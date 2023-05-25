<xsl:stylesheet version="1.0"
xmlns:json="http://json.org/"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
>
<xsl:import href="dateTemplate.xsl"/>
<xsl:output method="html" />

<xsl:template match="/">
  
{
  "username": "userALF001",
  "password": "HSWND1J3",
  "agentcode": "ALF"
  "AgentAccountCode":"",
  "ReferenceNo": "<xsl:value-of select="root/IP/IP_Header/Partner_Ref_No" />"
}
  </xsl:template>
</xsl:stylesheet>
