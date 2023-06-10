<xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"  xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:tns="http://himalremituat.himalayanbank.com/soap/RemittanceWebService" >
  <xsl:output method="html" indent="yes" omit-xml-declaration="yes"/>
  <xsl:variable name="lookupTable" select="document('himal-mappingLookup.xml')"/>

  <xsl:template match="/">

  <xsl:variable name="Partner_Return_Code" select="//*[local-name()='Code']" />
  <xsl:variable name="Partner_Return_Desc" select="//*[local-name()='StatusDesc']" />
  <xsl:variable name="afx-code" select="$lookupTable/lookup/processTransaction/returnCode/code[@value=$Partner_Return_Code]"/>
    <IP>							
    <IP_Header>						
		<Partner_Ref_No></Partner_Ref_No>					
		<Partner_Code></Partner_Code>					
		<Transaction_No> <xsl:value-of select="//*[local-name()='TransactionNumber']" /></Transaction_No>					
		<Operation_Type></Operation_Type>					
		<Terminal_Id></Terminal_Id>					
							
		<ReferenceNo></ReferenceNo>					
		<Transaction_Status></Transaction_Status>					
							
							
		<Request_Timestamp></Request_Timestamp>					
		<Response_Timestamp></Response_Timestamp>					
							
		<Business_Return_Code> <xsl:value-of select="$afx-code"/></Business_Return_Code>					
    <Business_Return_Desc> <xsl:value-of select="$lookupTable/lookup/returnDesc/code[@value=$afx-code]"/></Business_Return_Desc>					
    <Partner_Return_Code> <xsl:value-of select="$Partner_Return_Code"/></Partner_Return_Code>					
    <Partner_Return_Desc> <xsl:value-of select="$Partner_Return_Desc"/></Partner_Return_Desc>					
							
	</IP_Header>						
</IP>							

  </xsl:template>
</xsl:stylesheet>
