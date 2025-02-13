# frozen_string_literal: true

# WARNING ABOUT GENERATED CODE
#
# This file is generated. See the contributing guide for more information:
# https://github.com/aws/aws-sdk-ruby/blob/version-3/CONTRIBUTING.md
#
# WARNING ABOUT GENERATED CODE

module Aws::Support
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
Ly9zdXBwb3J0LWZpcHMue1JlZ2lvbn0ue1BhcnRpdGlvblJlc3VsdCNkdWFs
U3RhY2tEbnNTdWZmaXh9IiwicHJvcGVydGllcyI6e30sImhlYWRlcnMiOnt9
fSwidHlwZSI6ImVuZHBvaW50In1dfSx7ImNvbmRpdGlvbnMiOltdLCJlcnJv
ciI6IkZJUFMgYW5kIER1YWxTdGFjayBhcmUgZW5hYmxlZCwgYnV0IHRoaXMg
cGFydGl0aW9uIGRvZXMgbm90IHN1cHBvcnQgb25lIG9yIGJvdGgiLCJ0eXBl
IjoiZXJyb3IifV19LHsiY29uZGl0aW9ucyI6W3siZm4iOiJib29sZWFuRXF1
YWxzIiwiYXJndiI6W3sicmVmIjoiVXNlRklQUyJ9LHRydWVdfV0sInR5cGUi
OiJ0cmVlIiwicnVsZXMiOlt7ImNvbmRpdGlvbnMiOlt7ImZuIjoiYm9vbGVh
bkVxdWFscyIsImFyZ3YiOlt0cnVlLHsiZm4iOiJnZXRBdHRyIiwiYXJndiI6
W3sicmVmIjoiUGFydGl0aW9uUmVzdWx0In0sInN1cHBvcnRzRklQUyJdfV19
XSwidHlwZSI6InRyZWUiLCJydWxlcyI6W3siY29uZGl0aW9ucyI6W10sInR5
cGUiOiJ0cmVlIiwicnVsZXMiOlt7ImNvbmRpdGlvbnMiOlt7ImZuIjoic3Ry
aW5nRXF1YWxzIiwiYXJndiI6W3sicmVmIjoiUmVnaW9uIn0sInVzLWdvdi13
ZXN0LTEiXX1dLCJlbmRwb2ludCI6eyJ1cmwiOiJodHRwczovL3N1cHBvcnQu
dXMtZ292LXdlc3QtMS5hbWF6b25hd3MuY29tIiwicHJvcGVydGllcyI6e30s
ImhlYWRlcnMiOnt9fSwidHlwZSI6ImVuZHBvaW50In0seyJjb25kaXRpb25z
IjpbXSwiZW5kcG9pbnQiOnsidXJsIjoiaHR0cHM6Ly9zdXBwb3J0LWZpcHMu
e1JlZ2lvbn0ue1BhcnRpdGlvblJlc3VsdCNkbnNTdWZmaXh9IiwicHJvcGVy
dGllcyI6e30sImhlYWRlcnMiOnt9fSwidHlwZSI6ImVuZHBvaW50In1dfV19
LHsiY29uZGl0aW9ucyI6W10sImVycm9yIjoiRklQUyBpcyBlbmFibGVkIGJ1
dCB0aGlzIHBhcnRpdGlvbiBkb2VzIG5vdCBzdXBwb3J0IEZJUFMiLCJ0eXBl
IjoiZXJyb3IifV19LHsiY29uZGl0aW9ucyI6W3siZm4iOiJib29sZWFuRXF1
YWxzIiwiYXJndiI6W3sicmVmIjoiVXNlRHVhbFN0YWNrIn0sdHJ1ZV19XSwi
dHlwZSI6InRyZWUiLCJydWxlcyI6W3siY29uZGl0aW9ucyI6W3siZm4iOiJi
b29sZWFuRXF1YWxzIiwiYXJndiI6W3RydWUseyJmbiI6ImdldEF0dHIiLCJh
cmd2IjpbeyJyZWYiOiJQYXJ0aXRpb25SZXN1bHQifSwic3VwcG9ydHNEdWFs
U3RhY2siXX1dfV0sInR5cGUiOiJ0cmVlIiwicnVsZXMiOlt7ImNvbmRpdGlv
bnMiOltdLCJlbmRwb2ludCI6eyJ1cmwiOiJodHRwczovL3N1cHBvcnQue1Jl
Z2lvbn0ue1BhcnRpdGlvblJlc3VsdCNkdWFsU3RhY2tEbnNTdWZmaXh9Iiwi
cHJvcGVydGllcyI6e30sImhlYWRlcnMiOnt9fSwidHlwZSI6ImVuZHBvaW50
In1dfSx7ImNvbmRpdGlvbnMiOltdLCJlcnJvciI6IkR1YWxTdGFjayBpcyBl
bmFibGVkIGJ1dCB0aGlzIHBhcnRpdGlvbiBkb2VzIG5vdCBzdXBwb3J0IER1
YWxTdGFjayIsInR5cGUiOiJlcnJvciJ9XX0seyJjb25kaXRpb25zIjpbXSwi
dHlwZSI6InRyZWUiLCJydWxlcyI6W3siY29uZGl0aW9ucyI6W3siZm4iOiJz
dHJpbmdFcXVhbHMiLCJhcmd2IjpbeyJyZWYiOiJSZWdpb24ifSwiYXdzLWds
b2JhbCJdfV0sImVuZHBvaW50Ijp7InVybCI6Imh0dHBzOi8vc3VwcG9ydC51
cy1lYXN0LTEuYW1hem9uYXdzLmNvbSIsInByb3BlcnRpZXMiOnsiYXV0aFNj
aGVtZXMiOlt7Im5hbWUiOiJzaWd2NCIsInNpZ25pbmdSZWdpb24iOiJ1cy1l
YXN0LTEiLCJzaWduaW5nTmFtZSI6InN1cHBvcnQifV19LCJoZWFkZXJzIjp7
fX0sInR5cGUiOiJlbmRwb2ludCJ9LHsiY29uZGl0aW9ucyI6W3siZm4iOiJz
dHJpbmdFcXVhbHMiLCJhcmd2IjpbeyJyZWYiOiJSZWdpb24ifSwiYXdzLWNu
LWdsb2JhbCJdfV0sImVuZHBvaW50Ijp7InVybCI6Imh0dHBzOi8vc3VwcG9y
dC5jbi1ub3J0aC0xLmFtYXpvbmF3cy5jb20uY24iLCJwcm9wZXJ0aWVzIjp7
ImF1dGhTY2hlbWVzIjpbeyJuYW1lIjoic2lndjQiLCJzaWduaW5nUmVnaW9u
IjoiY24tbm9ydGgtMSIsInNpZ25pbmdOYW1lIjoic3VwcG9ydCJ9XX0sImhl
YWRlcnMiOnt9fSwidHlwZSI6ImVuZHBvaW50In0seyJjb25kaXRpb25zIjpb
eyJmbiI6InN0cmluZ0VxdWFscyIsImFyZ3YiOlt7InJlZiI6IlJlZ2lvbiJ9
LCJhd3MtdXMtZ292LWdsb2JhbCJdfV0sImVuZHBvaW50Ijp7InVybCI6Imh0
dHBzOi8vc3VwcG9ydC51cy1nb3Ytd2VzdC0xLmFtYXpvbmF3cy5jb20iLCJw
cm9wZXJ0aWVzIjp7ImF1dGhTY2hlbWVzIjpbeyJuYW1lIjoic2lndjQiLCJz
aWduaW5nUmVnaW9uIjoidXMtZ292LXdlc3QtMSIsInNpZ25pbmdOYW1lIjoi
c3VwcG9ydCJ9XX0sImhlYWRlcnMiOnt9fSwidHlwZSI6ImVuZHBvaW50In0s
eyJjb25kaXRpb25zIjpbeyJmbiI6InN0cmluZ0VxdWFscyIsImFyZ3YiOlt7
InJlZiI6IlJlZ2lvbiJ9LCJhd3MtaXNvLWdsb2JhbCJdfV0sImVuZHBvaW50
Ijp7InVybCI6Imh0dHBzOi8vc3VwcG9ydC51cy1pc28tZWFzdC0xLmMycy5p
Yy5nb3YiLCJwcm9wZXJ0aWVzIjp7ImF1dGhTY2hlbWVzIjpbeyJuYW1lIjoi
c2lndjQiLCJzaWduaW5nUmVnaW9uIjoidXMtaXNvLWVhc3QtMSIsInNpZ25p
bmdOYW1lIjoic3VwcG9ydCJ9XX0sImhlYWRlcnMiOnt9fSwidHlwZSI6ImVu
ZHBvaW50In0seyJjb25kaXRpb25zIjpbeyJmbiI6InN0cmluZ0VxdWFscyIs
ImFyZ3YiOlt7InJlZiI6IlJlZ2lvbiJ9LCJhd3MtaXNvLWItZ2xvYmFsIl19
XSwiZW5kcG9pbnQiOnsidXJsIjoiaHR0cHM6Ly9zdXBwb3J0LnVzLWlzb2It
ZWFzdC0xLnNjMnMuc2dvdi5nb3YiLCJwcm9wZXJ0aWVzIjp7ImF1dGhTY2hl
bWVzIjpbeyJuYW1lIjoic2lndjQiLCJzaWduaW5nUmVnaW9uIjoidXMtaXNv
Yi1lYXN0LTEiLCJzaWduaW5nTmFtZSI6InN1cHBvcnQifV19LCJoZWFkZXJz
Ijp7fX0sInR5cGUiOiJlbmRwb2ludCJ9LHsiY29uZGl0aW9ucyI6W10sImVu
ZHBvaW50Ijp7InVybCI6Imh0dHBzOi8vc3VwcG9ydC57UmVnaW9ufS57UGFy
dGl0aW9uUmVzdWx0I2Ruc1N1ZmZpeH0iLCJwcm9wZXJ0aWVzIjp7fSwiaGVh
ZGVycyI6e319LCJ0eXBlIjoiZW5kcG9pbnQifV19XX1dfQ==

    JSON
  end
end
