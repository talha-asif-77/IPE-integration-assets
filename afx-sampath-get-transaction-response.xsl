<xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"  xmlns:ser="http://service.ws.erm.sampath" xmlns:ws="http://service.ws.erm.sampath">
  <xsl:output method="html"  indent="yes" omit-xml-declaration="yes"/>
   <xsl:param name="PartnerRequestBody" />
  <xsl:variable name="lookupTable" select="document('sampath-mappingLookup.xml')"/>
  <xsl:param name="Partner_Ref_No" />


  <xsl:template match="/">
        <xsl:apply-templates select="//ws:inquireTransactionReturn[ws:pin = $Partner_Ref_No]" />
    </xsl:template>
  
  <!-- identity template to copy all nodes and attributes -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

  <xsl:template match="ws:inquireTransactionReturn">

  <xsl:variable name="Partner_Return_Code" select="ws:recStatus" />
  <xsl:variable name="Partner_Return_Desc" select="ws:msgText" />
  <xsl:variable name="afx-code" select="$lookupTable/lookup/getTransactionStatus/returnCode/code[@value=$Partner_Return_Code]"/>
  <root>
    <IP>							
	<IP_Header>						
		<CIF></CIF>					
		<Partner_Ref_No></Partner_Ref_No>					
		<Partner_Code></Partner_Code>					
		<Operation_Type></Operation_Type>					
							
		<Request_Timestamp></Request_Timestamp>					
							
		<Response_Timestamp></Response_Timestamp>					
							
		<Business_Return_Code> <xsl:value-of select="$afx-code"/></Business_Return_Code>					
        <Business_Return_Desc> <xsl:value-of select="$lookupTable/lookup/returnDesc/code[@value=$afx-code]"/></Business_Return_Desc>					
        <Partner_Return_Code> <xsl:value-of select="$Partner_Return_Code"/></Partner_Return_Code>					
        <Partner_Return_Desc> <xsl:value-of select="$Partner_Return_Desc"/></Partner_Return_Desc>					
		<Status></Status>					
		
    		<Exact_Response>  <xsl:copy-of select="."/> </Exact_Response>
    <Partner_Request><xsl:value-of select="$PartnerRequestBody"  disable-output-escaping="yes" /></Partner_Request>	
    <Unique_Id><xsl:value-of select="$Partner_Ref_No" /></Unique_Id>			
	</IP_Header>						
	<Get_Remittance_Transaction_Status_Response>						
		<Txn_Type><xsl:value-of select="ws:txnType" /></Txn_Type>		
		<Txn_No><xsl:value-of select="ws:pin" /></Txn_No>					
		<Txn_Status><xsl:value-of select="ws:txnStatus" /></Txn_Status>					
		<No_of_Txn></No_of_Txn>					
							
		<Response_Status></Response_Status>

	</Get_Remittance_Transaction_Status_Response>						
</IP>							
</root>
  </xsl:template>
</xsl:stylesheet>
