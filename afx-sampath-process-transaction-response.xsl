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
  
  <xsl:variable name="convertedDate">
             <xsl:call-template name="convertDateTime-to-ISO">
                          <xsl:with-param name="inputDateTime" select="root/IP/IP_Header/Request_Timestamp" />
            </xsl:call-template>
 </xsl:variable>


  <xsl:variable name="Partner_Return_Code"  select="//processTransactionReturn[not(preceding-sibling::processTransactionReturn)]"/> 
  <xsl:variable name="Partner_Return_Desc"  select="//processTransactionReturn[not(preceding-sibling::processTransactionReturn)]"/>
  <xsl:variable name="afx-code" select="$lookupTable/lookup/returnCode/code[@value=$Partner_Return_Code]"/>
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

        <xsl:for-each select="//processTransactionReturn">

     <xsl:if test="processTransactionReturn=preceding::processTransactionReturn[1]">
     			<Partner_Return_Code> <xsl:value-of select="//processTransactionReturn"/></Partner_Return_Code>
     </xsl:if>
     <xsl:if test="processTransactionReturn=preceding::processTransactionReturn[2]">
     			 <Partner_Return_Desc> <xsl:value-of select="//processTransactionReturn"/></Partner_Return_Desc>	
     </xsl:if>
     </xsl:for-each>

				
        		<Exact_Response>  <xsl:copy-of select="."/> </Exact_Response>
            <Partner_Request><xsl:value-of select="$PartnerRequestBody"  disable-output-escaping="yes" /></Partner_Request>	
            <Unique_Id><xsl:value-of select="$Partner_Ref_No" /></Unique_Id>
                  
      </IP_Header>						
    </IP>		
  </xsl:template>
</xsl:stylesheet>
