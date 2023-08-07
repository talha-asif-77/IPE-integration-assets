<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
exclude-result-prefixes="xs">
<xsl:import href="../dateTemplate.xsl"/>
<xsl:output method="xml" omit-xml-declaration="yes"/>
<xsl:variable name="lookupTable" select="document('icici-mappingLookup.xml')"/>

<xsl:template match="/">

<xsl:variable name="current-date" select="root/IP/IP_Header/Request_Timestamp"/>
<xsl:variable name="convertedDate">
    <xsl:call-template name="convertDateTime-to-ISO8601">
        <xsl:with-param name="inputDateTime" select="$current-date" />
    </xsl:call-template>
</xsl:variable>


		<VostroAccountInquiry>
			<Header>
				<MessageType>AccountBalance</MessageType>
                <InquiryDateTime><xsl:value-of select="$convertedDate"/></InquiryDateTime>
                <CorrespondentID><xsl:value-of select="root/IP/IP_Header/Partner_Id"/></CorrespondentID>
			</Header>
			<VostroBalance>
				<VostroAccNo><xsl:value-of select="root/IP/Inquire_Balance_Request/Account_No"/></VostroAccNo>
			</VostroBalance> 
			<Signature>  
                <SignatureValue>GSD[/'clientcertria.jks/',/'%Ri@Cert11%/',/'selfsigned/', /'%Ri@Cert11%/', /'SHA256withRSA/', /'<xsl:value-of select="root/IP/Inquire_Balance_Request/Account_No"/>/', /'PKCS7/']</SignatureValue>
			</Signature>
		</VostroAccountInquiry>
	</xsl:template>
</xsl:stylesheet>

