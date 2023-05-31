<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
exclude-result-prefixes="xs">
<xsl:import href="dateTemplate.xsl"/>
<xsl:output method="html" omit-xml-declaration="yes"/>
<xsl:variable name="lookupTable" select="document('sampath-mappingLookup.xml')"/>


  <xsl:template match="/">
  
  <xsl:variable name="convertedDate">
             <xsl:call-template name="convertDateTime-to-ISO">
                          <xsl:with-param name="inputDateTime" select="root/IP/IP_Header/Request_Timestamp" />
            </xsl:call-template>
 </xsl:variable>

    <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ser="http://service.ws.erm.sampath">
        <soapenv:Header/>
        <soapenv:Body>
            <ser:processTransaction>
                <ser:user>101204</ser:user>
                <ser:accessCode>YWxmMTEx</ser:accessCode>
                <ser:companyId>129</ser:companyId>
                <ser:txnData><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Transaction/Transaction_No" /></ser:txnData>
                <ser:txnData><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Transaction/Source_Country_Code_ISO3" /></ser:txnData>
                <ser:txnData><xsl:choose>
                            <xsl:when test="root/IP/Send_Remitance_Transaction_Request/Remitter/Local_Currency_Amount"></xsl:when>
                            <xsl:otherwise><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Amount_Paid" /></xsl:otherwise>
                        </xsl:choose>
                </ser:txnData>
                <ser:txnData><xsl:value-of select="concat(root/IP/Send_Remitance_Transaction_Request/Remitter/First_Name,' ',root/IP/Send_Remitance_Transaction_Request/Remitter/Second_Name,' ',root/IP/Send_Remitance_Transaction_Request/Remitter/Last_Name)" /></ser:txnData>
                <ser:txnData><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Identity_No" /></ser:txnData>
                <ser:txnData><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/MobileNo" /></ser:txnData>
                <ser:txnData><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Address1" /></ser:txnData>
                <ser:txnData><xsl:value-of select="concat(root/IP/Send_Remitance_Transaction_Request/Beneficiary/First_Name,' ',root/IP/Send_Remitance_Transaction_Request/Beneficiary/Second_Name,' ',root/IP/Send_Remitance_Transaction_Request/Beneficiary/Last_Name)" /></ser:txnData>
                <ser:txnData><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Identity_No" /></ser:txnData>
                <ser:txnData><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Mobile" /></ser:txnData>
                <ser:txnData><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Address1" /></ser:txnData>
                <ser:txnData><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary/Account_No" /></ser:txnData>
                <ser:txnData><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary_Bank/Code" /></ser:txnData>
                <ser:txnData><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Beneficiary_Bank/Branch/Br_Code" /></ser:txnData>
                <ser:txnData><xsl:value-of select="$lookupTable/lookup/disbursalType/code[@value=root/IP/Send_Remitance_Transaction_Request/Delivery_Type]" /></ser:txnData>
                <ser:txnData></ser:txnData>
                <ser:txnData><xsl:value-of select="$lookupTable/lookup/disbursalType/code[@value=root/IP/Send_Remitance_Transaction_Request/Transaction/Transaction_Purpose]" /></ser:txnData>
                <ser:txnData><xsl:value-of select="root/IP/Send_Remitance_Transaction_Request/Remitter/Beneficiary_Relation" /></ser:txnData>
                <ser:txnData>/'QATAR/'</ser:txnData>
                <ser:txnData><xsl:value-of select="$lookupTable/lookup/disbursalType/code[@value=root/IP/Send_Remitance_Transaction_Request/Remitter/Source_of_Fund]" /></ser:txnData>
            </ser:processTransaction>
        </soapenv:Body>
    </soapenv:Envelope>
  </xsl:template>
</xsl:stylesheet>