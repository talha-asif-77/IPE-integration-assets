<xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:temp="http://tempuri.org/">
  <xsl:output method="html"  indent="yes" omit-xml-declaration="yes"/>
  <xsl:variable name="lookupTable" select="document('mappingLookup.xml')"/>

  <xsl:template match="/">
 
  <xsl:variable name="Partner_Return_Code" select="//*[local-name()='StatusCode']" />
  <xsl:variable name="Partner_Return_Desc" select="//*[local-name()='StatusMessage']" />
  <xsl:variable name="afx-code" select="$lookupTable/lookup/cancelTransaction/returnCode/code[@value=$Partner_Return_Code]"/>
  <root>
    <IP>							
      <IP_Header>						
        <CIF></CIF>					
        <Partner_Ref_No> <xsl:value-of select="//*[local-name()='ReferenceNo']" /></Partner_Ref_No>					
        <Partner_Code></Partner_Code>					
        <Transaction_No></Transaction_No>					
        <Operation_Type></Operation_Type>					
        <Terminal_Id></Terminal_Id>					
                  
        <Request_Timestamp></Request_Timestamp>					
        <Response_Timestamp></Response_Timestamp>					
                  
        <Business_Return_Code> <xsl:value-of select="$afx-code"/></Business_Return_Code>					
        <Business_Return_Desc> <xsl:value-of select="$lookupTable/lookup/returnDesc/code[@value=$afx-code]"/></Business_Return_Desc>					
        <Partner_Return_Code> <xsl:value-of select="$Partner_Return_Code"/></Partner_Return_Code>					
        <Partner_Return_Desc> <xsl:value-of select="$Partner_Return_Desc"/></Partner_Return_Desc>					
                  
      </IP_Header>						
    </IP>							
    </root>
  </xsl:template>
</xsl:stylesheet>
