<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
exclude-result-prefixes="xs">
<xsl:import href="dateTemplate.xsl"/>
<xsl:output method="html" omit-xml-declaration="yes"/>
 <xsl:param name="PartnerRequestBody" />
 <xsl:param name="Partner_Ref_No" />

<xsl:variable name="lookupTable" select="document('sampath-mappingLookup.xml')"/>

  <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

  <xsl:template match="/">


  <xsl:variable name="Partner_Return_Code"  select="//*[local-name()='processTransactionReturn']" /> 
  <xsl:variable name="Partner_Return_Desc"  select="//*[local-name()='processTransactionReturn']" /> 
  <xsl:variable name="afx-code" select="$lookupTable/lookup/processTransaction/returnCode/code[@value=$Partner_Return_Code]"/>
    <root>
    <IP>							
      <IP_Header>						
        <CIF></CIF>					
        <Partner_Ref_No></Partner_Ref_No>					
  			
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

        		<Exact_Response>  <xsl:copy-of select="."/> </Exact_Response>
            <Partner_Request><xsl:value-of select="$PartnerRequestBody"  disable-output-escaping="yes" /></Partner_Request>	
            <Unique_Id><xsl:value-of select="$Partner_Ref_No" /></Unique_Id>
                  
      </IP_Header>						
    </IP>		
    </root>
  </xsl:template>
</xsl:stylesheet>
