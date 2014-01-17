<?xml version="1.0" encoding="UTF-8"?>
  <!--©  Crown copyright
 
You may use and re-use this code free of charge under the terms of the Open Government Licence
 
http://www.nationalarchives.gov.uk/doc/open-government-licence/-->
   <xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:gzm="http://www.gazettes.co.uk/metadata" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

  <xsl:param name="updates" as="node()">
    <updates xmlns:x="http://www.w3.org/1999/xhtml"><x:rdfentry property="gaz:hasIssueNumber">the-issue-number-12345</x:rdfentry></updates>
  </xsl:param>


  <xsl:template match="node()[@property = $updates//*:rdfentry/@property]">
    <xsl:variable name="current-property" select="@property"/>
    <!-- xsl:variable name="current-about" select="@about"/ -->
    <!-- xsl:if test="$updates//*:rdfentry[@property = $current-property]/@about = $current-about" -->
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:value-of select="$updates//*:rdfentry[@property = $current-property]"/>
    </xsl:copy>
    <!-- /xsl:if -->
  </xsl:template>

  <xsl:template match="node()[name() = $updates//*:entry/@name]">
    <xsl:variable name="thisone">
      <xsl:value-of select="name()"/>
    </xsl:variable>
    <xsl:element name="{$thisone}" namespace="{namespace-uri()}">
      <xsl:copy-of select="@*"/>
      <xsl:value-of select="$updates//*:entry[@name = $thisone]"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="/ | @* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>