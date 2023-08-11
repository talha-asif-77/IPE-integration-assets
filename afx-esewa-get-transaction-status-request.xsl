<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
exclude-result-prefixes="xs">
<xsl:import href="../dateTemplate.xsl"/>
<xsl:output method="xml" omit-xml-declaration="yes"/>
<xsl:variable name="lookupTable" select="document('esewa-mappingLookup.xml')"/>
<xsl:template match="/">
    <xsl:variable name="convertedDate2">
          <xsl:call-template name="convertDateTime-to-YYYYMMDDHHMMSS">
                      <xsl:with-param name="inputDateTime" select="root/IP/IP_Header/Request_Timestamp" />
        </xsl:call-template>
    </xsl:variable>
	
	<xsl:variable name="AGENT_CODE" select="'AFEL01'"></xsl:variable>
  <xsl:variable name="USER_ID" select="'AFEL'"></xsl:variable>
  <xsl:variable name="AGENT_SESSION_ID" select="concat($convertedDate2,'-',root/IP/IP_Header/Partner_Code)" ></xsl:variable>
	<xsl:variable name="PINNO" select="root/IP/IP_Header/Partner_Ref_No"></xsl:variable>
	<xsl:variable name="AGENT_TXNID" select="root/IP/Get_Remittance_Transaction_Status_Request/Transaction_No"></xsl:variable>
	<xsl:variable name="PASSWORD" select="'yp4eunz1a8'"></xsl:variable>
	
	
    <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
		  <soap:Body>
        <QueryTXNStatus xmlns="ClientWebService">
          <AGENT_CODE>
            <xsl:value-of select="$AGENT_CODE"/>
          </AGENT_CODE>
          <USER_ID>
            <xsl:value-of select="$USER_ID"/>
          </USER_ID>
          <PINNO>
            <xsl:value-of select="$PINNO"/>
          </PINNO>
          <AGENT_SESSION_ID>
            <xsl:value-of select="$AGENT_SESSION_ID" />
          </AGENT_SESSION_ID>
          <AGENT_TXNID>
            <xsl:value-of select="$AGENT_TXNID" />
          </AGENT_TXNID>
          <SIGNATURE>GHS[/'        
            <xsl:value-of select="concat($AGENT_CODE,$USER_ID,$PINNO,$AGENT_SESSION_ID,$AGENT_TXNID, $PASSWORD)"/>/',/'SHA-256/',/'UTF-8/']
          </SIGNATURE>
        </QueryTXNStatus>
      </soap:Body>
    </soap:Envelope>
    </xsl:template>
</xsl:stylesheet>