<xsl:stylesheet version="1.0"
xmlns:json="http://json.org/"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
>
<xsl:import href="dateTemplate.xsl"/>
<xsl:output method="html" />

<xsl:template match="/">
  
{
  "username": "ALFAUATAE",
  "password": "ENR02WVB",
  "agentcode": "105",
  "AgentAccountCode":"",
  "ReferenceNo": "<xsl:value-of select="root/IP/Get_Remittance_Transaction_Status_Request/Transaction_No" />"
}
  </xsl:template>
</xsl:stylesheet>
