<?xml version="1.0" encoding="UTF-8"?>
  <!--©  Crown copyright
 
You may use and re-use this code free of charge under the terms of the Open Government Licence
 
http://www.nationalarchives.gov.uk/doc/open-government-licence/-->
   <xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:gzm="http://www.gazettes.co.uk/metadata" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

  <xsl:param name="date"/>

  <xsl:template match="node()[@property='gaz:earliestPublicationDate']">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <time datetime="{$date}"><xsl:value-of select="$date"/></time>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="/ | @* | node()[not(@property='gaz:earliestPublicationDate')]">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>