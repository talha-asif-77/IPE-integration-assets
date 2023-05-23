<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" omit-xml-declaration="yes"/>

    <!-- identity template to copy all nodes and attributes -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- template to increment the text value of the specified element -->
    <xsl:template match="retryCount">
        <xsl:copy>
            <xsl:value-of select=". + 1"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>