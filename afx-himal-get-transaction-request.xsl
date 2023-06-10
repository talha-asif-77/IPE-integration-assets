<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:SOAPENV="http://schemas.xmlsoap.org/soap/envelope/"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:SOAPENC="http://schemas.xmlsoap.org/soap/encoding/"
                xmlns:ns1860="https://himalremituat.himalayanbank.com/webService/"
                xmlns:tns="http://himalremituat.himalayanbank.com/soap/TxnStatusWebService"
                xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
  <xsl:output method="html" indent="yes" />
  <!-- Match the root node of the input XML -->
  <xsl:template match="/">
    <!-- Start creating the output SOAP envelope -->
    <SOAP-ENV:Envelope SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
      <SOAP-ENV:Body>
        <!-- Start creating the GetTxnStatus element -->
        <ns1860:GetTxnStatus xmlns:ns1860="https://himalremituat.himalayanbank.com/webService/">
          <!-- Start creating the soapObjects element -->
          <soapObjects xsi:type="tns:TxnStatusSoapObjectArray">
            <!-- Map the TransactionNumber field -->
            <TransactionNumber xsi:type="xsd:string">
              <xsl:value-of select="root/IP/IP_Header/Partner_Ref_No" />
            </TransactionNumber>
            <!-- Map the AgentID field -->
            <AgentID xsi:type="xsd:string">114</AgentID>
            <!-- Map the token_value field -->
            <token_value xsi:type="xsd:string">alF@R3614</token_value>
            <retryCount><xsl:value-of select="root/IP/IP_Header/retryCount" /></retryCount>
          </soapObjects>
        </ns1860:GetTxnStatus>
      </SOAP-ENV:Body>
    </SOAP-ENV:Envelope>
  </xsl:template>
</xsl:stylesheet>