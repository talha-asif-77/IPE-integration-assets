<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
xmlns:SOAPenv="http://schemas.xmlSOAP.org/SOAP/envelope/"
xmlns:rem="http://www.bdo.com.ph/RemitAPI"
exclude-result-prefixes="xs">
<xsl:import href="dateTemplate.xsl"/>
<xsl:output method="html" omit-xml-declaration="yes"/>
<xsl:variable name="lookupTable" select="document('bdo-mappingLookup.xml')"/>

    <xsl:template match="/">

        <SOAPenv:Envelope>
            <SOAPenv:Header/>
            <SOAPenv:Body>
                <rem:apiStatusRequest>
                    <xsl:value-of select="/'548AESTF1/'"/>
                    <rem:password>MEC[/'AES/ECB/PKCS5Padding/',/'AES/',/'tvnw63ufg9gh5392/',/'SunJCE/',/'b2!8%v%H/']</rem:password>
                    <rem:signedData> GSD[/'clientcertria.jks/',/'%Ri@Cert11%/',/'selfsigned/', /'%Ri@Cert11%/', /'SHA256withRSA/',GHS[/'<xsl:value-of select="root/IP/IP_Header/Partner_Ref_No"/>/',/'MD5/']]</rem:signedData>
                    <xsl:value-of select="548"/>
                    <rem:referenceNo><xsl:value-of select="root/IP/IP_Header/Partner_Ref_No"/></rem:referenceNo>
                </rem:apiStatusRequest>
            </SOAPenv:Body>
        </SOAPenv:Envelope>

    </xsl:template>


</xsl:stylesheet>
