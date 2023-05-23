<xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:temp="http://tempuri.org/">
  <xsl:output method="html"  indent="yes" omit-xml-declaration="yes"/>
  <xsl:variable name="lookupTable" select="document('mappingLookup.xml')"/>

  <xsl:template match="/">
 
      <xsl:variable name="Partner_Return_Code" select="//*[local-name()='StatusCode']" />
      <xsl:variable name="Partner_Return_Desc" select="//*[local-name()='StatusMessage']" />
      <xsl:variable name="afx-code" select="$lookupTable/lookup/cancelTransaction/returnCode/code[@value=$Partner_Return_Code]"/>
        <IP>							
      <IP_Header>						
        <CIF></CIF>					
        <Partner_Ref_No> <xsl:value-of select="//*[local-name()='ReferenceNo']" /></Partner_Ref_No>					
  			
        <Partner_Code></Partner_Code>					
        <Transaction_No></Transaction_No>					
        <Operation_Type></Operation_Type>					
        <Terminal_Id></Terminal_Id>					
                  
        <Request_Timestamp></Request_Timestamp>					
        <Response_Timestamp></Response_Timestamp>					
                  
        <Business_Return_Code> <xsl:value-of select="$afx-code"/></Business_Return_Code>					
        <Business_Return_Desc> <xsl:value-of select="$lookupTable/lookup/returnDesc/code[@value=$afx-code]"/></Business_Return_Desc>			
        <Partner_Return_Code> <xsl:value-of select="Partner_Return_Code"/></Partner_Return_Code>					
        <Partner_Return_Desc> <xsl:value-of select="Partner_Return_Desc"/></Partner_Return_Desc>					
                  
      </IP_Header>	

        <Validate_Beneficiary_Account_Response>						
          <Beneficiary>					
            <Account_Status><xsl:value-of select="//*[local-name()='AccountStatus']" /></Account_Status>				
            <Account_Number><xsl:value-of select="//*[local-name()='BOCAccountNo']" /></Account_Number>				
            <Account_Title><xsl:value-of select="//*[local-name()='RefereAccountHolderNamenceNo']" /> </Account_Title>				
            <Account_Currency><xsl:value-of select="//*[local-name()='AccountCurrency']" />  </Account_Currency>				
            <Account_Type></Account_Type>	
            <Joint_Account_Title><xsl:value-of  select="//*[local-name()='JointAccountName1']" /></Joint_Account_Title>
            <Is_Joint_Account><xsl:value-of   select="//*[local-name()='IsJointAccount']" /> </Is_Joint_Account>			
            <First_Name></First_Name>				
            <Last_Name></Last_Name>				
          </Beneficiary>					
          <Bank_Details>					
            <Code></Code>				
            <Name></Name>				
            <Br_Code><xsl:value-of select="//*[local-name()='BOCBranchCode']" /> </Br_Code>				
            <Br_Name></Br_Name>				
            <Br_City></Br_City>				
            <Country_Code></Country_Code>				
            <IBAN></IBAN>				
          </Bank_Details>					
          <Amount_Paid></Amount_Paid>					
          <Id_No></Id_No>					
        </Validate_Beneficiary_Account_Response>						
      </IP>							
  </xsl:template>
</xsl:stylesheet>