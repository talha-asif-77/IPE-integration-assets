<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
exclude-result-prefixes="xs">
<xsl:import href="/dateTemplate.xsl"/>
<xsl:output method="xml" omit-xml-declaration="yes"/>
<xsl:variable name="lookupTable" select="document('icici-mappingLookup.xml')"/>
<xsl:variable name="country" select="document('countryCodeMapping.xml')"/>

<xsl:template match="/">
<xsl:variable name="current-date" select="root/IP/IP_Header/Request_Timestamp"/>
<xsl:variable name="current-date2" select="root/IP/Send_Remitance_Transaction_Request/Transaction/Transaction_Created_Date"/>
<xsl:variable name="beneficiaryAccountType" select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Account_Type"/>
<xsl:variable name="disbursal" select="root/IP/Send_Remitance_Transaction_Request/Delivery_Type"/>
<xsl:variable name="purposeCode" select="root/IP/Send_Remitance_Transaction_Request/Transaction/Transaction_Purpose"/>
<xsl:variable name="c-channel" select="root/IP/IP_Header/Channel_Id"/>
<xsl:variable name="countryC" select="root/IP/Send_Remitance_Transaction_Request/Remitter/Remitter_Country_Code_ISO3"/>
<xsl:variable name="convertedDate2">
	<xsl:call-template name="convertDateTime-to-DDMMYYYY">
        <xsl:with-param name="inputDateTime" select="$current-date2"/>
	</xsl:call-template>
