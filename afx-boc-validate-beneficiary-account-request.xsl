 <xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
exclude-result-prefixes="xs">
<xsl:import href="dateTemplate.xsl"/>
<xsl:output method="html" omit-xml-declaration="yes"/>

  <xsl:template match="/">
  
  <xsl:variable name="convertedDate">
             <xsl:call-template name="convertDateTime-to-YYYYMMDDHHMMSS">
                          <xsl:with-param name="inputDateTime" select="root/IP/IP_Header/Request_Timestamp" />
            </xsl:call-template>
 </xsl:variable>
    <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:tem="http://tempuri.org/">
      <soap:Header/>
      <soap:Body>
        <tem:CancelTXN>
          <tem:objCancel>
            <tem:USERNAME>ALFUAEAPI01</tem:USERNAME>
            <tem:PASSWORD>EIn@0133</tem:PASSWORD>
            <tem:AGENTCODE>891</tem:AGENTCODE>
            <retryCount><xsl:value-of select="root/IP/IP_Header/retryCount"/></retryCount>
            <tem:SESSIONID>
                <xsl:value-of select="concat($convertedDate,'-',root/IP/IP_Header/Partner_Code)" />
            </tem:SESSIONID>
            <tem:ACCOUNTNO><xsl:value-of select="root/IP/IP_Header/Validate_Beneficiary_Account_Request/Beneficiary/Account_No" /></tem:ACCOUNTNO>
          </tem:objCancel>
        </tem:CancelTXN>
      </soap:Body>
    </soap:Envelope>
  </xsl:template>
</xsl:stylesheet>
