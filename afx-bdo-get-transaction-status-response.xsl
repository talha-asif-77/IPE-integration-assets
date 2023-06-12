<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
xmlns:SOAPenv="http://schemas.xmlSOAP.org/SOAP/envelope/"
xmlns:rem="http://www.bdo.com.ph/RemitAPI"
exclude-result-prefixes="xs">
<xsl:import href="dateTemplate.xsl"/>
<xsl:output method="html" omit-xml-declaration="yes"/>
<xsl:param name="PartnerBody" />
<xsl:param name="Partner_Ref_No" />

<xsl:variable name="lookupTable" select="document('bdo-mappingLookup.xml')"/>



    <!-- identity template to copy all nodes and attributes -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
  <xsl:variable name="Partner_Return_Code" select="//*[local-name()='status']"/>
  <xsl:variable name="Partner_Return_Desc" select="//*[local-name()='remarks']"/>
  
  <xsl:variable name="afx-code" select="$lookupTable/lookup/processTransaction/returnCode/code[@value=$Partner_Return_Code]"/>

<xsl:template match="/">

    <root>  
        <IP>
             <IP_Header>
      
        <CIF></CIF>				
        <Partner_Ref_No><xsl:value-of select="//*[local-name()='invoiceNo']"/></Partner_Ref_No>				
        <Partner_Code></Partner_Code>				
        <Operation_Type></Operation_Type>				
        <Request_Timestamp><xsl:value-of select="//*[local-name()='dateProcessed']"/></Request_Timestamp>				
        <Response_Timestamp><xsl:value-of select="//*[local-name()='dateDelivered']"/></Response_Timestamp>		
        <Business_Return_Code> <xsl:value-of select="$afx-code"/></Business_Return_Code>					
        <Business_Return_Desc> <xsl:value-of select="$lookupTable/lookup/getTransactionStatus/returnDesc/code[@value=$afx-code]"/></Business_Return_Desc>						
        <Partner_Return_Code><xsl:value-of select="$Partner_Return_Code"/></Partner_Return_Code>
        <Partner_Return_Desc><xsl:value-of select="$Partner_Return_Desc"/></Partner_Return_Desc>

          
        <Exact_Response>  <xsl:copy-of select="."/> </Exact_Response>
        <Partner_Request><xsl:value-of select="$PartnerBody"  /></Partner_Request>
        <Unique_Id><xsl:value-of select="$Partner_Ref_No" /></Unique_Id>

      </IP_Header>
    </IP>
  </root>

</xsl:template>

</xsl:stylesheet>