</xsl:variable>

		<TrnOrder>
			<Header>
				<MessageType>TrnOrder</MessageType>
				<RequestType>01</RequestType>
				<processDateTime>
					<xsl:if test="string-length($current-date) > 0">
					 	<xsl:variable name="convertedDate">
							<xsl:call-template name="convertDateTime-to-ISO8601">
								<xsl:with-param name="inputDateTime" select="$current-date" />
							</xsl:call-template>
						</xsl:variable>
					<xsl:value-of select="$convertedDate"/>
					</xsl:if>
				</processDateTime>
				<correspondentID><xsl:value-of select="root/IP/IP_Header/Partner_Id"/></correspondentID>
			</Header>
			<Transaction>
				<ClientShortName>ICI</ClientShortName>
				<settlementDate>
					<xsl:if test="string-length($current-date2) > 0">
						<xsl:value-of select="$convertedDate2"/>
					</xsl:if>
				</settlementDate>
				<EHReferenceNo><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Transaction/Transaction_No" /></EHReferenceNo>
				<receiveCurrency>
					<xsl:choose>
						<xsl:when test="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Beneficiary_Currency">INR</xsl:when>
						<xsl:otherwise><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Beneficiary_Currency" /></xsl:otherwise>
					</xsl:choose>
				</receiveCurrency>
				<sendCountry>
					<xsl:choose>
						<xsl:when test="root/IP/Send_Remitance_Transaction_Request/Transaction/Source_Country_Code_ISO3">QA</xsl:when>
						<xsl:otherwise><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Transaction/Source_Country_Code_ISO3" /></xsl:otherwise>
					</xsl:choose>
				</sendCountry>
				<disbursalMode><xsl:value-of select="$lookupTable/lookup/disbursalType/processTransaction/code[@value=$disbursal]"/></disbursalMode>
				<senderMobileNumber><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/MobileNo"/></senderMobileNumber>
				<accountType><xsl:value-of select="$lookupTable/lookup/beneficiaryAccountType/processTransaction/code[@value=$beneficiaryAccountType]"/></accountType>
				<micrcode><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary_Bank/Branch/Br_International_Code"/></micrcode> 
				<receiveAccountNumber><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Account_No"/></receiveAccountNumber>
				<sendAmount><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Amount_Paid"/></sendAmount>
				<cardRate><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Exchange_Rate"/></cardRate>
				<receiveAmount><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Beneficiary_Currency_Amount"/></receiveAmount>
				<payableBranchCode><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary_Bank/Branch/Br_Code"/></payableBranchCode>
				<DDIssuedTo/>
				<beneBranchName><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary_Bank/Branch/Br_Name"/></beneBranchName>
				<beneBankAddress><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary_Bank/Branch/Br_Addr1"/></beneBankAddress>
				<purpose> <xsl:value-of select="$lookupTable/lookup/purposeCode/processTransaction/code[@value=$purposeCode]"/></purpose>
				<payoutLocation><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary_Bank/Branch/Br_Code"/></payoutLocation>
				<senderFirstName><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/First_Name"/></senderFirstName>
				<senderMiddleName><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Second_Name"/></senderMiddleName>
				<senderLastName><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Last_Name"/></senderLastName>
				<senderCurrency><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Local_Currency"/></senderCurrency>
				<senderAddress><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Address1"/></senderAddress>
				<senderCity><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/City"/></senderCity>
				<senderCountry><xsl:value-of select="$country/lookup/countryCodeISO2/code[@value=$countryC]"/></senderCountry> 
				<senderAccountNumber/>
				<senderIDNumber><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Identity_No"/></senderIDNumber>
				<receiverFirstName><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/First_Name"/></receiverFirstName>
				<receiverMiddleName><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Second_Name"/></receiverMiddleName>
				<receiverLastName><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Last_Name"/></receiverLastName>
				<receiverAddress1><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Address1"/></receiverAddress1>
				<receiverAddress2><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Address2"/></receiverAddress2>
				<receiverAddress3><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Address2"/></receiverAddress3>
				<receiverCity><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/City"/></receiverCity>
				<receiverStateProvince><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/State"/></receiverStateProvince>
				<receiverCountry><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Transaction/Destination_Country_Code_ISO3"/></receiverCountry>
				<receiverZipPostalCode><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Zip_Code"/></receiverZipPostalCode>
				<receiverPhoneNumber><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/TelNo"/></receiverPhoneNumber>
			</Transaction> 
			<Signature>  
                <SignatureValue>GSD[/'clientcertria.jks/',/'%Ri@Cert11%/',/'selfsigned/', /'%Ri@Cert11%/', /'SHA256withRSA/', CON[/'ICI/',	/'<xsl:value-of select="$convertedDate2"/>/',/'static/',/'INR/',/'QA/',/'<xsl:value-of select="$lookupTable/lookup/disbursalType/processTransaction/code[@value=$disbursal]"/>/',/'<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/MobileNo"/>/',/'<xsl:value-of select="$lookupTable/lookup/beneficiaryAccountType/processTransaction/code[@value=$beneficiaryAccountType]"/>/',/'<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary_Bank/Branch/Br_International_Code"/>/',/'<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Account_No"/>/',/'<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Local_Currency_Amount"/>/',/'<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Exchange_Rate"/>/',/'<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Beneficiary_Currency_Amount"/>/',/'<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary_Bank/Branch/Br_Code"/>/',/'<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/First_Name"/>/',/'<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Second_Name"/>/',/'<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Last_Name"/>/',/'<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Local_Currency"/>/',/'<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Address1"/>/',/'<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/City"/>/',/'<xsl:value-of select="$lookupTable/lookup/countryCodeISO2/code[@value=$countryC]"/>/',/'<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Identity_No"/>/',/'<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/First_Name"/>/',/'<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Second_Name"/>/',/'<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Last_Name"/>/',/'<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Address1"/>/',/'<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Address2"/>/',/'<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Address2"/>/',/'<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/City"/>/',/'<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/State"/>/',/'<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Transaction/Destination_Country_Code_ISO3"/>/',/'<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Zip_Code"/>/',/'<xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/TelNo"/>/'], /'PKCS7/']</SignatureValue>
			</Signature>
		</TrnOrder>
	</xsl:template>
</xsl:stylesheet>
