<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:tem="http://tempuri.org/">
<xsl:import href="dateTemplate.xsl"/>
<xsl:output method="html" omit-xml-declaration="yes"/>
  
  <xsl:template match="/">
  <xsl:variable name="convertedDate">
             <xsl:call-template name="convertDateTime-to-YYYYMMDDHHMMSS">
                          <xsl:with-param name="inputDateTime" select="IP/IP_Header/Request_Timestamp" />
            </xsl:call-template>
 </xsl:variable>
    <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:tem="http://tempuri.org/">
      <soap:Header/>
      <soap:Body>
        <tem:GetRate>
          <tem:raterequest>
            <tem:USERNAME>ALFUAEAPI01</tem:USERNAME>
            <tem:PASSWORD>EIn@0133</tem:PASSWORD>
            <tem:AGENTCODE>891</tem:AGENTCODE>
            <tem:SESSIONID>
              <xsl:value-of select="concat($convertedDate,'-',IP/IP_Header/Partner_Code)" />
            </tem:SESSIONID>
            <tem:CurrencyCode>
              <xsl:value-of select="/IP/Fetch_Rates_Charges_Req/Transaction/Source_Currency_Code"/>
            </tem:CurrencyCode>
            <tem:Amount>
              <xsl:value-of select="/IP/Fetch_Rates_Charges_Req/Amount_Paid"/>
            </tem:Amount>
          </tem:raterequest>
        </tem:GetRate>
      </soap:Body>
    </soap:Envelope>
  </xsl:template>
</xsl:stylesheet>
