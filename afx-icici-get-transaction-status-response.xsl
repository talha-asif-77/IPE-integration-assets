<xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:temp="http://tempuri.org/">
  <xsl:output method="html"  indent="yes" omit-xml-declaration="yes"/>
  <xsl:variable name="lookupTable" select="document('icici-mappingLookup.xml')"/>
	 <xsl:param name="PartnerRequestBody" />
	 	<xsl:param name="Partner_Ref_No" />

<!-- identity template to copy all nodes and attributes -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
  <xsl:template match="/">


  <xsl:variable name="Partner_Return_Code" select="TrnOrderAck/AckStatus" />
  <xsl:variable name="Partner_Return_Desc" select="TrnOrderAck/Reason" />
  <xsl:variable name="afx-code" select="$lookupTable/lookup/processTransaction/returnCode/code[@value=$Partner_Return_Code]"/>
    <IP>							
      <IP_Header>						
        <CIF></CIF>					
        <Partner_Code></Partner_Code>					
        <Transaction_No></Transaction_No>					
        <Operation_Type></Operation_Type>					
        <Terminal_Id></Terminal_Id>					
        <ReferenceNo> <xsl:value-of select="TrnOrderAck/correspondentid" /></ReferenceNo>				
        <Transaction_Status> </Transaction_Status>				
        <Request_Timestamp></Request_Timestamp>					
        <Response_Timestamp><xsl:value-of select="TrnOrderAck/ProcessDateTime" /></Response_Timestamp>					
        <Partner_Ref_No> <xsl:value-of select="TrnOrderAck/EHReferenceNo" /></Partner_Ref_No> 

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
          <Txn_Type></Txn_Type>					
          <Txn_No></Txn_No>					
          <Txn_Status><xsl:variable name="Partner_Return_Code" select="//*[local-name()='TransactionStatus']" /></Txn_Status>					
          <No_of_Txn></No_of_Txn>					
                    
          <Response_Status></Response_Status>					
        </Get_Remittance_Transaction_Status_Response>	
    </IP>		
  </xsl:template>
</xsl:stylesheet>
