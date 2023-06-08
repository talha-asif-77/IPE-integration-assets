<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ser="http://service.ws.erm.sampath" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" version="1.0">
    <xsl:output indent="yes" method="html"/>
    <xsl:template match="/">
        <soapenv:Envelope>
            <soapenv:Body>
                <ser:inquireTransaction>
                    <ser:user>100230</ser:user>
                    <ser:txnPin>
                        <xsl:value-of select="root/IP/IP_Header/Partner_Ref_No"/>
                    </ser:txnPin>
                    <ser:companyId>35</ser:companyId>
                    <ser:accessCode>aG9heA==</ser:accessCode>
                    <retryCount>0</retryCount>
                    <Partner_Ref_No><xsl:value-of select="root/IP/IP_Header/Partner_Ref_No" /></Partner_Ref_No>
                </ser:inquireTransaction>
            </soapenv:Body>
        </soapenv:Envelope>
    </xsl:template>
</xsl:stylesheet>