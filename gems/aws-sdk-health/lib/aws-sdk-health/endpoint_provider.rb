# frozen_string_literal: true

# WARNING ABOUT GENERATED CODE
#
# This file is generated. See the contributing guide for more information:
# https://github.com/aws/aws-sdk-ruby/blob/version-3/CONTRIBUTING.md
#
# WARNING ABOUT GENERATED CODE

module Aws::Health
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
bHRJbiI6IkFXUzo6UmVnaW9uIiwicmVxdWlyZWQiOmZhbHNlLCJkb2N1bWVu
dGF0aW9uIjoiVGhlIEFXUyByZWdpb24gdXNlZCB0byBkaXNwYXRjaCB0aGUg
cmVxdWVzdC4iLCJ0eXBlIjoiU3RyaW5nIn0sIlVzZUR1YWxTdGFjayI6eyJi
dWlsdEluIjoiQVdTOjpVc2VEdWFsU3RhY2siLCJyZXF1aXJlZCI6dHJ1ZSwi
ZGVmYXVsdCI6ZmFsc2UsImRvY3VtZW50YXRpb24iOiJXaGVuIHRydWUsIHVz
ZSB0aGUgZHVhbC1zdGFjayBlbmRwb2ludC4gSWYgdGhlIGNvbmZpZ3VyZWQg
ZW5kcG9pbnQgZG9lcyBub3Qgc3VwcG9ydCBkdWFsLXN0YWNrLCBkaXNwYXRj
aGluZyB0aGUgcmVxdWVzdCBNQVkgcmV0dXJuIGFuIGVycm9yLiIsInR5cGUi
OiJCb29sZWFuIn0sIlVzZUZJUFMiOnsiYnVpbHRJbiI6IkFXUzo6VXNlRklQ
UyIsInJlcXVpcmVkIjp0cnVlLCJkZWZhdWx0IjpmYWxzZSwiZG9jdW1lbnRh
dGlvbiI6IldoZW4gdHJ1ZSwgc2VuZCB0aGlzIHJlcXVlc3QgdG8gdGhlIEZJ
UFMtY29tcGxpYW50IHJlZ2lvbmFsIGVuZHBvaW50LiBJZiB0aGUgY29uZmln
dXJlZCBlbmRwb2ludCBkb2VzIG5vdCBoYXZlIGEgRklQUyBjb21wbGlhbnQg
ZW5kcG9pbnQsIGRpc3BhdGNoaW5nIHRoZSByZXF1ZXN0IHdpbGwgcmV0dXJu
IGFuIGVycm9yLiIsInR5cGUiOiJCb29sZWFuIn0sIkVuZHBvaW50Ijp7ImJ1
aWx0SW4iOiJTREs6OkVuZHBvaW50IiwicmVxdWlyZWQiOmZhbHNlLCJkb2N1
bWVudGF0aW9uIjoiT3ZlcnJpZGUgdGhlIGVuZHBvaW50IHVzZWQgdG8gc2Vu
ZCB0aGlzIHJlcXVlc3QiLCJ0eXBlIjoiU3RyaW5nIn19LCJydWxlcyI6W3si
Y29uZGl0aW9ucyI6W3siZm4iOiJhd3MucGFydGl0aW9uIiwiYXJndiI6W3si
cmVmIjoiUmVnaW9uIn1dLCJhc3NpZ24iOiJQYXJ0aXRpb25SZXN1bHQifV0s
InR5cGUiOiJ0cmVlIiwicnVsZXMiOlt7ImNvbmRpdGlvbnMiOlt7ImZuIjoi
aXNTZXQiLCJhcmd2IjpbeyJyZWYiOiJFbmRwb2ludCJ9XX0seyJmbiI6InBh
cnNlVVJMIiwiYXJndiI6W3sicmVmIjoiRW5kcG9pbnQifV0sImFzc2lnbiI6
InVybCJ9XSwidHlwZSI6InRyZWUiLCJydWxlcyI6W3siY29uZGl0aW9ucyI6
W3siZm4iOiJib29sZWFuRXF1YWxzIiwiYXJndiI6W3sicmVmIjoiVXNlRklQ
UyJ9LHRydWVdfV0sImVycm9yIjoiSW52YWxpZCBDb25maWd1cmF0aW9uOiBG
SVBTIGFuZCBjdXN0b20gZW5kcG9pbnQgYXJlIG5vdCBzdXBwb3J0ZWQiLCJ0
eXBlIjoiZXJyb3IifSx7ImNvbmRpdGlvbnMiOltdLCJ0eXBlIjoidHJlZSIs
InJ1bGVzIjpbeyJjb25kaXRpb25zIjpbeyJmbiI6ImJvb2xlYW5FcXVhbHMi
LCJhcmd2IjpbeyJyZWYiOiJVc2VEdWFsU3RhY2sifSx0cnVlXX1dLCJlcnJv
ciI6IkludmFsaWQgQ29uZmlndXJhdGlvbjogRHVhbHN0YWNrIGFuZCBjdXN0
b20gZW5kcG9pbnQgYXJlIG5vdCBzdXBwb3J0ZWQiLCJ0eXBlIjoiZXJyb3Ii
fSx7ImNvbmRpdGlvbnMiOltdLCJlbmRwb2ludCI6eyJ1cmwiOnsicmVmIjoi
RW5kcG9pbnQifSwicHJvcGVydGllcyI6e30sImhlYWRlcnMiOnt9fSwidHlw
ZSI6ImVuZHBvaW50In1dfV19LHsiY29uZGl0aW9ucyI6W3siZm4iOiJzdHJp
bmdFcXVhbHMiLCJhcmd2IjpbeyJmbiI6ImdldEF0dHIiLCJhcmd2IjpbeyJy
ZWYiOiJQYXJ0aXRpb25SZXN1bHQifSwibmFtZSJdfSwiYXdzIl19XSwidHlw
ZSI6InRyZWUiLCJydWxlcyI6W3siY29uZGl0aW9ucyI6W3siZm4iOiJib29s
ZWFuRXF1YWxzIiwiYXJndiI6W3sicmVmIjoiVXNlRklQUyJ9LHRydWVdfSx7
ImZuIjoiYm9vbGVhbkVxdWFscyIsImFyZ3YiOlt7InJlZiI6IlVzZUR1YWxT
dGFjayJ9LHRydWVdfV0sInR5cGUiOiJ0cmVlIiwicnVsZXMiOlt7ImNvbmRp
dGlvbnMiOlt7ImZuIjoiYm9vbGVhbkVxdWFscyIsImFyZ3YiOlt0cnVlLHsi
Zm4iOiJnZXRBdHRyIiwiYXJndiI6W3sicmVmIjoiUGFydGl0aW9uUmVzdWx0
In0sInN1cHBvcnRzRklQUyJdfV19LHsiZm4iOiJib29sZWFuRXF1YWxzIiwi
YXJndiI6W3RydWUseyJmbiI6ImdldEF0dHIiLCJhcmd2IjpbeyJyZWYiOiJQ
YXJ0aXRpb25SZXN1bHQifSwic3VwcG9ydHNEdWFsU3RhY2siXX1dfV0sInR5
cGUiOiJ0cmVlIiwicnVsZXMiOlt7ImNvbmRpdGlvbnMiOltdLCJlbmRwb2lu
dCI6eyJ1cmwiOiJodHRwczovL2hlYWx0aC1maXBzLntSZWdpb259LmFwaS5h
d3MiLCJwcm9wZXJ0aWVzIjp7ImF1dGhTY2hlbWVzIjpbeyJuYW1lIjoic2ln
djQiLCJzaWduaW5nTmFtZSI6ImhlYWx0aCIsInNpZ25pbmdSZWdpb24iOiJ1
cy1lYXN0LTEifV19LCJoZWFkZXJzIjp7fX0sInR5cGUiOiJlbmRwb2ludCJ9
XX0seyJjb25kaXRpb25zIjpbXSwiZXJyb3IiOiJGSVBTIGFuZCBEdWFsU3Rh
Y2sgYXJlIGVuYWJsZWQsIGJ1dCB0aGlzIHBhcnRpdGlvbiBkb2VzIG5vdCBz
dXBwb3J0IG9uZSBvciBib3RoIiwidHlwZSI6ImVycm9yIn1dfSx7ImNvbmRp
dGlvbnMiOlt7ImZuIjoiYm9vbGVhbkVxdWFscyIsImFyZ3YiOlt7InJlZiI6
IlVzZUZJUFMifSx0cnVlXX1dLCJ0eXBlIjoidHJlZSIsInJ1bGVzIjpbeyJj
b25kaXRpb25zIjpbeyJmbiI6ImJvb2xlYW5FcXVhbHMiLCJhcmd2IjpbdHJ1
ZSx7ImZuIjoiZ2V0QXR0ciIsImFyZ3YiOlt7InJlZiI6IlBhcnRpdGlvblJl
c3VsdCJ9LCJzdXBwb3J0c0ZJUFMiXX1dfV0sInR5cGUiOiJ0cmVlIiwicnVs
ZXMiOlt7ImNvbmRpdGlvbnMiOltdLCJlbmRwb2ludCI6eyJ1cmwiOiJodHRw
czovL2hlYWx0aC1maXBzLntSZWdpb259LmFtYXpvbmF3cy5jb20iLCJwcm9w
ZXJ0aWVzIjp7ImF1dGhTY2hlbWVzIjpbeyJuYW1lIjoic2lndjQiLCJzaWdu
aW5nTmFtZSI6ImhlYWx0aCIsInNpZ25pbmdSZWdpb24iOiJ1cy1lYXN0LTEi
fV19LCJoZWFkZXJzIjp7fX0sInR5cGUiOiJlbmRwb2ludCJ9XX0seyJjb25k
aXRpb25zIjpbXSwiZXJyb3IiOiJGSVBTIGlzIGVuYWJsZWQgYnV0IHRoaXMg
cGFydGl0aW9uIGRvZXMgbm90IHN1cHBvcnQgRklQUyIsInR5cGUiOiJlcnJv
ciJ9XX0seyJjb25kaXRpb25zIjpbeyJmbiI6ImJvb2xlYW5FcXVhbHMiLCJh
cmd2IjpbeyJyZWYiOiJVc2VEdWFsU3RhY2sifSx0cnVlXX1dLCJ0eXBlIjoi
dHJlZSIsInJ1bGVzIjpbeyJjb25kaXRpb25zIjpbeyJmbiI6ImJvb2xlYW5F
cXVhbHMiLCJhcmd2IjpbdHJ1ZSx7ImZuIjoiZ2V0QXR0ciIsImFyZ3YiOlt7
InJlZiI6IlBhcnRpdGlvblJlc3VsdCJ9LCJzdXBwb3J0c0R1YWxTdGFjayJd
fV19XSwidHlwZSI6InRyZWUiLCJydWxlcyI6W3siY29uZGl0aW9ucyI6W10s
ImVuZHBvaW50Ijp7InVybCI6Imh0dHBzOi8vaGVhbHRoLntSZWdpb259LmFw
aS5hd3MiLCJwcm9wZXJ0aWVzIjp7ImF1dGhTY2hlbWVzIjpbeyJuYW1lIjoi
c2lndjQiLCJzaWduaW5nTmFtZSI6ImhlYWx0aCIsInNpZ25pbmdSZWdpb24i
OiJ1cy1lYXN0LTEifV19LCJoZWFkZXJzIjp7fX0sInR5cGUiOiJlbmRwb2lu
dCJ9XX0seyJjb25kaXRpb25zIjpbXSwiZXJyb3IiOiJEdWFsU3RhY2sgaXMg
ZW5hYmxlZCBidXQgdGhpcyBwYXJ0aXRpb24gZG9lcyBub3Qgc3VwcG9ydCBE
dWFsU3RhY2siLCJ0eXBlIjoiZXJyb3IifV19LHsiY29uZGl0aW9ucyI6W10s
ImVuZHBvaW50Ijp7InVybCI6Imh0dHBzOi8vZ2xvYmFsLmhlYWx0aC5hbWF6
b25hd3MuY29tIiwicHJvcGVydGllcyI6eyJhdXRoU2NoZW1lcyI6W3sibmFt
ZSI6InNpZ3Y0Iiwic2lnbmluZ05hbWUiOiJoZWFsdGgiLCJzaWduaW5nUmVn
aW9uIjoidXMtZWFzdC0xIn1dfSwiaGVhZGVycyI6e319LCJ0eXBlIjoiZW5k
cG9pbnQifV19LHsiY29uZGl0aW9ucyI6W3siZm4iOiJzdHJpbmdFcXVhbHMi
LCJhcmd2IjpbeyJmbiI6ImdldEF0dHIiLCJhcmd2IjpbeyJyZWYiOiJQYXJ0
aXRpb25SZXN1bHQifSwibmFtZSJdfSwiYXdzLWNuIl19XSwidHlwZSI6InRy
ZWUiLCJydWxlcyI6W3siY29uZGl0aW9ucyI6W3siZm4iOiJib29sZWFuRXF1
YWxzIiwiYXJndiI6W3sicmVmIjoiVXNlRklQUyJ9LHRydWVdfSx7ImZuIjoi
Ym9vbGVhbkVxdWFscyIsImFyZ3YiOlt7InJlZiI6IlVzZUR1YWxTdGFjayJ9
LHRydWVdfV0sInR5cGUiOiJ0cmVlIiwicnVsZXMiOlt7ImNvbmRpdGlvbnMi
Olt7ImZuIjoiYm9vbGVhbkVxdWFscyIsImFyZ3YiOlt0cnVlLHsiZm4iOiJn
ZXRBdHRyIiwiYXJndiI6W3sicmVmIjoiUGFydGl0aW9uUmVzdWx0In0sInN1
cHBvcnRzRklQUyJdfV19LHsiZm4iOiJib29sZWFuRXF1YWxzIiwiYXJndiI6
W3RydWUseyJmbiI6ImdldEF0dHIiLCJhcmd2IjpbeyJyZWYiOiJQYXJ0aXRp
b25SZXN1bHQifSwic3VwcG9ydHNEdWFsU3RhY2siXX1dfV0sInR5cGUiOiJ0
cmVlIiwicnVsZXMiOlt7ImNvbmRpdGlvbnMiOltdLCJlbmRwb2ludCI6eyJ1
cmwiOiJodHRwczovL2hlYWx0aC1maXBzLntSZWdpb259LmFwaS5hbWF6b253
ZWJzZXJ2aWNlcy5jb20uY24iLCJwcm9wZXJ0aWVzIjp7ImF1dGhTY2hlbWVz
IjpbeyJuYW1lIjoic2lndjQiLCJzaWduaW5nTmFtZSI6ImhlYWx0aCIsInNp
Z25pbmdSZWdpb24iOiJjbi1ub3J0aHdlc3QtMSJ9XX0sImhlYWRlcnMiOnt9
fSwidHlwZSI6ImVuZHBvaW50In1dfSx7ImNvbmRpdGlvbnMiOltdLCJlcnJv
ciI6IkZJUFMgYW5kIER1YWxTdGFjayBhcmUgZW5hYmxlZCwgYnV0IHRoaXMg
cGFydGl0aW9uIGRvZXMgbm90IHN1cHBvcnQgb25lIG9yIGJvdGgiLCJ0eXBl
IjoiZXJyb3IifV19LHsiY29uZGl0aW9ucyI6W3siZm4iOiJib29sZWFuRXF1
YWxzIiwiYXJndiI6W3sicmVmIjoiVXNlRklQUyJ9LHRydWVdfV0sInR5cGUi
OiJ0cmVlIiwicnVsZXMiOlt7ImNvbmRpdGlvbnMiOlt7ImZuIjoiYm9vbGVh
bkVxdWFscyIsImFyZ3YiOlt0cnVlLHsiZm4iOiJnZXRBdHRyIiwiYXJndiI6
W3sicmVmIjoiUGFydGl0aW9uUmVzdWx0In0sInN1cHBvcnRzRklQUyJdfV19
XSwidHlwZSI6InRyZWUiLCJydWxlcyI6W3siY29uZGl0aW9ucyI6W10sImVu
ZHBvaW50Ijp7InVybCI6Imh0dHBzOi8vaGVhbHRoLWZpcHMue1JlZ2lvbn0u
YW1hem9uYXdzLmNvbS5jbiIsInByb3BlcnRpZXMiOnsiYXV0aFNjaGVtZXMi
Olt7Im5hbWUiOiJzaWd2NCIsInNpZ25pbmdOYW1lIjoiaGVhbHRoIiwic2ln
bmluZ1JlZ2lvbiI6ImNuLW5vcnRod2VzdC0xIn1dfSwiaGVhZGVycyI6e319
LCJ0eXBlIjoiZW5kcG9pbnQifV19LHsiY29uZGl0aW9ucyI6W10sImVycm9y
IjoiRklQUyBpcyBlbmFibGVkIGJ1dCB0aGlzIHBhcnRpdGlvbiBkb2VzIG5v
dCBzdXBwb3J0IEZJUFMiLCJ0eXBlIjoiZXJyb3IifV19LHsiY29uZGl0aW9u
cyI6W3siZm4iOiJib29sZWFuRXF1YWxzIiwiYXJndiI6W3sicmVmIjoiVXNl
RHVhbFN0YWNrIn0sdHJ1ZV19XSwidHlwZSI6InRyZWUiLCJydWxlcyI6W3si
Y29uZGl0aW9ucyI6W3siZm4iOiJib29sZWFuRXF1YWxzIiwiYXJndiI6W3Ry
dWUseyJmbiI6ImdldEF0dHIiLCJhcmd2IjpbeyJyZWYiOiJQYXJ0aXRpb25S
ZXN1bHQifSwic3VwcG9ydHNEdWFsU3RhY2siXX1dfV0sInR5cGUiOiJ0cmVl
IiwicnVsZXMiOlt7ImNvbmRpdGlvbnMiOltdLCJlbmRwb2ludCI6eyJ1cmwi
OiJodHRwczovL2hlYWx0aC57UmVnaW9ufS5hcGkuYW1hem9ud2Vic2Vydmlj
ZXMuY29tLmNuIiwicHJvcGVydGllcyI6eyJhdXRoU2NoZW1lcyI6W3sibmFt
ZSI6InNpZ3Y0Iiwic2lnbmluZ05hbWUiOiJoZWFsdGgiLCJzaWduaW5nUmVn
aW9uIjoiY24tbm9ydGh3ZXN0LTEifV19LCJoZWFkZXJzIjp7fX0sInR5cGUi
OiJlbmRwb2ludCJ9XX0seyJjb25kaXRpb25zIjpbXSwiZXJyb3IiOiJEdWFs
U3RhY2sgaXMgZW5hYmxlZCBidXQgdGhpcyBwYXJ0aXRpb24gZG9lcyBub3Qg
c3VwcG9ydCBEdWFsU3RhY2siLCJ0eXBlIjoiZXJyb3IifV19LHsiY29uZGl0
aW9ucyI6W10sImVuZHBvaW50Ijp7InVybCI6Imh0dHBzOi8vZ2xvYmFsLmhl
YWx0aC5hbWF6b25hd3MuY29tLmNuIiwicHJvcGVydGllcyI6eyJhdXRoU2No
ZW1lcyI6W3sibmFtZSI6InNpZ3Y0Iiwic2lnbmluZ05hbWUiOiJoZWFsdGgi
LCJzaWduaW5nUmVnaW9uIjoiY24tbm9ydGh3ZXN0LTEifV19LCJoZWFkZXJz
Ijp7fX0sInR5cGUiOiJlbmRwb2ludCJ9XX0seyJjb25kaXRpb25zIjpbeyJm
biI6ImJvb2xlYW5FcXVhbHMiLCJhcmd2IjpbeyJyZWYiOiJVc2VGSVBTIn0s
dHJ1ZV19LHsiZm4iOiJib29sZWFuRXF1YWxzIiwiYXJndiI6W3sicmVmIjoi
VXNlRHVhbFN0YWNrIn0sdHJ1ZV19XSwidHlwZSI6InRyZWUiLCJydWxlcyI6
W3siY29uZGl0aW9ucyI6W3siZm4iOiJib29sZWFuRXF1YWxzIiwiYXJndiI6
W3RydWUseyJmbiI6ImdldEF0dHIiLCJhcmd2IjpbeyJyZWYiOiJQYXJ0aXRp
b25SZXN1bHQifSwic3VwcG9ydHNGSVBTIl19XX0seyJmbiI6ImJvb2xlYW5F
cXVhbHMiLCJhcmd2IjpbdHJ1ZSx7ImZuIjoiZ2V0QXR0ciIsImFyZ3YiOlt7
InJlZiI6IlBhcnRpdGlvblJlc3VsdCJ9LCJzdXBwb3J0c0R1YWxTdGFjayJd
fV19XSwidHlwZSI6InRyZWUiLCJydWxlcyI6W3siY29uZGl0aW9ucyI6W10s
ImVuZHBvaW50Ijp7InVybCI6Imh0dHBzOi8vaGVhbHRoLWZpcHMue1JlZ2lv
bn0ue1BhcnRpdGlvblJlc3VsdCNkdWFsU3RhY2tEbnNTdWZmaXh9IiwicHJv
cGVydGllcyI6e30sImhlYWRlcnMiOnt9fSwidHlwZSI6ImVuZHBvaW50In1d
fSx7ImNvbmRpdGlvbnMiOltdLCJlcnJvciI6IkZJUFMgYW5kIER1YWxTdGFj
ayBhcmUgZW5hYmxlZCwgYnV0IHRoaXMgcGFydGl0aW9uIGRvZXMgbm90IHN1
cHBvcnQgb25lIG9yIGJvdGgiLCJ0eXBlIjoiZXJyb3IifV19LHsiY29uZGl0
aW9ucyI6W3siZm4iOiJib29sZWFuRXF1YWxzIiwiYXJndiI6W3sicmVmIjoi
VXNlRklQUyJ9LHRydWVdfV0sInR5cGUiOiJ0cmVlIiwicnVsZXMiOlt7ImNv
bmRpdGlvbnMiOlt7ImZuIjoiYm9vbGVhbkVxdWFscyIsImFyZ3YiOlt0cnVl
LHsiZm4iOiJnZXRBdHRyIiwiYXJndiI6W3sicmVmIjoiUGFydGl0aW9uUmVz
dWx0In0sInN1cHBvcnRzRklQUyJdfV19XSwidHlwZSI6InRyZWUiLCJydWxl
cyI6W3siY29uZGl0aW9ucyI6W10sInR5cGUiOiJ0cmVlIiwicnVsZXMiOlt7
ImNvbmRpdGlvbnMiOltdLCJlbmRwb2ludCI6eyJ1cmwiOiJodHRwczovL2hl
YWx0aC1maXBzLntSZWdpb259LntQYXJ0aXRpb25SZXN1bHQjZG5zU3VmZml4
fSIsInByb3BlcnRpZXMiOnt9LCJoZWFkZXJzIjp7fX0sInR5cGUiOiJlbmRw
b2ludCJ9XX1dfSx7ImNvbmRpdGlvbnMiOltdLCJlcnJvciI6IkZJUFMgaXMg
ZW5hYmxlZCBidXQgdGhpcyBwYXJ0aXRpb24gZG9lcyBub3Qgc3VwcG9ydCBG
SVBTIiwidHlwZSI6ImVycm9yIn1dfSx7ImNvbmRpdGlvbnMiOlt7ImZuIjoi
Ym9vbGVhbkVxdWFscyIsImFyZ3YiOlt7InJlZiI6IlVzZUR1YWxTdGFjayJ9
LHRydWVdfV0sInR5cGUiOiJ0cmVlIiwicnVsZXMiOlt7ImNvbmRpdGlvbnMi
Olt7ImZuIjoiYm9vbGVhbkVxdWFscyIsImFyZ3YiOlt0cnVlLHsiZm4iOiJn
ZXRBdHRyIiwiYXJndiI6W3sicmVmIjoiUGFydGl0aW9uUmVzdWx0In0sInN1
cHBvcnRzRHVhbFN0YWNrIl19XX1dLCJ0eXBlIjoidHJlZSIsInJ1bGVzIjpb
eyJjb25kaXRpb25zIjpbXSwiZW5kcG9pbnQiOnsidXJsIjoiaHR0cHM6Ly9o
ZWFsdGgue1JlZ2lvbn0ue1BhcnRpdGlvblJlc3VsdCNkdWFsU3RhY2tEbnNT
dWZmaXh9IiwicHJvcGVydGllcyI6e30sImhlYWRlcnMiOnt9fSwidHlwZSI6
ImVuZHBvaW50In1dfSx7ImNvbmRpdGlvbnMiOltdLCJlcnJvciI6IkR1YWxT
dGFjayBpcyBlbmFibGVkIGJ1dCB0aGlzIHBhcnRpdGlvbiBkb2VzIG5vdCBz
dXBwb3J0IER1YWxTdGFjayIsInR5cGUiOiJlcnJvciJ9XX0seyJjb25kaXRp
b25zIjpbXSwidHlwZSI6InRyZWUiLCJydWxlcyI6W3siY29uZGl0aW9ucyI6
W3siZm4iOiJzdHJpbmdFcXVhbHMiLCJhcmd2IjpbeyJyZWYiOiJSZWdpb24i
fSwiYXdzLWdsb2JhbCJdfV0sImVuZHBvaW50Ijp7InVybCI6Imh0dHBzOi8v
Z2xvYmFsLmhlYWx0aC5hbWF6b25hd3MuY29tIiwicHJvcGVydGllcyI6eyJh
dXRoU2NoZW1lcyI6W3sibmFtZSI6InNpZ3Y0Iiwic2lnbmluZ05hbWUiOiJo
ZWFsdGgiLCJzaWduaW5nUmVnaW9uIjoidXMtZWFzdC0xIn1dfSwiaGVhZGVy
cyI6e319LCJ0eXBlIjoiZW5kcG9pbnQifSx7ImNvbmRpdGlvbnMiOlt7ImZu
Ijoic3RyaW5nRXF1YWxzIiwiYXJndiI6W3sicmVmIjoiUmVnaW9uIn0sImF3
cy1jbi1nbG9iYWwiXX1dLCJlbmRwb2ludCI6eyJ1cmwiOiJodHRwczovL2ds
b2JhbC5oZWFsdGguYW1hem9uYXdzLmNvbS5jbiIsInByb3BlcnRpZXMiOnsi
YXV0aFNjaGVtZXMiOlt7Im5hbWUiOiJzaWd2NCIsInNpZ25pbmdOYW1lIjoi
aGVhbHRoIiwic2lnbmluZ1JlZ2lvbiI6ImNuLW5vcnRod2VzdC0xIn1dfSwi
aGVhZGVycyI6e319LCJ0eXBlIjoiZW5kcG9pbnQifSx7ImNvbmRpdGlvbnMi
OltdLCJlbmRwb2ludCI6eyJ1cmwiOiJodHRwczovL2hlYWx0aC57UmVnaW9u
fS57UGFydGl0aW9uUmVzdWx0I2Ruc1N1ZmZpeH0iLCJwcm9wZXJ0aWVzIjp7
fSwiaGVhZGVycyI6e319LCJ0eXBlIjoiZW5kcG9pbnQifV19XX1dfQ==

    JSON
  end
end
