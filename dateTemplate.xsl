<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Convert date from DD/MM/YYYY to YYYY-MM-DD -->
    <xsl:template name="convertDate-DDMMYYYY-to-YYYYMMDD">
        <xsl:param name="inputDate" />
        <xsl:value-of select="substring($inputDate, 7, 4)"/>
        <xsl:text>-</xsl:text>
        <xsl:value-of select="substring($inputDate, 4, 2)"/>
        <xsl:text>-</xsl:text>
        <xsl:value-of select="substring($inputDate, 1, 2)"/>
    </xsl:template>

<!-- Convert date-time from YYYY-MM-DD HH:MM:ss to DDMMYYYYHHMMSS -->
    <xsl:template name="convertDateTime-to-DDMMYYYYHHMMSS">
        <xsl:param name="inputDateTime" />
        <xsl:value-of select="substring($inputDateTime, 9, 2)"/>
        <xsl:value-of select="substring($inputDateTime, 6, 2)"/>
        <xsl:value-of select="substring($inputDateTime, 1, 4)"/>
        <xsl:value-of select="substring($inputDateTime, 12, 2)"/>
        <xsl:value-of select="substring($inputDateTime, 15, 2)"/>
        <xsl:value-of select="substring($inputDateTime, 18, 2)"/>
    </xsl:template>

    <xsl:template name="convertDateTime-to-YYYY-DD-MM">
        <xsl:param name="inputDateTime" />
        <xsl:value-of select="substring($inputDateTime, 1, 4)"/>
        <xsl:text>-</xsl:text>
        <xsl:value-of select="substring($inputDateTime, 9, 2)"/>
        <xsl:text>-</xsl:text>
        <xsl:value-of select="substring($inputDateTime, 6, 2)"/>
    </xsl:template>

    <!-- Convert date-time from YYYY-MM-DD HH:MM:ss to YYYY-MM-DD'T'HH:MM:ss -->
    <xsl:template name="convertDateTime-to-ISO">
        <xsl:param name="inputDateTime" />
        <xsl:value-of select="substring($inputDateTime, 1, 10)"/>
        <xsl:text>T</xsl:text>
        <xsl:value-of select="substring($inputDateTime, 12, 8)"/>
    </xsl:template>

    <!-- Convert date-time from YYYY-MM-DD HH:MM:ss to YYYY-MM-DD -->
    <xsl:template name="extractDate-from-DateTime">
        <xsl:param name="inputDateTime" />
        <xsl:value-of select="substring($inputDateTime, 1, 10)"/>
    </xsl:template>

    <!-- Convert date-time from YYYY-MM-DD HH:MM:ss to YYYY/MM/DD -->
    <xsl:template name="convertDateTime-with-slashes">
      <xsl:param name="inputDateTime" />
      <xsl:value-of select="substring($inputDateTime, 1, 4)"/>
      <xsl:text>/</xsl:text>
      <xsl:value-of select="substring($inputDateTime, 6, 2)"/>
      <xsl:text>/</xsl:text>
      <xsl:value-of select="substring($inputDateTime, 9, 2)"/>
   </xsl:template>


        <!-- Convert date-time from YYYY-MM-DD HH:MM:ss to MM-DD-YYYY -->
    <xsl:template name="convertDateTime-to-MM-DD-YYYY">
        <xsl:param name="inputDateTime" />
        <xsl:value-of select="substring($inputDateTime, 6, 2)"/>
        <xsl:text>-</xsl:text>
        <xsl:value-of select="substring($inputDateTime, 9, 2)"/>
        <xsl:text>-</xsl:text>
        <xsl:value-of select="substring($inputDateTime, 1, 4)"/>
    </xsl:template>

 <!-- Convert date-time from YYYY-MM-DD HH:MM:ss to MM-DD-YY -->
    <xsl:template name="convertDateTime-to-MM-DD-YY">
    <xsl:param name="inputDateTime" />
    <xsl:value-of select="substring($inputDateTime, 6, 2)"/>
    <xsl:text>-</xsl:text>
    <xsl:value-of select="substring($inputDateTime, 9, 2)"/>
    <xsl:text>-</xsl:text>
    <xsl:value-of select="substring($inputDateTime, 3, 2)"/>
</xsl:template>

