# frozen_string_literal: true

# WARNING ABOUT GENERATED CODE
#
# This file is generated. See the contributing guide for more information:
# https://github.com/aws/aws-sdk-ruby/blob/version-3/CONTRIBUTING.md
#
# WARNING ABOUT GENERATED CODE

module Aws::Route53Domains
  class EndpointProvider
    def initialize(rule_set = nil)
      @@rule_set ||= begin
        endpoint_rules = Aws::Json.load(Base64.decode64(RULES))
        Aws::Endpoints::RuleSet.new(
          version: endpoint_rules['version'],
          service_id: endpoint_rules['serviceId'],
          parameters: endpoint_rules['parameters'],
          rules: endpoint_rules['rules']
        )
      end
      @provider = Aws::Endpoints::RulesProvider.new(rule_set || @@rule_set)
    end

    def resolve_endpoint(parameters)
      @provider.resolve_endpoint(parameters)
    end

    # @api private
    RULES = <<-JSON
eyJ2ZXJzaW9uIjoiMS4wIiwicGFyYW1ldGVycyI6eyJSZWdpb24iOnsiYnVp
bHRJbiI6IkFXUzo6UmVnaW9uIiwicmVxdWlyZWQiOnRydWUsImRvY3VtZW50
YXRpb24iOiJUaGUgQVdTIHJlZ2lvbiB1c2VkIHRvIGRpc3BhdGNoIHRoZSBy
ZXF1ZXN0LiIsInR5cGUiOiJTdHJpbmcifSwiVXNlRHVhbFN0YWNrIjp7ImJ1
aWx0SW4iOiJBV1M6OlVzZUR1YWxTdGFjayIsInJlcXVpcmVkIjp0cnVlLCJk
ZWZhdWx0IjpmYWxzZSwiZG9jdW1lbnRhdGlvbiI6IldoZW4gdHJ1ZSwgdXNl
IHRoZSBkdWFsLXN0YWNrIGVuZHBvaW50LiBJZiB0aGUgY29uZmlndXJlZCBl
bmRwb2ludCBkb2VzIG5vdCBzdXBwb3J0IGR1YWwtc3RhY2ssIGRpc3BhdGNo
aW5nIHRoZSByZXF1ZXN0IE1BWSByZXR1cm4gYW4gZXJyb3IuIiwidHlwZSI6
IkJvb2xlYW4ifSwiVXNlRklQUyI6eyJidWlsdEluIjoiQVdTOjpVc2VGSVBT
IiwicmVxdWlyZWQiOnRydWUsImRlZmF1bHQiOmZhbHNlLCJkb2N1bWVudGF0
aW9uIjoiV2hlbiB0cnVlLCBzZW5kIHRoaXMgcmVxdWVzdCB0byB0aGUgRklQ
Uy1jb21wbGlhbnQgcmVnaW9uYWwgZW5kcG9pbnQuIElmIHRoZSBjb25maWd1
cmVkIGVuZHBvaW50IGRvZXMgbm90IGhhdmUgYSBGSVBTIGNvbXBsaWFudCBl
bmRwb2ludCwgZGlzcGF0Y2hpbmcgdGhlIHJlcXVlc3Qgd2lsbCByZXR1cm4g
YW4gZXJyb3IuIiwidHlwZSI6IkJvb2xlYW4ifSwiRW5kcG9pbnQiOnsiYnVp
bHRJbiI6IlNESzo6RW5kcG9pbnQiLCJyZXF1aXJlZCI6ZmFsc2UsImRvY3Vt
ZW50YXRpb24iOiJPdmVycmlkZSB0aGUgZW5kcG9pbnQgdXNlZCB0byBzZW5k
IHRoaXMgcmVxdWVzdCIsInR5cGUiOiJTdHJpbmcifX0sInJ1bGVzIjpbeyJj
b25kaXRpb25zIjpbeyJmbiI6ImF3cy5wYXJ0aXRpb24iLCJhcmd2IjpbeyJy
ZWYiOiJSZWdpb24ifV0sImFzc2lnbiI6IlBhcnRpdGlvblJlc3VsdCJ9XSwi
dHlwZSI6InRyZWUiLCJydWxlcyI6W3siY29uZGl0aW9ucyI6W3siZm4iOiJp
c1NldCIsImFyZ3YiOlt7InJlZiI6IkVuZHBvaW50In1dfV0sInR5cGUiOiJ0
cmVlIiwicnVsZXMiOlt7ImNvbmRpdGlvbnMiOlt7ImZuIjoiYm9vbGVhbkVx
dWFscyIsImFyZ3YiOlt7InJlZiI6IlVzZUZJUFMifSx0cnVlXX1dLCJlcnJv
ciI6IkludmFsaWQgQ29uZmlndXJhdGlvbjogRklQUyBhbmQgY3VzdG9tIGVu
ZHBvaW50IGFyZSBub3Qgc3VwcG9ydGVkIiwidHlwZSI6ImVycm9yIn0seyJj
b25kaXRpb25zIjpbXSwidHlwZSI6InRyZWUiLCJydWxlcyI6W3siY29uZGl0
aW9ucyI6W3siZm4iOiJib29sZWFuRXF1YWxzIiwiYXJndiI6W3sicmVmIjoi
VXNlRHVhbFN0YWNrIn0sdHJ1ZV19XSwiZXJyb3IiOiJJbnZhbGlkIENvbmZp
Z3VyYXRpb246IER1YWxzdGFjayBhbmQgY3VzdG9tIGVuZHBvaW50IGFyZSBu
b3Qgc3VwcG9ydGVkIiwidHlwZSI6ImVycm9yIn0seyJjb25kaXRpb25zIjpb
XSwiZW5kcG9pbnQiOnsidXJsIjp7InJlZiI6IkVuZHBvaW50In0sInByb3Bl
cnRpZXMiOnt9LCJoZWFkZXJzIjp7fX0sInR5cGUiOiJlbmRwb2ludCJ9XX1d
fSx7ImNvbmRpdGlvbnMiOlt7ImZuIjoiYm9vbGVhbkVxdWFscyIsImFyZ3Yi
Olt7InJlZiI6IlVzZUZJUFMifSx0cnVlXX0seyJmbiI6ImJvb2xlYW5FcXVh
bHMiLCJhcmd2IjpbeyJyZWYiOiJVc2VEdWFsU3RhY2sifSx0cnVlXX1dLCJ0
eXBlIjoidHJlZSIsInJ1bGVzIjpbeyJjb25kaXRpb25zIjpbeyJmbiI6ImJv
b2xlYW5FcXVhbHMiLCJhcmd2IjpbdHJ1ZSx7ImZuIjoiZ2V0QXR0ciIsImFy
Z3YiOlt7InJlZiI6IlBhcnRpdGlvblJlc3VsdCJ9LCJzdXBwb3J0c0ZJUFMi
XX1dfSx7ImZuIjoiYm9vbGVhbkVxdWFscyIsImFyZ3YiOlt0cnVlLHsiZm4i
OiJnZXRBdHRyIiwiYXJndiI6W3sicmVmIjoiUGFydGl0aW9uUmVzdWx0In0s
InN1cHBvcnRzRHVhbFN0YWNrIl19XX1dLCJ0eXBlIjoidHJlZSIsInJ1bGVz
IjpbeyJjb25kaXRpb25zIjpbXSwiZW5kcG9pbnQiOnsidXJsIjoiaHR0cHM6
Ly9yb3V0ZTUzZG9tYWlucy1maXBzLntSZWdpb259LntQYXJ0aXRpb25SZXN1
bHQjZHVhbFN0YWNrRG5zU3VmZml4fSIsInByb3BlcnRpZXMiOnt9LCJoZWFk
ZXJzIjp7fX0sInR5cGUiOiJlbmRwb2ludCJ9XX0seyJjb25kaXRpb25zIjpb
XSwiZXJyb3IiOiJGSVBTIGFuZCBEdWFsU3RhY2sgYXJlIGVuYWJsZWQsIGJ1
dCB0aGlzIHBhcnRpdGlvbiBkb2VzIG5vdCBzdXBwb3J0IG9uZSBvciBib3Ro
IiwidHlwZSI6ImVycm9yIn1dfSx7ImNvbmRpdGlvbnMiOlt7ImZuIjoiYm9v
bGVhbkVxdWFscyIsImFyZ3YiOlt7InJlZiI6IlVzZUZJUFMifSx0cnVlXX1d
LCJ0eXBlIjoidHJlZSIsInJ1bGVzIjpbeyJjb25kaXRpb25zIjpbeyJmbiI6
ImJvb2xlYW5FcXVhbHMiLCJhcmd2IjpbdHJ1ZSx7ImZuIjoiZ2V0QXR0ciIs
ImFyZ3YiOlt7InJlZiI6IlBhcnRpdGlvblJlc3VsdCJ9LCJzdXBwb3J0c0ZJ
UFMiXX1dfV0sInR5cGUiOiJ0cmVlIiwicnVsZXMiOlt7ImNvbmRpdGlvbnMi
OltdLCJ0eXBlIjoidHJlZSIsInJ1bGVzIjpbeyJjb25kaXRpb25zIjpbXSwi
ZW5kcG9pbnQiOnsidXJsIjoiaHR0cHM6Ly9yb3V0ZTUzZG9tYWlucy1maXBz
LntSZWdpb259LntQYXJ0aXRpb25SZXN1bHQjZG5zU3VmZml4fSIsInByb3Bl
cnRpZXMiOnt9LCJoZWFkZXJzIjp7fX0sInR5cGUiOiJlbmRwb2ludCJ9XX1d
fSx7ImNvbmRpdGlvbnMiOltdLCJlcnJvciI6IkZJUFMgaXMgZW5hYmxlZCBi
dXQgdGhpcyBwYXJ0aXRpb24gZG9lcyBub3Qgc3VwcG9ydCBGSVBTIiwidHlw
ZSI6ImVycm9yIn1dfSx7ImNvbmRpdGlvbnMiOlt7ImZuIjoiYm9vbGVhbkVx
dWFscyIsImFyZ3YiOlt7InJlZiI6IlVzZUR1YWxTdGFjayJ9LHRydWVdfV0s
InR5cGUiOiJ0cmVlIiwicnVsZXMiOlt7ImNvbmRpdGlvbnMiOlt7ImZuIjoi
Ym9vbGVhbkVxdWFscyIsImFyZ3YiOlt0cnVlLHsiZm4iOiJnZXRBdHRyIiwi
YXJndiI6W3sicmVmIjoiUGFydGl0aW9uUmVzdWx0In0sInN1cHBvcnRzRHVh
bFN0YWNrIl19XX1dLCJ0eXBlIjoidHJlZSIsInJ1bGVzIjpbeyJjb25kaXRp
b25zIjpbXSwiZW5kcG9pbnQiOnsidXJsIjoiaHR0cHM6Ly9yb3V0ZTUzZG9t
YWlucy57UmVnaW9ufS57UGFydGl0aW9uUmVzdWx0I2R1YWxTdGFja0Ruc1N1
ZmZpeH0iLCJwcm9wZXJ0aWVzIjp7fSwiaGVhZGVycyI6e319LCJ0eXBlIjoi
ZW5kcG9pbnQifV19LHsiY29uZGl0aW9ucyI6W10sImVycm9yIjoiRHVhbFN0
YWNrIGlzIGVuYWJsZWQgYnV0IHRoaXMgcGFydGl0aW9uIGRvZXMgbm90IHN1
cHBvcnQgRHVhbFN0YWNrIiwidHlwZSI6ImVycm9yIn1dfSx7ImNvbmRpdGlv
bnMiOltdLCJlbmRwb2ludCI6eyJ1cmwiOiJodHRwczovL3JvdXRlNTNkb21h
aW5zLntSZWdpb259LntQYXJ0aXRpb25SZXN1bHQjZG5zU3VmZml4fSIsInBy
b3BlcnRpZXMiOnt9LCJoZWFkZXJzIjp7fX0sInR5cGUiOiJlbmRwb2ludCJ9
XX1dfQ==

    JSON
  end
end
