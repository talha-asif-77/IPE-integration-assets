<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:web="https://himalremituat.himalayanbank.com/webService/" xmlns:rem="http://himalremituat.himalayanbank.com/soap/RemittanceWebService">
<xsl:import href="dateTemplate.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:variable name="lookupTable" select="document('himal-mappingLookup.xml')"/>

  <xsl:template match="/">
  <xsl:variable name="convertedDate1">
             <xsl:call-template name="convertDateTime-to-YYYYMMDD">
                          <xsl:with-param name="inputDateTime" select="root/IP/Send_Remitance_Transaction_Request/Transaction/Transaction_Created_Date" />
            </xsl:call-template>
 </xsl:variable>
 <xsl:variable name="convertedDate2">
             <xsl:call-template name="convertDateTime-to-YYYYMMDD">
                          <xsl:with-param name="inputDateTime" select="root/IP/IP_Header/Request_Timestamp" />
            </xsl:call-template>
 </xsl:variable>
  <xsl:variable name="First_Name" select="root/IP/Send_Remitance_Transaction_Request/Remitter/First_Name"/>
  <xsl:variable name="Second_Name" select="root/IP/Send_Remitance_Transaction_Request/Remitter/Second_Name"/>
  <xsl:variable name="Third_Name" select="root/IP/Send_Remitance_Transaction_Request/Remitter/Third_Name"/>
  <xsl:variable name="Last_Name" select="root/IP/Send_Remitance_Transaction_Request/Remitter/Last_Name"/>
  <xsl:variable name="Bene_First_Name" select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/First_Name"/>
  <xsl:variable name="Bene_Second_Name" select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Second_Name"/>
  <xsl:variable name="Bene_Third_Name" select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Third_Name"/>
  <xsl:variable name="Bene_Last_Name" select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Last_Name"/>
  <xsl:variable name="Delivery_Type" select="root/IP/Send_Remitance_Transaction_Request/Delivery_Type"/>
  <xsl:variable name="Identity_Type" select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Identity_Type"/>

    <soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:web="https://himalremituat.himalayanbank.com/webService/">
      <soapenv:Header/>
      <soapenv:Body>
        <web:RemitInterfaceAPI soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
          <soapObjects xsi:type="rem:RemitInterfaceSoapObjectArray">
            <TransactionNumber xsi:type="xsd:string">
              <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Transaction/Transaction_No"/>
            </TransactionNumber>
            <TransactionDate xsi:type="xsd:string">
				<xsl:value-of select="$convertedDate1"/>
            </TransactionDate>
            <TransactionLCY xsi:type="xsd:string">
              <xsl:value-of select="/IP/Send_Remitance_Transaction_Request/Remitter/Local_Currency"/>
            </TransactionLCY>
            <TransactionLCYAmount xsi:type="xsd:string">
                <xsl:choose>
                    <xsl:when test="root/IP/Send_Remitance_Transaction_Request/Remitter/Local_Currency_Amount != ''">
                        <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Local_Currency_Amount"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Amount_Paid"/>
                    </xsl:otherwise>
                </xsl:choose>
            </TransactionLCYAmount>
            <TransactionChargesInLCY xsi:type="xsd:string">
              <xsl:value-of select="/IP/Send_Remitance_Transaction_Request/Partner_Bank_Charges"/>
            </TransactionChargesInLCY>
            <RateOfTransaction xsi:type="xsd:string">
              <xsl:value-of select="/IP/Send_Remitance_Transaction_Request/Beneficiary/Exchange_Rate"/>
            </RateOfTransaction>
            <AmountToPayInFCY xsi:type="xsd:string">
              <xsl:value-of select="/IP/Send_Remitance_Transaction_Request/Beneficiary/Beneficiary_Currency_Amount"/>
            </AmountToPayInFCY>
            <CurrencyCodeInPCY xsi:type="xsd:string">NPR</CurrencyCodeInPCY>
            <CorrespondentBankCode xsi:type="xsd:string">
              <xsl:value-of select="$lookupTable/lookup/processTransaction/correspBankCode/code[@value=$Delivery_Type]"/>
            </CorrespondentBankCode>
             
            <CorrespondentBranchCode xsi:type="xsd:string">
              <xsl:value-of select="$lookupTable/lookup/processTransaction/CorrespondentBranchCode/code[@value=$Delivery_Type]"/>
            </CorrespondentBranchCode>
			<RemitterName xsi:type="xsd:string">
              <xsl:value-of select="concat($First_Name,' ',$Second_Name,' ',$Third_Name,' ',$Last_Name)" />
            </RemitterName>
           <RemitterAddress1 xsi:type="xsd:string">
              <xsl:value-of select="/IP/Send_Remitance_Transaction_Request/Remitter/Address1"/>
            </RemitterAddress1>
            <RemitterAddress2 xsi:type="xsd:string">
              <xsl:value-of select="/IP/Send_Remitance_Transaction_Request/Remitter/Address2"/>
            </RemitterAddress2>
            <RemitterAddress3 xsi:type="xsd:string">
              <xsl:value-of select="/IP/Send_Remitance_Transaction_Request/Remitter/Address2"/>
            </RemitterAddress3>
            <RemitterPhoneNumber xsi:type="xsd:string">
              <xsl:value-of select="/IP/Send_Remitance_Transaction_Request/Remitter/MobileNo"/>
            </RemitterPhoneNumber>
            <RemitterPinCode xsi:type="xsd:string"/>
            <BeneficiaryName xsi:type="xsd:string">
              <xsl:value-of select="concat($Bene_First_Name,' ',$Bene_Second_Name,' ',$Bene_Third_Name,' ',$Bene_Last_Name)" />
            </BeneficiaryName>
            <BeneficiaryAccountNumber xsi:type="xsd:string">
              <xsl:value-of select="/IP/Send_Remitance_Transaction_Request/Beneficiary/Account_No"/>
            </BeneficiaryAccountNumber>
			<BeneficiaryAccountDetail xsi:type="xsd:string"></BeneficiaryAccountDetail>
            <BeneficiaryAddress1 xsi:type="xsd:string">
                <xsl:value-of select="/IP/Send_Remitance_Transaction_Request/Beneficiary/Address1"/>
            </BeneficiaryAddress1>
            <BeneficiaryAddress2 xsi:type="xsd:string">
                <xsl:value-of select="/IP/Send_Remitance_Transaction_Request/Beneficiary/Address2"/>
            </BeneficiaryAddress2>
            <BeneficiaryAddress3 xsi:type="xsd:string">
                <xsl:value-of select="/IP/Send_Remitance_Transaction_Request/Beneficiary/Address2"/>
            </BeneficiaryAddress3>
            <BeneficiaryCountry xsi:type="xsd:string">NP</BeneficiaryCountry>
            <BeneficiaryPhoneNumber xsi:type="xsd:string">
                <xsl:value-of select="/IP/Send_Remitance_Transaction_Request/Beneficiary/TelNo"/>
            </BeneficiaryPhoneNumber>
            <TransactionMethod xsi:type="xsd:string">
                <xsl:value-of select="$lookupTable/lookup/processTransaction/disbursalType/code[@value=$Delivery_Type]"/>
            </TransactionMethod>
            <BeneficiaryIdentity xsi:type="xsd:string">
                <xsl:value-of select="$lookupTable/lookup/processTransaction/idType/code[@value=$Identity_Type]"/>
            </BeneficiaryIdentity>
            <BenificiaryIDNo xsi:type="xsd:string">
                <xsl:value-of select="/IP/Send_Remitance_Transaction_Request/Beneficiary/Identity_No"/>
            </BenificiaryIDNo>
            <AgentID xsi:type="xsd:string">53</AgentID>
            <token_value xsi:type="xsd:string">alF3x18nq!</token_value>
            <SessionID xsi:type="xsd:string">
                <xsl:value-of select="concat($convertedDate2,'-',IP/IP_Header/Partner_Code)" />
            </SessionID>
        </soapObjects>
            </web:RemitInterfaceAPI>
         </soapenv:Body>
      </soapenv:Envelope>
   </xsl:template>
</xsl:stylesheet>