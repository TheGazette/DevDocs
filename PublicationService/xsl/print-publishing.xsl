<?xml version="1.0" encoding="UTF-8"?>
<!--
(c)  Crown copyright
You may use and re-use this code free of charge under the terms of the Open Government Licence v2.0
http://www.nationalarchives.gov.uk/doc/open-government-licence/version/2
 
-->

<!-- Version 1.02 -->
<!-- Created by Williams Lea XML Team -->
<!--
                Change history
                1.0 Initial release         
                -->
<!-- This transformation is used for displaying dynamic contents for single notice -->


   <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:f="http://www.gazettes.co.uk/facets" xmlns:tax="http://www.gazettes.co.uk/assets/taxonomy" xmlns:m="http://www.gazettes.co.uk/metadata" xmlns="http://www.w3.org/1999/xhtml" xmlns:saxon="http://saxon.sf.net/" version="2.0" exclude-result-prefixes="#all">


  <xsl:output indent="no" method="xhtml" encoding="ascii" omit-xml-declaration="yes"/>
  <!--xsl:strip-space elements="*"/-->
  <xsl:param name="barcode" required="yes" as="xs:string"/>
  <!-- ideally the string contains an SVG document, -->
  <!-- if not, a path to a TIFF, PNG or JPEG on the filesystem - let us know which, thanx -->
  <xsl:param name="initial-page" required="yes"/>
  <!-- page number -->
  <xsl:param name="isbn-number" required="no"/>
  <!-- isbn number ## -->
  <xsl:param name="cover-price" as="xs:string" required="no"/>
  <xsl:param name="crest" as="node()" select="doc('local-test/gazette.svg')"/>
  <xsl:param name="tso_logo" as="node()" select="doc('local-test/tso-gazettes.svg')"/>
  <!-- cover price ## -->
  <xsl:param name="publication-date" required="yes" as="xs:date"/>
  <!-- publication date -->
  <xsl:param name="number" required="yes"/>
  <!-- issue number -->
  <xsl:param name="edition-name" required="yes"/>
  <!-- edition name needs to be passed as printed e.g. "London Gazette" ## -->
  <xsl:param name="taxonomy-notice-type" as="node()" select="doc('taxonomy_new.xml')"/>
  <!-- we need access to the FULL taxonomy to create the table of contents and section headings - therefore mandatory -->
  <xsl:param name="terms-and-conditions" as="node()" select="node()"/>
  <!-- HTML document containing terms and conditions ## -->
  <!-- Java layer should make the choice as to which terms and conditions to pass -->
  <xsl:param name="contact-document" as="node()" select="doc('local-test/contact.xhtml')"/>
  <!-- HTML document containing contact information ## -->
  <xsl:param name="prices" as="node()" select="node()"/>
  <!-- HTML document containing information needed to generate pricing table ## -->
  <!-- the pricing information needs to be drawn from the ecommerce solution -->
  <xsl:param name="number-of-extra-pages" as="xs:integer" select="0"/>
  <!-- to be used on the second pass to add an appropriate number of advert pages  (1-3) -->
  <!-- if number of extra pages = 0, no need to push it through a second time -->
  <!-- total number of pages modulo 4 = number of extra pages ## -->
  <xsl:param name="gazette-host-name" as="xs:string"/>
  <!-- used for images no trailing slash-->
  <xsl:param name="DEBUG">false</xsl:param>


  <xsl:variable name="category">
    <xsl:sequence select="//m:notice-category-codes/m:notice-category-code"/>
  </xsl:variable>


  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="atom:feed">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;
    </xsl:text>
    <html data-initial-page="{$initial-page}">
      <head>
        <title>
          <xsl:value-of select="$edition-name"/>
        </title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <xsl:if test="$DEBUG = 'true'">
          <link href="../css/print-production.css" rel="stylesheet" type="text/css"/>
        </xsl:if>
      </head>
      <body>
        <xsl:call-template name="front-cover"/>
        <section class="two-columns">

          <xsl:for-each-group select="atom:entry" group-by="m:gazette-metadata/m:notice-category-codes/m:notice-category-code[1]">
            <!-- the below should be /@sort, not /@name -->
            <xsl:sort select="$taxonomy-notice-type/*:notice-taxonomy/*:notice-type[@code=current-grouping-key()]/@sort"/>
            <xsl:if test="$DEBUG = 'true'">
              <hr/>
              <code>====== STARTING A CATEGORY ======</code>
              <br/>
              <code>notice-category-code[1]: <xsl:value-of select="current-grouping-key()"/></code>
            </xsl:if>
            <section class="notice-category" id="nt-{current-grouping-key()}">
              <header>
                <h1>
                  <xsl:for-each select="$taxonomy-notice-type/*:notice-taxonomy/*:notice-type">
                    <xsl:if test="@code = current-grouping-key()">
                      <xsl:apply-templates select="@name"/>
                    </xsl:if>
                  </xsl:for-each>
                </h1>
              </header>
              <xsl:variable name="current-group-of-entries" select="current-group()"/>
              <xsl:if test="m:gazette-metadata/m:notice-code = '2903'">
                <xsl:if test="$DEBUG = 'true'">
                  <hr/>
                  <code>Starting 2903 grouping current-grouping-key is <xsl:value-of select="current-grouping-key()"/></code>
                  <!-- code>$current-group-of-entries: |<xsl:copy-of select="$current-group-of-entries"/>|</code -->
                  <hr/>
                </xsl:if>

                <xsl:for-each-group select="$current-group-of-entries" group-by=".//m:gazette-metadata/m:edition">
                  <xsl:variable name="group-for-this-edition" select="current-group()"/>

                  <section class="notice-type" id="nt-2903">
                    <header>
                      <xsl:if test="position() &lt; 3">
                        <h2>
                          <xsl:value-of select="$taxonomy-notice-type/*:notice-taxonomy//*:notice-type[@code = '2903']/@name"/>
                        </h2>
                      </xsl:if>
                    </header>
                    <xsl:if test="$DEBUG = 'true'">
                      <hr/>
                      <code>STARTING AN EDITION GROUPING</code>
                    </xsl:if>
                    <xsl:choose>
                      <xsl:when test="current-grouping-key() = 'London'">
                        <div class="legal-notice">
                          <!-- @TODO: Legal text for 2903 notices needs passed through by Java Layer -->
                          <p>LEGAL TEXT HERE</p>
                        </div>
                        <table>
                          <thead>
                            <tr>
                              <th class="name">Name of Deceased (Surname first)</th>
                              <th class="address">Address,description and date of death of Deceased</th>
                              <th class="represent">Names addresses and descriptions of Persons to whom notices of claims are to be given and names, in parentheses, of Personal Representatives</th>
                              <th class="claimsDate">Date before which notice of claims to be given</th>
                              <th class="noticeNum"/>
                            </tr>
                          </thead>
                          <xsl:for-each select="$group-for-this-edition">
                            <xsl:sort select=".//*:dd[@property = 'foaf:familyName' and @about='this:deceasedPerson']"/>
                            <xsl:variable name="noticeid" select=".//*[@property = 'gaz:hasNoticeID']/."/>
                            <tr>
                              <td>
                                <!-- DONE - @TODO, uppercase familyName (Done by css instead) -->
                                <span class="familyName">
                                  <xsl:value-of select=".//*:dd[@property='foaf:familyName' and @about='this:deceasedPerson']"/>
                                </span>
                                <xsl:text>, </xsl:text>
                                <xsl:value-of select=".//*:dd[@property='foaf:firstName' and @about='this:deceasedPerson']"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select=".//*:dd[@property='foaf:givenName' and @about='this:deceasedPerson']"/>
                                <!-- @TODO, check this, can there be more than 1? -->
                                <xsl:if test=".//*:dd[@property='person:alsoKnownAs' and @about='this:deceasedPerson'] != ''">
                                  <xsl:text> </xsl:text>
                                  <xsl:if test="not(contains(.//*:dd[@property='person:alsoKnownAs' and @about='this:deceasedPerson'],'otherwise') or contains(.//*:dd[@property='person:alsoKnownAs' and @about='this:deceasedPerson'],'also known as'))">
                                    <xsl:text>otherwise </xsl:text>
                                  </xsl:if>
                                  <xsl:value-of select=".//*:dd[@property='person:alsoKnownAs' and @about='this:deceasedPerson']"/>
                                </xsl:if>
                                <!-- @TODO, Maiden name? -->
                              </td>
                              <td>
                                <!-- find all the different @about contents which relate to an address of the deceased -->
                                <xsl:variable name="addressSections" select=".//*[@property='person:hasAddress' and @about='this:deceasedPerson']"/>
                                <xsl:choose>
                                  <xsl:when test="count(.//*:dd[@about=$addressSections[1]/@resource]) &gt; 0">
                                    <xsl:for-each select=".//*:dd[@about=$addressSections[1]/@resource]">
                                      <xsl:if test="position() != 1">
                                        <xsl:text>, </xsl:text>
                                      </xsl:if>
                                      <xsl:value-of select="."/>
                                    </xsl:for-each>
                                    <xsl:if test="count($addressSections/@resource) &gt; 1">
                                      <xsl:for-each select="$addressSections">
                                        <xsl:variable name="resource" select="./@resource"/>
                                        <xsl:if test="position() != 1">
                                          <xsl:for-each select=".//*:dd[@about=$resource]">
                                            <xsl:if test="position() != 1">
                                              <xsl:text>, </xsl:text>
                                            </xsl:if>
                                            <xsl:value-of select="."/>
                                          </xsl:for-each>
                                        </xsl:if>
                                      </xsl:for-each>
                                    </xsl:if>
                                  </xsl:when>
                                  <xsl:when test="count($addressSections/@resource) = 0">
                                    <xsl:value-of select=".//*:dd[@about='this:addressOfDeceased-address-1']"/>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:value-of select=".//*:dd[@about=$addressSections[1]/@resource]"/>
                                  </xsl:otherwise>
                                </xsl:choose>


                                <xsl:if test=".//*:dd[@property='person:jobTitle']">
                                  <xsl:text>. </xsl:text>
                                  <xsl:value-of select=".//*:dd[@property='person:jobTitle']"/>
                                </xsl:if>
                                <xsl:text>. </xsl:text>
                                <xsl:value-of select=".//*:dd[@property='personal-legal:dateOfDeath']/."/>
                              </td>
                              <td>
                                <xsl:choose>
                                  <xsl:when test="count(.//*:dd[@about='this:estateExecutor']) &gt; 1">
                                    <xsl:for-each select=".//*:dd[@about='this:addressOfExecutor-1']">
                                      <xsl:if test="position() != 1">
                                        <xsl:text>, </xsl:text>
                                      </xsl:if>
                                      <xsl:value-of select="."/>
                                    </xsl:for-each>
                                    <xsl:text>. (</xsl:text>
                                    <xsl:value-of select=".//*:dd[@about='this:estateExecutor' and @property='foaf:firstName']"/>
                                    <xsl:if test=".//*:dd[@about='this:estateExecutor' and @property='foaf:firstName'] and .//*:dd[@about='this:estateExecutor' and @property='foaf:givenName']">
                                      <xsl:text> </xsl:text>
                                    </xsl:if>
                                    <xsl:value-of select=".//*:dd[@about='this:estateExecutor' and @property='foaf:givenName']"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select=".//*:dd[@about='this:estateExecutor' and @property='foaf:familyName']"/>
                                    <xsl:text>)</xsl:text>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:value-of select=".//*:dd[@about='this:estateExecutor']"/>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </td>
                              <td>
                                <xsl:value-of select=".//*:dd[@property='personal-legal:hasClaimDeadline']"/>
                              </td>
                              <td>
                                <xsl:text>(</xsl:text>
                                <xsl:choose>
                                  <xsl:when test="starts-with($noticeid,'L') or starts-with($noticeid,'B') or starts-with($noticeid,'E')">
                                    <xsl:value-of select="substring-after(substring-after($noticeid,'-'),'-')"/>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:value-of select="$noticeid"/>
                                  </xsl:otherwise>
                                </xsl:choose>
                                <xsl:text>)</xsl:text>
                              </td>
                            </tr>
                          </xsl:for-each>
                        </table>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:for-each select="$group-for-this-edition">
                          <xsl:apply-templates select="current-group()"/>
                        </xsl:for-each>
                      </xsl:otherwise>
                    </xsl:choose>
                  </section>


                </xsl:for-each-group>


              </xsl:if>

              <xsl:for-each-group select="current-group()" group-by="m:gazette-metadata/m:notice-code">
                <!-- @TODO: transport notices need sorted by "authority" needs to be by the "B" of "London Borough of Barnet" not the "L" -->
                <xsl:sort select="$taxonomy-notice-type/*:notice-taxonomy//*:notice-type[@code=current-grouping-key()]/@sort"/>
                <xsl:if test="$DEBUG = 'true'">
                  <hr/>
                  <code>====== STARTING A GROUPING OF NOTICES ======</code>
                  <br/>
                  <code>notice-code: <xsl:value-of select="current-grouping-key()"/></code>
                </xsl:if>
                <xsl:choose>
                  <xsl:when test="current-grouping-key() = '2903'">
                    <!-- suppress -->
                  </xsl:when>
                  <xsl:when test="current-grouping-key() = ('2401','2402','2403','2404','2405','2406','2407','2408','2410','2411','2412','2413','2421','2422','2423','2431','2432','2433','2434','2435','2441','2442','2443','2444','2445','2446','2450','2451','2452','2454','2455','2459','2460','2461','2462','2463')">
                    <xsl:variable name="to-sort-by-company-name" select="current-group()"/>
                    <section class="notice-type" id="nt-{current-grouping-key()}">
                      <header>
                        <h2>
                          <xsl:value-of select="$taxonomy-notice-type/*:notice-taxonomy//*:notice-type[@code = current-grouping-key()]/@name"/>
                        </h2>
                      </header>
                      <xsl:for-each select="$to-sort-by-company-name">
                        <xsl:sort select="(.//*:h3[@property = 'gazorg:name'])[1]"/>
                        <xsl:apply-templates/>
                      </xsl:for-each>
                    </section>
                  </xsl:when>
                  <xsl:when test="current-grouping-key() = ('2501','2502','2503','2505','2506','2507','2508','2509','2510','2511','2512','2513','2514','2515','2516','2517','2518','2524','2525','2526','2527')">
                    <xsl:variable name="to-sort-by-surname" select="current-group()"/>
                    <section class="notice-type" id="nt-{current-grouping-key()}">
                      <header>
                        <h2>
                          <xsl:value-of select="$taxonomy-notice-type/*:notice-taxonomy//*:notice-type[@code = current-grouping-key()]/@name"/>
                        </h2>
                      </header>
                      <xsl:for-each select="$to-sort-by-surname">
                        <xsl:sort select="(.//*:span[@property = 'foaf:familyName' and ancestor::*/@property != 'insolvency:hasAdministrator'])[1]"/>
                        <xsl:apply-templates/>
                      </xsl:for-each>
                      <!-- xsl:apply-templates select="current-group()"/ -->
                    </section>
                  </xsl:when>
                  <xsl:when test="current-grouping-key() = '1501'">
                    <xsl:variable name="to-sort-by-authority" select="current-group()"/>
                    <section class="notice-type" id="nt-{current-grouping-key()}">
                      <header>
                        <h2>
                          <xsl:value-of select="$taxonomy-notice-type/*:notice-taxonomy//*:notice-type[@code = current-grouping-key()]/@name"/>
                        </h2>
                      </header>

                      <xsl:for-each select="$to-sort-by-authority">
                        <xsl:sort select="replace( (.//*:span[@property = 'gazorg:name' and ancestor::*/@property = 'gaz:hasAuthority'])[1], 'London Borough of ', '')"/>
                     
                        <xsl:apply-templates/>
                      </xsl:for-each>
                      <!-- xsl:apply-templates select="current-group()"/ -->
                    </section>
                  </xsl:when>
                  <xsl:otherwise>
                    <section class="notice-type" id="nt-{current-grouping-key()}">
                      <header>
                        <h2>
                          <xsl:value-of select="$taxonomy-notice-type/*:notice-taxonomy//*:notice-type[@code = current-grouping-key()]/@name"/>
                        </h2>
                      </header>
                      <xsl:apply-templates select="current-group()"/>
                    </section>
                  </xsl:otherwise>
                </xsl:choose>

              </xsl:for-each-group>
            </section>
          </xsl:for-each-group>
        </section>
        <xsl:call-template name="adverts"/>
        <xsl:call-template name="terms"/>
        <xsl:call-template name="back-cover"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="atom:entry | atom:content | *:div">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="f:* | atom:id | atom:link | atom:title | atom:updated | atom:openSearch | atom:author | m:gazette-metadata"/>

  <xsl:template match="*:article">
    <xsl:variable name="noticeid" select="descendant::*[@property = 'gaz:hasNoticeID'][1]"/>
    <xsl:choose>
      <xsl:when test=".//*:dd[@property='gaz:hasNoticeCode'][1] = '2903' and .//m:gazette-metadata/m:edition = 'London'">
        <!-- <tr>
          <td>
           
            <span class="familyName">
              <xsl:value-of select=".//*:dd[@property='foaf:familyName']"/>
            </span>
            <xsl:text>, </xsl:text>
            <xsl:value-of select=".//*:dd[@property='foaf:firstName']"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select=".//*:dd[@property='foaf:givenName']"/>
            
            <xsl:if test=".//*:dd[@property='person:alsoKnownAs']">
              <xsl:text> </xsl:text>
              <xsl:value-of select=".//*:dd[@property='person:alsoKnownAs']"/>
            </xsl:if>
          </td>
          <td>
          
            <xsl:value-of select=".//*:dd[@about='this:addressOfDeceased-address-1']"/>
            <xsl:text>. </xsl:text>
            <xsl:value-of select=".//*:dd[@property='personal-legal:dateOfDeath']"/>
          </td>
          <td>
            <xsl:value-of select="normalize-space(.//*:dd[@about='this:estateExecutor'])"/>
          </td>
          <td>
            <xsl:value-of select=".//*:dd[@property='personal-legal:hasClaimDeadline']"/>
          </td>
          <td>
            <xsl:text>(</xsl:text>
            <xsl:choose>
              <xsl:when test="starts-with($noticeid,'L') or starts-with($noticeid,'B') or starts-with($noticeid,'E')">
                <xsl:value-of select="substring-after(substring-after($noticeid,'-'),'-')"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="$noticeid"/>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:text>)</xsl:text>
          </td>
        </tr>-->
      </xsl:when>
      <xsl:otherwise>
        <article class="full-notice full-notice-{.//*:dd[@property='gaz:hasNoticeCode'][1]}">
          <xsl:choose>
            <xsl:when test=".//*:dd[@property='gaz:hasNoticeCode'][1]">


              <div class="content">
                <span property="gaz:hasNoticeID" class="metadata">
                  <xsl:value-of select="$noticeid"/>
                </span>
                <!--xsl:copy-of select=".//*:div[@class='content']/*" copy-namespaces="no"/-->
                <xsl:apply-templates select=".//*:div[@class='content']/*" mode="notice"/>


              </div>
              <footer>
                <p>
                  <xsl:text>(</xsl:text>
                  <xsl:choose>
                    <!-- TODO what about B-0000-000 and E-0000-000 ? -->
                    <xsl:when test="starts-with($noticeid,'L')">
                      <xsl:value-of select="substring-after(substring-after($noticeid,'-'),'-')"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="$noticeid"/>
                    </xsl:otherwise>
                  </xsl:choose>
                  <xsl:text>)</xsl:text>
                </p>
              </footer>
            </xsl:when>
            <xsl:otherwise> </xsl:otherwise>
          </xsl:choose>

        </article>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="*" mode="notice">
    <xsl:choose>
      <!-- <xsl:when test="name() = 'col'">
        <col span="{@span}"/>
      </xsl:when>-->
      <xsl:when test="name() = 'table'">
        <table>
          <xsl:if test="@cols">
            <xsl:attribute name="cols">
              <xsl:value-of select="@cols"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="@data-width">
            <xsl:attribute name="width">
              <xsl:choose>
                <xsl:when test="matches(@data-width,'pt')"><xsl:variable name="numeric" select="number(replace(@data-width,'pt','')) * 0.352777778"/><xsl:value-of select="format-number($numeric,'###.##')"/>mm</xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="@data-width"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
          </xsl:if>
          <xsl:apply-templates mode="notice"/>
        </table>
      </xsl:when>
      <xsl:when test="name() = 'td'">
        <td>
          <xsl:if test="@colspan">
            <xsl:attribute name="colspan">
              <xsl:value-of select="@colspan"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="@rowspan">
            <xsl:attribute name="rowspan">
              <xsl:value-of select="@rowspan"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="@class">
            <xsl:attribute name="class">
              <xsl:value-of select="@class"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:apply-templates mode="notice"/>
        </td>
      </xsl:when>
      <xsl:when test="name() = 'img'">
        <img>
          <xsl:if test="@Width">
            <xsl:attribute name="width">
              <xsl:choose>
                <xsl:when test="matches(@Width,'pt')"><xsl:variable name="numeric" select="number(replace(@Width,'pt','')) * 0.352777778"/><xsl:value-of select="format-number($numeric,'###.##')"/>mm</xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="@Width"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="@Height">
            <xsl:attribute name="height">
              <xsl:choose>
                <xsl:when test="matches(@Height,'pt')"><xsl:variable name="numeric" select="number(replace(@Height,'pt','')) * 0.352777778"/><xsl:value-of select="format-number($numeric,'###.##')"/>mm</xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="@Height"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
          </xsl:if>
          <xsl:attribute name="src">
            <xsl:value-of select="$gazette-host-name"/>
            <xsl:value-of select="@src"/>
          </xsl:attribute>
        </img>
      </xsl:when>
      <xsl:otherwise>
        <xsl:element name="{name()}">
          <xsl:copy-of select="@*[not(name() = 'id')]"/>
          <xsl:apply-templates mode="notice"/>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="front-cover">
    <article class="front-cover">
      <header>
        <!-- TODO: needs checked! -->
        <xsl:copy-of select="$crest"/>
        <h1 class="sub-title">
          <xsl:value-of select="$edition-name"/>
        </h1>
      </header>
      <section class="publication-details">
        <!-- date & issue number to be passed through -->
        <p><span class="publication-date"><xsl:value-of select="format-date($publication-date,'[D] [Mn] [Y]')"/></span>
          <xsl:if test="$number != ''"><xsl:text> | Number </xsl:text><xsl:value-of select="$number"/></xsl:if>
        </p>
        <p>Published by Authority | Established 1665</p>
        <p>www.thegazette.co.uk</p>
      </section>
      <section class="table-of-contents">
        <header>Contents</header>
        <ul>

          <xsl:for-each select="$taxonomy-notice-type/tax:notice-taxonomy/tax:notice-type">
            <xsl:sort select="@code"/>
            <li>
              <xsl:choose>
                <xsl:when test="contains($category,@code)">
                  <xsl:attribute name="class">active</xsl:attribute>
                  <a href="#nt-{@code}">
                    <xsl:apply-templates select="@name"/>
                    <xsl:text>/</xsl:text>
                  </a>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:apply-templates select="@name"/>
                  <xsl:text>/</xsl:text>
                </xsl:otherwise>
              </xsl:choose>
            </li>
          </xsl:for-each>
          <xsl:if test="count($terms-and-conditions//*:body//*:article/*)">
          <li class="active">
            <a href="#terms"> Terms &amp; Conditions/ </a>
          </li>
          </xsl:if>
        </ul>
        <footer>*Notices published today</footer>
      </section>
    </article>
  </xsl:template>

  <xsl:template name="terms">
    <xsl:if test="count($terms-and-conditions//*:body//*:article/*) &gt; 0">
    <article class="terms-and-conditions" id="terms">
      <xsl:copy-of select="$terms-and-conditions//*:body//*:article/*"/>
    </article>
    </xsl:if>
  </xsl:template>
  <xsl:template name="adverts">

    <xsl:if test="$number-of-extra-pages  &gt; 0">
      <article class="advert advert-1">
        <h1>ADVERT 1</h1>
      </article>
    </xsl:if>
    <xsl:if test="$number-of-extra-pages  &gt; 1">
      <article class="advert advert-2">
        <h1>ADVERT 2</h1>
      </article>
    </xsl:if>
    <xsl:if test="$number-of-extra-pages  &gt; 2">
      <article class="advert advert-4">
        <h1>ADVERT 3</h1>
      </article>
    </xsl:if>

  </xsl:template>
  <xsl:template name="back-cover">
    <article class="back-cover">
      <header>
        <div class="contact">
          <xsl:copy-of select="$contact-document//*:article/*:header/*"/>
        </div>
        <div class="crest">
          <!-- TODO: needs checked -->
          <xsl:copy-of select="$crest"/>
          <h2>
            <xsl:value-of select="$edition-name"/>
          </h2>
        </div>
      </header>
      <section class="charges">
        <!--<xsl:copy-of select="$prices//*:body/*"/>-->
        <xsl:apply-templates select="$prices//*:body/*" mode="notice"/>
      </section>
      <div class="sales">
        <section class="contact-information">
          <header>
            <!--TODO: needs checked-->
            <xsl:copy-of select="$tso_logo"/>
            <xsl:copy-of select="$contact-document//*:article/*:section[@class='contact-information']/*:header/*"/>
          </header>
          <xsl:copy-of select="$contact-document//*:article/*:section[@class='contact-information']/*:div[@class='content']/*"/>
        </section>
        <xsl:if test="$barcode != ''">
          <section class="isbn">
            <img>
              <xsl:attribute name="src">
                <xsl:text>data:image/png;base64,</xsl:text>
                <xsl:value-of select="$barcode" disable-output-escaping="yes"/>
              </xsl:attribute>
            </img>
          </section>
        </xsl:if>
      </div>
      <footer class="page-footer">
        <xsl:copy-of select="$contact-document//*:article/*:footer/*"/>
      </footer>
    </article>
  </xsl:template>
</xsl:stylesheet>