<!-- Convert date-time from YYYY-MM-DD HH:MM:ss to MM/DD/YYYY -->
    <xsl:template name="convertDateTime-to-MM-DD-YYYY-with-slash">
        <xsl:param name="inputDateTime" />
        <xsl:value-of select="substring($inputDateTime, 6, 2)"/>
        <xsl:text>/</xsl:text>
        <xsl:value-of select="substring($inputDateTime, 9, 2)"/>
        <xsl:text>/</xsl:text>
        <xsl:value-of select="substring($inputDateTime, 1, 4)"/>
    </xsl:template>

    <!-- Convert date-time from YYYY-MM-DD HH:MM:ss to DD-MM-YYYY -->
    <xsl:template name="convertDateTime-to-DD-MM-YYYY">
        <xsl:param name="inputDateTime" />
        <xsl:value-of select="substring($inputDateTime, 9, 2)"/>
        <xsl:text>-</xsl:text>
        <xsl:value-of select="substring($inputDateTime, 6, 2)"/>
        <xsl:text>-</xsl:text>
        <xsl:value-of select="substring($inputDateTime, 1, 4)"/>
    </xsl:template>

     <!-- Convert date-time from YYYY-MM-DD HH:MM:ss to DD/MM/YYYY -->
    <xsl:template name="convertDateTime-with-slash">
        <xsl:param name="inputDateTime" />
        <xsl:value-of select="substring($inputDateTime, 9, 2)"/>
        <xsl:text>/</xsl:text>
        <xsl:value-of select="substring($inputDateTime, 6, 2)"/>
        <xsl:text>/</xsl:text>
        <xsl:value-of select="substring($inputDateTime, 1, 4)"/>
    </xsl:template>

<!-- Convert date-time from YYYY-MM-DD HH:MM:ss to YYYYMMDDHHMMSS -->
    <xsl:template name="convertDateTime-to-YYYYMMDDHHMMSS">
        <xsl:param name="inputDateTime" />
        <xsl:value-of select="substring($inputDateTime, 1, 4)"/>
        <xsl:value-of select="substring($inputDateTime, 6, 2)"/>
        <xsl:value-of select="substring($inputDateTime, 9, 2)"/>
        <xsl:value-of select="substring($inputDateTime, 12, 2)"/>
        <xsl:value-of select="substring($inputDateTime, 15, 2)"/>
        <xsl:value-of select="substring($inputDateTime, 18, 2)"/>
    </xsl:template>

<!-- Convert date-time from YYYY-MM-DD HH:MM:ss to DDMMYYYY -->
    <xsl:template name="convertDateTime-to-DDMMYYYY">
        <xsl:param name="inputDateTime" />
        <xsl:value-of select="substring($inputDateTime, 9, 2)"/>
        <xsl:text>/</xsl:text>
        <xsl:value-of select="substring($inputDateTime, 6, 2)"/>
        <xsl:text>/</xsl:text>
        <xsl:value-of select="substring($inputDateTime, 1, 4)"/>
    </xsl:template>

<!-- Convert date-time from YYYY-MM-DD HH:MM:ss to MMDDYYYY -->
    <xsl:template name="convertDateTime-to-MMDDYYYY">
        <xsl:param name="inputDateTime" />
        <xsl:value-of select="substring($inputDateTime, 6, 2)"/>
        <xsl:text>/</xsl:text>
        <xsl:value-of select="substring($inputDateTime, 9, 2)"/>
        <xsl:text>/</xsl:text>
        <xsl:value-of select="substring($inputDateTime, 1, 4)"/>
    </xsl:template>

<!-- Convert date-time from YYYY-MM-DD HH:MM:ss to MMDDYYYY -->
    <xsl:template name="convertDateTime-to-mmddyyyy">
        <xsl:param name="inputDateTime" />
        <xsl:value-of select="substring($inputDateTime, 6, 2)"/>
        <xsl:value-of select="substring($inputDateTime, 9, 2)"/>
        <xsl:value-of select="substring($inputDateTime, 1, 4)"/>
    </xsl:template>

<!-- Convert date-time from YYYY-MM-DD HH:MM:ss to YYYYMMDD -->
    <xsl:template name="convertDateTime-to-YYYYMMDD">
        <xsl:param name="inputDateTime" />
        <xsl:value-of select="substring($inputDateTime, 1, 4)"/>
        <xsl:value-of select="substring($inputDateTime, 6, 2)"/>
        <xsl:value-of select="substring($inputDateTime, 9, 2)"/>
    </xsl:template>

