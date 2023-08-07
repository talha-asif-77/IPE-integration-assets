<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
exclude-result-prefixes="xs">
<xsl:import href="../dateTemplate.xsl"/>
<xsl:output method="html" omit-xml-declaration="yes"/>
<xsl:variable name="lookupTable" select="document('icici-mappingLookup.xml')"/>
<xsl:template match="/">

<xsl:variable name="current-date"  select="''"/>
<xsl:if test="string-length(root/IP/IP_Header/Timestamp) > 0">
    <xsl:variable name="current-date"  select="xs:dateTime(root/IP/IP_Header/Timestamp)"/>
</xsl:if>

<xsl:variable name="disbursalType" select="root/IP/Get_Remittance_Transaction_Status_Request/Delivery_Type_Id"/>
<xsl:variable name="c-request" select="root/IP/IP_Header/Partner_Code" />
<xsl:variable name="c-coressp" select="root/IP/IP_Header/Partner_Ref_No" />
<xsl:variable name="c-disbursal" select="$lookupTable/lookup/disbursalType/getTransaction/code[@value=$disbursalType]"/>
<xsl:variable name="processDateTime"  select="''"/>
<xsl:variable name="UploadDate"  select="''"/>

<TrnInquiry>
    <Header>
        <MessageType>TrnInquiry</MessageType>
        <processDateTime>
            <xsl:if test="string-length($current-date)>0">
                <xsl:variable name="convertedDate">
					<xsl:call-template name="convertDateTime-to-ISO">
						<xsl:with-param name="inputDateTime" select="$current-date" />
					</xsl:call-template>
				</xsl:variable>
				<xsl:value-of select="$convertedDate"/>
            </xsl:if>	
        </processDateTime>
        <UploadDate>
            <xsl:if test="string-length($current-date)>0">
                <xsl:variable name="convertedDate">
					<xsl:call-template name="convertDateTime-to-DDMMYYYY">
						<xsl:with-param name="inputDateTime" select="$current-date" />
					</xsl:call-template>
				</xsl:variable>
				<xsl:value-of select="$convertedDate"/>
            </xsl:if>
        </UploadDate>
        <CorrespondentID><xsl:value-of select="$c-request" /></CorrespondentID>
        <retryCount><xsl:value-of select="root/IP/IP_Header/retryCount"/></retryCount>
    </Header>
    <Transaction>
        <CorrespondentReferenceNo><xsl:value-of select="$c-coressp" /></CorrespondentReferenceNo>
        <DisbursalMode>
            <xsl:value-of select="$c-disbursal" />
        </DisbursalMode>
        <ICICIReferenceNo></ICICIReferenceNo>
    </Transaction>
   <Signature>
        <SignatureValue>
            <xsl:choose>
                <xsl:when test="string-length($current-date)>0">
                   GSD[/'clientcertria.jks/',/'%Ri@Cert11%/',/'selfsigned/', /'%Ri@Cert11%/', /'SHA256withRSA/', /'<xsl:value-of select="concat($processDateTime,$UploadDate,$c-request, $c-coressp, $c-disbursal)" />/',/'PKCS7/']
                </xsl:when>
                <xsl:otherwise>
                    [/'clientcertria.jks/',/'%Ri@Cert11%/',/'selfsigned/', /'%Ri@Cert11%/', /'SHA256withRSA/', /'<xsl:value-of select="concat($c-request, $c-coressp, $c-disbursal)" />/',/'PKCS7/']
                </xsl:otherwise>
            </xsl:choose>
            
        </SignatureValue>
    </Signature>

</TrnInquiry>
</xsl:template>


</xsl:stylesheet>
