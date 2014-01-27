<?xml version="1.0" encoding="UTF-8"?>
  <!--©  Crown copyright
 
You may use and re-use this code free of charge under the terms of the Open Government Licence
 
http://www.nationalarchives.gov.uk/doc/open-government-licence/-->
   <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:functx="http://www.functx.com" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:dfn="http://www.dfn.org/dfn" version="2.0">

  <xsl:output method="xml" omit-xml-declaration="yes" indent="yes" encoding="UTF-8"/>

  <xsl:param name="status" as="xs:string">published</xsl:param>
  <xsl:param name="notice-code" as="xs:string">1119</xsl:param>
  <xsl:param name="publishDate" as="xs:dateTime"/>
  <xsl:param name="bundleId" as="xs:string"/>
  <xsl:param name="edition" as="xs:string"/>
  <xsl:param name="issueNumber" as="xs:string" />
  <xsl:param name="noticeId" as="xs:string"/>
  <xsl:param name="user-submitted" as="xs:nonNegativeInteger"/>
  <xsl:param name="version-count" as="xs:nonNegativeInteger"/>
  <xsl:param name="notice-capture-method" as="xs:string"/>

 <xsl:template match="/">

   <xsl:apply-templates/>
 </xsl:template>
  
 <xsl:template match="*:html">
   <html>
     <xsl:copy-of select="@*"/>
     <xsl:apply-templates/>
   </html>
 </xsl:template> 
  

  <xsl:template match="*:head">
    <head>
      <xsl:copy-of select="*"/>
      <gazette-metadata xmlns="http://www.gazettes.co.uk/metadata">
        <status><xsl:value-of select="$status"/></status>
        <notice-code><xsl:value-of select="$notice-code"/></notice-code>
        <publication-date><xsl:value-of select="$publishDate"/></publication-date>
        <bundle-id><xsl:value-of select="$bundleId"/></bundle-id>
        <edition><xsl:value-of select="$edition"/></edition>
        <issue><xsl:value-of select="$issueNumber"/></issue>
        <notice-id><xsl:value-of select="$noticeId"/></notice-id>
        <user-submitted><xsl:value-of select="$user-submitted"/></user-submitted>
        <version-count><xsl:value-of select="$version-count"/></version-count>
        <!--Notice category code is hard coded for now becasue there is only
one notice type submisson method. However, /taxonomy/index should be passed as a 
a param into this xlst if there are more types notices. Notice category codes should be 
produced according to the taxnomy index file        -->
        <notice-category-codes>
          <notice-category-code>11</notice-category-code>
          <notice-category-code>1119</notice-category-code>
        </notice-category-codes>
        <notice-capture-method><xsl:value-of select="$notice-capture-method"/></notice-capture-method>
      </gazette-metadata>
    </head>
  </xsl:template>

<xsl:template match="*:body">
  <xsl:copy-of select="."/>
</xsl:template>

</xsl:stylesheet>