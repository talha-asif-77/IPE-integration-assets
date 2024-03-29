<xsl:stylesheet version="1.0"
xmlns:json="http://json.org/"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema">
<xsl:import href="dateTemplate.xsl"/>
<xsl:output method="html" />

<xsl:variable name="lookupTable" select="document('pb-mappingLookup.xml')"/>

<xsl:template match="/">
  
  <xsl:variable name="convertedDate">
             <xsl:call-template name="convertDateTime-to-dd-MMM-yyyy">
                          <xsl:with-param name="inputDateTime" select="root/IP/Send_Remitance_Transaction_Request/Transaction/Transaction_Value_Date" />
            </xsl:call-template>
 </xsl:variable>
 <xsl:variable name="DOB">
             <xsl:call-template name="convertDateTime-to-dd-MMM-yyyy">
                          <xsl:with-param name="inputDateTime" select="root/IP/Send_Remitance_Transaction_Request/Remitter/DOB" />
            </xsl:call-template>
 </xsl:variable>
 <xsl:variable name="Rem_Identity_Issue">
             <xsl:call-template name="convertDateTime-to-dd-MMM-yyyy">
                          <xsl:with-param name="inputDateTime" select="root/IP/Send_Remitance_Transaction_Request/Remitter/Identity_Issue_Date" />
            </xsl:call-template>
 </xsl:variable>
 <xsl:variable name="Rem_Identity_Expire">
             <xsl:call-template name="convertDateTime-to-dd-MMM-yyyy">
                          <xsl:with-param name="inputDateTime" select="root/IP/Send_Remitance_Transaction_Request/Remitter/Identity_Expiry_Date" />
            </xsl:call-template>
 </xsl:variable>
  <xsl:variable name="Ben_Identity_Issue">
             <xsl:call-template name="convertDateTime-to-dd-MMM-yyyy">
                          <xsl:with-param name="inputDateTime" select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Identity_Issue_Date" />
            </xsl:call-template>
 </xsl:variable>
 <xsl:variable name="Ben_Identity_Expire">
             <xsl:call-template name="convertDateTime-to-dd-MMM-yyyy">
                          <xsl:with-param name="inputDateTime" select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Identity_Expiry_Date" />
            </xsl:call-template>
 </xsl:variable>

  <xsl:variable name="transactionPurpose" select="root/IP/Send_Remitance_Transaction_Request/Transaction/Transaction_Purpose"/>
  <xsl:variable name="deliveryType" select="root/IP/Send_Remitance_Transaction_Request/Delivery_Type"/>

{
  "AgentReferenceNo": "<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Transaction/Transaction_No" />",
  "ValueDate": "<xsl:value-of select="$convertedDate" />",
  "TransactionServiceCode": "<xsl:value-of select="$lookupTable/lookup/processTransaction/disbursalType/code[@value=$deliveryType]" />",
  "SendingAgentCode": "105",
  "SendingCurCode": "AED",
  "ReceivingCurCode": "<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Receiver_Currency" />",
  "CustomerFirstName": "<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/First_Name" />",
  "CustomerMiddleName": "<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Second_Name" />",
  "CustomerLastName": "<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Last_Name" />",
  "CustomerConCode": "<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Identity_Country_Id_ISO2" />",
  "CustomerPhone": "<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/TelNo" />",
  "CustomerMobile": "<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/MobileNo" />",
  "CustomerAddr1": "<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Address1" />",
  "CustomerAddr2": "<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Address2" />",
  "CustomerAddr3": "",
  "CustomerDOB": "<xsl:value-of select="$DOB" />",
  "CustomerIDType":"<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Identity_Type" />",
  "CustomerIDNO": "<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Identity_No" />",
  "CustomerIDIssDate": "<xsl:value-of select="$Rem_Identity_Issue" />",
  "CustomerIDExpDate": "<xsl:value-of select="$Rem_Identity_Expire" />",
  "BeneficiaryFirstName": "<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/First_Name" />",
  "BeneficiaryMiddleName": "<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Second_Name" />",
  "BeneficiaryLastName":"<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Last_Name" />",
  "BeneficiaryConCode": "<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Identity_Country_Id_ISO2" />",
  "BeneficiaryPhone": "<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/TelNo" />",
  "BeneficiaryMobile": "<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Mobile" />",
  "BeneficiaryAddr1": "<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Address1" />",
  "BeneficiaryAddr2": "<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Address2" />",
  "BeneficiaryAddr3": "",
  "BeneficiaryIDType": "<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Identity_Type" />",
  "BeneficiaryIDNO": "<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Identity_No" />",
  "BeneficiaryIDIssDate": "<xsl:value-of select="$Ben_Identity_Issue" />",
  "BeneficiaryIDExpDate": "<xsl:value-of select="$Ben_Identity_Expire" />",
  "BankAccNO": "<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Account_No" />",
  "BankCode": "<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary_Bank/Code" />",
  "BranchCode": "<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary_Bank/Branch/Br_Code" />",
  "FXAmount": "<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Foreign_Currency_Amount" />",
  "PurposeCode": "<xsl:value-of select="$lookupTable/lookup/processTransaction/purposeCode/code[@value=$transactionPurpose]" />",
  "SourceCode": "<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Source_of_Fund" />",
  "TransactionRemarks": "",
  "username": "ALFAUATAE",
  "password": "ENR02WVB",
  "agentcode": "105",
  "retryCount": "<xsl:value-of select="root/IP/IP_Header/retryCount" />",
  "Partner_Ref_No": "<xsl:value-of select="root/IP/IP_Header/Partner_Ref_No" />"
}
  </xsl:template>
</xsl:stylesheet>
