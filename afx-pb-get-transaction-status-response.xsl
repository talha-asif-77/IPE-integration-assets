<xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:temp="http://tempuri.org/">
  <xsl:output method="html"  indent="yes" omit-xml-declaration="yes"/>
  <xsl:variable name="lookupTable" select="document('pb-mappingLookup.xml')"/>

  <xsl:template match="/">

  <xsl:variable name="Partner_Return_Code" select="//*[local-name()='StatusCode']" />
  <xsl:variable name="Partner_Return_Desc" select="//*[local-name()='StatusMessage']" />
  <xsl:variable name="afx-code" select="$lookupTable/lookup/processTransaction/returnCode/code[@value=$Partner_Return_Code]"/>
    <IP>							
      <IP_Header>						
        <CIF></CIF>					
        <Partner_Code></Partner_Code>					
        <Transaction_No><xsl:value-of select="//*[local-name()='ReferenceNo']" /></Transaction_No>					
        <Operation_Type></Operation_Type>					
        <Terminal_Id></Terminal_Id>					
        <ReferenceNo> <xsl:value-of select="//*[local-name()='BankReferenceNo']" /></ReferenceNo>				
        <Transaction_Status> </Transaction_Status>				
        <Request_Timestamp></Request_Timestamp>					
        <Response_Timestamp></Response_Timestamp>					
        <Partner_Ref_No> <xsl:value-of select="//*[local-name()='ReferenceNo']" /></Partner_Ref_No> 

        <Business_Return_Code> <xsl:value-of select="$afx-code"/></Business_Return_Code>					
        <Business_Return_Desc> <xsl:value-of select="$lookupTable/lookup/returnDesc/code[@value=$afx-code]"/></Business_Return_Desc>					
        <Partner_Return_Code> <xsl:value-of select="$Partner_Return_Code"/></Partner_Return_Code>					
        <Partner_Return_Desc> <xsl:value-of select="$Partner_Return_Desc"/></Partner_Return_Desc>					
        <Status></Status>		  
        <Exact_Response>  <xsl:copy-of select="."/> </Exact_Response>
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
