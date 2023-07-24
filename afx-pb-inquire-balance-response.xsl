<xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:temp="http://tempuri.org/">
  <xsl:output method="html"  indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="PartnerRequestBody" />

  <xsl:variable name="lookupTable" select="document('mappingLookup.xml')"/>

  <xsl:template match="/">

  <xsl:variable name="Partner_Return_Code" select="//*[local-name()='Code']" />
  <xsl:variable name="Partner_Return_Desc" select="//*[local-name()='Message']" />
  <xsl:variable name="afx-code" select="$lookupTable/lookup/processTransaction/returnCode/code[@value=$Partner_Return_Code]"/>
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
			<Exact_Response>  <xsl:copy-of select="."/> </Exact_Response>
			<Partner_Request><xsl:value-of select="$PartnerRequestBody"  disable-output-escaping="yes" /></Partner_Request>		
		</IP_Header>						
		<Inquire_Balance_Response>						
			<Account_No><xsl:value-of select="//*[local-name()='AccountNumber']" /></Account_No>					
			<Balance_Amount><xsl:value-of select="//*[local-name()='BalanceAmount']" /></Balance_Amount>					
			<Currency_Code><xsl:value-of select="//*[local-name()='CurrencyCode']" /></Currency_Code>					
		</Inquire_Balance_Response>						
	</IP>				
    </root>			

  </xsl:template>
</xsl:stylesheet> 
