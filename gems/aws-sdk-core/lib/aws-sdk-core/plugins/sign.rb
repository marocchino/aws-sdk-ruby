# frozen_string_literal: true

require 'aws-sigv4'

module Aws
  module Plugins
    # @api private
    class Sign < Seahorse::Client::Plugin
      # These once had defaults. But now they are used as overrides to
      # new endpoint and auth resolution.
      option(:sigv4_signer)
      option(:sigv4_name)
      option(:sigv4_region)
      option(:unsigned_operations, default: [])

      supported_auth_types = %w[sigv4 bearer none]
      supported_auth_types += ['sigv4a'] if Aws::Sigv4::Signer.use_crt?
      SUPPORTED_AUTH_TYPES = supported_auth_types.freeze

      def add_handlers(handlers, cfg)
        operations = cfg.api.operation_names - cfg.unsigned_operations
        handlers.add(Handler, step: :sign, operations: operations)
      end

      def self.signer_for(auth_scheme, config, region_override = nil)
        case auth_scheme['name']
        when 'sigv4', 'sigv4a'
          begin
            SignatureV4.build_v4_signer(auth_scheme, config, region_override)
          rescue Aws::Sigv4::Errors::MissingCredentialsError
            raise Aws::Errors::MissingCredentialsError
          end
        when 'bearer'
          'Bearer'
        when 'none'
          # don't sign
        end
      end

      class Handler < Seahorse::Client::Handler
        def call(context)
          signer = Sign.signer_for(
            context[:auth_scheme],
            context.config,
            context[:sigv4_region]
          )

          case signer
          when Aws::Sigv4::Signer
            Sign::SignatureV4.apply_signature(signer, context)
          when 'Bearer'
            Sign::Bearer.apply(context)
          end

          @handler.call(context)
        end
      end

      # @!api private
      module Bearer
        class << self
          def apply(context)
            if context.http_request.endpoint.scheme != 'https'
              raise ArgumentError,
                    'Unable to use bearer authorization on non https endpoint.'
            end

            token_provider = context.config.token_provider

            raise Errors::MissingBearerTokenError unless token_provider&.set?

            context.http_request.headers['Authorization'] =
              "Bearer #{token_provider.token.token}"
          end
        end
      end

      # @api private
      module SignatureV4
        class << self
          def build_v4_signer(auth_scheme, config, region_override = nil)
            scheme_name = auth_scheme['name']

            unless %w[sigv4 sigv4a].include?(scheme_name)
              raise ArgumentError,
                    "Expected sigv4 or sigv4a auth scheme, got #{scheme_name}"
            end

            region = if scheme_name == 'sigv4a'
                       auth_scheme['signingRegionSet'].first
                     else
                       auth_scheme['signingRegion']
                     end
            Aws::Sigv4::Signer.new(
              service: config.sigv4_name || auth_scheme['signingName'],
              region: region_override || config.sigv4_region || region,
              credentials_provider: config.credentials,
              signing_algorithm: scheme_name.to_sym,
              uri_escape_path: !!!auth_scheme['disableDoubleEncoding'],
              unsigned_headers: %w[content-length user-agent x-amzn-trace-id]
            )
          end

          def apply_signature(signer, context)
            req = context.http_request

            apply_authtype(context, req)
            reset_signature(req)
            apply_clock_skew(context, req)

            # compute the signature
            begin
              signature = signer.sign_request(
                http_method: req.http_method,
                url: req.endpoint,
                headers: req.headers,
                body: req.body
              )
            rescue Aws::Sigv4::Errors::MissingCredentialsError
              # Necessary for when credentials is explicitly set to nil
              raise Aws::Errors::MissingCredentialsError
            end
            # apply signature headers
            req.headers.update(signature.headers)

            # add request metadata with signature components for debugging
            context[:canonical_request] = signature.canonical_request
            context[:string_to_sign] = signature.string_to_sign
          end

          private

          def apply_authtype(context, req)
            if context.operation['authtype'].eql?('v4-unsigned-body') &&
               req.endpoint.scheme.eql?('https')
              req.headers['X-Amz-Content-Sha256'] ||= 'UNSIGNED-PAYLOAD'
            end
          end

          def reset_signature(req)
            # in case this request is being re-signed
            req.headers.delete('Authorization')
            req.headers.delete('X-Amz-Security-Token')
            req.headers.delete('X-Amz-Date')
            req.headers.delete('x-Amz-Region-Set')
          end

          def apply_clock_skew(context, req)
            if context.config.respond_to?(:clock_skew) &&
               context.config.clock_skew &&
               context.config.correct_clock_skew

              endpoint = context.http_request.endpoint
              skew = context.config.clock_skew.clock_correction(endpoint)
              if skew.abs.positive?
                req.headers['X-Amz-Date'] =
                  (Time.now.utc + skew).strftime('%Y%m%dT%H%M%SZ')
              end
            end
          end
        end

      end
    end
  end
end
