<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
exclude-result-prefixes="xs">
    <xsl:import href="../dateTemplate.xsl"/>
    <xsl:output method="xml" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <xsl:variable name="convertedDate2">
            <xsl:call-template name="convertDateTime-to-YYYYMMDDHHMMSS">
                <xsl:with-param name="inputDateTime" select="root/IP/IP_Header/Request_Timestamp" />
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="AGENT_CODE" select="'AFEL01'"></xsl:variable>
        <xsl:variable name="USER_ID" select="'AFEL'"></xsl:variable>
        <xsl:variable name="AGENT_SESSION_ID" select="concat($convertedDate2,'-',root/IP/IP_Header/Partner_Code)" ></xsl:variable>
        <xsl:variable name="PASSWORD" select="'yp4eunz1a8'"></xsl:variable>
        <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:cli="ClientWebService">
            <soap:Header/>
            <soap:Body>
                <cli:GetCurrentBalance>
                    <cli:AGENT_CODE>
                        <xsl:value-of select="$AGENT_CODE"/>
                    </cli:AGENT_CODE>
                    <cli:USER_ID>
                        <xsl:value-of select="$USER_ID"/>
                    </cli:USER_ID>
                    <cli:AGENT_SESSION_ID>
                        <xsl:value-of select="$AGENT_SESSION_ID" />
                    </cli:AGENT_SESSION_ID>
                    <cli:SIGNATURE>GHS[/'
                        <xsl:value-of select="concat($AGENT_CODE,$USER_ID,$AGENT_SESSION_ID, $PASSWORD)"/>/',/'SHA-256/',/'UTF-8/']
                    </cli:SIGNATURE>
                </cli:GetCurrentBalance>
            </soap:Body>
        </soap:Envelope>
    </xsl:template>
</xsl:stylesheet>