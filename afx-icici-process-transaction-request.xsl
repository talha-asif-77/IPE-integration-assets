<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
xmlns:fn="http://www.w3.org/2005/xpath-functions"
exclude-result-prefixes="xs">
<xsl:import href="dateTemplate.xsl"/>
<xsl:output method="xml" omit-xml-declaration="yes"/>
<xsl:variable name="lookupTable" select="document('pb-mappingLookup.xml')"/>

<xsl:template match="/">
<xsl:variable name="current-date" select="root/IP/IP_Header/Request_Timestamp"/>
<xsl:variable name="beneficiaryAccountType" select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Account_Type"/>
<xsl:variable name="purposeCode" select="root/IP/Send_Remitance_Transaction_Request/Transaction/Transaction_Purpose"/>
<xsl:variable name="c-channel" select="root/IP/IP_Header/Channel_Id"/>

		<TrnOrder>
			<Header>
				<MessageType>TrnOrder</MessageType>
				<RequestType>01</RequestType>
				<processDateTime>
					<xsl:if test="string-length($current-date) > 0">
					 	<xsl:variable name="convertedDate">
							<xsl:call-template name="convertDateTime-to-ISO">
								<xsl:with-param name="inputDateTime" select="$current-date" />
							</xsl:call-template>
						</xsl:variable>
					<xsl:value-of select="$convertedDate"/>
					</xsl:if>
				</processDateTime>
				<correspondentID><xsl:value-of select="root/IP/IP_Header/Partner_Id"/></correspondentID>
				<retryCount><xsl:value-of select="root/IP/IP_Header/retryCount"/></retryCount>
			</Header>
			<Transaction>
				<ClientShortName>ICI</ClientShortName>
				<settlementDate>
					<xsl:if test="string-length($current-date) > 0">
						<xsl:variable name="convertedDate">
							<xsl:call-template name="extractDate-from-DateTime">
								<xsl:with-param name="inputDateTime" select="$current-date" />
							</xsl:call-template>
						</xsl:variable>
						<xsl:value-of select="$convertedDate"/>
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
						<xsl:when test="root/IP/Send_Remitance_Transaction_Request/Remitter/Remitter_Country_Code_ISO3">QA</xsl:when>
						<xsl:otherwise><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Transaction/Source_Country_Code_ISO3" /></xsl:otherwise>
					</xsl:choose>
				</sendCountry>
				<disbursalMode>16</disbursalMode>
				<senderMobileNumber><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/MobileNo"/></senderMobileNumber>
				<accountType><xsl:value-of select="$lookupTable/lookup/beneficiaryAccountType/processTransaction/code[@value=$beneficiaryAccountType]"/></accountType>
				<micrcode/>
				<receiveAccountNumber><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Account_No"/></receiveAccountNumber>
				<sendAmount><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Local_Currency_Amount"/></sendAmount>
				<cardRate><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Exchange_Rate"/></cardRate>
				<receiveAmount><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Beneficiary_Currency_Amount"/></receiveAmount>
				<payableBranchCode><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary_Bank/Branch/Br_Code"/></payableBranchCode>
				<DDIssuedTo/>
				<beneBranchName><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary_Bank/Branch/Br_Name"/></beneBranchName>
				<beneBankAddress><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary_Bank/Branch/Br_Addr1"/></beneBankAddress>
				<purpose><xsl:value-of select="$lookupTable/lookup/purposeCode/processTransaction/code[@value=$purposeCode]"/></purpose>
				<payoutLocation><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary_Bank/Branch/Br_Code"/></payoutLocation>
				<senderFirstName><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/First_Name"/></senderFirstName>
				<senderMiddleName><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Second_Name"/></senderMiddleName>
				<senderLastName><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Last_Name"/></senderLastName>
				<senderCurrency><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Local_Currency"/></senderCurrency>
				<senderAddress><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Address1"/></senderAddress>
				<senderCity><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/City"/></senderCity>
				<senderCountry></senderCountry>
				<senderAccountNumber/>
				<senderIDNumber><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Identity_No"/></senderIDNumber>
				<receiverFirstName><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/First_Name"/></receiverFirstName>
				<receiverMiddleName><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Second_Name"/></receiverMiddleName>
				<receiverLastName><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Last_Name"/></receiverLastName>
				<receiverAddress1><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Address1"/></receiverAddress1>
				<receiverAddress2><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Address2"/></receiverAddress2>
				<receiverAddress3><xsl:value-of select="/IP/Send_Remitance_Transaction_Request/Beneficiary/Address2"/></receiverAddress3>
				<receiverCity><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/City"/></receiverCity>
				<receiverStateProvince><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/State"/></receiverStateProvince>
				<receiverCountry><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Transaction/Destination_Country_Code_ISO3"/></receiverCountry>
				<receiverZipPostalCode><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Zip_Code"/></receiverZipPostalCode>
				<receiverPhoneNumber><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/TelNo"/></receiverPhoneNumber>
			</Transaction>
			<Signature>
				<SignatureValue>
					<xsl:value-of select="concat($c-channel,purposeCode)" />
				</SignatureValue>
			</Signature>
		</TrnOrder>
	</xsl:template>
</xsl:stylesheet>
