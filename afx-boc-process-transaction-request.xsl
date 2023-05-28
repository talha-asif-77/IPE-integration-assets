<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
<xsl:import href="dateTemplate.xsl"/>
  <xsl:output method="xml" indent="yes"/>
  <xsl:variable name="lookupTable" select="document('mappingLookup.xml')"/>

  <xsl:template match="/">
  <xsl:variable name="convertedDate1">
             <xsl:call-template name="convertDateTime-to-YYYYMMDDHHMMSS">
                          <xsl:with-param name="inputDateTime" select="root/IP/IP_Header/Request_Timestamp" />
            </xsl:call-template>
 </xsl:variable>
 <xsl:variable name="convertedDate2">
             <xsl:call-template name="convertDateTime-to-DD-MM-YYYY">
                          <xsl:with-param name="inputDateTime" select="root/IP/Send_Remitance_Transaction_Request/Remitter/Identity_Expiry_Date" />
            </xsl:call-template>
 </xsl:variable>
 <xsl:variable name="convertedDate3">
             <xsl:call-template name="convertDateTime-to-dd-MMM-yyyy">
                          <xsl:with-param name="inputDateTime" select="root/IP/IP_Header/Request_Timestamp" />
            </xsl:call-template>
 </xsl:variable>
  <xsl:variable name="Delivery_Type" select="root/IP/Send_Remitance_Transaction_Request/Delivery_Type"/>
  <xsl:variable name="Identity_Type" select="root/IP/Send_Remitance_Transaction_Request/Remitter/Identity_Type"/>
  <xsl:variable name="Source_of_Fund" select="root/IP/Send_Remitance_Transaction_Request/Remitter/Source_of_Fund"/>
  <xsl:variable name="Transaction_Purpose" select="root/IP/Send_Remitance_Transaction_Request/Transaction/Transaction_Purpose"/>

    <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:tem="http://tempuri.org/">
      <soap:Header/>
      <soap:Body>
        <tem:CreateTXN>
          <tem:objProp>
             <tem:USERNAME>ALFUAEAPI01</tem:USERNAME>
            <tem:PASSWORD>EIn@0133</tem:PASSWORD>
            <tem:AGENTCODE>891</tem:AGENTCODE>
            <tem:SESSIONID>
              <xsl:value-of select="concat($convertedDate1,'-',root/IP/IP_Header/Partner_Code)" />
            </tem:SESSIONID>
            <tem:TrnsType>
              <xsl:value-of select="$lookupTable/lookup/processTransaction/disbursalType/code[@value=$Delivery_Type]"/>
            </tem:TrnsType>
            <tem:AgtTrnsRefno>
              <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Transaction/Transaction_No"/>
            </tem:AgtTrnsRefno>
            <tem:CustomerFirstName>
              <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/First_Name"/>
            </tem:CustomerFirstName>
            <tem:CustomerMiddleName>
              <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Second_Name"/>
            </tem:CustomerMiddleName>
            <tem:CustomerLastName>
              <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Last_Name"/>
            </tem:CustomerLastName>
            <tem:CustomerAddress>
              <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Address1"/>
            </tem:CustomerAddress>
            <tem:CustomerContact>
              <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/MobileNo"/>
            </tem:CustomerContact>
            <tem:CustomerIdentity>
              <xsl:value-of select="$lookupTable/lookup/processTransaction/senderIdType/code[@value=$Identity_Type]"/>
            </tem:CustomerIdentity>
            <tem:CustomerIdentityNo>
              <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Identity_No"/>
            </tem:CustomerIdentityNo>
            <tem:CustomerIDExpDate>
              <xsl:value-of select="$convertedDate2"/>
            </tem:CustomerIDExpDate>
            <tem:CustomerNationality>
              <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Nationality_Country_Id_ISO2"/>
            </tem:CustomerNationality>
			<tem:BeneficiaryFirstName>
              <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/First_Name"/>
            </tem:BeneficiaryFirstName>
            <tem:BeneficiaryMiddleName>
              <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Second_Name"/>
            </tem:BeneficiaryMiddleName>
            <tem:BeneficiaryLastName>
              <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Last_Name"/>
            </tem:BeneficiaryLastName>
            <tem:BeneficiaryAddress>
              <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Address1"/>
            </tem:BeneficiaryAddress>
            <tem:BeneficiaryIdentity>NIC</tem:BeneficiaryIdentity>
            <tem:BenfIdentiyNo>
              <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Identity_No"/>
            </tem:BenfIdentiyNo>
            <tem:BeneficiaryContactNumber>
              <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Mobile"/>
            </tem:BeneficiaryContactNumber>
            <tem:SendingCurrencyCode>
              <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Local_Currency"/>
            </tem:SendingCurrencyCode>
            <tem:SendingAmount>
              <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Amount_Paid"/>
            </tem:SendingAmount>
            <tem:AccountNo>
              <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Account_No"/>
            </tem:AccountNo>
            <tem:BeneficiaryBankCode>
              <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary_Bank/Code"/>
            </tem:BeneficiaryBankCode>
            <tem:BeneficiaryBranchCode>
              <xsl:value-of select="root/IPSend_Remitance_Transaction_Request/Beneficiary_Bank/Branch/Br_Code"/>
            </tem:BeneficiaryBranchCode>
            <tem:SourceofRemitance>
              <xsl:value-of select="$lookupTable/lookup/processTransaction/fundSourceType/code[@value=$Source_of_Fund]"/>
            </tem:SourceofRemitance>
            <tem:Purpose>
              <xsl:value-of select="$lookupTable/lookup/processTransaction/purposeCode/code[@value=$Transaction_Purpose]"/>
            </tem:Purpose>
            <tem:ValueDate>
              <xsl:value-of select="$convertedDate3"/>
            </tem:ValueDate>
          </tem:objProp>
        </tem:CreateTXN>
      </soap:Body>
    </soap:Envelope>
  </xsl:template>
</xsl:stylesheet>
