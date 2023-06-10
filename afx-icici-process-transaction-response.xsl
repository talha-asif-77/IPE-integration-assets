<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
exclude-result-prefixes="xs">
<xsl:output method="html" omit-xml-declaration="yes"/>
	 <xsl:param name="PartnerRequestBody" />
	 	<xsl:param name="Partner_Ref_No" />
<xsl:variable name="lookupTable" select="document('icici-mappingLookup.xml')"/>

 <xsl:variable name="Partner_Return_Code" select="TrnOrderAck/AckStatus" />
  <xsl:variable name="Partner_Return_Desc" select="TrnOrderAck/Reason" />
  <xsl:variable name="afx-code" select="$lookupTable/lookup/returnCode/processTransaction/code[@value=$Partner_Return_Code]"/>
    
	<!-- identity template to copy all nodes and attributes -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
	<xsl:template match="/">
<root>
<IP>						
    <IP_Header>					
		<Partner_Ref_No><xsl:value-of select="TrnOrderAck/EHReferenceNo" /></Partner_Ref_No>				
		<Partner_Code></Partner_Code>				
		<Transaction_No></Transaction_No>				
		<Operation_Type></Operation_Type>				
		<Terminal_Id></Terminal_Id>				
		<Partner_Id><xsl:value-of select="TrnOrderAck/correspondentid" /></Partner_Id>
		<ReferenceNo></ReferenceNo>				
		<Transaction_Status></Transaction_Status>				
						
						
		<Request_Timestamp></Request_Timestamp>				
		<Response_Timestamp><xsl:value-of select="TrnOrderAck/ProcessDateTime" /></Response_Timestamp>				
						
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
