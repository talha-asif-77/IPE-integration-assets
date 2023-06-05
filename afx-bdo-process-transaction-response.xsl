<xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:temp="http://tempuri.org/">
  <xsl:output method="html"  indent="yes" omit-xml-declaration="yes"/>
  

<xsl:template match="/">
  <xsl:variable name="Partner_Return_Code" select="//*[local-name()='responseCode']"/>
  <xsl:variable name="Partner_Return_Desc" select="//*[local-name()='description']"/>
  
  <IP>
    <IP_Header>
    
    <Partner_Return_Code>
      <xsl:value-of select="$Partner_Return_Code"/>
    </Partner_Return_Code>
    <Partner_Return_Desc>
      <xsl:value-of select="$Partner_Return_Desc"/>
    </Partner_Return_Desc>
    </IP_Header>
  </IP>
</xsl:template>
</xsl:stylesheet>