<!-- Convert date-time from YYYY-MM-DD HH:MM:ss to ISO8601 YYYY-MM-DDTHH:MM:SS+SDTZ -->
<xsl:template name="convertDateTime-to-ISO8601">
        <xsl:param name="inputDateTime" />
        <xsl:value-of select="substring($inputDateTime, 1, 10)"/>
        <xsl:text>T</xsl:text>
        <xsl:value-of select="substring($inputDateTime, 12, 8)"/>
        <xsl:text>+04:00</xsl:text>
</xsl:template>
<!-- Convert date-time from YYYY-MM-DD HH:MM:ss to ISO8601 YYYY-MM-DDTHH:MM:SS.000+SDTZ -->
 <xsl:template name="convertDateTime-to-ISO8601WithMillis">
        <xsl:param name="inputDateTime" />
        <xsl:value-of select="substring($inputDateTime, 1, 10)"/>
        <xsl:text>T</xsl:text>
        <xsl:value-of select="substring($inputDateTime, 12, 8)"/>
        <xsl:text>.000</xsl:text>
        <xsl:text>+04:00</xsl:text>
</xsl:template>

<!-- Convert date from yyyy-MM-dd HH:mm:ss to dd-MMM-yyyy -->
<xsl:template name="convertDateTime-to-dd-MMM-yyyy">
  <xsl:param name="inputDateTime" />
  
  <!-- Check if the inputDateTime is not empty -->
  <xsl:choose>
    <xsl:when test="not($inputDateTime)">
      <!-- If inputDateTime is empty, return an empty string -->
      <xsl:text></xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <!-- If inputDateTime is not empty, proceed with date conversion -->
      <xsl:variable name="year" select="substring($inputDateTime, 1, 4)" />
      <xsl:variable name="month" select="substring($inputDateTime, 6, 2)" />
      <xsl:variable name="day" select="substring($inputDateTime, 9, 2)" />
      
      <xsl:variable name="months">
        <month>Jan</month>
        <month>Feb</month>
        <month>Mar</month>
        <month>Apr</month>
        <month>May</month>
        <month>Jun</month>
        <month>Jul</month>
        <month>Aug</month>
        <month>Sep</month>
        <month>Oct</month>
        <month>Nov</month>
        <month>Dec</month>
      </xsl:variable>
      
      <xsl:value-of select="$day"/>
      <xsl:text>-</xsl:text>
      <xsl:value-of select="substring($months/month[number($month)]/text(), 1, 3)"/>
      <xsl:text>-</xsl:text>
      <xsl:value-of select="$year"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

    <xsl:template name="convertDateTime-to-YYYY-MM-DD">
        <xsl:param name="inputDateTime" />
        <xsl:value-of select="substring($inputDateTime, 1, 4)"/>
        <xsl:text>-</xsl:text>
        <xsl:value-of select="substring($inputDateTime, 6, 2)"/>
        <xsl:text>-</xsl:text>
        <xsl:value-of select="substring($inputDateTime, 9, 2)"/>
    </xsl:template>

    <!-- Convert date-time from YYYY-MM-DD HH:MM:ss to DDMMYYYYHHMMSSmmm -->
    <xsl:template name="convertDateTime-to-DDMMYYYYHHMMSSmmm">
        <xsl:param name="inputDateTime" />
        <xsl:value-of select="substring($inputDateTime, 9, 2)"/>
        <xsl:value-of select="substring($inputDateTime, 6, 2)"/>
        <xsl:value-of select="substring($inputDateTime, 1, 4)"/>
        <xsl:value-of select="substring($inputDateTime, 12, 2)"/>
        <xsl:value-of select="substring($inputDateTime, 15, 2)"/>
        <xsl:value-of select="substring($inputDateTime, 18, 2)"/>
        <xsl:text>00000</xsl:text> <!-- Milliseconds portion -->
    </xsl:template>

<!-- Convert date-time from YYYY-MM-DD HH:MM:ss to DDMMYYYY -->
    <xsl:template name="convertDateTime-to-DDMMYYYY-withoutSymbol">
        <xsl:param name="inputDateTime" />
        <xsl:value-of select="substring($inputDateTime, 9, 2)"/>
        <xsl:value-of select="substring($inputDateTime, 6, 2)"/>
        <xsl:value-of select="substring($inputDateTime, 1, 4)"/>
    </xsl:template>

