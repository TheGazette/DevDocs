<?xml version="1.0" encoding="UTF-8"?>
  <!--©  Crown copyright
 
You may use and re-use this code free of charge under the terms of the Open Government Licence
 
http://www.nationalarchives.gov.uk/doc/open-government-licence/-->
   <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:gz="http://www.tso.co.uk/assets/namespace/gazette" xmlns:saxon="http://saxon.sf.net/" exclude-result-prefixes="xs  xd" version="2.0">

  <xsl:param name="bundleId" required="yes"/>
  <!-- expected values - e.g. 123456abcd-->
  <xsl:param name="bundleLocation" required="yes"/>
  <!-- expected values - e.g. Gazette/Notices/2903 or file:///c:/Development/NewGazettes/noticesbefore2005-->

  <xsl:output encoding="UTF-8" indent="no"/>

  <xsl:strip-space elements="*"/>

  <xsl:variable name="path" select="concat($bundleLocation,'/',$bundleId)"/>


  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="notice[@code = '2903']">
    <xsl:choose>
      <xsl:when test="legal">
        <xsl:apply-templates select="legal"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="type" select="@code"/>
        <!-- xsl:variable name="reference-no" select="replace(replace(string(number),'\)',''),'\(','')"/ -->
        <xsl:variable name="reference-no" select="generate-id()"/>
        <xsl:choose>
          <xsl:when test="$type = '999999999'">

            <xsl:for-each select="legal">
              <xsl:element name="notice"> DEBUG - should never run </xsl:element>
            </xsl:for-each>

          </xsl:when>
          <xsl:otherwise>
            <xsl:variable name="filename" select="concat('Notice','_',$type,'_',$reference-no,'.xml')"/>
            <xsl:result-document saxon:asynchronous="no" method="xml" href="{concat('file:///',$path,'/',$filename)}">
              <xsl:element name="notice">
                <xsl:copy-of select="@*"/>
                <xsl:attribute name="alternateformat">true</xsl:attribute>
                <xsl:copy-of select="ancestor::gazette/control/date"/>
                <xsl:copy-of select="ancestor::notice/legalhd"/>
                <xsl:copy-of select="*"/>
              </xsl:element>
            </xsl:result-document>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="legal">
    <xsl:variable name="type" select="ancestor::notice/@code"/>
    <xsl:variable name="refeNo" select="translate(translate(r/c[5],'(',''),')','')"/>
    <xsl:variable name="reference-no" select="generate-id()"/>
    <xsl:variable name="fileName" select="concat('Notice','_',$type,'_',$reference-no,'_',position(),'.xml')"/>
    <xsl:result-document saxon:asynchronous="no" method="xml" href="{concat('file:///',$path,'/',$fileName)}">
      <xsl:element name="notice">
        <xsl:copy-of select="ancestor::notice/@*"/>
        <xsl:copy-of select="ancestor::gazette/control/date"/>
        <xsl:copy-of select="ancestor::notice/legalhd"/>
        <xsl:copy-of select="."/>
      </xsl:element>
    </xsl:result-document>
  </xsl:template>

  <xsl:template match="gz:Notice">
    <xsl:variable name="refeNo" select="@Reference"/>
    <xsl:variable name="type" select="@Type"/>
    <xsl:variable name="reference-no" select="generate-id()"/>
    <xsl:variable name="fileName" select="concat('Notice','_',$type,'_',$reference-no,'.xml')"/>
    <xsl:result-document saxon:asynchronous="no" method="xml" href="{concat('file:///',$path,'/',$fileName)}">
      <xsl:copy-of select="."/>
    </xsl:result-document>
  </xsl:template>

  <xsl:template match="notice">
    <xsl:variable name="type" select="@code"/>
    <!-- xsl:variable name="reference-no" select="replace(replace(string(number),'\)',''),'\(','')"/ -->
    <xsl:variable name="reference-no" select="generate-id()"/>
    <xsl:choose>
      <xsl:when test="$type = '999999999'">

        <xsl:for-each select="legal">
          <xsl:element name="notice"> DEBUG - should never run </xsl:element>
        </xsl:for-each>

      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="filename" select="concat('Notice','_',$type,'_',$reference-no,'.xml')"/>
        <xsl:result-document saxon:asynchronous="no" method="xml" href="{concat('file:///',$path,'/',$filename)}">
          <xsl:element name="notice">
            <xsl:copy-of select="@*"/>
            <xsl:copy-of select="ancestor::gazette/control/date"/>
            <xsl:copy-of select="ancestor::notice/legalhd"/>
            <xsl:copy-of select="*"/>
          </xsl:element>
        </xsl:result-document>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>






</xsl:stylesheet>