<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:SOAPenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:rem="http://www.bdo.com.ph/RemitAPI"
version="1.0">
<xsl:import href="dateTemplate.xsl"/>
<xsl:output indent="yes" method="html"  omit-xml-declaration="yes"/>

<xsl:variable name="TRN_NO" select="root/IP/Send_Remitance_Transaction_Request/Transaction/Transaction_No"></xsl:variable>
<xsl:variable name="BEN_CURRENCY_AMOUNT" select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Beneficiary_Currency_Amount"></xsl:variable>
<xsl:variable name="convertedDate">
    <xsl:call-template name="extractDate-from-DateTime">
      <xsl:with-param name="inputDateTime" select="root/IP/Send_Remitance_Transaction_Request/Transaction/Transaction_Created_Date" />
    </xsl:call-template>
</xsl:variable>
<xsl:variable name="ACC_NO" select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Account_No"></xsl:variable>
<xsl:variable name="GHS" select="concat('b2!8%v%H',$TRN_NO,$BEN_CURRENCY_AMOUNT,$convertedDate,$ACC_NO)"></xsl:variable>
<xsl:template match="/">
    <SOAPenv:Envelope>
        <SOAPenv:Body>
            <rem:apiRequest>
                <rem:userName>
                    <xsl:value-of select="/'548AESTF1/'"/>
                </rem:userName>
                <rem:password>
                    MEC[/'AES/ECB/PKCS5Padding/',/'AES/',/'tvnw63ufg9gh5392/',/'SunJCE/',/'b2!8%v%H/']
                </rem:password>
                <rem:signedData>
                    GSD[/'clientcertria.jks/',/'%Ri@Cert11%/',/'selfsigned/', /'%Ri@Cert11%/', /'SHA256withRSA/',GHS[/'<xsl:value-of select="$GHS"/>/',/'MD5/']]
                </rem:signedData>
                <rem:receiverBirthDate>
                    <xsl:variable name="formatDateDOB">
                        <xsl:call-template name="extractDate-from-DateTime">
                        <xsl:with-param name="inputDateTime" select="oot/IP/Send_Remitance_Transaction_Request/Beneficiary/DOB" />
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:value-of select="$formatDateDOB"></xsl:value-of>
                </rem:receiverBirthDate>
                <rem:receiverMobilePhone>
                    <xsl:choose>
                        <xsl:when test="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Mobile != ''">
                            <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Mobile"/>
                        </xsl:when>
                        <xsl:when test="'9999' != ''">
                            <xsl:value-of select="'9999'"/>
                        </xsl:when>
                    </xsl:choose>
                </rem:receiverMobilePhone>
                <rem:senderAddress1>
                    <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Address1"/>
                </rem:senderAddress1>
                <rem:payableCode>
                    <xsl:value-of select="'CBBM/'"/>
                </rem:payableCode>
                <rem:senderAddress2>
                    <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Address2"/>
                </rem:senderAddress2>
                <rem:referenceNo>
                    <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Transaction/Transaction_No"/>
                </rem:referenceNo>
                <rem:senderFirstname>
                    <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/First_Name"/>
                </rem:senderFirstname>
                <rem:receiverMiddlename>
                    <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Second_Name"/>
                </rem:receiverMiddlename>
                <rem:transactionType>
                    <xsl:value-of select="'02/'"/>
                </rem:transactionType>
                <rem:landedAmount>
                    <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Beneficiary_Currency_Amount"/>
                </rem:landedAmount>
                <rem:senderPhone>
                    <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/TelNo"/>
                </rem:senderPhone>
                <rem:receiverGender>
                    <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Gender"/>
                </rem:receiverGender>
                <rem:landedCurrency>
                    <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Transaction/Destination_Country_Code_ISO3"/>
                </rem:landedCurrency>
                <rem:branchName>
                    <xsl:value-of select="'BDO/'"/>
                </rem:branchName>
                <rem:accountNo>
                    <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Account_No"/>
                </rem:accountNo>
                <rem:messageToBene1>
                    <xsl:choose>
                        <xsl:when test="root/IP/Send_Remitance_Transaction_Request/Transaction/Custom_Message != ''">
                            <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Transaction/Custom_Message"/>
                        </xsl:when>
                        <xsl:when test="'BDO' != ''">
                            <xsl:value-of select="'BDO'"/>
                        </xsl:when>
                    </xsl:choose>
                </rem:messageToBene1>
                <rem:conduitCode>
                    <xsl:value-of select="/'EF/'"/>
                </rem:conduitCode>
                <rem:messageToBene2>
                    <xsl:value-of select="0"/>
                </rem:messageToBene2>
                <rem:senderMiddlename>
                    <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Second_Name"/>
                </rem:senderMiddlename>
                <rem:bankCode>
                    <xsl:value-of select="'BDO/'"/>
                </rem:bankCode>
                <rem:transDate>
                    <xsl:variable name="formatDateTCD">
                        <xsl:call-template name="extractDate-from-DateTime">
                        <xsl:with-param name="inputDateTime" select="root/IP/Send_Remitance_Transaction_Request/Transaction/Transaction_Created_Date" />
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:value-of select="$formatDateTCD"></xsl:value-of>
                </rem:transDate>
                <rem:receiverFirstname>
                    <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/First_Name"/>
                </rem:receiverFirstname>
                <rem:receiverAddress1>
                    <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Address1"/>
                </rem:receiverAddress1>
                <rem:locatorCode>
                    <xsl:value-of select="548"/>
                </rem:locatorCode>
                <rem:receiverAddress2>
                    <xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Address2"/>
                </rem:receiverAddress2>
            </rem:apiRequest>
        </SOAPenv:Body>
    </SOAPenv:Envelope>
</xsl:template>
</xsl:stylesheet>