<!-- Convert date from yyyy-MM-dd HH:mm:ss to dd-MMM-yyyy -->
<xsl:template name="convertDateTime-to-dd-MMM-yyyy-without-dashes">
  <xsl:param name="inputDateTime" />
  
  <!-- Check if the inputDateTime is not empty -->
  <xsl:choose>
    <xsl:when test="not($inputDateTime)">
      <!-- If inputDateTime is empty, return an empty string -->
      <xsl:text></xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <!-- If inputDateTime is not empty, proceed with date conversion -->
      <xsl:variable name="year" select="substring($inputDateTime, 1, 4)" />
      <xsl:variable name="month" select="substring($inputDateTime, 6, 2)" />
      <xsl:variable name="day" select="substring($inputDateTime, 9, 2)" />
      
      <xsl:variable name="months">
        <month>Jan</month>
        <month>Feb</month>
        <month>Mar</month>
        <month>Apr</month>
        <month>May</month>
        <month>Jun</month>
        <month>Jul</month>
        <month>Aug</month>
        <month>Sep</month>
        <month>Oct</month>
        <month>Nov</month>
        <month>Dec</month>
      </xsl:variable>
      
      <xsl:value-of select="$day"/>
      <xsl:value-of select="' '"/>
      <xsl:value-of select="substring($months/month[number($month)]/text(), 1, 3)"/>
      <xsl:value-of select="' '"/>
      <xsl:value-of select="$year"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

      <!-- Convert date from yyyy-MM-dd HH:mm:ss to dd/MMM/yyyy -->
<xsl:template name="convertDateTime-to-dd-MMM-yyyy-with-slash">
  <xsl:param name="inputDateTime" />
  
  <!-- Check if the inputDateTime is not empty -->
  <xsl:choose>
    <xsl:when test="not($inputDateTime)">
      <!-- If inputDateTime is empty, return an empty string -->
      <xsl:text></xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <!-- If inputDateTime is not empty, proceed with date conversion -->
      <xsl:variable name="year" select="substring($inputDateTime, 1, 4)" />
      <xsl:variable name="month" select="substring($inputDateTime, 6, 2)" />
      <xsl:variable name="day" select="substring($inputDateTime, 9, 2)" />
      
      <xsl:variable name="months">
        <month>Jan</month>
        <month>Feb</month>
        <month>Mar</month>
        <month>Apr</month>
        <month>May</month>
        <month>Jun</month>
        <month>Jul</month>
        <month>Aug</month>
        <month>Sep</month>
        <month>Oct</month>
        <month>Nov</month>
        <month>Dec</month>
      </xsl:variable>
      
      <xsl:value-of select="$day"/>
      <xsl:text>/</xsl:text>
      <xsl:value-of select="substring($months/month[number($month)]/text(), 1, 3)"/>
      <xsl:text>/</xsl:text>
      <xsl:value-of select="$year"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

    <xsl:template name="format-current-date-to-dd-MM-yy">
    <!-- Get the current date and time -->
    <xsl:param name="inputDateTime" />

    <!-- Extract the year, month, and day -->
    <xsl:variable name="year" select="substring($inputDateTime, 3, 2)" />
    <xsl:variable name="month" select="substring($inputDateTime, 6, 2)" />
    <xsl:variable name="day" select="substring($inputDateTime, 9, 2)" />

    <!-- Define month name to number mapping -->
    <xsl:variable name="months">
        <month num="01" name="JAN" />
        <month num="02" name="FEB" />
        <month num="03" name="MAR" />
        <month num="04" name="APR" />
        <month num="05" name="MAY" />
        <month num="06" name="JUN" />
        <month num="07" name="JUL" />
        <month num="08" name="AUG" />
        <month num="09" name="SEP" />
        <month num="10" name="OCT" />
        <month num="11" name="NOV" />
        <month num="12" name="DEC" />
    </xsl:variable>

    <!-- Get the month abbreviation -->
    <xsl:variable name="monthAbbr" select="$months/month[@num=$month]/@name" />

    <!-- Output the formatted date as dd-MMM-yy -->
    <xsl:value-of select="concat($day, '-', $monthAbbr, '-', $year)" />
</xsl:template>
    <!-- Add more date conversion templates here -->
</xsl:stylesheet>


