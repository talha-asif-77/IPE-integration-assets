<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:tem="http://tempuri.org/">
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
            <tem:TransactionStatus>
                <tem:objRef>
                    <tem:USERNAME>ALFARAPI001</tem:USERNAME>
                    <tem:PASSWORD>Afa@5637</tem:PASSWORD>
                    <tem:AGENTCODE>821</tem:AGENTCODE>
                    <tem:SESSIONID> <xsl:value-of select="concat($convertedDate,'-',root/IP/IP_Header/Partner_Code)" /></tem:SESSIONID>
                    <tem:REFERENCENO><xsl:value-of select="root/IP/Get_Remittance_Transaction_Status_Request/Transaction_No"/></tem:REFERENCENO>

                </tem:objRef>
            </tem:TransactionStatus>
        </soap:Body>
    </soap:Envelope>
  </xsl:template>
</xsl:stylesheet>
