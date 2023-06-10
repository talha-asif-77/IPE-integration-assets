<xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:temp="http://tempuri.org/">
  <xsl:output method="html"  indent="yes" omit-xml-declaration="yes"/>
   <xsl:param name="PartnerRequestBody" />
  <xsl:variable name="lookupTable" select="document('himal-mappingLookup.xml')"/>

  <!-- identity template to copy all nodes and attributes -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

  <xsl:template match="/">

  <xsl:variable name="Partner_Return_Code" select="//*[local-name()='Code']" />
  <xsl:variable name="Partner_Return_Desc" select="//*[local-name()='StatusDesc']" />
  <xsl:variable name="afx-code" select="$lookupTable/lookup/getTransaction/returnCode/code[@value=$Partner_Return_Code]"/>
    <IP>							
	<IP_Header>						
		<CIF></CIF>					
		<Partner_Ref_No></Partner_Ref_No>					
		<Partner_Code><xsl:value-of select="//*[local-name()='CorrespondentBankCode']" /></Partner_Code>					
		<Operation_Type></Operation_Type>					
							
		<Request_Timestamp></Request_Timestamp>					
							
		<Response_Timestamp></Response_Timestamp>					
							
		<Business_Return_Code> <xsl:value-of select="$afx-code"/></Business_Return_Code>					
        <Business_Return_Desc> <xsl:value-of select="$lookupTable/lookup/returnDesc/code[@value=$afx-code]"/></Business_Return_Desc>					
        <Partner_Return_Code> <xsl:value-of select="$Partner_Return_Code"/></Partner_Return_Code>					
        <Partner_Return_Desc> <xsl:value-of select="$Partner_Return_Desc"/></Partner_Return_Desc>				
		<Status></Status>					
							
	</IP_Header>						
	<Get_Remittance_Transaction_Status_Response>						
		<Txn_Type></Txn_Type>					
		<Txn_No><xsl:value-of select="//*[local-name()='TransactionNumber']" /></Txn_No>					
		<Txn_Status><xsl:value-of select="//*[local-name()='Status']" /></Txn_Status>					
		<No_of_Txn></No_of_Txn>					
							
		<Response_Status></Response_Status>
		<Exact_Response>  <xsl:copy-of select="."/> </Exact_Response>
        <Partner_Request><xsl:value-of select="$PartnerRequestBody"  disable-output-escaping="yes" /></Partner_Request>					
	</Get_Remittance_Transaction_Status_Response>						
	</IP>							

  </xsl:template>
</xsl:stylesheet>