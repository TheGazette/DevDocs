<?xml version="1.0" encoding="UTF-8"?>
<!--Â©  Crown copyright
 
You may use and re-use this code free of charge under the terms of the Open Government Licence
 
http://www.nationalarchives.gov.uk/doc/open-government-licence/-->

<!--Version 1.0-->
<!--Created by Williams Lea XML Team-->
<!--
	  Purpose of transform: incorporate the Java layer draft format into an HTMLRDFa format document 
	  
      Change history
      1.0 Initial Release: 20th January 2014
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:u="http://www.williamslea.com/ns/updates"
  xmlns:wlf="http://www.williamslea.com/xslt/functions" xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:x="http://www.w3.org/1999/xhtml" xmlns="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="u wlf xsl xs x">

  <xsl:param name="form">false</xsl:param>
  <!-- Hard coding for the time being, to be London, but it needs to be considered on the form submission -->
  <xsl:param name="edition" as="xs:string" required="no">Default</xsl:param>
  <xsl:param name="bundleId" required="no">0</xsl:param>
  <xsl:param name="noticeId" as="xs:string" required="no">0</xsl:param>
  <xsl:param name="status" as="xs:string" required="no">0</xsl:param>
  <xsl:param name="submitted-date" as="xs:dateTime" required="no">
    <xsl:value-of select="current-dateTime()"/>
  </xsl:param>
  <xsl:param name="version-count" as="xs:string" required="no">0</xsl:param>
  <xsl:param name="user-submitted" as="xs:string" required="no">0</xsl:param>
  <xsl:param name="pageNumber" required="no">0</xsl:param>
  <xsl:param name="issue" required="no">0</xsl:param>
  <xsl:param name="issue-isbn" as="xs:string" required="no">0</xsl:param>
  <xsl:param name="organisationId" as="xs:string" required="no">0</xsl:param>
  <xsl:param name="debug">false</xsl:param>
  <xsl:param name="mapping" as="node()" required="yes"/>
  <!--<xsl:variable name="mapping"><test/></xsl:variable>-->
  <xsl:param name="updates" as="node()">
    <form draftTitle="Draft 484" draftURI="/my-gazette/draft/484" noticeTypeCode="2445">
      <entry about="this:company-1" property="gazorg:companyNumber">05086161</entry>
      <entry about="this:IP1-address-1" property="vcard:street-address">Highfield Court, Tollgate,
        Chandlers Ford</entry>
      <entry about="this:IP1-address-1" property="vcard:locality">Hampshire</entry>
      <entry about="this:company-registered-office-1" property="vcard:region"/>
      <entry about="this:legislation-1" property="legislation:legislationSection">Sections
        106</entry>
      <entry about="this:legislation-1" property="legislation:legislationTitle">Insolvency Act
        1986</entry>
      <entry about="this:notifiableThing" property="corp-insolvency:meetingTimeWITHtime"
        >10:00</entry>
      <entry about="this:IP1-address-1" property="vcard:extended-address">Eastleigh</entry>
      <entry about="this:IP1" property="person:additionalInformationIP">fl;sdigb</entry>
      <entry about="this:company-previous-registered-office-1" property="vcard:postal-code">SE1
        5SS</entry>
      <entry about="this:company-1" property="gazorg:previouslyTradingAs">ANGEL LIMITED</entry>
      <entry about="noticeid:" property="gaz:earliestPublicationDateWITHtime">16:41</entry>
      <entry about="this:IP2" property="foaf:name">Nigel Ian Fox</entry>
      <entry about="this:meetingAddress-1" property="vcard:locality">Hampshire</entry>
      <entry about="this:IP1" property="gaz:fax">023 8064 6437</entry>
      <entry about="this:authoriser-1" property="gaz:dateAuthorisationSigned">2014-03-24</entry>
      <entry about="this:IP-company-1" property="gazorg:name">Baker Tilly</entry>
      <entry about="this:company-principal-trading-address-1" property="vcard:locality"
        >LONDON</entry>
      <entry about="this:IP2" property="person:hasIPnum">8891</entry>
      <entry about="this:company-registered-office-1" property="vcard:postal-code">SO53 3TZ</entry>
      <entry about="this:signatory-1" property="foaf:name"/>
      <entry about="this:company-principal-trading-address-1" property="vcard:street-address">36-38
        West STREET</entry>
      <entry about="this:IP1-address-1" property="vcard:postal-code">SO53 3TZ</entry>
      <entry about="this:company-principal-trading-address-1" property="vcard:country-name"/>
      <entry about="this:company-registered-office-1" property="vcard:extended-address">Chandlers
        Ford</entry>
      <entry about="this:IP1" property="gaz:telephone">023 8064 6437</entry>
      <entry about="this:company-1" property="gazorg:name">ANGEL PARTNERS LIMITED</entry>
      <entry about="this:meetingAddress-1" property="vcard:region"/>
      <entry about="this:IP1" property="gaz:email">lisa.duell@bakertilly.co.uk</entry>
      <entry about="this:company-1" property="gazorg:natureOfBusiness"/>
      <entry about="this:company-registered-office-1" property="vcard:country-name"/>
      <entry about="this:previous-trading-address-1" property="vcard:country-name"/>
      <entry about="this:company-previous-registered-office-1" property="vcard:locality"
        >LONDON</entry>
      <entry about="this:IP1" property="person:hasIPCapacity">Liquidator</entry>
      <entry about="this:company-principal-trading-address-1" property="vcard:extended-address"/>
      <entry about="this:IP1" property="foaf:name">Alexander Kinninmonth</entry>
      <entry about="noticeid:" property="gaz:earliestPublicationDate">2014-03-24</entry>
      <entry about="this:IP1" property="person:hasIPReferenceNumber">RR654</entry>
      <entry about="this:company-registered-office-1" property="vcard:locality">Hampshire</entry>
      <entry about="this:previous-trading-address-1" property="vcard:street-address">FLAT 10</entry>
      <entry about="this:company-principal-trading-address-1" property="vcard:region"/>
      <entry about="this:company-registered-office-1" property="vcard:street-address">Highfield
        Court, Tollgate</entry>
      <entry about="this:notifiableThing" property="corp-insolvency:meetingIsFor">Members</entry>
      <entry about="this:meetingAddress-1" property="vcard:postal-code">SO53 3TZ</entry>
      <entry about="issue:" property="gaz:hasEdition">london</entry>
      <entry about="this:meetingAddress-1" property="vcard:country-name"/>
      <entry about="this:notifiableThing" property="corp-insolvency:meetingTime">2014-05-21</entry>
      <entry about="this:previous-trading-address-1" property="vcard:locality">LONDON</entry>
      <entry about="this:IP1" property="person:additionalContactName">Lisa Duell</entry>
      <entry about="this:previous-trading-address-1" property="vcard:region"/>
      <entry about="this:company-1" property="gazorg:tradingAs">ANGEL PARTNERS</entry>
      <entry about="this:company-1" property="gazorg:previousCompanyName">PARTNERS LIMITED</entry>
      <entry about="this:IP1-address-1" property="vcard:country-name"/>
      <entry about="this:company-previous-registered-office-1" property="vcard:region"/>
      <entry about="this:meetingAddress-1" property="vcard:street-address">Highfield Court,
        Tollgate, Chandlers Ford</entry>
      <entry about="this:company-previous-registered-office-1" property="vcard:country-name"/>
      <entry about="this:meetingAddress-1" property="vcard:extended-address">Eastleigh</entry>
      <entry about="this:company-previous-registered-office-1" property="vcard:extended-address">5
        MANDELA WAY</entry>
      <entry about="this:notifiableThing" property="corp-insolvency:meetingTime2WITHtime"
        >10:30</entry>
      <entry about="this:company-previous-registered-office-1" property="vcard:street-address"
        >PROGRESS HOUSE</entry>
      <entry about="this:role-signatory-1" property="person:roleName"/>
      <entry about="this:previous-trading-address-1" property="vcard:extended-address">STEPHENSON
        HOUSE</entry>
      <entry about="this:IP1-address-1" property="vcard:region"/>
      <entry about="this:company-principal-trading-address-1" property="vcard:postal-code">WC2H
        9HB</entry>
      <entry about="this:previous-trading-address-1" property="vcard:postal-code">SE1 6PP</entry>
      <entry about="this:notifiableThing" property="corp-insolvency:meeting2IsFor">Creditors</entry>
      <entry about="this:IP1" property="person:hasIPnum">9019</entry>
      <entry about="this:IP2" property="person:hasIPCapacity">Liquidator</entry>
    </form>
  </xsl:param>
  <!-- local functions -->
  <xsl:variable name="publicationDate"
    select="concat($updates//*:entry[@property='gaz:earliestPublicationDate'],'T', 
   if ($updates//*:entry[@property='gaz:earliestPublicationDateWITHtime']) then wlf:getTimeStamp($updates//*:entry[@property='gaz:earliestPublicationDateWITHtime']) else '15:30:00')"/>


  <xsl:function name="wlf:increment">
    <xsl:param name="propertytoincrement"/>
    <xsl:variable name="numeric"
      select="number(substring-before(substring-after($propertytoincrement,'['),']')) + 1"/>
    <xsl:variable name="baseproperty" select="substring-before($propertytoincrement,'[')"/>
    <xsl:variable name="newproperty">
      <xsl:value-of select="$baseproperty"/>[<xsl:value-of select="$numeric"/>]</xsl:variable>
    <xsl:value-of select="$newproperty"/>
  </xsl:function>
  <xsl:function name="wlf:getTimeStamp">
    <xsl:param name="arg"/>
    <xsl:choose>
      <xsl:when test="$arg castable as xs:time">
        <xsl:value-of select="$arg"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:analyze-string select="$arg"
          regex="^([0-9]*):([0-9]*):([0-9]*)([.0-9]*)|([0-9]*):([0-9]*)">
          <xsl:matching-substring>
            <xsl:if test="matches($arg,'^([0-9]*):([0-9]*):([0-9]*)([.0-9]*)')">
              <xsl:value-of
                select="concat(wlf:get2Digits(regex-group(1)),':', wlf:get2Digits(regex-group(2)),':',wlf:get2Digits(regex-group(3)))"
              />
            </xsl:if>
            <xsl:if test="matches($arg,'^([0-9]*):([0-9]*)')">
              <xsl:value-of
                select="concat(wlf:get2Digits(regex-group(5)),':', wlf:get2Digits(regex-group(6)),':00')"
              />
            </xsl:if>
          </xsl:matching-substring>
          <xsl:non-matching-substring>
            <xsl:value-of select="$arg"/>
          </xsl:non-matching-substring>
        </xsl:analyze-string>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>
  <xsl:function name="wlf:get2Digits">
    <xsl:param name="arg"/>
    <xsl:value-of
      select="if ($arg castable as xs:integer) then format-number(number($arg),'00') else $arg"/>
  </xsl:function>
  <xsl:template name="editionName">
    <xsl:variable name="edition_local">
      <xsl:choose>
        <xsl:when test="$edition = 'Default'">
          <xsl:value-of select="$updates//*[@property='gaz:hasEdition']/text()"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$edition"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="lower-case($edition_local) = 'london'">
        <xsl:text>London</xsl:text>
      </xsl:when>
      <xsl:when test="lower-case($edition_local) = 'belfast'">
        <xsl:text>Belfast</xsl:text>
      </xsl:when>
      <xsl:when test="lower-case($edition_local) = 'edinburgh'">
        <xsl:text>Edinburgh</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="x:html">
    <xsl:element name="html" namespace="http://www.w3.org/1999/xhtml">
      <xsl:attribute name="IdURI"
        select="replace(@IdURI,'notice/undefined',concat('notice/',$noticeId))"/>
      <xsl:variable name="temp-edition" select="$updates//*:entry[@property='gaz:hasEdition']"/>
      <xsl:variable name="temp-prefix" select="@prefix"/>
      <xsl:attribute name="prefix">
        <xsl:value-of
          select="replace(replace($temp-prefix,'edition/undefined',concat('edition/', $temp-edition )),'notice/undefined',concat('notice/',$noticeId))"
        />
      </xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
  <xsl:template match="x:head">
    <head>
      <title>
        <xsl:value-of select="$updates//@draftTitle"/>
      </title>
      <xsl:call-template name="gazettes-metadata"/>
    </head>
  </xsl:template>
  <xsl:template match="x:body">
    <body>
      <xsl:apply-templates/>
      <!-- div class="DEBUG">
        <hr/><hr/><hr/>
        <xsl:copy-of select="$updates"/>
        <hr/><hr/><hr/>
      </div -->
      <xsl:if test="$updates//*[@property='gzw:noticeImageFile']">
        <img class="logoimage" alt="Organisation Logo">
          <xsl:attribute name="src">
            <xsl:value-of select="$updates//*[@property='gzw:noticeImageFile']"/>
          </xsl:attribute>
        </img>
      </xsl:if>
    </body>
  </xsl:template>
  <xsl:template name="gazettes-metadata">
    <gazette-metadata xmlns="http://www.gazettes.co.uk/metadata">
      <bundle-id>
        <xsl:value-of select="$bundleId"/>
      </bundle-id>
      <notice-id>
        <xsl:value-of select="$noticeId"/>
      </notice-id>
      <edition>
        <xsl:call-template name="editionName"/>
      </edition>
      <status>
        <xsl:value-of select="$status"/>
      </status>
      <submitted-date>
        <xsl:value-of select="$submitted-date"/>
      </submitted-date>
      <version-count>
        <xsl:value-of select="$version-count"/>
      </version-count>
      <user-submitted>
        <xsl:value-of select="$user-submitted"/>
      </user-submitted>
      <organisation-id>0</organisation-id>
      <draft-uri>
        <xsl:value-of select="$updates//@draftURI"/>
      </draft-uri>
      <xsl:if test="$updates//@uploadUri">
        <has-supporting-doc>true</has-supporting-doc>
      </xsl:if>
      <xsl:variable name="noticeType">
        <xsl:value-of select="$updates//@noticeTypeCode"/>
      </xsl:variable>
      <notice-code>
        <xsl:value-of select="$noticeType"/>
      </notice-code>
      <xsl:variable name="category">
        <xsl:sequence select="$mapping//*:Map[@Code = $noticeType]/*"/>
      </xsl:variable>
      <xsl:sequence select="$category"/>
      <notice-capture-method>webform</notice-capture-method>
      <publication-date>
        <xsl:value-of select="$publicationDate"/>
      </publication-date>
      <publication-year>
        <xsl:value-of select="substring($publicationDate,1,4)"/>
      </publication-year>
      <notice-logo>
        <xsl:value-of select="$updates//*[@property='gzw:noticeImageFile']"/>
      </notice-logo>
      <xsl:if test="$updates//*[@property='gzw:requestPaperPurchase']">
        <notice-printed-copy>true</notice-printed-copy>
      </xsl:if>
      <xsl:if test="$updates//*[@property='gzw:poBoxService']">
        <po-box-service>true</po-box-service>
      </xsl:if>
      <xsl:if test="$updates//*[@property='gzw:requestPDFpurchase']">
        <pdf-copy>true</pdf-copy>
      </xsl:if>
    </gazette-metadata>
  </xsl:template>


  <xsl:template match="x:p[x:span[@property='person:alsoKnownAs']]">
    <xsl:element name="{name(.)}">
      <xsl:copy-of select="@*"/>
      <xsl:value-of select="text()[1]"/>
      <xsl:apply-templates select="x:span"/>
    </xsl:element>
  </xsl:template>
  <xsl:template match="x:span[@property='person:alsoKnownAs']">
    <xsl:variable name="this" as="node()" select="."/>
    <xsl:element name="{name(.)}">
      <xsl:copy-of select="@*"/>
      <xsl:value-of
        select="string-join($updates//*:entry[@about=$this/@about and @property=$this/@property],', ')"
      />
    </xsl:element>
  </xsl:template>
  <!-- 2903 -->
  <xsl:template match="x:dd[@about='this:deceasedPerson' and @property='person:alsoKnownAs']">
    <xsl:element name="{name(.)}">
      <xsl:copy-of select="@*"/>
      <xsl:value-of
        select="string-join($updates//*:entry[@about='this:deceasedPerson' and @property='person:alsoKnownAs'],', ')"
      />
    </xsl:element>
  </xsl:template>
  <!-- 2903 -->
  <xsl:template
    match="x:dd[@about='this:deceasedPerson' and @property='personal-legal:dateOfDeath']"/>
  <!-- 2903 -->
  <xsl:template
    match="x:dt[following-sibling::x:dd[1][@about='this:deceasedPerson' and @property='personal-legal:dateOfDeath']]">
    <xsl:copy-of copy-namespaces="no" select="."/>
    <xsl:variable name="dd" select="following-sibling::x:dd[1]" as="node()"/>
    <xsl:element name="{name($dd)}">
      <xsl:copy-of copy-namespaces="no" select="$dd/@*"/>
      <xsl:value-of select="$updates//*/.[@about=$dd/@about and @property = $dd/@property]/text()"/>
    </xsl:element>
  </xsl:template>
  <!-- 2903 -->
  <xsl:template
    match="x:dd[x:span[@about='this:deceasedPerson' and @property='personal-legal:startDateOfDeath']]">
    <xsl:if
      test="$updates//*:entry[@about='this:deceasedPerson' and @property='personal-legal:startDateOfDeath']/normalize-space(.)">
      <xsl:next-match/>
    </xsl:if>
  </xsl:template>
  <!-- 2903 -->
  <xsl:template
    match="x:dt[following-sibling::x:dd[1]/x:span[@about='this:deceasedPerson' and @property='personal-legal:startDateOfDeath']]">
    <xsl:if
      test="$updates//*:entry[@about='this:deceasedPerson' and @property='personal-legal:startDateOfDeath']/normalize-space(.)">
      <xsl:copy-of copy-namespaces="no" select="."/>
    </xsl:if>
  </xsl:template>
  <xsl:template
    match="x:span[@about='noticeid:' and @property='gaz:earliestPublicationDate' and @datatype='xsd:dateTime']">
    <xsl:element name="{name()}">
      <xsl:copy-of select="@*"/>
      <xsl:value-of select="$publicationDate"/>
    </xsl:element>
  </xsl:template>
  <xsl:template match="x:div[@data-container = 'boilerplate']">
    <div>
      <!--   <xsl:apply-templates mode="boilerplate"/>   -->
      <xsl:call-template name="boilerPlateText">
        <xsl:with-param name="updates" select="$updates"/>
      </xsl:call-template>
    </div>
  </xsl:template>
  <xsl:template
    match="x:div[@class = 'content' and not(@content)]//x:div[not(@data-container = 'address') and not(@data-container='boilerplate')]">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </xsl:copy>
    <xsl:if test="@data-container = 'copyable'">
      <div about="{@about}" property="gzw:isDuplicable" content="true" data-container="copyable">
        <xsl:apply-templates select="*" mode="duplicate"/>
      </div>
    </xsl:if>
  </xsl:template>
  <xsl:template match="x:div[@data-container = 'address']">
    <xsl:variable name="addressDivAbout">
      <xsl:value-of select="@about"/>
    </xsl:variable>
    <xsl:variable name="addressDivProperty">
      <xsl:value-of select="@property"/>
    </xsl:variable>
    <xsl:variable name="dataGazettesValue">
      <xsl:value-of select="@data-gazettes"/>
    </xsl:variable>
    <xsl:variable name="lengthResource" select="string-length(substring-before(@resource,'-1'))"/>
    <xsl:variable name="resourceWithoutPostfix" select="substring(@resource,1,$lengthResource)"/>
    <xsl:variable name="context" select="."/>
    <xsl:variable name="dot" select="."/>
    <!-- Added text() condition here. We dont want to choose empty entry -->
    <xsl:variable name="indistinct"
      select="$updates//*[contains(@about,$resourceWithoutPostfix)][text()]/@about"/>

    <xsl:for-each select="distinct-values($indistinct)">
      <xsl:sort select="."/>
      <xsl:variable name="currentAddressAbout" select="."/>
      <div about="{$addressDivAbout}" property="{$addressDivProperty}"
        resource="{$currentAddressAbout}">
        <xsl:choose>
          <xsl:when test="$context/x:dl">

            <dl>
              <xsl:apply-templates select="$context/x:dl/x:dd">
                <xsl:with-param name="currentAddressAbout" select="." tunnel="yes"/>
              </xsl:apply-templates>

            </dl>

          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates select="$context/*">
              <xsl:with-param name="currentAddressAbout" select="." tunnel="yes"/>
            </xsl:apply-templates>
          </xsl:otherwise>
        </xsl:choose>
      </div>
    </xsl:for-each>
  </xsl:template>
  <!-- 2903 -->
  <xsl:template match="x:dl[@data-gazettes = 'Legislation']">
    <xsl:choose>
      <xsl:when
        test="$updates//*:entry[@property = 'legislation:legislationTitle'] != '' 
                or $updates//*:entry[@property = 'legislation:legislationSection'] != ''">
        <dl>
          <xsl:copy-of select="@*"/>
          <xsl:apply-templates/>
        </dl>
      </xsl:when>
      <xsl:otherwise>
        <dl>
          <xsl:if test="$updates//*:entry[@property = 'legislation:legislationTitle'] != ''">
            <xsl:apply-templates
              select="x:dt[following-sibling::*[1][self::x:dd [@property = 'legislation:legislationTitle']]]"/>
            <xsl:apply-templates select="x:dd [@property = 'legislation:legislationTitle']"/>
          </xsl:if>
          <xsl:if test="$updates//*:entry[@property = 'legislation:legislationSection'] != ''">
            <xsl:apply-templates
              select="x:dt[following-sibling::*[1][self::x:dd [@property = 'legislation:legislationSection']]]"/>
            <xsl:apply-templates select="x:dd [@property = 'legislation:legislationSection']"/>
          </xsl:if>
        </dl>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- 2903 -->
  <xsl:template match="x:dl[../@data-gazettes = 'Deceased details']">
    <dl>
      <xsl:apply-templates
        select="x:dt[following-sibling::*[1][self::x:dd [@property = 'foaf:familyName']]]"/>
      <xsl:apply-templates select="x:dd [@property = 'foaf:familyName']"/>
      <xsl:apply-templates
        select="x:dt[following-sibling::*[1][self::x:dd [@property = 'foaf:firstName']]]"/>
      <xsl:apply-templates select="x:dd [@property = 'foaf:firstName']"/>
      <xsl:if test="$updates//*:entry[@property = 'foaf:givenName'] != ''">
        <xsl:apply-templates
          select="x:dt[following-sibling::*[1][self::x:dd [@property = 'foaf:givenName']]]"/>
        <xsl:apply-templates select="x:dd [@property = 'foaf:givenName']"/>
      </xsl:if>
      <xsl:if test="$updates//*:entry[@property = 'person:hasMaidenName'] != ''">
        <xsl:apply-templates
          select="x:dt[following-sibling::*[1][self::x:dd [@property = 'person:hasMaidenName']]]"/>
        <xsl:apply-templates select="x:dd [@property = 'person:hasMaidenName']"/>
      </xsl:if>
      <xsl:if test="$updates//*:entry[@property = 'person:alsoKnownAs'] != ''">
        <xsl:apply-templates
          select="x:dt[following-sibling::*[1][self::x:dd [@property = 'person:alsoKnownAs']]]"/>
        <xsl:apply-templates select="x:dd [@property = 'person:alsoKnownAs']"/>
      </xsl:if>
      <xsl:if test="$updates//*:entry[@property = 'personal-legal:dateOfDeath'] != ''">
        <xsl:apply-templates
          select="x:dt[following-sibling::*[1][self::x:dd [@property = 'personal-legal:dateOfDeath']]]"/>
        <xsl:apply-templates select="x:dd [@property = 'personal-legal:dateOfDeath']"/>
      </xsl:if>
      <xsl:if test="$updates//*:entry[@property = 'person:jobTitle'] != ''">
        <xsl:apply-templates
          select="x:dt[following-sibling::*[1][self::x:dd [@property = 'person:jobTitle']]]"/>
        <xsl:apply-templates select="x:dd [@property = 'person:jobTitle']"/>
      </xsl:if>
    </dl>
  </xsl:template>
  <!-- 2903 -->
  <xsl:template match="x:dl[@data-gazettes = 'Executors Name']">
    <dl>
      <xsl:apply-templates
        select="x:dt[following-sibling::*[1][self::x:dd [@property = 'foaf:familyName']]]"/>
      <xsl:apply-templates select="x:dd [@property = 'foaf:familyName']"/>
      <xsl:apply-templates
        select="x:dt[following-sibling::*[1][self::x:dd [@property = 'foaf:firstName']]]"/>
      <xsl:apply-templates select="x:dd [@property = 'foaf:firstName']"/>
      <xsl:if test="$updates//*:entry[@property = 'foaf:givenName'] != ''">
        <xsl:apply-templates
          select="x:dt[following-sibling::*[1][self::x:dd [@property = 'foaf:givenName']]]"/>
        <xsl:apply-templates select="x:dd [@property = 'foaf:givenName']"/>
      </xsl:if>
    </dl>
  </xsl:template>
  <!-- 2903 -->
  <xsl:template match="x:dl[@data-gazettes = 'Executors Contact']">
    <xsl:choose>
      <xsl:when
        test="$updates//*:entry[@property = 'gaz:telephone' and @about = 'this:estateExecutor'] != ''
        or $updates//*:entry[@property = 'gaz:fax' and @about = 'this:estateExecutor'] != ''
        or $updates//*:entry[@property = 'gaz:email' and @about = 'this:estateExecutor'] != ''">
        <dl>
          <xsl:if
            test="$updates//*:entry[@property = 'gaz:telephone' and @about = 'this:estateExecutor'] != ''">
            <xsl:apply-templates
              select="x:dt[following-sibling::*[1][self::x:dd [@property = 'gaz:telephone']]]"/>
            <xsl:apply-templates select="x:dd [@property = 'gaz:telephone']"/>
          </xsl:if>
          <xsl:if
            test="$updates//*:entry[@property = 'gaz:fax' and @about = 'this:estateExecutor'] != ''">
            <xsl:apply-templates
              select="x:dt[following-sibling::*[1][self::x:dd [@property = 'gaz:fax']]]"/>
            <xsl:apply-templates select="x:dd [@property = 'gaz:fax']"/>
          </xsl:if>
          <xsl:if
            test="$updates//*:entry[@property = 'gaz:email' and @about = 'this:estateExecutor'] != ''">
            <xsl:apply-templates
              select="x:dt[following-sibling::*[1][self::x:dd [@property = 'gaz:email']]]"/>
            <xsl:apply-templates select="x:dd [@property = 'gaz:email']"/>
          </xsl:if>
        </dl>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  <!-- 2903 -->
  <xsl:template match="x:dl[@data-gazettes = 'Claims Date']">
    <xsl:choose>
      <xsl:when test="$updates//*:entry[@property = 'personal-legal:hasClaimDeadline'] != ''">
        <dl>
          <xsl:if test="$updates//*:entry[@property = 'personal-legal:hasClaimDeadline'] != ''">
            <xsl:apply-templates
              select="x:dt[following-sibling::*[1][self::x:dd [@property = 'personal-legal:hasClaimDeadline']]]"/>
            <xsl:apply-templates select="x:dd [@property = 'personal-legal:hasClaimDeadline']"/>
          </xsl:if>
        </dl>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="x:div[@class = 'fileupload']"/>
  <xsl:template match="x:p">
    <xsl:param name="currentAddressAbout" select="''" tunnel="yes"/>
    <xsl:variable name="currentAbout">
      <xsl:choose>
        <xsl:when test="../@data-container='address'">
          <xsl:value-of select="$currentAddressAbout"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="x:span[1]/@about"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="currentProperty" select="x:span[1]/@property"/>
    <xsl:variable name="currentResource" select="x:span[1]/@resource"/>
    <xsl:variable name="currentTypeOf" select="x:span[1]/@typeof"/>
    <xsl:variable name="copyablepropertyname" select="concat($currentProperty,'--copy')"/>
    <xsl:choose>
      <xsl:when test="$form = 'true'">
        <xsl:apply-templates select="x:span|x:strong|x:em"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:element name="p">
          <xsl:value-of select="text()"/>
          <xsl:element name="span">
            <xsl:attribute name="about" select="$currentAbout"/>
            <xsl:attribute name="property" select="$currentProperty"/>
            <xsl:attribute name="datatype" select="x:span[1]/@datatype"/>
            <xsl:attribute name="resource" select="$currentResource"/>
            <xsl:attribute name="typeof" select="$currentTypeOf"/>
            <xsl:choose>
              <xsl:when
                test="($updates//*/@property = $copyablepropertyname) and ($updates//*[@property = $copyablepropertyname]/@about = $currentAbout)">
                <xsl:attribute name="data-container">fixed</xsl:attribute>
              </xsl:when>
              <xsl:otherwise/>
            </xsl:choose>
            <xsl:choose>
              <xsl:when
                test="($updates//*/@property = $currentProperty) and ($updates//*[@property = $currentProperty]/@about = $currentAbout)">
                <xsl:choose>
                  <xsl:when
                    test="x:span[1]/@datatype = 'xsd:dateTime' and ($updates//*/.[@about=$currentAbout and @property = $currentProperty]/text() != '')">
                    <xsl:value-of
                      select="$updates//*/.[@about=$currentAbout and @property = $currentProperty][1]/text()"
                      />T<xsl:value-of
                      select="$updates//*/.[@about=$currentAbout and @property = concat($currentProperty,'WITHtime')][1]/text()"
                    />:00</xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of
                      select="$updates//*/.[@about=$currentAbout and @property = $currentProperty][1]/text()"
                    />
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="normalize-space(x:span[1])"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="x:dd[@data-gazettes='noticeid']">
    <dd about="noticeid:" property="gaz:hasNoticeID">
      <xsl:value-of select="$noticeId"/>
    </dd>
  </xsl:template>
  <xsl:template match="@*">
    <xsl:copy-of select="."/>
  </xsl:template>

  <xsl:template match="node()">
    <xsl:param name="currentAddressAbout" select="''" tunnel="yes"/>
    <xsl:variable name="currentAbout">
      <xsl:choose>
        <xsl:when test="../../@data-container ='address'">
          <xsl:value-of select="$currentAddressAbout"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="@about"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="currentProperty" select="@property"/>
    <xsl:choose>
      <xsl:when
        test="($form = 'true') and (ancestor::*/@class='content') and ((name() = 'span') or (name() = 'p') or (name() = 'strong') or (name()='em') ) and @property">
        <xsl:if test="not(@data-hide = 'true')">
          <!-- temp: get list of corresponding nodes in $updates -->
          <xsl:variable name="updatenodes"
            select="$updates//*[@about = $currentAbout and @property = $currentProperty]"/>
          <xsl:variable name="preambletext" select="../text()"/>
          <xsl:variable name="datatype" select="@datatype"/>
          <xsl:choose>
            <xsl:when test="$updates//*[@about = $currentAbout and @property = $currentProperty]">
              <!-- make the update -->
              <xsl:for-each select="$updatenodes">
                <xsl:variable name="atomicupdate" select="."/>
                <xsl:variable name="id">
                  <xsl:value-of select="replace(@about,':','-')"/>_<xsl:value-of
                    select="replace(@property,':','-')"/>-<xsl:value-of select="position()"/>
                </xsl:variable>
                <xsl:element name="li">
                  <label for="{$id}">
                    <xsl:value-of select="$preambletext"/>
                  </label>
                  <xsl:element name="input">
                    <xsl:attribute name="id" select="$id"/>
                    <xsl:attribute name="name">
                      <xsl:variable name="namestructure"><xsl:value-of select="@about"
                          />[<xsl:value-of select="@property"/>]</xsl:variable>
                      <xsl:value-of select="$namestructure"/>
                    </xsl:attribute>
                    <xsl:choose>
                      <xsl:when test="$datatype = 'xsd:date'">
                        <xsl:attribute name="type">date</xsl:attribute>
                        <xsl:attribute name="class">date-picker
                          date-picker-free-date</xsl:attribute>
                      </xsl:when>
                      <xsl:when test="$datatype = 'xsd:time'">
                        <xsl:attribute name="type">time</xsl:attribute>
                      </xsl:when>
                      <xsl:when test="$datatype = 'xsd:dateTime'">
                        <xsl:attribute name="type">datetime</xsl:attribute>
                      </xsl:when>
                      <xsl:when test="$datatype = 'checkbox'">
                        <xsl:attribute name="type">checkbox</xsl:attribute>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:attribute name="type">text</xsl:attribute>
                      </xsl:otherwise>
                    </xsl:choose>
                    <xsl:attribute name="value">
                      <xsl:value-of select="normalize-space(.)"/>
                    </xsl:attribute>
                  </xsl:element>
                </xsl:element>
              </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
              <!-- just pass through the template -->
              <xsl:element name="li">
                <xsl:variable name="id">
                  <xsl:value-of select="replace(@about,':','-')"/>_<xsl:value-of
                    select="replace(@property,':','-')"/>
                </xsl:variable>
                <label for="{$id}">
                  <xsl:value-of select="../text()"/>
                </label>
                <xsl:element name="input">
                  <xsl:attribute name="id" select="$id"/>
                  <xsl:attribute name="name">
                    <xsl:variable name="namestructure"><xsl:value-of select="@about"/>[<xsl:value-of
                        select="@property"/>]</xsl:variable>
                    <xsl:value-of select="$namestructure"/>
                  </xsl:attribute>
                  <xsl:choose>
                    <xsl:when test="@datatype = 'xsd:date'">
                      <xsl:attribute name="type">date</xsl:attribute>
                      <xsl:attribute name="class">date-picker date-picker-free-date</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="@datatype = 'xsd:time'">
                      <xsl:attribute name="type">time</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="@datatype = 'xsd:dateTime'">
                      <xsl:attribute name="type">datetime</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="@datatype = 'checkbox'">
                      <xsl:attribute name="type">checkbox</xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:attribute name="type">text</xsl:attribute>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:element>
              </xsl:element>
            </xsl:otherwise>
          </xsl:choose>
          <!-- output any required buttons -->
          <xsl:if test="@data-button = 'true'">
            <li>
              <span class="{@data-class-outer}" id="{@data-class-outer}">
                <input class="{@data-class-inner}" formnovalidate="formnovalidate"
                  name="{@data-name}" type="submit" value="{@data-title}"/>
              </span>
            </li>
          </xsl:if>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when
            test="($updates//*/@property = $currentProperty) and ($updates//*[@property = $currentProperty]/@about = $currentAbout)">
            <xsl:variable name="contents"
              select="$updates//*/.[@property = $currentProperty and @about = $currentAbout]/text()"/>
            <xsl:if test="$contents!=''">
              <xsl:choose>
                <xsl:when test="../../@data-container ='address' and name(.)='dd'">
                  <xsl:apply-templates select="preceding-sibling::*[1][self::x:dt]"/>
                  <dd>
                    <xsl:for-each select="@*">
                      <xsl:variable name="attributeName">
                        <xsl:value-of select="name(.)"/>
                      </xsl:variable>
                      <xsl:choose>
                        <xsl:when test="$attributeName = 'about'">
                          <xsl:attribute name="{$attributeName}" select="$currentAbout"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:attribute name="{$attributeName}" select="."/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:for-each>
                    <xsl:value-of select="$contents"/>
                  </dd>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:if test="$debug='true'">|||</xsl:if>
                    <xsl:choose>
                      <xsl:when
                        test="@datatype = 'xsd:dateTime' and ($updates//*/.[@about=$currentAbout and @property = $currentProperty][1]/text() != '')">
                        <xsl:value-of
                          select="$updates//*/.[@about=$currentAbout and @property = $currentProperty][1]/text()"
                          />T<xsl:value-of
                          select="$updates//*/.[@about=$currentAbout and @property = concat($currentProperty,'WITHtime')][1]/text()"
                        />:00</xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="$contents"/>
                      </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="$debug='true'">|||</xsl:if>
                  </xsl:copy>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:if>
          </xsl:when>

          <xsl:otherwise>
            <xsl:copy>
              <xsl:apply-templates select="@* | node()"/>
            </xsl:copy>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="x:div" mode="duplicate">
    <xsl:copy>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="x:p" mode="duplicate">
    <p>
      <xsl:apply-templates mode="duplicate"/>
    </p>
  </xsl:template>
  <xsl:template match="x:span" mode="duplicate">
    <span about="{@about}" property="{@property}" datatype="{@datatype}" resource="{@resource}"
      typeof="{@typeof}">
      <xsl:apply-templates mode="duplicate"/>
    </span>
  </xsl:template>
  <xsl:template match="text()" mode="duplicate">
    <xsl:value-of select="."/>
  </xsl:template>
  <xsl:template
    match="area[not(node())]|bgsound[not(node())]|br[not(node())]|hr[not(node())]|img[not(node())]|input[not(node())]|param[not(node())]">
    <xsl:element name="{name()}">
      <xsl:apply-templates select="@*"/>
    </xsl:element>
  </xsl:template>

  <!--	<xsl:template match="x:span[@about='issue:' and @property='gaz:hasEdition' and @resource='edition:']">
	 <span about="issue:" property="gaz:hasEdition" resource="edition:">
		<xsl:call-template name="editionName"/>
	 </span>	
	 
	 <span about="edition:" property="gaz:editionName" datatype="xsd:string">
		<xsl:call-template name="editionName"/>
	 </span>
	</xsl:template>-->

  <xsl:template
    match="x:span[@about='issue:' and @property='gaz:hasEdition' and @resource='edition:']">
    <span about="issue:" property="gaz:hasEdition" resource="edition:">
      <!--<xsl:call-template name="editionName"/>-->
    </span>
  </xsl:template>

  <xsl:template match="x:span[@about='edition:' and @property='gaz:editionName']">
    <span about="edition:" property="gaz:editionName" datatype="xsd:string">
      <xsl:call-template name="editionName"/>
    </span>
  </xsl:template>

  <xsl:template match="x:span[@resource='edition:' and @typeof='gaz:Edition']">
    <span resource="edition:" typeof="gaz:Edition">
      <!--<xsl:call-template name="editionName"/>-->
    </span>
  </xsl:template>

  <xsl:template name="boilerPlateText">
    <xsl:param name="updates"/>
    <xsl:variable name="noticeCode">
      <xsl:value-of
        select="/x:html/x:body/x:article/x:div[@class='rdfa-data']/x:span[@property = 'gaz:hasNoticeCode']/@content"
      />
    </xsl:variable>
    <xsl:variable name="edition">
      <xsl:value-of select="$updates//*[@property='gaz:hasEdition']/text()"/>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$noticeCode = '2450' and ($edition='london' or $edition='belfast')">
        <xsl:call-template name="boilerPlateText2450">
          <xsl:with-param name="updates" select="$updates"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$noticeCode = '2450' and ($edition='edinburgh')">
        <xsl:call-template name="boilerPlateText2450Edinburgh">
          <xsl:with-param name="updates" select="$updates"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$noticeCode = '2451' and ($edition='london' or $edition='belfast')">
        <xsl:call-template name="boilerPlateText2451">
          <xsl:with-param name="updates" select="$updates"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$noticeCode = '2451' and ($edition='edinburgh')">
        <xsl:call-template name="boilerPlateText2451Edinburgh">
          <xsl:with-param name="updates" select="$updates"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$noticeCode = '2441'">
        <xsl:call-template name="boilerPlateText2441">
          <xsl:with-param name="updates" select="$updates"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$noticeCode = '2442'">
        <xsl:call-template name="boilerPlateText2442">
          <xsl:with-param name="updates" select="$updates"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$noticeCode = '2443'">
        <xsl:call-template name="boilerPlateText2443">
          <xsl:with-param name="updates" select="$updates"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$noticeCode = '2445'">
        <xsl:call-template name="boilerPlateText2445">
          <xsl:with-param name="updates" select="$updates"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$noticeCode = '2446'">
        <xsl:call-template name="boilerPlateText2446">
          <xsl:with-param name="updates" select="$updates"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$noticeCode = '2509'">
        <xsl:call-template name="boilerPlateText2509">
          <xsl:with-param name="updates" select="$updates"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$noticeCode = '2518'">
        <xsl:call-template name="boilerPlateText2518">
          <xsl:with-param name="updates" select="$updates"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$noticeCode = '1510'">
        <xsl:call-template name="boilerPlateText1510">
          <xsl:with-param name="updates" select="$updates"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$noticeCode = '1601'">
        <xsl:call-template name="boilerPlateText1601">
          <xsl:with-param name="updates" select="$updates"/>
        </xsl:call-template>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="boilerPlateText2450">
    <xsl:param name="updates"/>
    <p>
      <xsl:text>In the </xsl:text>
      <span about="this:court-1" property="court:courtName" datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:court-1' and @property='court:courtName']/text()"/>
      </span>
    </p>
    <p>
      <span about="this:court-1" property="court:courtDistrict" datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:court-1' and @property='court:courtDistrict']/text()"/>
      </span>
      <xsl:text> </xsl:text>
      <span about="this:court-case-1" property="court:caseNumber" datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:court-case-1' and @property='court:caseNumber']/text()"/>
      </span>
      <xsl:text> of </xsl:text>
      <span about="this:court-case-1" property="court:caseYear" datatype="xsd:gYear">
        <xsl:value-of
          select="$updates//*[@about='this:court-case-1' and @property='court:caseYear']/text()"/>
      </span>
    </p>
    <p>
      <xsl:text>In the matter of</xsl:text>
    </p>
    <h3 about="this:company-1" property="gazorg:name" datatype="xsd:string">
      <xsl:value-of
        select="upper-case($updates//*[@about='this:company-1' and @property='gazorg:name']/text())"
      />
    </h3>
    <p>
      <xsl:text>(Company Number </xsl:text>
      <span about="this:company-1" property="gazorg:companyNumber" datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:company-1' and @property='gazorg:companyNumber']/text()"
        />
      </span>
      <xsl:text>)</xsl:text>
    </p>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:previousCompanyName']/text() != ''">
      <p>
        <xsl:text>(previously </xsl:text>
        <span about="this:company-1" property="gazorg:previousCompanyName" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:previousCompanyName']/text()"
          />
        </span>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:tradingAs']/text() != ''">
      <p>
        <xsl:text>(t/a </xsl:text>
        <span about="this:company-1" property="gazorg:tradingAs" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:tradingAs']/text()"/>
        </span>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:previouslyTradingAs']/text() != ''">
      <p>
        <xsl:text>(previously t/a </xsl:text>
        <span about="this:company-1" property="gazorg:previouslyTradingAs" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:previouslyTradingAs']/text()"
          />
        </span>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:country']/text() != ''">
      <p>
        <xsl:text>(Previous Registered Office: </xsl:text>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:company-previous-registered-office-1'"/>
        </xsl:call-template>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:country']/text() != ''">
      <p>
        <xsl:text>(Principal Trading Address: </xsl:text>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:company-principal-trading-address-1'"/>
        </xsl:call-template>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:street-address']/text() != ''">
      <p>
        <xsl:text>(Previous Trading Address: </xsl:text>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:previous-trading-address-1'"/>
        </xsl:call-template>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:natureOfBusiness']/text() != ''">
      <p>
        <xsl:text>Nature of Business: </xsl:text>
        <span about="this:company-1" property="gazorg:natureOfBusiness" datatype="xsd:string"
          data-recommended="true">
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:natureOfBusiness']/text()"
          />
        </span>
      </p>
    </xsl:if>
    <p>
      <xsl:text>and in the Matter of the </xsl:text>
      <span about="this:legislation-1" property="legislation:legislationTitle" datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:legislation-1' and @property='legislation:legislationTitle']/text()"
        />
      </span>
    </p>
    <p>
      <xsl:text>A Petition to wind up the above-named Company of </xsl:text>
      <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:company-registered-office-1'"/>
      </xsl:call-template>
      <xsl:text> presented on </xsl:text>
      <xsl:variable name="dateOfPetitionPresentation">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateOfPetitionPresentation']/text()"
        />
      </xsl:variable>
      <span about="this:notifiableThing" property="corp-insolvency:dateOfPetitionPresentation"
        datatype="xsd:date" content="{$dateOfPetitionPresentation}">
        <xsl:value-of
          select="format-date(xs:date($dateOfPetitionPresentation), '[FNn] [D01] [MNn] [Y0001]')"/>
      </span>
      <xsl:text> by </xsl:text>
      <span about="this:petitioner-1" property="foaf:name" datatype="xsd:string">
        <xsl:value-of
          select="upper-case($updates//*[@about='this:petitioner-1' and @property='foaf:name']/text())"
        />
      </span>
      <xsl:text>, of </xsl:text>
      <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:petitioner-address-1'"/>
      </xsl:call-template>
      <xsl:text> claiming to be a </xsl:text>
      <span about="this:notifiableThing" property="corp-insolvency:presentedBy"
        datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:presentedBy']/text()"
        />
      </span>
      <xsl:text> of the Company, will be heard at </xsl:text>
      <span about="this:notifiableThing" property="corp-insolvency:nameOfPlaceOfHearing"
        datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:nameOfPlaceOfHearing']/text()"
        />
      </span>
      <xsl:text>, </xsl:text>
      <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:hearingAddress'"/>
      </xsl:call-template>
      <xsl:text> on </xsl:text>
      <xsl:variable name="dateOfHearing">
        <xsl:value-of
          select="format-date(xs:date($updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateOfHearing'][1]/text()),'[FNn] [D01] [MNn] [Y0001]')"
        />
      </xsl:variable>
      <xsl:variable name="timeOfHearing">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateOfHearingWITHtime'][1]/text()"
        />
      </xsl:variable>
      <xsl:variable name="dateOfHearingValue">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateOfHearing'][1]/text()"
        />
      </xsl:variable>
      <xsl:variable name="hearing">
        <xsl:value-of select="concat($dateOfHearingValue,'T',$timeOfHearing,':00')"/>
      </xsl:variable>
      <span about="this:notifiableThing" datatype="xsd:dateTime"
        property="corp-insolvency:dateOfHearing" content="{$hearing}">
        <xsl:value-of select="concat($dateOfHearing,', at ',$timeOfHearing)"/>
      </span>
      <xsl:text> (or as soon thereafter as the Petition can be heard).</xsl:text>
    </p>
    <xsl:variable name="dateInsolvencyRule">
      <xsl:value-of
        select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateInsolvencyRule']/text()"
      />
    </xsl:variable>
    <p>
      <xsl:text>Any person intending to appear on the hearing of the Petition (whether to support or oppose it) must give notice of intention to do so to the Petitioner or its Solicitor in accordance with Rule 4.16 by 16.00 hours on </xsl:text>
      <span about="this:notifiableThing" property="corp-insolvency:dateInsolvencyRule"
        datatype="xsd:date" content="{$dateInsolvencyRule}">
        <xsl:value-of
          select="format-date(xs:date($dateInsolvencyRule), '[FNn] [D01] [MNn] [Y0001]')"/>
        <xsl:text>.</xsl:text>
      </span>
    </p>
    <xsl:if
      test="$updates//*[@about='this:IP1' and @property='foaf:name']/text() != ''
	or $updates//*[@about='this:IP-company-1' and @property='gazorg:name']/text() != ''
	or $updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != ''
	or $updates//*[@about='this:IP1' and @property='gaz:fax']/text() != ''
	or $updates//*[@about='this:IP1' and @property='gaz:email']/text() != ''
	or $updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text() != ''
	or $updates//*[@about='this:IP1-address-1' and @property='vcard:street-address']/text() != ''
	or $updates//*[@about='this:IP1-address-1' and @property='vcard:extended-address']/text() != ''
	or $updates//*[@about='this:IP1-address-1' and @property='vcard:locality']/text() != ''
	or $updates//*[@about='this:IP1-address-1' and @property='vcard:region']/text() != ''
	or $updates//*[@about='this:IP1-address-1' and @property='vcard:postal-code']/text() != ''
	or $updates//*[@about='this:IP1-address-1' and @property='vcard:country']/text() != ''">
      <p>
        <xsl:choose>
          <xsl:when
            test="$updates//*[@about='gzw:repDetails' and @property='gzw:repType']/text() = 'solicitor'">
            <xsl:text>The Petitioner's Solicitor is </xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>The Petitioner is </xsl:text>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="$updates//*[@about='this:IP1' and @property='foaf:name']/text() != ''">
          <span about="this:IP1" property="foaf:name" datatype="xsd:string">
            <xsl:value-of select="$updates//*[@about='this:IP1' and @property='foaf:name']/text()"/>
          </span>
          <xsl:text> of </xsl:text>
        </xsl:if>
        <xsl:if
          test="$updates//*[@about='this:IP-company-1' and @property='gazorg:name']/text() != ''">
          <span about="this:IP-company-1" property="gazorg:name" datatype="xsd:string">
            <xsl:value-of
              select="upper-case($updates//*[@about='this:IP-company-1' and @property='gazorg:name']/text())"
            />
          </span>
          <xsl:text>, </xsl:text>
        </xsl:if>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:IP1-address-1'"/>
        </xsl:call-template>
        <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != ''">
          <xsl:if
            test="$updates//*[@about='this:IP1-address-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:country']/text() != ''">
            <xsl:text>, </xsl:text>
          </xsl:if>
          <xsl:text>Telephone: </xsl:text>
          <span about="this:IP1" property="gaz:telephone" datatype="xsd:string">
            <xsl:value-of
              select="$updates//*[@about='this:IP1' and @property='gaz:telephone']/text()"/>
          </span>
        </xsl:if>
        <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:fax']/text() != ''">
          <xsl:if
            test="$updates//*[@about='this:IP1-address-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:country']/text() != '' or $updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != ''">
            <xsl:text>, </xsl:text>
          </xsl:if>
          <xsl:text> Fax: </xsl:text>
          <span about="this:IP1" property="gaz:fax" datatype="xsd:string">
            <xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:fax']/text()"/>
          </span>
        </xsl:if>
        <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:email']/text() != ''">
          <xsl:if
            test="$updates//*[@about='this:IP1-address-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:country']/text() != '' or $updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != '' or $updates//*[@about='this:IP1' and @property='gaz:fax']/text() != ''">
            <xsl:text>, </xsl:text>
          </xsl:if>
          <xsl:text> Email: </xsl:text>
          <span about="this:IP1" property="gaz:email" datatype="xsd:string">
            <xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:email']/text()"/>
          </span>
        </xsl:if>
        <xsl:if
          test="$updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text() != ''">
          <xsl:text> (Reference number: </xsl:text>
          <span about="this:IP1" property="person:hasIPReferenceNumber" datatype="xsd:string">
            <xsl:value-of
              select="$updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text()"/>
            <xsl:text>.)</xsl:text>
          </span>
        </xsl:if>
      </p>
    </xsl:if>
    <xsl:if test="$updates//*[@about='this:IP1' and @property='person:noticeDated']/text() != ''">
      <p>
        <xsl:variable name="noticeDated">
          <xsl:value-of
            select="$updates//*[@about='this:IP1' and @property='person:noticeDated']/text()"/>
        </xsl:variable>
        <span about="this:IP1" property="person:noticeDated" datatype="xsd:date"
          content="{$noticeDated}">
          <xsl:value-of select="format-date(xs:date($noticeDated), '[FNn] [D01] [MNn] [Y0001]')"/>
        </span>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:IP1' and @property='person:additionalInformationIP']/text() != ''">
      <p>
        <span about="this:IP1" property="person:additionalInformationIP" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:IP1' and @property='person:additionalInformationIP']/text()"
          />
        </span>
      </p>
    </xsl:if>
  </xsl:template>

  <xsl:template name="boilerPlateText2450Edinburgh">
    <xsl:param name="updates"/>
    <p>
      <xsl:text>In the Matter of </xsl:text>
      <span about="this:legislation-1" property="legislation:legislationTitle" datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:legislation-1' and @property='legislation:legislationTitle']/text()"
        />
      </span>
    </p>
    <h3 about="this:company-1" property="gazorg:name" datatype="xsd:string">
      <xsl:value-of
        select="upper-case($updates//*[@about='this:company-1' and @property='gazorg:name']/text())"
      />
    </h3>

    <p>
      <span about="this:company-1" property="gazorg:companyNumber" datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:company-1' and @property='gazorg:companyNumber']/text()"
        />
      </span>
    </p>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:previousCompanyName']/text() != ''">
      <p>
        <xsl:text>(previously </xsl:text>
        <span about="this:company-1" property="gazorg:previousCompanyName" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:previousCompanyName']/text()"
          />
        </span>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:tradingAs']/text() != ''">
      <p>
        <xsl:text>(t/a </xsl:text>
        <span about="this:company-1" property="gazorg:tradingAs" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:tradingAs']/text()"/>
        </span>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:previouslyTradingAs']/text() != ''">
      <p>
        <xsl:text>(previously t/a </xsl:text>
        <span about="this:company-1" property="gazorg:previouslyTradingAs" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:previouslyTradingAs']/text()"
          />
        </span>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:country']/text() != ''">
      <p>
        <xsl:text>(Previous Registered Office: </xsl:text>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:company-previous-registered-office-1'"/>
        </xsl:call-template>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>

    <xsl:if
      test="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:country']/text() != ''">
      <p>
        <xsl:text>(Principal Trading Address: </xsl:text>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:company-principal-trading-address-1'"/>
        </xsl:call-template>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>

    <xsl:if
      test="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:street-address']/text() != ''">
      <p>
        <xsl:text>(Previous Trading Address: </xsl:text>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:previous-trading-address-1'"/>
        </xsl:call-template>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>

    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:natureOfBusiness']/text() != ''">
      <p>
        <xsl:text>Nature of Business: </xsl:text>
        <span about="this:company-1" property="gazorg:natureOfBusiness" datatype="xsd:string"
          data-recommended="true">
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:natureOfBusiness']/text()"
          />
        </span>
      </p>
    </xsl:if>
    <p><xsl:text>Notice is hereby given that on </xsl:text><xsl:variable
        name="dateOfPetitionPresentation">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateOfPetitionPresentation']/text()"
        />
      </xsl:variable>
      <span about="this:notifiableThing" property="corp-insolvency:dateOfPetitionPresentation"
        datatype="xsd:date" content="{$dateOfPetitionPresentation}">
        <xsl:value-of
          select="format-date(xs:date($dateOfPetitionPresentation), '[FNn] [D01] [MNn] [Y0001]')"/>
      </span><xsl:text> a Petition was presented to </xsl:text><span about="this:court-1"
        property="court:courtName" datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:court-1' and @property='court:courtName']/text()"/>
      </span><xsl:text> by </xsl:text><span about="this:petitioner-1" property="foaf:name"
        datatype="xsd:string">
        <xsl:value-of
          select="upper-case($updates//*[@about='this:petitioner-1' and @property='foaf:name']/text())"
        />
      </span>, <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:petitioner-address-1'"/>
      </xsl:call-template><xsl:text> craving the Court </xsl:text><i>inter
        alia</i><xsl:text> to order that </xsl:text><span about="this:company-1"
        property="gazorg:name" datatype="xsd:string">
        <xsl:value-of
          select="upper-case($updates//*[@about='this:company-1' and @property='gazorg:name']/text())"
        />
      </span><xsl:text> having its registered office at </xsl:text><xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:company-registered-office-1'"/>
      </xsl:call-template><xsl:text> be wound up by the Court and to appoint a liquidator; the </xsl:text><span
        about="this:notifiableThing" property="corp-insolvency:sheriffName" datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:sheriffName']/text()"
        />
      </span><xsl:text> by Interlocutor dated </xsl:text><xsl:variable name="dateOfInterlocutor">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateOfInterlocutor']/text()"
        />
      </xsl:variable>
      <span about="this:notifiableThing" property="corp-insolvency:dateOfInterlocutor"
        datatype="xsd:date" content="{$dateOfInterlocutor}">
        <xsl:value-of
          select="format-date(xs:date($dateOfInterlocutor), '[FNn] [D01] [MNn] [Y0001]')"/>
      </span><xsl:text> appointed all persons having an interest, if they intend to show cause why the prayer of the petition should not be granted, to lodge Answers in the hands of </xsl:text><span
        about="this:notifiableThing" property="corp-insolvency:nameOfPlaceOfHearing"
        datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:nameOfPlaceOfHearing']/text()"
        />
      </span><xsl:text> at </xsl:text><xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:hearingAddress'"/>
      </xsl:call-template><xsl:text> within eight days after such intimation, service or advertisement.</xsl:text></p>
    <p>
      <xsl:if test="$updates//*[@about='this:IP1' and @property='foaf:name']/text() != ''">
        <span about="this:IP1" property="foaf:name" datatype="xsd:string">
          <xsl:value-of select="$updates//*[@about='this:IP1' and @property='foaf:name']/text()"/>
        </span>
      </xsl:if>
      <xsl:if test="$updates//*[@about='this:IP1' and @property='foaf:name']/text() != ''">
        <xsl:if
          test="$updates//*[@about='this:IP1-address-1' and @property='vcard:street-address']/text() != ''">
          <xsl:text>, </xsl:text>
        </xsl:if>
        <span about="this:IP-company-1" property="gazorg:name" datatype="xsd:string">
          <xsl:value-of
            select="upper-case($updates//*[@about='this:IP-company-1' and @property='gazorg:name']/text())"
          />
        </span>
        <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:IP1-address-1'"/>
      </xsl:call-template>
      <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != ''">
        <xsl:if
          test="$updates//*[@about='this:IP1-address-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:country']/text() != ''">
          <xsl:text>, </xsl:text>
        </xsl:if>
        <xsl:text>Tel: </xsl:text>
        <span about="this:IP1" property="gaz:telephone" datatype="xsd:string">
          <xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:telephone']/text()"
          />
        </span>
      </xsl:if>
      <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:fax']/text() != ''">
        <xsl:if
          test="$updates//*[@about='this:IP1-address-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:country']/text() != '' or $updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != ''">
          <xsl:text>, </xsl:text>
        </xsl:if>
        <xsl:text> Fax: </xsl:text>
        <span about="this:IP1" property="gaz:fax" datatype="xsd:string">
          <xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:fax']/text()"/>
        </span>
      </xsl:if>
      <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:email']/text() != ''">
        <xsl:if
          test="$updates//*[@about='this:IP1-address-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:country']/text() != '' or $updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != '' or $updates//*[@about='this:IP1' and @property='gaz:fax']/text() != ''">
          <xsl:text>, </xsl:text>
        </xsl:if>
        <span about="this:IP1" property="gaz:email" datatype="xsd:string">
          <xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:email']/text()"/>
        </span>
      </xsl:if>
      <xsl:if
        test="$updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text() != ''">
        <p>
          <xsl:text>Ref: </xsl:text>
          <span about="this:IP1" property="person:hasIPReferenceNumber" datatype="xsd:string">
            <xsl:value-of
              select="$updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text()"
            />
          </span>
        </p>
      </xsl:if>
      <xsl:if
        test="$updates//*[@about='this:IP1' and @property='person:additionalInformationIP']/text() != ''">
        <p>
          <span about="this:IP1" property="person:additionalInformationIP" datatype="xsd:string">
            <xsl:value-of
              select="$updates//*[@about='this:IP1' and @property='person:additionalInformationIP']/text()"
            />
          </span>
        </p>
      </xsl:if>
      <xsl:if test="$updates//*[@about='this:IP1' and @property='person:noticeDated']/text() != ''">
        <p>
          <xsl:text>Notice Dated: </xsl:text>
          <xsl:variable name="noticeDated">
            <xsl:value-of
              select="$updates//*[@about='this:IP1' and @property='person:noticeDated']/text()"/>
          </xsl:variable>
          <span about="this:IP1" property="person:noticeDated" datatype="xsd:date"
            content="{$noticeDated}">
            <xsl:value-of select="format-date(xs:date($noticeDated), '[FNn] [D01] [MNn] [Y0001]')"/>
          </span>
        </p>
      </xsl:if>
    </p>
  </xsl:template>

  <xsl:template name="boilerPlateText2451">
    <xsl:param name="updates"/>
    <p>
      <xsl:text>In the </xsl:text>
      <span about="this:court-1" property="court:courtName" datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:court-1' and @property='court:courtName']/text()"/>
      </span>
    </p>
    <p>
      <span about="this:court-1" property="court:courtDistrict" datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:court-1' and @property='court:courtDistrict']/text()"/>
      </span>
      <xsl:text> </xsl:text>
      <span about="this:court-case-1" property="court:caseNumber" datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:court-case-1' and @property='court:caseNumber']/text()"/>
      </span>
      <xsl:text> of </xsl:text>
      <span about="this:court-case-1" property="court:caseYear" datatype="xsd:gYear">
        <xsl:value-of
          select="$updates//*[@about='this:court-case-1' and @property='court:caseYear']/text()"/>
      </span>
    </p>
    <p>
      <xsl:text>In the matter of</xsl:text>
    </p>
    <h3 about="this:company-1" property="gazorg:name" datatype="xsd:string">
      <xsl:value-of
        select="upper-case($updates//*[@about='this:company-1' and @property='gazorg:name']/text())"
      />
    </h3>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:partnershipNumber']/text() != ''">
      <p>
        <xsl:text> (Registered Number </xsl:text>
        <span about="this:company-1" property="gazorg:partnershipNumber" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:partnershipNumber']/text()"
          />
        </span>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:previousCompanyName']/text() != ''">
      <p>
        <xsl:text>(previously </xsl:text>
        <span about="this:company-1" property="gazorg:previousCompanyName" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:previousCompanyName']/text()"
          />
        </span>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:tradingAs']/text() != ''">
      <p>
        <xsl:text>(t/a </xsl:text>
        <span about="this:company-1" property="gazorg:tradingAs" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:tradingAs']/text()"/>
        </span>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:previouslyTradingAs']/text() != ''">
      <p>
        <xsl:text>(previously t/a </xsl:text>
        <span about="this:company-1" property="gazorg:previouslyTradingAs" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:previouslyTradingAs']/text()"
          />
        </span>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:country']/text() != ''">
      <p>
        <xsl:text>(Previous Registered Office: </xsl:text>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:company-previous-registered-office-1'"/>
        </xsl:call-template>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:country']/text() != ''">
      <p>
        <xsl:text>(Principal Trading Address: </xsl:text>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:company-principal-trading-address-1'"/>
        </xsl:call-template>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:street-address']/text() != ''">
      <p>
        <xsl:text>(Previous Trading Address: </xsl:text>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:previous-trading-address-1'"/>
        </xsl:call-template>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:natureOfBusiness']/text() != ''">
      <p>
        <xsl:text>Nature of Business: </xsl:text>
        <span about="this:company-1" property="gazorg:natureOfBusiness" datatype="xsd:string"
          data-recommended="true">
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:natureOfBusiness']/text()"
          />
        </span>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:legislation-1' and @property='legislation:legislationTitle']/text() != ''">
      <p>
        <xsl:text>and in the Matter of the </xsl:text>
        <span about="this:legislation-1" property="legislation:legislationTitle"
          datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:legislation-1' and @property='legislation:legislationTitle']/text()"
          />
        </span>
      </p>
    </xsl:if>
    <p>
      <xsl:text>A Petition to wind up the above-named Partnership of </xsl:text>
      <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:company-registered-office-1'"/>
      </xsl:call-template>
      <xsl:text> presented on </xsl:text>
      <xsl:variable name="dateOfPetitionPresentation">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateOfPetitionPresentation']/text()"
        />
      </xsl:variable>
      <span about="this:notifiableThing" property="corp-insolvency:dateOfPetitionPresentation"
        datatype="xsd:date" content="{$dateOfPetitionPresentation}">
        <xsl:value-of
          select="format-date(xs:date($dateOfPetitionPresentation), '[D01] [MNn] [Y0001]')"/>
      </span>
      <xsl:text> by </xsl:text>
      <span about="this:petitioner-1" property="foaf:name" datatype="xsd:string">
        <xsl:value-of
          select="upper-case($updates//*[@about='this:petitioner-1' and @property='foaf:name']/text())"
        />
      </span>
      <xsl:text>, of </xsl:text>
      <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:petitioner-address-1'"/>
      </xsl:call-template>
      <xsl:text> claiming to be a </xsl:text>
      <span about="this:notifiableThing" property="corp-insolvency:presentedBy">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:presentedBy']/text()"
        />
      </span>
      <xsl:text> of the Company, will be heard at </xsl:text>
      <span about="this:notifiableThing" property="corp-insolvency:nameOfPlaceOfHearing">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:nameOfPlaceOfHearing']/text()"
        />
      </span>
      <xsl:text>, </xsl:text>
      <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:hearingAddress'"/>
      </xsl:call-template>
      <xsl:variable name="dateOfHearing">
        <xsl:value-of
          select="format-date(xs:date($updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateOfHearing'][1]/text()),'[D01] [MNn] [Y0001]')"
        />
      </xsl:variable>
      <xsl:variable name="timeOfHearing">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateOfHearingWITHtime'][1]/text()"
        />
      </xsl:variable>
      <xsl:variable name="dateOfHearingValue">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateOfHearing'][1]/text()"
        />
      </xsl:variable>
      <xsl:variable name="hearing">
        <xsl:value-of select="concat($dateOfHearingValue,'T',$timeOfHearing,':00')"/>
      </xsl:variable>
      <xsl:text> on </xsl:text>
      <span about="this:notifiableThing" datatype="xsd:dateTime"
        property="corp-insolvency:dateOfHearing" content="{$hearing}">
        <xsl:value-of select="concat($dateOfHearing,' at ',$timeOfHearing)"/>
      </span>
      <xsl:text> (or as soon thereafter as the Petition can be heard).</xsl:text>
    </p>
    <p>
      <xsl:variable name="dateInsolvencyRule">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateInsolvencyRule'][1]/text()"
        />
      </xsl:variable>
      <xsl:text>Any person intending to appear on the hearing of the Petition (whether to support or oppose it) must give notice of intention to do so to the Petitioner or its Solicitor in accordance with Rule 4.16 by 16.00 hours on </xsl:text>
      <span about="this:notifiableThing" property="corp-insolvency:dateInsolvencyRule"
        datatype="xsd:date" content="{$dateInsolvencyRule}">
        <xsl:value-of select="format-date(xs:date($dateInsolvencyRule), '[D01] [MNn] [Y0001]')"/>
      </span>
      <xsl:text>.</xsl:text>
    </p>
    <xsl:if
      test="$updates//*[@about='this:IP1' and @property='foaf:name']/text() != ''
	or $updates//*[@about='this:IP-company-1' and @property='gazorg:name']/text() != ''
	or $updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != ''
	or $updates//*[@about='this:IP1' and @property='gaz:fax']/text() != ''
	or $updates//*[@about='this:IP1' and @property='gaz:email']/text() != ''
	or $updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text() != ''
	or $updates//*[@about='this:IP1-address-1' and @property='vcard:street-address']/text() != ''
	or $updates//*[@about='this:IP1-address-1' and @property='vcard:extended-address']/text() != ''
	or $updates//*[@about='this:IP1-address-1' and @property='vcard:locality']/text() != ''
	or $updates//*[@about='this:IP1-address-1' and @property='vcard:region']/text() != ''
	or $updates//*[@about='this:IP1-address-1' and @property='vcard:postal-code']/text() != ''
	or $updates//*[@about='this:IP1-address-1' and @property='vcard:country']/text() != ''">
      <p>
        <xsl:choose>
          <xsl:when
            test="$updates//*[@about='gzw:repDetails' and @property='gzw:repType']/text() = 'solicitor'">
            <xsl:text>The Petitioner's Solicitor is </xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>The Petitioner is </xsl:text>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="$updates//*[@about='this:IP1' and @property='foaf:name']/text() != ''">
          <span about="this:IP1" property="foaf:name" datatype="xsd:string">
            <xsl:value-of select="$updates//*[@about='this:IP1' and @property='foaf:name']/text()"/>
          </span>
          <xsl:text> of </xsl:text>
        </xsl:if>
        <xsl:if
          test="$updates//*[@about='this:IP-company-1' and @property='gazorg:name']/text() != ''">
          <span about="this:IP-company-1" property="gazorg:name" datatype="xsd:string">
            <xsl:value-of
              select="upper-case($updates//*[@about='this:IP-company-1' and @property='gazorg:name']/text())"
            />
          </span>
          <xsl:text>, </xsl:text>
        </xsl:if>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:IP1-address-1'"/>
        </xsl:call-template>
        <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != ''">
          <xsl:if
            test="$updates//*[@about='this:IP1-address-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:country']/text() != ''">
            <xsl:text>, </xsl:text>
          </xsl:if>
          <xsl:text>Telephone: </xsl:text>
          <span about="this:IP1" property="gaz:telephone" datatype="xsd:string">
            <xsl:value-of
              select="$updates//*[@about='this:IP1' and @property='gaz:telephone']/text()"/>
          </span>
        </xsl:if>
        <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:fax']/text() != ''">
          <xsl:if
            test="$updates//*[@about='this:IP1-address-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:country']/text() != '' or $updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != ''">
            <xsl:text>, </xsl:text>
          </xsl:if>
          <xsl:text> Fax: </xsl:text>
          <span about="this:IP1" property="gaz:fax" datatype="xsd:string">
            <xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:fax']/text()"/>
          </span>
        </xsl:if>
        <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:email']/text() != ''">
          <xsl:if
            test="$updates//*[@about='this:IP1-address-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:country']/text() != '' or $updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != '' or $updates//*[@about='this:IP1' and @property='gaz:fax']/text() != ''">
            <xsl:text>, </xsl:text>
          </xsl:if>
          <xsl:text> Email: </xsl:text>
          <span about="this:IP1" property="gaz:email" datatype="xsd:string">
            <xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:email']/text()"/>
          </span>
        </xsl:if>
        <xsl:if
          test="$updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text() != ''">
          <xsl:text> (Reference number: </xsl:text>
          <span about="this:IP1" property="person:hasIPReferenceNumber" datatype="xsd:string">
            <xsl:value-of
              select="$updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text()"/>
            <xsl:text>.)</xsl:text>
          </span>
        </xsl:if>
      </p>
    </xsl:if>
    <xsl:if test="$updates//*[@about='this:IP1' and @property='person:noticeDated']/text() != ''">
      <p>
        <xsl:variable name="noticeDated">
          <xsl:value-of
            select="$updates//*[@about='this:IP1' and @property='person:noticeDated']/text()"/>
        </xsl:variable>
        <span about="this:IP1" property="person:noticeDated" datatype="xsd:date"
          content="{$noticeDated}">
          <xsl:value-of select="format-date(xs:date($noticeDated), '[FNn] [D01] [MNn] [Y0001]')"/>
        </span>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:IP1' and @property='person:additionalInformationIP']/text() != ''">
      <p>
        <span about="this:IP1" property="person:additionalInformationIP" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:IP1' and @property='person:additionalInformationIP']/text()"
          />
        </span>
      </p>
    </xsl:if>
  </xsl:template>

  <xsl:template name="boilerPlateText2451Edinburgh">
    <xsl:param name="updates"/>
    <p>
      <xsl:text>In the Matter of </xsl:text>
      <span about="this:legislation-1" property="legislation:legislationTitle">
        <xsl:value-of
          select="$updates//*[@about='this:legislation-1' and @property='legislation:legislationTitle']/text()"
        />
      </span>
    </p>
    <h3 about="this:company-1" property="gazorg:name" datatype="xsd:string">
      <xsl:value-of
        select="upper-case($updates//*[@about='this:company-1' and @property='gazorg:name']/text())"
      />
    </h3>
    <p>
      <span about="this:company-1" property="gazorg:partnershipNumber" datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:company-1' and @property='gazorg:partnershipNumber']/text()"
        />
      </span>
    </p>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:previousCompanyName']/text() != ''">
      <p>
        <xsl:text>(previously </xsl:text>
        <span about="this:company-1" property="gazorg:previousCompanyName" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:previousCompanyName']/text()"
          />
        </span>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:tradingAs']/text() != ''">
      <p>
        <xsl:text>(t/a </xsl:text>
        <span about="this:company-1" property="gazorg:tradingAs" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:tradingAs']/text()"/>
        </span>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:previouslyTradingAs']/text() != ''">
      <p>
        <xsl:text>(previously t/a </xsl:text>
        <span about="this:company-1" property="gazorg:previouslyTradingAs" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:previouslyTradingAs']/text()"
          />
        </span>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:country']/text() != ''">
      <p>
        <xsl:text>(Previous Registered Office: </xsl:text>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:company-previous-registered-office-1'"/>
        </xsl:call-template>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:country']/text() != ''">
      <p>
        <xsl:text>(Principal Trading Address: </xsl:text>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:company-principal-trading-address-1'"/>
        </xsl:call-template>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>

    <xsl:if
      test="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:street-address']/text() != ''">
      <p>
        <xsl:text>(Previous Trading Address: </xsl:text>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:previous-trading-address-1'"/>
        </xsl:call-template>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>

    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:natureOfBusiness']/text() != ''">
      <p>
        <xsl:text>Nature of Business: </xsl:text>
        <span about="this:company-1" property="gazorg:natureOfBusiness" datatype="xsd:string"
          data-recommended="true">
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:natureOfBusiness']/text()"
          />
        </span>
      </p>
    </xsl:if>

    <p>
      <xsl:text>Notice is hereby given that on </xsl:text>
      <xsl:variable name="dateOfPetitionPresentation">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateOfPetitionPresentation']/text()"
        />
      </xsl:variable>
      <span about="this:notifiableThing" property="corp-insolvency:dateOfPetitionPresentation"
        datatype="xsd:date" content="{$dateOfPetitionPresentation}">
        <xsl:value-of
          select="format-date(xs:date($dateOfPetitionPresentation), '[FNn] [D01] [MNn] [Y0001]')"/>
      </span>
      <xsl:text> a Petition was presented to </xsl:text>
      <span about="this:court-1" property="court:courtName" datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:court-1' and @property='court:courtName']/text()"/>
      </span>
      <xsl:text> by </xsl:text>
      <!--<span about="this:notifiableThing" property="corp-insolvency:nameOfPlaceOfHearing" datatype="xsd:string">
				<xsl:value-of select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:nameOfPlaceOfHearing']/text()"/>
			</span> by -->
      <span about="this:petitioner-1" property="foaf:name" datatype="xsd:string">
        <xsl:value-of
          select="upper-case($updates//*[@about='this:petitioner-1' and @property='foaf:name']/text())"
        />
      </span>
      <xsl:text>, </xsl:text>
      <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:petitioner-address-1'"/>
      </xsl:call-template>
      <xsl:text> craving the Court </xsl:text>
      <i>inter alia</i>
      <xsl:text> to order that </xsl:text>
      <span about="this:company-1" property="gazorg:name" datatype="xsd:string">
        <xsl:value-of
          select="upper-case($updates//*[@about='this:company-1' and @property='gazorg:name']/text())"
        />
      </span>
      <xsl:text> having its registered office at </xsl:text>
      <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:company-registered-office-1'"/>
      </xsl:call-template>
      <xsl:text> be wound up by the Court and to appoint a liquidator; the </xsl:text>
      <span about="this:notifiableThing" property="corp-insolvency:sheriffName"
        datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:sheriffName']/text()"
        />
      </span>
      <xsl:text> by Interlocutor dated </xsl:text>
      <xsl:variable name="dateOfInterlocutor">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateOfInterlocutor']/text()"
        />
      </xsl:variable>
      <span about="this:notifiableThing" property="corp-insolvency:dateOfInterlocutor"
        datatype="xsd:date" content="{$dateOfInterlocutor}">
        <xsl:value-of
          select="format-date(xs:date($dateOfInterlocutor), '[FNn] [D01] [MNn] [Y0001]')"/>
      </span>
      <xsl:text> appointed all persons having an interest, if they intend to show cause why the prayer of the petition should not be granted, to lodge Answers in the hands of </xsl:text>
      <span about="this:notifiableThing" property="corp-insolvency:nameOfPlaceOfHearing"
        datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:nameOfPlaceOfHearing']/text()"
        />
      </span>
      <xsl:text> at </xsl:text>
      <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:hearingAddress'"/>
      </xsl:call-template>
      <xsl:text> within eight days after such intimation, service or advertisement.</xsl:text>
    </p>
    <xsl:if
      test="$updates//*[@about='this:IP1' and @property='foaf:name']/text() != ''
	or $updates//*[@about='this:IP-company-1' and @property='gazorg:name']/text() != ''
	or $updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != ''
	or $updates//*[@about='this:IP1' and @property='gaz:fax']/text() != ''
	or $updates//*[@about='this:IP1' and @property='gaz:email']/text() != ''
	or $updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text() != ''
	or $updates//*[@about='this:IP1-address-1' and @property='vcard:street-address']/text() != ''
	or $updates//*[@about='this:IP1-address-1' and @property='vcard:extended-address']/text() != ''
	or $updates//*[@about='this:IP1-address-1' and @property='vcard:locality']/text() != ''
	or $updates//*[@about='this:IP1-address-1' and @property='vcard:region']/text() != ''
	or $updates//*[@about='this:IP1-address-1' and @property='vcard:postal-code']/text() != ''
	or $updates//*[@about='this:IP1-address-1' and @property='vcard:country']/text() != ''">
      <p>
        <xsl:choose>
          <xsl:when
            test="$updates//*[@about='gzw:repDetails' and @property='gzw:repType']/text() = 'solicitor'">
            <xsl:text>The Petitioner's Solicitor is </xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>The Petitioner is </xsl:text>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="$updates//*[@about='this:IP1' and @property='foaf:name']/text() != ''">
          <span about="this:IP1" property="foaf:name" datatype="xsd:string">
            <xsl:value-of select="$updates//*[@about='this:IP1' and @property='foaf:name']/text()"/>
          </span>
          <xsl:text> of </xsl:text>
        </xsl:if>
        <xsl:if
          test="$updates//*[@about='this:IP-company-1' and @property='gazorg:name']/text() != ''">
          <span about="this:IP-company-1" property="gazorg:name" datatype="xsd:string">
            <xsl:value-of
              select="upper-case($updates//*[@about='this:IP-company-1' and @property='gazorg:name']/text())"
            />
          </span>
          <xsl:text>, </xsl:text>
        </xsl:if>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:IP1-address-1'"/>
        </xsl:call-template>
        <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != ''">
          <xsl:if
            test="$updates//*[@about='this:IP1-address-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:country']/text() != ''">
            <xsl:text>, </xsl:text>
          </xsl:if>
          <xsl:text>Telephone: </xsl:text>
          <span about="this:IP1" property="gaz:telephone" datatype="xsd:string">
            <xsl:value-of
              select="$updates//*[@about='this:IP1' and @property='gaz:telephone']/text()"/>
          </span>
        </xsl:if>
        <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:fax']/text() != ''">
          <xsl:if
            test="$updates//*[@about='this:IP1-address-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:country']/text() != '' or $updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != ''">
            <xsl:text>, </xsl:text>
          </xsl:if>
          <xsl:text> Fax: </xsl:text>
          <span about="this:IP1" property="gaz:fax" datatype="xsd:string">
            <xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:fax']/text()"/>
          </span>
        </xsl:if>
        <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:email']/text() != ''">
          <xsl:if
            test="$updates//*[@about='this:IP1-address-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:country']/text() != '' or $updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != '' or $updates//*[@about='this:IP1' and @property='gaz:fax']/text() != ''">
            <xsl:text>, </xsl:text>
          </xsl:if>
          <xsl:text> Email: </xsl:text>
          <span about="this:IP1" property="gaz:email" datatype="xsd:string">
            <xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:email']/text()"/>
          </span>
        </xsl:if>
        <xsl:if
          test="$updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text() != ''">
          <xsl:text> (Reference number: </xsl:text>
          <span about="this:IP1" property="person:hasIPReferenceNumber" datatype="xsd:string"
            >
            <xsl:value-of
              select="$updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text()"/>
            <xsl:text>.)</xsl:text>
          </span>
        </xsl:if>
      </p>
    </xsl:if>
    <xsl:if test="$updates//*[@about='this:IP1' and @property='person:noticeDated']/text() != ''">
      <p>
        <xsl:variable name="noticeDated">
          <xsl:value-of
            select="$updates//*[@about='this:IP1' and @property='person:noticeDated']/text()"/>
        </xsl:variable>
        <span about="this:IP1" property="person:noticeDated" datatype="xsd:date"
          content="{$noticeDated}">
          <xsl:value-of select="format-date(xs:date($noticeDated), '[FNn] [D01] [MNn] [Y0001]')"/>
        </span>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:IP1' and @property='person:additionalInformationIP']/text() != ''">
      <p>
        <span about="this:IP1" property="person:additionalInformationIP" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:IP1' and @property='person:additionalInformationIP']/text()"
          />
        </span>
      </p>
    </xsl:if>
    <xsl:if test="$updates//*[@about='this:IP1' and @property='person:noticeDated']/text() != ''">
      <xsl:variable name="noticeDated">
        <xsl:value-of
          select="$updates//*[@about='this:IP1' and @property='person:noticeDated']/text()"/>
      </xsl:variable>
      <p>
        <span about="this:IP1" property="person:noticeDated" datatype="xsd:date"
          content="{$noticeDated}">
          <xsl:value-of select="format-date(xs:date($noticeDated), '[FNn] [D01] [MNn] [Y0001]')"/>
        </span>
      </p>
    </xsl:if>
  </xsl:template>

  <xsl:template name="boilerPlateText2441">
    <xsl:param name="updates"/>
    <h3 about="this:company-1" property="gazorg:name" datatype="xsd:string">
      <xsl:value-of
        select="upper-case($updates//*[@about='this:company-1' and @property='gazorg:name']/text())"
      />
    </h3>
    <p> (Company Number <span about="this:company-1" property="gazorg:companyNumber"
        datatype="xsd:string" ><xsl:value-of
          select="$updates//*[@about='this:company-1' and @property='gazorg:companyNumber']/text()"
        /></span>)</p>

    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:previousCompanyName']/text() != ''">
      <p>(previously <span about="this:company-1" property="gazorg:previousCompanyName"
          datatype="xsd:string" >
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:previousCompanyName']/text()"
          />
        </span>)</p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:tradingAs']/text() != ''">
      <p> (t/a <span about="this:company-1" property="gazorg:tradingAs" datatype="xsd:string"
          >
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:tradingAs']/text()"/>
        </span>)</p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:previouslyTradingAs']/text() != ''">
      <p>(previously t/a <span about="this:company-1" property="gazorg:previouslyTradingAs"
          datatype="xsd:string" >
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:previouslyTradingAs']/text()"
          />
        </span>)</p>
    </xsl:if>

    <p>Registered Office: <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:company-registered-office-1'"/>
      </xsl:call-template>
    </p>

    <xsl:if
      test="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:country']/text() != ''">
      <p>(Previous Registered Office: <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:company-previous-registered-office-1'"/>
        </xsl:call-template>) </p>
    </xsl:if>

    <xsl:if
      test="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:country']/text() != ''">
      <p>(Principal Trading Address: <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:company-principal-trading-address-1'"/>
        </xsl:call-template>) </p>
    </xsl:if>

    <xsl:if
      test="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:street-address']/text() != ''">
      <p>(Previous Trading Address: <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:previous-trading-address-1'"/>
        </xsl:call-template>) </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:natureOfBusiness']/text() != ''">
      <p>Nature of Business: <span about="this:company-1" property="gazorg:natureOfBusiness"
          datatype="xsd:string" data-recommended="true"><xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:natureOfBusiness']/text()"
          /></span></p>
    </xsl:if>

    <p> At a General Meeting of the Members of the above-named Company, duly convened, and held at
        <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:meetingAddress-1'"/>
      </xsl:call-template>
      <xsl:variable name="corpInsolvencyMeetingDate">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:meetingTime'][1]/text()"
        />
      </xsl:variable>
      <xsl:variable name="corpInsolvencyMeetingTime">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:meetingTimeWITHtime'][1]/text()"
        />
      </xsl:variable>
      <xsl:variable name="corpInsolvencyMeetingTime2">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:meetingTime2WITHtime'][1]/text()"
        />
      </xsl:variable>
      <xsl:variable name="corpInsolvencyMeetingDateAndTime">
        <xsl:value-of
          select="concat($corpInsolvencyMeetingDate,'T',$corpInsolvencyMeetingTime,':00')"/>
      </xsl:variable>
      <xsl:variable name="corpInsolvencyMeetingDateAndTime2">
        <xsl:value-of
          select="concat($corpInsolvencyMeetingDate,'T',$corpInsolvencyMeetingTime2,':00')"/>
      </xsl:variable> on <span about="this:notifiableThing" property="corp-insolvency:meetingTime"
        datatype="xsd:dateTime" content="{$corpInsolvencyMeetingDateAndTime}"/><xsl:value-of
        select="format-date(xs:date($corpInsolvencyMeetingDate), '[FNn] [D01] [MNn] [Y0001]')"/>
      <xsl:if test="$corpInsolvencyMeetingTime != ''"> at <xsl:value-of
          select="$corpInsolvencyMeetingTime"/>
        <xsl:if
          test="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:meetingTime2WITHtime']/text() != ''"
          > and <span about="this:notifiableThing" property="corp-insolvency:meetingTime2"
            datatype="xsd:dateTime" content="{$corpInsolvencyMeetingDateAndTime2}"/><xsl:value-of
            select="$corpInsolvencyMeetingTime2"/>
        </xsl:if>
      </xsl:if> the following Resolutions were duly passed, as a Special Resolution and as an
      Ordinary Resolution: </p>

    <p> "That it has been proved to the satisfaction of this Meeting that the Company cannot, by
      reason of its liabilities, continue its business, and that it is advisable to wind up the
      same, and accordingly that the Company be wound up voluntarily, and that <span
        about="this:IP1" property="foaf:name" datatype="xsd:string"
        typeof="person:InsolvencyPractitioner"><xsl:value-of
          select="$updates//*[@about='this:IP1' and @property='foaf:name']/text()"/></span>
      <xsl:if test="$updates//*[@about='this:IP2' and @property='foaf:name']/text() != ''"> and
          <span about="this:IP2" property="foaf:name" datatype="xsd:string"
          typeof="person:InsolvencyPractitioner"><xsl:value-of
            select="$updates//*[@about='this:IP2' and @property='foaf:name']/text()"/></span>
      </xsl:if> , (IP number<xsl:if
        test="$updates//*[@about='this:IP2' and @property='foaf:name']/text() != ''">(s)</xsl:if>
      <xsl:text> </xsl:text>
      <span about="this:IP1" property="person:hasIPnum" datatype="xsd:string">
        <!--<xsl:if test="not($updates//*[@about='this:IP2' and @property='person:hasIPnum']/text())">
          <xsl:attribute name="style">margin-right:-4px;</xsl:attribute>
        </xsl:if>-->
        <xsl:value-of select="$updates//*[@about='this:IP1' and @property='person:hasIPnum']/text()"
        /></span>
      <xsl:if test="$updates//*[@about='this:IP2' and @property='person:hasIPnum']/text() != ''">
        and <span about="this:IP2" property="person:hasIPnum" datatype="xsd:string"
          ><xsl:value-of
            select="$updates//*[@about='this:IP2' and @property='person:hasIPnum']/text()"
        /></span></xsl:if>), of <span about="this:IP-company-1" property="gazorg:name"
        datatype="xsd:string"><xsl:value-of
          select="upper-case($updates//*[@about='this:IP-company-1' and @property='gazorg:name']/text())"
        /></span>, <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:IP1-address-1'"/>
      </xsl:call-template> be and <xsl:choose>
        <xsl:when test="$updates//*[@about='this:IP2' and @property='foaf:name']/text() != ''"> are </xsl:when>
        <xsl:otherwise> is </xsl:otherwise>
      </xsl:choose> hereby appointed <xsl:if
        test="$updates//*[@about='this:IP2' and @property='foaf:name']/text() != ''"> (Joint)
      </xsl:if> Liquidator<xsl:if
        test="$updates//*[@about='this:IP2' and @property='foaf:name']/text() != ''">(s)</xsl:if>
      for the purposes of such winding-up." </p>

    <p>
      <xsl:if
        test="$updates//*[@about='this:IP1' and @property='person:additionalContactName']/text() != ''"
        > Further details contact: <span about="this:IP1" property="person:additionalContactName"
          datatype="xsd:string"><xsl:value-of
            select="$updates//*[@about='this:IP1' and @property='person:additionalContactName']/text()"
          /></span></xsl:if>

      <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != ''">
        <xsl:if
          test="$updates//*[@about='this:IP1' and @property='person:additionalContactName']/text() != ''"
          >, </xsl:if> Telephone number: <span about="this:IP1" property="gaz:telephone"
          datatype="xsd:string"><xsl:value-of
            select="$updates//*[@about='this:IP1' and @property='gaz:telephone']/text()"
        /></span></xsl:if>

      <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:fax']/text() != ''">
        <xsl:if
          test="$updates//*[@about='this:IP1' and @property='person:additionalContactName']/text() != '' or $updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != ''"
          >, </xsl:if> Fax: <span about="this:IP1" property="gaz:fax" datatype="xsd:string"
            ><xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:fax']/text()"
          /></span></xsl:if>

      <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:email']/text() != ''">
        <xsl:if
          test="$updates//*[@about='this:IP1' and @property='person:additionalContactName']/text() != '' or $updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != '' or $updates//*[@about='this:IP1' and @property='gaz:fax']/text() != ''"
          >, </xsl:if> Email: <span about="this:IP1" property="gaz:email" datatype="xsd:string"
            ><xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:email']/text()"
          /></span>
      </xsl:if>

      <xsl:if
        test="$updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text() != ''"
        > (Ref: <span about="this:IP1" property="person:hasIPReferenceNumber" datatype="xsd:string"
            ><xsl:value-of
            select="$updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text()"
          />)</span>
      </xsl:if>

    </p>

    <xsl:if
      test="$updates//*[@about='this:IP1' and @property='person:additionalInformationIP']/text() != ''">
      <p>
        <span about="this:IP1" property="person:additionalInformationIP">
          <xsl:value-of
            select="$updates//*[@about='this:IP1' and @property='person:additionalInformationIP']/text()"
          />
        </span>
      </p>
    </xsl:if>

    <xsl:if test="$updates//*[@about='this:signatory-1' and @property='foaf:name']/text() != ''">
      <p>
        <span about="this:signatory-1" property="foaf:name" typeof="person:Person"
          datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:signatory-1' and @property='foaf:name']/text()"/>
        </span>
        <xsl:if
          test="$updates//*[@about='this:role-signatory-1' and @property='person:roleName']/text() != ''"
          >, <span about="this:role-signatory-1" property="person:roleName" typeof="person:Role"
            datatype="xsd:string"><xsl:value-of
              select="$updates//*[@about='this:role-signatory-1' and @property='person:roleName']/text()"
            /></span></xsl:if>
      </p>
    </xsl:if>

    <xsl:variable name="dateAuthorisationSigned">
      <xsl:value-of
        select="$updates//*[@about='this:authoriser-1' and @property='gaz:dateAuthorisationSigned']/text()"
      />
    </xsl:variable>

    <xsl:if
      test="$updates//*[@about='this:authoriser-1' and @property='gaz:dateAuthorisationSigned']/text() != ''">
      <P>
        <span about="this:authoriser-1" property="gaz:dateAuthorisationSigned" datatype="xsd:date"
          content="{$dateAuthorisationSigned}">
          <xsl:value-of
            select="format-date(xs:date($dateAuthorisationSigned), '[FNn] [D01] [MNn] [Y0001]')"/>
        </span>
      </P>
    </xsl:if>
  </xsl:template>

  <xsl:template name="boilerPlateText2442">
    <xsl:param name="updates"/>
    <h3 about="this:company-1" property="gazorg:name" datatype="xsd:string">
      <xsl:value-of
        select="upper-case($updates//*[@about='this:company-1' and @property='gazorg:name']/text())"
      />
    </h3>
    <p> (Company Number <span about="this:company-1" property="gazorg:companyNumber"
        datatype="xsd:string" ><xsl:value-of
          select="$updates//*[@about='this:company-1' and @property='gazorg:companyNumber']/text()"
        /></span>) </p>

    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:previousCompanyName']/text() != ''">
      <p>(previously <span about="this:company-1" property="gazorg:previousCompanyName"
          datatype="xsd:string" >
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:previousCompanyName']/text()"
          />
        </span>)</p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:tradingAs']/text() != ''">
      <p> (t/a <span about="this:company-1" property="gazorg:tradingAs" datatype="xsd:string"
          >
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:tradingAs']/text()"/>
        </span>)</p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:previouslyTradingAs']/text() != ''">
      <p>(previously t/a <span about="this:company-1" property="gazorg:previouslyTradingAs"
          datatype="xsd:string" >
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:previouslyTradingAs']/text()"
          />
        </span>)</p>
    </xsl:if>

    <p>Registered Office: <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:company-registered-office-1'"/>
      </xsl:call-template>
    </p>

    <xsl:if
      test="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:country']/text() != ''">
      <p>(Previous Registered Office: <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:company-previous-registered-office-1'"/>
        </xsl:call-template>) </p>
    </xsl:if>

    <xsl:if
      test="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:country']/text() != ''">
      <p>(Principal Trading Address: <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:company-principal-trading-address-1'"/>
        </xsl:call-template>) </p>
    </xsl:if>

    <xsl:if
      test="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:street-address']/text() != ''">
      <p>(Previous Trading Address: <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:previous-trading-address-1'"/>
        </xsl:call-template>) </p>
    </xsl:if>

    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:natureOfBusiness']/text() != ''">
      <p>Nature of Business: <span about="this:company-1" property="gazorg:natureOfBusiness"
          datatype="xsd:string" data-recommended="true"><xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:natureOfBusiness']/text()"
          /></span></p>
    </xsl:if>

    <p> Notice is hereby given, pursuant to <xsl:if
        test="$updates//*[@about='this:legislation-1' and @property='legislation:legislationSection']/text() != ''">
        <span about="this:legislation-1" property="legislation:legislationSection"
          datatype="xsd:string"><xsl:value-of
            select="$updates//*[@about='this:legislation-1' and @property='legislation:legislationSection']/text()"
          /></span> of the </xsl:if>
      <span about="this:legislation-1" property="legislation:legislationTitle" datatype="xsd:string"
          ><xsl:value-of
          select="$updates//*[@about='this:legislation-1' and @property='legislation:legislationTitle']/text()"
        /></span> that a meeting of creditors of the above named Company will be held at
        <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:meetingAddress-1'"/>
      </xsl:call-template>
      <xsl:variable name="corpInsolvencyMeetingDate">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:meetingTime'][1]/text()"
        />
      </xsl:variable>
      <xsl:variable name="corpInsolvencyMeetingTime">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:meetingTimeWITHtime'][1]/text()"
        />
      </xsl:variable>
      <xsl:variable name="corpInsolvencyMeetingTime2">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:meetingTime2WITHtime'][1]/text()"
        />
      </xsl:variable>
      <xsl:variable name="corpInsolvencyMeetingDateAndTime">
        <xsl:value-of
          select="concat($corpInsolvencyMeetingDate, 'T', $corpInsolvencyMeetingTime, ':00')"/>
      </xsl:variable>
      <xsl:variable name="corpInsolvencyMeeting2DateAndTime">
        <xsl:value-of
          select="concat($corpInsolvencyMeetingDate, 'T', $corpInsolvencyMeetingTime2, ':00')"/>
      </xsl:variable> on <span about="this:notifiableThing" property="corp-insolvency:meetingTime"
        datatype="xsd:dateTime" content="{$corpInsolvencyMeetingDateAndTime}"><xsl:value-of
          select="format-date(xs:date($corpInsolvencyMeetingDate), '[D01] [MNn] [Y0001]')"/>, at
          <xsl:value-of select="$corpInsolvencyMeetingTime"/></span>
      <xsl:if
        test="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:meetingTime2WITHtime']/text() != ''"
        > and <span about="this:notifiableThing" property="corp-insolvency:meetingTime2"
          content="{$corpInsolvencyMeeting2DateAndTime}"><xsl:value-of
            select="$corpInsolvencyMeetingTime2"/></span>
      </xsl:if> for the purposes mentioned in <span about="this:legislation-1"
        property="legislation:legislationSection" datatype="xsd:string"><xsl:value-of
          select="$updates//*[@about='this:legislation-1' and @property='legislation:legislationSection']/text()"
        /></span> of the said Act. </p>

    <p> A list of the names and addresses of the company's creditors will be available for
      inspection free of charge at the offices of <span about="this:IP-company-1"
        property="gazorg:name" datatype="xsd:string" typeof="gazorg:ForProfitOrganisation"
          ><xsl:value-of
          select="upper-case($updates//*[@about='this:IP-company-1' and @property='gazorg:name']/text())"
        /></span> at <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:IP1-address-1'"/>
      </xsl:call-template>
      <xsl:variable name="corpInsolvencyOnOrBeforeCreditorDetailDate">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:onOrBeforeCreditorDetail'][1]/text()"
        />
      </xsl:variable>
      <xsl:variable name="corpInsolvencyOnOrBeforeCreditorDetailTime">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:onOrBeforeCreditorDetailWITHtime'][1]/text()"
        />
      </xsl:variable>
      <xsl:variable name="corpInsolvencyOnOrBeforeCreditorDetailDateAndTime">
        <xsl:value-of
          select="concat($corpInsolvencyOnOrBeforeCreditorDetailDate,'T',$corpInsolvencyOnOrBeforeCreditorDetailTime,':00')"
        />
      </xsl:variable> by no later than <span about="this:notifiableThing"
        property="corp-insolvency:onOrBeforeCreditorDetail" datatype="xsd:dateTime"
        content="{$corpInsolvencyOnOrBeforeCreditorDetailDateAndTime}" 
          ><xsl:value-of select="$corpInsolvencyOnOrBeforeCreditorDetailTime"/> on <xsl:value-of
          select="format-date(xs:date($corpInsolvencyOnOrBeforeCreditorDetailDate), '[D01] [MNn] [Y0001]')"
        /></span>. </p>

    <p> Any Creditor entitled to attend and vote at this Meeting is entitled to do so either in
      person or by proxy. Creditors wishing to vote at the Meeting must (unless they are individual
      creditors attending in person) lodge their proxy at the offices of <span
        about="this:IP-company-1" property="gazorg:name" typeof="gazorg:ForProfitOrganisation"
        datatype="xsd:string"><xsl:value-of
          select="upper-case($updates//*[@about='this:IP-company-1' and @property='gazorg:name']/text())"
        /></span> at <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:IP1-address-1'"/>
      </xsl:call-template>
      <xsl:variable name="corpInsolvencyOnOrBeforeProxySubmitDate">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:onOrBeforeProxySubmit'][1]/text()"
        />
      </xsl:variable>
      <xsl:variable name="corpInsolvencyOnOrBeforeProxySubmitTime">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:onOrBeforeProxySubmitWITHtime'][1]/text()"
        />
      </xsl:variable>
      <xsl:variable name="corpInsolvencyOnOrBeforeProxySubmitDateAndTime">
        <xsl:value-of
          select="concat($corpInsolvencyOnOrBeforeProxySubmitDate,'T',$corpInsolvencyOnOrBeforeProxySubmitTime,':00')"
        />
      </xsl:variable> by no later than <span about="this:notifiableThing"
        property="corp-insolvency:onOrBeforeProxySubmit" datatype="xsd:dateTime"
        content="{$corpInsolvencyOnOrBeforeProxySubmitDateAndTime}" 
          ><xsl:value-of select="$corpInsolvencyOnOrBeforeProxySubmitTime"/> on <xsl:value-of
          select="format-date(xs:date($corpInsolvencyOnOrBeforeProxySubmitDate), '[D01] [MNn] [Y0001]')"
        /></span>. </p>

    <p>
      <span about="this:IP1" property="foaf:name" datatype="xsd:string"
        typeof="person:InsolvencyPractitioner"><xsl:value-of
          select="$updates//*[@about='this:IP1' and @property='foaf:name']/text()"/></span> (IP
      number <span about="this:IP1" property="person:hasIPnum" datatype="xsd:string"
        ><xsl:value-of
          select="$updates//*[@about='this:IP1' and @property='person:hasIPnum']/text()"/></span>)
        <xsl:if test="$updates//*[@about='this:IP2' and @property='foaf:name']/text() != ''"> and
          <span about="this:IP2" property="foaf:name" typeof="person:InsolvencyPractitioner"
          datatype="xsd:string"><xsl:value-of
            select="$updates//*[@about='this:IP2' and @property='foaf:name']/text()"/></span>
      </xsl:if>
      <xsl:if test="$updates//*[@about='this:IP2' and @property='person:hasIPnum']/text() != ''">
        (IP number <span about="this:IP2" property="person:hasIPnum" datatype="xsd:string"
          ><xsl:value-of
            select="$updates//*[@about='this:IP2' and @property='person:hasIPnum']/text()"/></span>)
      </xsl:if> of <span about="this:IP-company-1" property="gazorg:name"
        typeof="gazorg:ForProfitOrganisation" datatype="xsd:string"><xsl:value-of
          select="upper-case($updates//*[@about='this:IP-company-1' and @property='gazorg:name']/text())"
        /></span> at <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:IP1-address-1'"/>
      </xsl:call-template>, <xsl:choose>
        <xsl:when test="$updates//*[@about='this:IP2' and @property='foaf:name']/text() != ''"> are </xsl:when>
        <xsl:otherwise> is </xsl:otherwise>
      </xsl:choose> qualified to act as Insolvency Practitioner<xsl:if
        test="$updates//*[@about='this:IP2' and @property='foaf:name']/text() != ''">s</xsl:if> in
      relation to the above and will furnish creditors, free of charge, with such information
      concerning the company's affairs as is reasonably required. </p>

    <p>
      <xsl:if
        test="$updates//*[@about='this:IP1' and @property='person:additionalContactName']/text() != '' or $updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != '' or $updates//*[@about='this:IP1' and @property='gaz:fax']/text() != '' or $updates//*[@about='this:IP1' and @property='gaz:email']/text() != '' or $updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text() != ''"
        > For further details contact: </xsl:if>
      <xsl:if
        test="$updates//*[@about='this:IP1' and @property='person:additionalContactName']/text() != ''">
        <span about="this:IP1" property="person:additionalContactName">
          <xsl:value-of
            select="$updates//*[@about='this:IP1' and @property='person:additionalContactName']/text()"
          />
        </span>
      </xsl:if>
      <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != ''">
        <xsl:if
          test="$updates//*[@about='this:IP1' and @property='person:additionalContactName']/text() != ''"
          >, </xsl:if> Telephone number: <span about="this:IP1" property="gaz:telephone"
          datatype="xsd:string"><xsl:value-of
            select="$updates//*[@about='this:IP1' and @property='gaz:telephone']/text()"
        /></span></xsl:if>

      <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:fax']/text() != ''">
        <xsl:if
          test="$updates//*[@about='this:IP1' and @property='person:additionalContactName']/text() != '' or $updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != ''"
          >, </xsl:if> Fax: <span about="this:IP1" property="gaz:fax" datatype="xsd:string"
            ><xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:fax']/text()"
          /></span></xsl:if>

      <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:email']/text() != ''">
        <xsl:if
          test="$updates//*[@about='this:IP1' and @property='person:additionalContactName']/text() != '' or $updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != '' or $updates//*[@about='this:IP1' and @property='gaz:fax']/text() != ''"
          >, </xsl:if> Email: <span about="this:IP1" property="gaz:email" datatype="xsd:string"
            ><xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:email']/text()"
          /></span>
      </xsl:if>

      <xsl:if
        test="$updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text() != ''"
        > (Ref: <span about="this:IP1" property="person:hasIPReferenceNumber" datatype="xsd:string"
          ><xsl:value-of
            select="$updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text()"
          />)</span>
      </xsl:if>

    </p>

    <xsl:if
      test="$updates//*[@about='this:IP1' and @property='person:additionalInformationIP']/text() != ''">
      <p>
        <span about="this:IP1" property="person:additionalInformationIP">
          <xsl:value-of
            select="$updates//*[@about='this:IP1' and @property='person:additionalInformationIP']/text()"
          />
        </span>
      </p>
    </xsl:if>

    <xsl:if test="$updates//*[@about='this:signatory-1' and @property='foaf:name']/text() != ''">
      <p>
        <span about="this:signatory-1" property="foaf:name" typeof="person:Person"
          datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:signatory-1' and @property='foaf:name']/text()"/>
        </span>
        <xsl:if
          test="$updates//*[@about='this:role-signatory-1' and @property='person:roleName']/text() != ''"
          >, <span about="this:role-signatory-1" property="person:roleName" typeof="person:Role"
            datatype="xsd:string"><xsl:value-of
              select="$updates//*[@about='this:role-signatory-1' and @property='person:roleName']/text()"
            /></span></xsl:if>
      </p>
    </xsl:if>

    <xsl:variable name="dateAuthorisationSigned">
      <xsl:value-of
        select="$updates//*[@about='this:authoriser-1' and @property='gaz:dateAuthorisationSigned']/text()"
      />
    </xsl:variable>

    <xsl:if
      test="$updates//*[@about='this:authoriser-1' and @property='gaz:dateAuthorisationSigned']/text() != ''">
      <p>
        <span about="this:authoriser-1" property="gaz:dateAuthorisationSigned" datatype="xsd:date"
          content="{$dateAuthorisationSigned}">
          <xsl:value-of
            select="format-date(xs:date($dateAuthorisationSigned), '[D01] [MNn] [Y0001]')"/>
        </span>
      </p>
    </xsl:if>

  </xsl:template>

  <xsl:template name="boilerPlateText2443">
    <xsl:param name="updates"/>
    <h3 about="this:company-1" property="gazorg:name" datatype="xsd:string">
      <xsl:value-of
        select="upper-case($updates//*[@about='this:company-1' and @property='gazorg:name']/text())"
      />
    </h3>

    <p>(Company Number <span about="this:company-1" property="gazorg:companyNumber"
        datatype="xsd:string" >
        <xsl:value-of
          select="$updates//*[@about='this:company-1' and @property='gazorg:companyNumber']/text()"
        />
      </span><xsl:text>)</xsl:text>
    </p>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:previousCompanyName']/text() != ''">
      <p>(previously <span about="this:company-1" property="gazorg:previousCompanyName"
          datatype="xsd:string" >
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:previousCompanyName']/text()"
          />
        </span><xsl:text>)</xsl:text></p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:tradingAs']/text() != ''">
      <p> (t/a <span about="this:company-1" property="gazorg:tradingAs" datatype="xsd:string"
          >
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:tradingAs']/text()"/>
        </span><xsl:text>)</xsl:text></p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:previouslyTradingAs']/text() != ''">
      <p>(previously t/a <span about="this:company-1" property="gazorg:previouslyTradingAs"
          datatype="xsd:string" >
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:previouslyTradingAs']/text()"
          />
        </span>)</p>
    </xsl:if>
    <p>Registered Office: <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:company-registered-office-1'"/>
      </xsl:call-template>
    </p>

    <xsl:if
      test="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:country']/text() != ''">
      <p>(Previous Registered Office: <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:company-previous-registered-office-1'"/>
        </xsl:call-template>) </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:country']/text() != ''">
      <p>(Principal Trading Address: <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:company-principal-trading-address-1'"/>
        </xsl:call-template>) </p>
    </xsl:if>

    <xsl:if
      test="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:street-address']/text() != ''">
      <p>(Previous Trading Address: <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:previous-trading-address-1'"/>
        </xsl:call-template>) </p>
    </xsl:if>

    <p>Nature of Business: <span about="this:company-1" property="gazorg:natureOfBusiness"
        datatype="xsd:string" data-recommended="true">
        <xsl:value-of
          select="$updates//*[@about='this:company-1' and @property='gazorg:natureOfBusiness']/text()"
        />
      </span>
    </p>
    <p>Type of Liquidation: <span about="this:notifiableThing"
        property="corp-insolvency:typeOfLiquidation" datatype="xsd:string"><xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:typeOfLiquidation']/text()"
        /></span>
    </p>


    <p>Liquidator's Name(s) and Address: <span about="this:IP1" property="foaf:name"
        datatype="xsd:string">
        <xsl:value-of select="$updates//*[@about='this:IP1' and @property='foaf:name']/text()"/>
      </span>
      <xsl:if test="$updates//*[@about='this:IP2' and @property='foaf:name']/text() != ''"> and
          <span about="this:IP2" property="foaf:name" datatype="xsd:string">
          <xsl:value-of select="$updates//*[@about='this:IP2' and @property='foaf:name']/text()"/>
        </span>
      </xsl:if> of <span about="this:IP-company-1" property="gazorg:name" datatype="xsd:string">
        <xsl:value-of
          select="upper-case($updates//*[@about='this:IP-company-1' and @property='gazorg:name']/text())"
        />
      </span>, <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:IP1-address-1'"/>
      </xsl:call-template>
      <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != ''">
        <xsl:text>Telephone: </xsl:text><span about="this:IP1" property="gaz:telephone"
          datatype="xsd:string">
          <xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:telephone']/text()"
          />
        </span></xsl:if>
      <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:fax']/text() != ''">
        <xsl:if
          test="$updates//*[@about='this:IP1-address-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:country']/text() != '' or $updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != ''"
          >, </xsl:if>
        <xsl:text> Fax: </xsl:text>
        <span about="this:IP1" property="gaz:fax" datatype="xsd:string">
          <xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:fax']/text()"/>
        </span></xsl:if>
      <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:email']/text() != ''">
        <xsl:if
          test="$updates//*[@about='this:IP1-address-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:IP1-address-1' and @property='vcard:country']/text() != '' or $updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != '' or $updates//*[@about='this:IP1' and @property='gaz:fax']/text() != ''"
          >, </xsl:if>
        <xsl:text> Email: </xsl:text>
        <span about="this:IP1" property="gaz:email" datatype="xsd:string">
          <xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:email']/text()"/>
        </span>
      </xsl:if>
      <xsl:if
        test="$updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text() != ''"
        > (Ref: <span about="this:IP1" property="person:hasIPReferenceNumber" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text()"
          />) </span></xsl:if>
    </p>
    <p>Office Holder Number(s): <span about="this:IP1" property="person:hasIPnum"
        datatype="xsd:string"><xsl:value-of
          select="$updates//*[@about='this:IP1' and @property='person:hasIPnum']/text()"/></span>
      <xsl:if test="$updates//*[@about='this:IP2' and @property='person:hasIPnum']/text() != ''">
        and <span about="this:IP2" property="person:hasIPnum" datatype="xsd:string"><xsl:value-of
            select="$updates//*[@about='this:IP2' and @property='person:hasIPnum']/text()"/></span>
      </xsl:if>
    </p>
    <p> Date of appointment: <xsl:variable name="dateOfAppointment">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateOfAppointment']/text()"
        />
      </xsl:variable>
      <span about="this:notifiableThing" property="corp-insolvency:dateOfAppointment"
        datatype="xsd:date" content="{$dateOfAppointment}"><xsl:value-of
          select="format-date(xs:date($dateOfAppointment), '[FNn] [D01] [MNn] [Y0001]')"/></span>
    </p>

    <p>By whom Appointed: <span about="this:notifiableThing" property="corp-insolvency:hasAppointer"
          ><xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:hasAppointer']/text()"
        /></span>
    </p>

    <xsl:if
      test="$updates//*[@about='this:IP1' and @property='person:additionalInformationIP']/text() != ''">
      <p>
        <span about="this:IP1" property="person:additionalInformationIP">
          <xsl:value-of
            select="$updates//*[@about='this:IP1' and @property='person:additionalInformationIP']/text()"
          />
        </span>
      </p>
    </xsl:if>

    <xsl:if test="$updates//*[@about='this:signatory-1' and @property='foaf:name']/text() != ''">
      <p>
        <span about="this:signatory-1" property="foaf:name" typeof="person:Person"
          datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:signatory-1' and @property='foaf:name']/text()"/>
        </span>
        <xsl:if
          test="$updates//*[@about='this:role-signatory-1' and @property='person:roleName']/text() != ''"
          >, <span about="this:role-signatory-1" property="person:roleName" typeof="person:Role"
            datatype="xsd:string"><xsl:value-of
              select="$updates//*[@about='this:role-signatory-1' and @property='person:roleName']/text()"
            /></span></xsl:if>
      </p>
    </xsl:if>

    <xsl:variable name="dateAuthorisationSigned">
      <xsl:value-of
        select="$updates//*[@about='this:authoriser-1' and @property='gaz:dateAuthorisationSigned']/text()"
      />
    </xsl:variable>

    <xsl:if
      test="$updates//*[@about='this:authoriser-1' and @property='gaz:dateAuthorisationSigned']/text() != ''">
      <p>
        <span about="this:authoriser-1" property="gaz:dateAuthorisationSigned" datatype="xsd:date"
          content="{$dateAuthorisationSigned}">
          <xsl:value-of
            select="format-date(xs:date($dateAuthorisationSigned), '[FNn] [D01] [MNn] [Y0001]')"/>
        </span>
      </p>
    </xsl:if>
  </xsl:template>

  <xsl:template name="boilerPlateText2445">
    <xsl:param name="updates"/>
    <span about="this:legislation-1" property="legislation:legislationTitle">
      <xsl:value-of
        select="$updates//*[@about='this:legislation-1' and @property='legislation:legislationTitle']/text()"
      />
    </span>
    <h3 about="this:company-1" property="gazorg:name" datatype="xsd:string">
      <xsl:value-of
        select="upper-case($updates//*[@about='this:company-1' and @property='gazorg:name']/text())"
      />
    </h3>
    <p>
      <xsl:text>(Company Number </xsl:text>
      <span about="this:company-1" property="gazorg:companyNumber" datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:company-1' and @property='gazorg:companyNumber']/text()"
        />
      </span>
      <xsl:text>)</xsl:text>
    </p>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:previousCompanyName']/text() != ''">
      <p>
        <xsl:text>(previously </xsl:text>
        <span about="this:company-1" property="gazorg:previousCompanyName" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:previousCompanyName']/text()"
          />
        </span>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:tradingAs']/text() != ''">
      <p>
        <xsl:text> (t/a </xsl:text>
        <span about="this:company-1" property="gazorg:tradingAs" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:tradingAs']/text()"/>
        </span>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:previouslyTradingAs']/text() != ''">
      <p>
        <xsl:text>(previously t/a </xsl:text>
        <span about="this:company-1" property="gazorg:previouslyTradingAs" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:previouslyTradingAs']/text()"
          />
        </span>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>
    <p>
      <xsl:text>Registered Office: </xsl:text>
      <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:company-registered-office-1'"/>
      </xsl:call-template>
    </p>
    <xsl:if
      test="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:country']/text() != ''">
      <p>
        <xsl:text>(Previous Registered Office: </xsl:text>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:company-previous-registered-office-1'"/>
        </xsl:call-template>
        <xsl:text>) </xsl:text>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:country']/text() != ''">
      <p>
        <xsl:text>(Principal Trading Address: </xsl:text>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:company-principal-trading-address-1'"/>
        </xsl:call-template>
        <xsl:text>) </xsl:text>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:street-address']/text() != ''">
      <p>
        <xsl:text>(Previous Trading Address: </xsl:text>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:previous-trading-address-1'"/>
        </xsl:call-template>
        <xsl:text>) </xsl:text>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:natureOfBusiness']/text() != ''">
      <p>
        <xsl:text>Nature of Business: </xsl:text>
        <span about="this:company-1" property="gazorg:natureOfBusiness" datatype="xsd:string"
          data-recommended="true">
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:natureOfBusiness']/text()"
          />
        </span>
      </p>
    </xsl:if>
    <p>
      <xsl:text>Notice is hereby given, pursuant to </xsl:text>
      <span about="this:legislation-1" property="legislation:legislationSection">
        <xsl:value-of
          select="$updates//*[@about='this:legislation-1' and @property='legislation:legislationSection']/text()"
        />
      </span>
      <xsl:text> of the </xsl:text>
      <span about="this:legislation-1" property="legislation:legislationTitle">
        <xsl:value-of
          select="$updates//*[@about='this:legislation-1' and @property='legislation:legislationTitle']/text()"
        />
      </span>
    </p>
    <p>
      <xsl:text>that final meetings of members and creditors of the above named Company will be held at </xsl:text>
      <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:meetingAddress-1'"/>
      </xsl:call-template>
      <xsl:variable name="corpInsolvencyMeetingDate">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:meetingTime'][1]/text()"
        />
      </xsl:variable>
      <xsl:variable name="corpInsolvencyMeetingTime">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:meetingTimeWITHtime'][1]/text()"
        />
      </xsl:variable>
      <xsl:variable name="corpInsolvencyMeetingTime2">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:meetingTime2WITHtime'][1]/text()"
        />
      </xsl:variable>
      <xsl:variable name="corpInsolvencyMeetingDateAndTime">
        <xsl:value-of
          select="concat($corpInsolvencyMeetingDate,'T',$corpInsolvencyMeetingTime,':00')"/>
      </xsl:variable>
      <xsl:variable name="corpInsolvencyMeeting2DateAndTime">
        <xsl:value-of
          select="concat($corpInsolvencyMeetingDate,'T',$corpInsolvencyMeetingTime2,':00')"/>
      </xsl:variable>
      <xsl:text> on </xsl:text>
      <span about="this:notifiableThing" property="corp-insolvency:meetingTime"
        datatype="xsd:dateTime" content="{$corpInsolvencyMeetingDateAndTime}">
        <xsl:value-of
          select="format-date(xs:date($corpInsolvencyMeetingDate), '[FNn] [D01] [MNn] [Y0001]')"/>
      </span>
      <xsl:text> at </xsl:text>
      <xsl:value-of select="$corpInsolvencyMeetingTime"/>
      <xsl:if
        test="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:meetingIsFor']">
        <xsl:text> for </xsl:text>
        <span about="this:notifiableThing" property="corp-insolvency:meetingIsFor">
          <xsl:value-of
            select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:meetingIsFor']/text()"
          />
        </span>
      </xsl:if>
      <xsl:if test="$corpInsolvencyMeetingTime2 != ''">
        <xsl:text> and </xsl:text>
        <span about="this:notifiableThing" property="corp-insolvency:meetingTime2"
          datatype="xsd:dateTime" content="{$corpInsolvencyMeeting2DateAndTime}">
          <xsl:value-of select="$corpInsolvencyMeetingTime2"/>
        </span>
      </xsl:if>
      <xsl:if
        test="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:meeting2IsFor']">
        <xsl:text> for </xsl:text>
        <span about="this:notifiableThing" property="corp-insolvency:meeting2IsFor"
          datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:meeting2IsFor']/text()"
          />
        </span>
      </xsl:if>
      <xsl:text>, for the purpose of having an account laid before them showing the manner in which the winding-up has been conducted and the property of the Company disposed of and of hearing any explanation that may be given by the Liquidator and also of determining the manner in which the books, accounts and documents of the Company and of the Liquidator shall be disposed of.</xsl:text>
    </p>
    <p>
      <xsl:text>A member or creditor entitled to attend and vote is entitled to appoint a proxy to attend and vote instead of him and such proxy need not also be a member or creditor. Proxy forms must be returned to the offices of </xsl:text>
      <span about="this:IP-company-1" property="gazorg:name" datatype="xsd:string">
        <xsl:value-of
          select="upper-case($updates//*[@about='this:IP-company-1' and @property='gazorg:name']/text())"
        />
      </span>
      <xsl:text> at </xsl:text>
      <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:IP1-address-1'"/>
      </xsl:call-template>
      <xsl:text> , no later than 12 noon on the business day before the meeting. </xsl:text>
    </p>
    <p>
      <span about="this:IP1" property="foaf:name" datatype="xsd:string"
        typeof="person:InsolvencyPractitioner">
        <xsl:value-of select="$updates//*[@about='this:IP1' and @property='foaf:name']/text()"/>
      </span>
      <xsl:text>, </xsl:text>
      <span about="this:IP1" property="person:hasIPCapacity" datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:IP1' and @property='person:hasIPCapacity']/text()"/>
      </span>
      <xsl:text> (IP number </xsl:text>
      <span about="this:IP1" property="person:hasIPnum" datatype="xsd:string">
        <xsl:value-of select="$updates//*[@about='this:IP1' and @property='person:hasIPnum']/text()"
        />
      </span>
      <xsl:text>)</xsl:text>
      <xsl:if test="$updates//*[@about='this:IP2' and @property='foaf:name']/text() != ''">
        <xsl:text> and</xsl:text>
        <span about="this:IP2" property="foaf:name" datatype="xsd:string">
          <xsl:value-of select="$updates//*[@about='this:IP2' and @property='foaf:name']/text()"/>
        </span>
        <xsl:if
          test="$updates//*[@about='this:IP2' and @property='person:hasIPCapacity']/text() != ''">
          <xsl:text>,</xsl:text>
        </xsl:if>
      </xsl:if>
      <xsl:if
        test="$updates//*[@about='this:IP2' and @property='person:hasIPCapacity']/text() != ''">
        <span about="this:IP2" property="person:hasIPCapacity" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:IP2' and @property='person:hasIPCapacity']/text()"/>
        </span>
      </xsl:if>
      <xsl:if test="$updates//*[@about='this:IP2' and @property='person:hasIPnum']/text() != ''">
        <xsl:text>(IP number </xsl:text>
        <span about="this:IP2" property="person:hasIPnum" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:IP2' and @property='person:hasIPnum']/text()"/>
        </span>
        <xsl:text>)</xsl:text>
      </xsl:if>
      <xsl:text> of </xsl:text>
      <span about="this:IP-company-1" property="gazorg:name" typeof="gazorg:ForProfitOrganisation"
        datatype="xsd:string">
        <xsl:value-of
          select="upper-case($updates//*[@about='this:IP-company-1' and @property='gazorg:name']/text())"
        />
      </span>
      <xsl:text> at </xsl:text>
      <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:IP1-address-1'"/>
      </xsl:call-template>
    </p>
    <p>
      <xsl:if
        test="$updates//*[@about='this:IP1' and @property='person:additionalContactName']/text() != ''">
        <xsl:text>For Further details contact: </xsl:text>
        <span about="this:IP1" property="person:additionalContactName">
          <xsl:value-of
            select="$updates//*[@about='this:IP1' and @property='person:additionalContactName']/text()"
          />
        </span>
      </xsl:if>
      <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != ''">
        <xsl:if
          test="$updates//*[@about='this:IP1' and @property='person:additionalContactName']/text() != ''">
          <xsl:text>, </xsl:text>
        </xsl:if>
        <xsl:text> Telephone number: </xsl:text>
        <span about="this:IP1" property="gaz:telephone" datatype="xsd:string">
          <xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:telephone']/text()"
          />
        </span>
      </xsl:if>
      <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:fax']/text() != ''">
        <xsl:if
          test="$updates//*[@about='this:IP1' and @property='person:additionalContactName']/text() != '' or $updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != ''">
          <xsl:text>, </xsl:text>
        </xsl:if>
        <xsl:text> Fax: </xsl:text>
        <span about="this:IP1" property="gaz:fax" datatype="xsd:string">
          <xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:fax']/text()"/>
        </span>
      </xsl:if>
      <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:email']/text() != ''">
        <xsl:if
          test="$updates//*[@about='this:IP1' and @property='person:additionalContactName']/text() != '' or $updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != '' or $updates//*[@about='this:IP1' and @property='gaz:fax']/text() != ''">
          <xsl:text>, </xsl:text>
        </xsl:if>
        <xsl:text> Email: </xsl:text>
        <span about="this:IP1" property="gaz:email" datatype="xsd:string">
          <xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:email']/text()"/>
        </span>
      </xsl:if>
      <xsl:if
        test="$updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text() != ''">
        <xsl:text> (Ref: </xsl:text>
        <span about="this:IP1" property="person:hasIPReferenceNumber" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text()"
          />
        </span>
        <xsl:text>)</xsl:text>
      </xsl:if>
    </p>
    <xsl:if
      test="$updates//*[@about='this:IP1' and @property='person:additionalInformationIP']/text() != ''">
      <p>
        <span about="this:IP1" property="person:additionalInformationIP">
          <xsl:value-of
            select="$updates//*[@about='this:IP1' and @property='person:additionalInformationIP']/text()"
          />
        </span>
      </p>
    </xsl:if>
    <xsl:if test="$updates//*[@about='this:signatory-1' and @property='foaf:name']/text() != ''">
      <p>
        <span about="this:signatory-1" property="foaf:name" typeof="person:Person"
          datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:signatory-1' and @property='foaf:name']/text()"/>
        </span>
        <xsl:if
          test="$updates//*[@about='this:role-signatory-1' and @property='person:roleName']/text() != ''">
          <xsl:text>, </xsl:text>
          <span about="this:role-signatory-1" property="person:roleName" typeof="person:Role"
            datatype="xsd:string">
            <xsl:value-of
              select="$updates//*[@about='this:role-signatory-1' and @property='person:roleName']/text()"
            />
          </span>
        </xsl:if>
      </p>
    </xsl:if>
    <xsl:variable name="dateAuthorisationSigned">
      <xsl:value-of
        select="$updates//*[@about='this:authoriser-1' and @property='gaz:dateAuthorisationSigned']/text()"
      />
    </xsl:variable>
    <xsl:if
      test="$updates//*[@about='this:authoriser-1' and @property='gaz:dateAuthorisationSigned']/text() != ''">
      <p>
        <span about="this:authoriser-1" property="gaz:dateAuthorisationSigned" datatype="xsd:date"
          content="{$dateAuthorisationSigned}">
          <xsl:value-of
            select="format-date(xs:date($dateAuthorisationSigned), '[D01] [MNn] [Y0001]')"/>
        </span>
      </p>
    </xsl:if>
  </xsl:template>

  <xsl:template name="boilerPlateText2446">
    <xsl:param name="updates"/>
    <h3 about="this:company-1" property="gazorg:name" datatype="xsd:string">
      <xsl:value-of
        select="upper-case($updates//*[@about='this:company-1' and @property='gazorg:name']/text())"
      />
    </h3>
    <p>
      <xsl:text>(Company Number </xsl:text>
      <span about="this:company-1" property="gazorg:companyNumber" datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:company-1' and @property='gazorg:companyNumber']/text()"
        />
      </span>
      <xsl:text>)</xsl:text>
    </p>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:previousCompanyName']/text() != ''">
      <p>
        <xsl:text>(previously </xsl:text>
        <span about="this:company-1" property="gazorg:previousCompanyName" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:previousCompanyName']/text()"
          />
        </span>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:tradingAs']/text() != ''">
      <p>
        <xsl:text>(t/a </xsl:text>
        <span about="this:company-1" property="gazorg:tradingAs" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:tradingAs']/text()"/>
        </span>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:previouslyTradingAs']/text() != ''">
      <p>
        <xsl:text>(previously t/a </xsl:text>
        <span about="this:company-1" property="gazorg:previouslyTradingAs" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:previouslyTradingAs']/text()"
          />
        </span>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>
    <p>
      <xsl:text>Registered Office: </xsl:text>
      <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:company-registered-office-1'"/>
      </xsl:call-template>
    </p>
    <xsl:if
      test="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:country']/text() != ''">
      <p>
        <xsl:text>(Previous Registered Office: </xsl:text>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:company-previous-registered-office-1'"/>
        </xsl:call-template>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:street-address']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:extended-address']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:locality']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:region']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:postal-code']/text() != '' or $updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:country']/text() != ''">
      <p>
        <xsl:text>(Principal Trading Address: </xsl:text>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:company-principal-trading-address-1'"/>
        </xsl:call-template>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:street-address']/text() != ''">
      <p>
        <xsl:text>(Previous Trading Address: </xsl:text>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:previous-trading-address-1'"/>
        </xsl:call-template>
        <xsl:text>)</xsl:text>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:company-1' and @property='gazorg:natureOfBusiness']/text() != ''">
      <p>
        <xsl:text>Nature of Business: </xsl:text>
        <span about="this:company-1" property="gazorg:natureOfBusiness" datatype="xsd:string"
          data-recommended="true">
          <xsl:value-of
            select="$updates//*[@about='this:company-1' and @property='gazorg:natureOfBusiness']/text()"
          />
        </span>
      </p>
    </xsl:if>
    <p>
      <xsl:text>Notice is hereby given that the creditors of the above named Company, which is being voluntarily wound up, are invited to prove their debts on or before </xsl:text>
      <xsl:variable name="dateOnOrBeforeClaimSubmit">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:onOrBeforeClaimSubmit']/text()"
        />
      </xsl:variable>
      <span about="this:notifiableThing" property="corp-insolvency:onOrBeforeClaimSubmit"
        datatype="xsd:date" content="{$dateOnOrBeforeClaimSubmit}">
        <xsl:value-of
          select="format-date(xs:date($dateOnOrBeforeClaimSubmit), '[FNn] [D01] [MNn] [Y0001]')"/>
      </span>
      <xsl:text>, by sending their names and addresses along with descriptions and full particulars of their debts or claims and the names and addresses of their solicitors (if any),
      to </xsl:text>
      <span about="this:IP1" property="foaf:name" datatype="xsd:string"
        typeof="person:InsolvencyPractitioner">
        <xsl:value-of select="$updates//*[@about='this:IP1' and @property='foaf:name']/text()"/>
      </span>
      <xsl:if test="$updates//*[@about='this:IP2' and @property='foaf:name']/text() != ''">
        <xsl:text> and</xsl:text>
        <span about="this:IP2" property="foaf:name" datatype="xsd:string"
          typeof="person:InsolvencyPractitioner">
          <xsl:value-of select="$updates//*[@about='this:IP2' and @property='foaf:name']/text()"/>
        </span>
      </xsl:if>
      <xsl:text> , (IP number</xsl:text>
      <xsl:if test="$updates//*[@about='this:IP2' and @property='foaf:name']/text() != ''">
        <xsl:text>(s)</xsl:text>
      </xsl:if>
      <span about="this:IP1" property="person:hasIPnum" datatype="xsd:string">
        <!--<xsl:if test="not($updates//*[@about='this:IP2' and @property='person:hasIPnum']/text())">
          <xsl:attribute name="style">margin-right:-4px;</xsl:attribute>
        </xsl:if>-->
        <xsl:text> </xsl:text>
        <xsl:value-of select="$updates//*[@about='this:IP1' and @property='person:hasIPnum']/text()"
        />
      </span>
      <xsl:if test="$updates//*[@about='this:IP2' and @property='person:hasIPnum']/text() != ''">
        <xsl:text>and </xsl:text>
        <span about="this:IP2" property="person:hasIPnum" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:IP2' and @property='person:hasIPnum']/text()"/>
        </span>
      </xsl:if>
      <xsl:text>) </xsl:text>
      <span about="this:IP-company-1" property="gazorg:name" datatype="xsd:string">
        <xsl:value-of
          select="upper-case($updates//*[@about='this:IP-company-1' and @property='gazorg:name']/text())"
        />
      </span>
      <xsl:text>, </xsl:text>
      <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:IP1-address-1'"/>
      </xsl:call-template>
      <xsl:text> and, if so required by notice in writing from the Liquidator</xsl:text>
      <xsl:if test="$updates//*[@about='this:IP2' and @property='foaf:name']/text() != ''">
        <xsl:text>(s)</xsl:text>
      </xsl:if>
      <xsl:text> of the Company or by the Solicitors of the Liquidator</xsl:text>
      <xsl:if test="$updates//*[@about='this:IP2' and @property='foaf:name']/text() != ''">
        <xsl:text>(s)</xsl:text>
      </xsl:if>
      <xsl:text>, to come in and prove their debts or claims, or in default thereof they will be excluded from the benefit of any distribution made before such debts or claims are proved. No further public advertisement of invitation to prove debts will be given.</xsl:text>
    </p>
    <p>
      <xsl:text>Date of appointment: </xsl:text>
      <xsl:variable name="dateOfAppointment">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateOfAppointment']/text()"
        />
      </xsl:variable>
      <span about="this:notifiableThing" property="corp-insolvency:dateOfAppointment"
        datatype="xsd:date" content="{$dateOfAppointment}">
        <xsl:value-of select="format-date(xs:date($dateOfAppointment), '[FNn] [D01] [MNn] [Y0001]')"
        />
      </span>
    </p>
    <p>
      <xsl:text>Further details contact: </xsl:text>
      <span about="this:IP1" property="person:additionalContactName" datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:IP1' and @property='person:additionalContactName']/text()"
        />
      </span>
      <xsl:text>, </xsl:text>
      <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != ''">
        <xsl:text> Telephone number: </xsl:text>
        <span about="this:IP1" property="gaz:telephone" datatype="xsd:string">
          <xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:telephone']/text()"
          />
        </span>
        <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:fax']/text() != ''">
        <xsl:text> Fax: </xsl:text>
        <span about="this:IP1" property="gaz:fax" datatype="xsd:string">
          <xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:fax']/text()"/>
        </span>
        <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:email']/text() != ''">
        <xsl:text>Email: </xsl:text>
        <span about="this:IP1" property="gaz:email" datatype="xsd:string">
          <xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:email']/text()"/>
        </span>
      </xsl:if>
      <xsl:if
        test="$updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text() != ''">
        <xsl:text> (Ref: </xsl:text>
        <span about="this:IP1" property="person:hasIPReferenceNumber" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text()"
          /></span>)</xsl:if>
    </p>
    <xsl:if
      test="$updates//*[@about='this:IP1' and @property='person:additionalInformationIP']/text() != ''">
      <p>
        <span about="this:IP1" property="person:additionalInformationIP">
          <xsl:value-of
            select="$updates//*[@about='this:IP1' and @property='person:additionalInformationIP']/text()"
          />
        </span>
      </p>
    </xsl:if>
    <xsl:if test="$updates//*[@about='this:signatory-1' and @property='foaf:name']/text() != ''">
      <p>
        <span about="this:signatory-1" property="foaf:name" typeof="person:Person"
          datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:signatory-1' and @property='foaf:name']/text()"/>
        </span>
        <xsl:if
          test="$updates//*[@about='this:role-signatory-1' and @property='person:roleName']/text() != ''"
          >, <span about="this:role-signatory-1" property="person:roleName" typeof="person:Role"
            datatype="xsd:string"><xsl:value-of
              select="$updates//*[@about='this:role-signatory-1' and @property='person:roleName']/text()"
            /></span></xsl:if>
      </p>
    </xsl:if>
    <xsl:variable name="dateAuthorisationSigned">
      <xsl:value-of
        select="$updates//*[@about='this:authoriser-1' and @property='gaz:dateAuthorisationSigned']/text()"
      />
    </xsl:variable>
    <xsl:if
      test="$updates//*[@about='this:authoriser-1' and @property='gaz:dateAuthorisationSigned']/text() != ''">
      <p>
        <span about="this:authoriser-1" property="gaz:dateAuthorisationSigned" datatype="xsd:date"
          content="{$dateAuthorisationSigned}">
          <xsl:value-of
            select="format-date(xs:date($dateAuthorisationSigned), '[FNn] [D01] [MNn] [Y0001]')"/>
        </span>
      </p>
    </xsl:if>
  </xsl:template>

  <xsl:template name="boilerPlateText2509">
    <xsl:param name="updates"/>
    <p>
      <xsl:text>In the </xsl:text>
      <span about="this:court-1" property="court:courtName" datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:court-1' and @property='court:courtName']/text()"/>
      </span>
      <xsl:text>, </xsl:text>
      <span about="this:court-1" property="court:courtDistrict" datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:court-1' and @property='court:courtDistrict']/text()"/>
      </span>
      <xsl:text> No </xsl:text>
      <span about="this:court-case-1" property="court:caseNumber" datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:court-case-1' and @property='court:caseNumber']/text()"/>
      </span>
      <xsl:text> of </xsl:text>
      <span about="this:court-case-1" property="court:caseYear" datatype="xsd:gYear">
        <xsl:value-of
          select="$updates//*[@about='this:court-case-1' and @property='court:caseYear']/text()"/>
      </span>
    </p>
    <p>
      <h3>
        <span about="this:person-1" property="foaf:firstName">
          <xsl:value-of
            select="$updates//*[@about='this:person-1' and @property='foaf:firstName']/text()"/>
        </span>
        <span about="this:person-1" property="foaf:givenName">
          <xsl:value-of
            select="$updates//*[@about='this:person-1' and @property='foaf:givenName']/text()"/>
        </span>
        <span about="this:person-1" property="foaf:familyName">
          <xsl:value-of
            select="$updates//*[@about='this:person-1' and @property='foaf:familyName']/text()"/>
        </span>
      </h3>
    </p>
    <p>
      <xsl:variable name="bankruptcyStatus">
        <xsl:choose>
          <xsl:when
            test="$updates//*[@about='this:person-1' and @property='person:bankruptcyStatus']/text() = 'inBankruptcy'">
            <xsl:text>(In Bankruptcy)</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>(Formerly In Bankruptcy)</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:if
        test="$updates//*[@about='this:person-1' and @property='person:isDeceased']/text() = 'yes'">
        <xsl:text>(The bankrupt person is deceased)</xsl:text>
      </xsl:if>
      <xsl:value-of select="$bankruptcyStatus"/>
    </p>
    <xsl:if
      test="$updates//*[@about='this:person-1' and @property='person:alsoKnownAs']/text() != ''">
      <p>
        <xsl:text>Previous name/any other name/also known as name: </xsl:text>
        <span about="this:person-1" property="person:alsoKnownAs" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:person-1' and @property='person:alsoKnownAs']/text()"/>
        </span>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:person-address-1' and @property='vcard:street-address']/text() != ''">
      <p>
        <xsl:value-of
          select="$updates//*[@about='this:person-1' and @property='corp-insolvency:addressType']/text()"/>
        <xsl:text>: </xsl:text>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:person-address-1'"/>
        </xsl:call-template>
        <xsl:text>. </xsl:text>
        <xsl:variable name="dateOfBirth">
          <xsl:value-of
            select="$updates//*[@about='this:person-1' and @property='person:dateOfBirth']/text()"/>
        </xsl:variable>
        <xsl:if
          test="$updates//*[@about='this:person-1' and @property='person:dateOfBirth']/text() != ''">
          <xsl:text>Date of Birth: </xsl:text>
          <span about="this:person-1" property="person:dateOfBirth" datatype="xsd:date"
            content="{$dateOfBirth}">
            <xsl:value-of select="format-date(xs:date($dateOfBirth), '[FNn] [D01] [MNn] [Y0001]')"/>
          </span>
          <xsl:text>. </xsl:text>
        </xsl:if>
        <xsl:if
          test="$updates//*[@about='this:occupation' and @property='person:jobTitle']/text() != ''">
          <xsl:text>Occupation: </xsl:text>
          <span about="this:occupation" property="person:jobTitle">
            <xsl:value-of
              select="$updates//*[@about='this:occupation' and @property='person:jobTitle']/text()"
            />
          </span>
          <xsl:text>.</xsl:text>
        </xsl:if>
      </p>
    </xsl:if>
    <xsl:variable name="dateOfBankruptcyOrder">
      <xsl:value-of
        select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateOfBankruptcyOrder']/text()"
      />
    </xsl:variable>
    <xsl:if
      test="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateOfBankruptcyOrder']/text() != ''">
      <p>
        <xsl:text>Bankruptcy Order date: </xsl:text>
        <span about="this:notifiableThing" property="corp-insolvency:dateOfBankruptcyOrder"
          datatype="xsd:dateTime" content="{concat($dateOfBankruptcyOrder,'T00:00:00')}">
          <xsl:value-of
            select="format-date(xs:date($dateOfBankruptcyOrder), '[FNn] [D01] [MNn] [Y0001]')"/>
        </span>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:person-1' and @property='person:isTradingAs']/text() != ''">
      <p>
        <xsl:text>Trading as: </xsl:text>
        <span about="this:person-1" property="person:isTradingAs">
          <xsl:value-of
            select="$updates//*[@about='this:person-1' and @property='person:isTradingAs']/text()"/>
        </span>
        <xsl:text> of </xsl:text>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:person-principal-trading-address-1'"/>
        </xsl:call-template>
      </p>
    </xsl:if>
    <p>
      <span about="this:notifiableThing" property="gaz:hasNoticeDetails">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='gaz:hasNoticeDetails']/text()"
        />
      </span>
    </p>
    <xsl:variable name="onOrBeforeClaimSubmit">
      <xsl:value-of
        select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:onOrBeforeClaimSubmit']/text()"
      />
    </xsl:variable>
    <p>
      <span about="this:notifiableThing" property="corp-insolvency:onOrBeforeClaimSubmit"
        datatype="xsd:date" content="{$onOrBeforeClaimSubmit}">
        <xsl:value-of
          select="format-date(xs:date($onOrBeforeClaimSubmit), '[FNn] [D01] [MNn] [Y0001]')"/>
      </span>
    </p>
    <p>
      <span about="this:IP1" property="foaf:name">
        <xsl:value-of select="$updates//*[@about='this:IP1' and @property='foaf:name']/text()"/>
      </span>
      <xsl:text>, (IP number </xsl:text>
      <span about="this:IP1" property="person:hasIPnum">
        <xsl:value-of select="$updates//*[@about='this:IP1' and @property='person:hasIPnum']/text()"
        />
      </span>
      <xsl:text>), </xsl:text>
      <span about="this:IP1" property="person:hasIPCapacity">
        <xsl:value-of
          select="$updates//*[@about='this:IP1' and @property='person:hasIPCapacity']/text()"/>
      </span>
      <xsl:text>, </xsl:text>
      <span about="this:IP-company-1" property="gazorg:name">
        <xsl:value-of
          select="upper-case($updates//*[@about='this:IP-company-1' and @property='gazorg:name']/text())"
        />
      </span>
      <xsl:text>, </xsl:text>
      <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:IP1-address-1'"/>
      </xsl:call-template>
      <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != ''">
        <xsl:text>, Telephone number: </xsl:text>
        <span about="this:IP1" property="gaz:telephone" datatype="xsd:string">
          <xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:telephone']/text()"
          />
        </span>
        <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:fax']/text() != ''">
        <xsl:text> Fax: </xsl:text>
        <span about="this:IP1" property="gaz:fax" datatype="xsd:string">
          <xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:fax']/text()"/>
        </span>
        <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:email']/text() != ''">
        <xsl:text> Email: </xsl:text>
        <span about="this:IP1" property="gaz:email" datatype="xsd:string">
          <xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:email']/text()"/>
        </span>
      </xsl:if>
      <xsl:if
        test="$updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text() != ''">
        <xsl:text> (Ref: </xsl:text>
        <span about="this:IP1" property="person:hasIPReferenceNumber" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text()"
          />
        </span>
        <xsl:text>)</xsl:text>
      </xsl:if>
    </p>
    <xsl:if
      test="$updates//*[@about='this:IP1' and @property='person:additionalInformationIP']/text() != ''">
      <p>
        <span about="this:IP1" property="person:additionalInformationIP">
          <xsl:value-of
            select="$updates//*[@about='this:IP1' and @property='person:additionalInformationIP']/text()"
          />
        </span>
      </p>
    </xsl:if>
    <xsl:if test="$updates//*[@about='this:signatory-1' and @property='foaf:name']/text() != ''">
      <p>
        <span about="this:signatory-1" property="foaf:name" typeof="person:Person"
          datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:signatory-1' and @property='foaf:name']/text()"/>
        </span>
        <xsl:if
          test="$updates//*[@about='this:role-signatory-1' and @property='person:roleName']/text() != ''">
          <xsl:text>, </xsl:text>
          <span about="this:role-signatory-1" property="person:roleName" typeof="person:Role"
            datatype="xsd:string">
            <xsl:value-of
              select="$updates//*[@about='this:role-signatory-1' and @property='person:roleName']/text()"
            />
          </span>
        </xsl:if>
      </p>
    </xsl:if>
    <xsl:variable name="dateAuthorisationSigned">
      <xsl:value-of
        select="$updates//*[@about='this:authoriser-1' and @property='gaz:dateAuthorisationSigned']/text()"
      />
    </xsl:variable>
    <xsl:if
      test="$updates//*[@about='this:authoriser-1' and @property='gaz:dateAuthorisationSigned']/text() != ''">
      <p>
        <span about="this:authoriser-1" property="gaz:dateAuthorisationSigned" datatype="xsd:date"
          content="{$dateAuthorisationSigned}">
          <xsl:value-of
            select="format-date(xs:date($dateAuthorisationSigned), '[FNn] [D01] [MNn] [Y0001]')"/>
        </span>
      </p>
    </xsl:if>
  </xsl:template>

  <xsl:template name="boilerPlateText2518">
    <xsl:param name="updates"/>
    <p>
      <xsl:text>A Trust Deed has been granted by </xsl:text>
      <span about="this:person1" property="foaf:firstName">
        <xsl:value-of
          select="$updates//*[@about='this:person1' and @property='foaf:firstName']/text()"/>
      </span>
      <xsl:text> </xsl:text>
      <xsl:if test="$updates//*[@about='this:person1' and @property='foaf:givenName']/text() != ''">
        <span about="this:person1" property="foaf:givenName">
          <xsl:value-of
            select="$updates//*[@about='this:person1' and @property='foaf:givenName']/text()"/>
        </span>
        <xsl:text> </xsl:text>
      </xsl:if>
      <span about="this:person1" property="foaf:familyName">
        <xsl:value-of
          select="$updates//*[@about='this:person1' and @property='foaf:familyName']/text()"/>
      </span>
      <xsl:if
        test="$updates//*[@about='this:person1' and @property='person:alsoKnownAs']/text() != ''">
        <span about="this:person1" property="person:alsoKnownAs">
          <xsl:value-of
            select="$updates//*[@about='this:person1' and @property='person:alsoKnownAs']/text()"/>
        </span>
      </xsl:if>
      <xsl:text> of </xsl:text>
      <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:person1-address-1'"/>
      </xsl:call-template>
      <xsl:text> , on </xsl:text>
      <xsl:variable name="dateGranted">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateGranted']/text()"
        />
      </xsl:variable>
      <span about="this:notifiableThing" property="corp-insolvency:dateGranted" datatype="xsd:date"
        content="{$dateGranted}">
        <xsl:value-of select="format-date(xs:date($dateGranted), '[FNn] [D01] [MNn] [Y0001]')"/>
      </span>
      <xsl:text>, conveying (to the extent specified in section 5(4A) in the Bankruptcy (Scotland) Act 1985) her estate to me, </xsl:text>
      <span about="this:person2" property="foaf:firstName">
        <xsl:value-of
          select="$updates//*[@about='this:person2' and @property='foaf:firstName']/text()"/>
      </span>
      <xsl:if test="$updates//*[@about='this:person2' and @property='foaf:givenName']/text() != ''">
        <span about="this:person2" property="foaf:givenName">
          <xsl:value-of
            select="$updates//*[@about='this:person2' and @property='foaf:givenName']/text()"/>
        </span>
      </xsl:if>
      <span about="this:person2" property="foaf:familyName">
        <xsl:value-of
          select="$updates//*[@about='this:person2' and @property='foaf:familyName']/text()"/>
      </span>
      <xsl:text> of </xsl:text>
      <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:person2-address-1'"/>
      </xsl:call-template>
      <xsl:text> , as Trustee for the benefit of her Creditors generally.</xsl:text>
    </p>
    <p>
      <xsl:text>If a Creditor wishes to object to the Trust Deed for the purposes of preventing it becoming
      a Protected Trust Deed (see notes below on the objections required for that purpose)
      notification of such objection must be delivered in writing to the Trustee within 5 weeks of
      the date of the publication of this notice in </xsl:text>
      <i>The Edinburgh Gazette</i>
      <xsl:text>.</xsl:text>
    </p>
    <p>
      <xsl:text>Notes: The Trust Deed may become a Protected Trust Deed unless within the period of 5 weeks
      of the date of publication of this notice in </xsl:text>
      <i>The Edinburgh Gazette</i>
      <xsl:text> a majority in number
      or not less than one third in value of the Creditors notify the Trustee in writing that they
      object to the Trust Deed and do not wish to accede to them.</xsl:text>
    </p>
    <p>
      <xsl:text>Briefly, this has the effect of restricting the rights of non-acceding Creditors to do
      diligence (ie to enforce court decrees for unpaid debts) against the Debtor and confers
      certain protection upon the Trust Deed from being superseded by the sequestration of the
      Debtor's estate.</xsl:text>
    </p>
    <p>
      <span about="this:IP1" property="foaf:name">
        <xsl:value-of select="$updates//*[@about='this:IP1' and @property='foaf:name']/text()"/>
      </span>
      <xsl:text>, (IP number </xsl:text>
      <span about="this:IP1" property="person:hasIPnum">
        <xsl:value-of select="$updates//*[@about='this:IP1' and @property='person:hasIPnum']/text()"
        />
      </span>
      <xsl:text>), </xsl:text>
      <span about="this:IP1" property="person:hasIPCapacity">
        <xsl:value-of
          select="$updates//*[@about='this:IP1' and @property='person:hasIPCapacity']/text()"/>
      </span>
      <xsl:text>, </xsl:text>
      <span about="this:IP-company-1" property="gazorg:name">
        <xsl:value-of
          select="$updates//*[@about='this:IP-company-1' and @property='gazorg:name']/text()"/>
      </span>
      <xsl:text>, </xsl:text>
      <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:IP1-address-1'"/>
      </xsl:call-template>
      <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != ''">
        <xsl:text>, Telephone number: </xsl:text>
        <span about="this:IP1" property="gaz:telephone" datatype="xsd:string">
          <xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:telephone']/text()"
          />
        </span>
        <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:fax']/text() != ''">
        <xsl:text> Fax: </xsl:text>
        <span about="this:IP1" property="gaz:fax" datatype="xsd:string">
          <xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:fax']/text()"/>
        </span>
        <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:email']/text() != ''">
        <xsl:text> Email: </xsl:text>
        <span about="this:IP1" property="gaz:email" datatype="xsd:string">
          <xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:email']/text()"/>
        </span>
      </xsl:if>
      <xsl:if
        test="$updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text() != ''">
        <xsl:text> (Ref: </xsl:text>
        <span about="this:IP1" property="person:hasIPReferenceNumber" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text()"
          />
        </span>
        <xsl:text>)</xsl:text>
      </xsl:if>
    </p>
    <!--<xsl:variable name="IPName">
      <xsl:value-of select="$updates//*[@about='this:IP1' and @property='foaf:name']/text()"/>
    </xsl:variable>
    <span about="this:IP1" typeof="person:InsolvencyPractitioner" property="foaf:name"
      datatype="xsd:string" content="{$IPName}"/>
    <xsl:variable name="IPNum">
      <xsl:value-of select="$updates//*[@about='this:IP1' and @property='person:hasIPnum']/text()"/>
    </xsl:variable>
    <span about="this:IP1" property="person:hasIPnum" datatype="xsd:string" content="{$IPNum}"/>
    <xsl:variable name="IPCompany">
      <xsl:value-of
        select="upper-case($updates//*[@about='this:IP-company-1' and @property='gazorg:name']/text())"
      />
    </xsl:variable>
    <span about="this:IP-company-1" typeof="gazorg:ForProfitOrganisation" property="gazorg:name"
      datatype="xsd:string" content="{$IPCompany}"/>
    <xsl:call-template name="address">
      <xsl:with-param name="updates" select="$updates"/>
      <xsl:with-param name="about" select="'this:IP1-address-1'"/>
    </xsl:call-template>
    <xsl:variable name="IPCapacity">
      <xsl:value-of
        select="$updates//*[@about='this:IP1' and @property='person:hasIPCapacity']/text()"/>
    </xsl:variable>
    <span about="this:IP1" property="person:hasIPCapacity" datatype="xsd:string"
      content="{$IPCapacity}"/>-->
  </xsl:template>

  <xsl:template name="boilerPlateText1510">
    <xsl:param name="updates"/>
    <p>
      <span about="this:legislation" property="legislation:legislationTitle" datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:legislation' and @property='legislation:legislationTitle']/text()"
        />
      </span>
    </p>
    <p>
      <span about="this:authority-1" property="gazorg:name" datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:authority-1' and @property='gazorg:name']/text()"/>
      </span>
    </p>
    <p>
      <span about="this:legislation-1" property="legislation:legislationTitle" datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:legislation-1' and @property='legislation:legislationTitle']/text()"
        />
      </span>
    </p>
    <xsl:if
      test="$updates//*[@about='this:legislation-2' and @property='legislation:legislationTitle']/text() != ''">
      <p>
        <span about="this:legislation-2" property="legislation:legislationTitle"
          datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:legislation-2' and @property='legislation:legislationTitle']/text()"
          />
        </span>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:legislation-3' and @property='legislation:legislationTitle']/text() != ''">
      <p>
        <span about="this:legislation-3" property="legislation:legislationTitle"
          datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:legislation-3' and @property='legislation:legislationTitle']/text()"
          />
        </span>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:legislation-4' and @property='legislation:legislationTitle']/text() != ''">
      <p>
        <span about="this:legislation-4" property="legislation:legislationTitle"
          datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:legislation-4' and @property='legislation:legislationTitle']/text()"
          />
        </span>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:legislation-5' and @property='legislation:legislationTitle']/text() != ''">
      <p>
        <span about="this:legislation-5" property="legislation:legislationTitle"
          datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:legislation-5' and @property='legislation:legislationTitle']/text()"
          />
        </span>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:subjectElement-1' and @property='gaz:hasSubject']/text() != ''">
      <p>
        <span about="this:subjectElement-1" property="gaz:hasSubject" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:subjectElement-1' and @property='gaz:hasSubject']/text()"
          />
        </span>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:subjectElement-1' and @property='transport:hasSubheading']/text() != ''">
      <p>
        <span about="this:subjectElement-1" property="transport:hasSubheading" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:subjectElement-1' and @property='transport:hasSubheading']/text()"
          />
        </span>
      </p>
    </xsl:if>
    <p>
      <span about="this:subjectElement-1" property="gaz:hasNoticeDetails" datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:subjectElement-1' and @property='gaz:hasNoticeDetails']/text()"
        />
      </span>
    </p>
    <xsl:if
      test="$updates//*[@about='this:subjectElement-2' and @property='gaz:hasSubject']/text() != ''">
      <p>
        <span about="this:subjectElement-2" property="gaz:hasSubject" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:subjectElement-2' and @property='gaz:hasSubject']/text()"
          />
        </span>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:subjectElement-2' and @property='transport:hasSubheading']/text() != ''">
      <p>
        <span about="this:subjectElement-2" property="transport:hasSubheading" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:subjectElement-2' and @property='transport:hasSubheading']/text()"
          />
        </span>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:subjectElement-2' and @property='gaz:hasNoticeDetails']/text() != ''">
      <p>
        <span about="this:subjectElement-2" property="gaz:hasNoticeDetails" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:subjectElement-2' and @property='gaz:hasNoticeDetails']/text()"
          />
        </span>
      </p>
    </xsl:if>

    <xsl:if
      test="$updates//*[@about='this:subjectElement-3' and @property='gaz:hasSubject']/text() != ''">
      <p>
        <span about="this:subjectElement-3" property="gaz:hasSubject" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:subjectElement-3' and @property='gaz:hasSubject']/text()"
          />
        </span>
      </p>
    </xsl:if>


    <xsl:if
      test="$updates//*[@about='this:subjectElement-3' and @property='transport:hasSubheading']/text() != ''">
      <p>
        <span about="this:subjectElement-3" property="transport:hasSubheading" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:subjectElement-3' and @property='transport:hasSubheading']/text()"
          />
        </span>
      </p>
    </xsl:if>


    <xsl:if
      test="$updates//*[@about='this:subjectElement-3' and @property='gaz:hasNoticeDetails']/text() != ''">
      <p>
        <span about="this:subjectElement-3" property="gaz:hasNoticeDetails" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:subjectElement-3' and @property='gaz:hasNoticeDetails']/text()"
          />
        </span>
      </p>
    </xsl:if>


    <xsl:if
      test="$updates//*[@about='this:subjectElement-4' and @property='gaz:hasSubject']/text() != ''">
      <p>
        <span about="this:subjectElement-4" property="gaz:hasSubject" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:subjectElement-4' and @property='gaz:hasSubject']/text()"
          />
        </span>
      </p>
    </xsl:if>


    <xsl:if
      test="$updates//*[@about='this:subjectElement-4' and @property='transport:hasSubheading']/text() != ''">
      <p>
        <span about="this:subjectElement-4" property="transport:hasSubheading" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:subjectElement-4' and @property='transport:hasSubheading']/text()"
          />
        </span>
      </p>
    </xsl:if>


    <xsl:if
      test="$updates//*[@about='this:subjectElement-4' and @property='gaz:hasNoticeDetails']/text() != ''">
      <p>
        <span about="this:subjectElement-4" property="gaz:hasNoticeDetails" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:subjectElement-4' and @property='gaz:hasNoticeDetails']/text()"
          />
        </span>
      </p>
    </xsl:if>


    <xsl:if
      test="$updates//*[@about='this:subjectElement-5' and @property='gaz:hasSubject']/text() != ''">
      <p>
        <span about="this:subjectElement-5" property="gaz:hasSubject" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:subjectElement-5' and @property='gaz:hasSubject']/text()"
          />
        </span>
      </p>
    </xsl:if>


    <xsl:if
      test="$updates//*[@about='this:subjectElement-5' and @property='transport:hasSubheading']/text() != ''">
      <p>
        <span about="this:subjectElement-5" property="transport:hasSubheading" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:subjectElement-5' and @property='transport:hasSubheading']/text()"
          />
        </span>
      </p>
    </xsl:if>


    <xsl:if
      test="$updates//*[@about='this:subjectElement-5' and @property='gaz:hasNoticeDetails']/text() != ''">
      <p>
        <span about="this:subjectElement-5" property="gaz:hasNoticeDetails" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:subjectElement-5' and @property='gaz:hasNoticeDetails']/text()"
          />
        </span>
      </p>
    </xsl:if>


    <xsl:if
      test="$updates//*[@about='this:subjectElement-6' and @property='gaz:hasSubject']/text() != ''">
      <p>
        <span about="this:subjectElement-6" property="gaz:hasSubject" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:subjectElement-6' and @property='gaz:hasSubject']/text()"
          />
        </span>
      </p>
    </xsl:if>


    <xsl:if
      test="$updates//*[@about='this:subjectElement-6' and @property='transport:hasSubheading']/text() != ''">
      <p>
        <span about="this:subjectElement-6" property="transport:hasSubheading" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:subjectElement-6' and @property='transport:hasSubheading']/text()"
          />
        </span>
      </p>
    </xsl:if>


    <xsl:if
      test="$updates//*[@about='this:subjectElement-6' and @property='gaz:hasNoticeDetails']/text() != ''">
      <p>
        <span about="this:subjectElement-6" property="gaz:hasNoticeDetails" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:subjectElement-6' and @property='gaz:hasNoticeDetails']/text()"
          />
        </span>
      </p>
    </xsl:if>


    <xsl:if
      test="$updates//*[@about='this:subjectElement-7' and @property='gaz:hasSubject']/text() != ''">
      <p>
        <span about="this:subjectElement-7" property="gaz:hasSubject" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:subjectElement-7' and @property='gaz:hasSubject']/text()"
          />
        </span>
      </p>
    </xsl:if>


    <xsl:if
      test="$updates//*[@about='this:subjectElement-7' and @property='transport:hasSubheading']/text() != ''">
      <p>
        <span about="this:subjectElement-7" property="transport:hasSubheading" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:subjectElement-7' and @property='transport:hasSubheading']/text()"
          />
        </span>
      </p>
    </xsl:if>


    <xsl:if
      test="$updates//*[@about='this:subjectElement-7' and @property='gaz:hasNoticeDetails']/text() != ''">
      <p>
        <span about="this:subjectElement-7" property="gaz:hasNoticeDetails" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:subjectElement-7' and @property='gaz:hasNoticeDetails']/text()"
          />
        </span>
      </p>
    </xsl:if>


    <xsl:if
      test="$updates//*[@about='this:subjectElement-8' and @property='gaz:hasSubject']/text() != ''">
      <p>
        <span about="this:subjectElement-8" property="gaz:hasSubject" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:subjectElement-8' and @property='gaz:hasSubject']/text()"
          />
        </span>
      </p>
    </xsl:if>


    <xsl:if
      test="$updates//*[@about='this:subjectElement-8' and @property='transport:hasSubheading']/text() != ''">
      <p>
        <span about="this:subjectElement-8" property="transport:hasSubheading" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:subjectElement-8' and @property='transport:hasSubheading']/text()"
          />
        </span>
      </p>
    </xsl:if>


    <xsl:if
      test="$updates//*[@about='this:subjectElement-8' and @property='gaz:hasNoticeDetails']/text() != ''">
      <p>
        <span about="this:subjectElement-8" property="gaz:hasNoticeDetails" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:subjectElement-8' and @property='gaz:hasNoticeDetails']/text()"
          />
        </span>
      </p>
    </xsl:if>


    <xsl:if
      test="$updates//*[@about='this:subjectElement-9' and @property='gaz:hasSubject']/text() != ''">
      <p>
        <span about="this:subjectElement-9" property="gaz:hasSubject" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:subjectElement-9' and @property='gaz:hasSubject']/text()"
          />
        </span>
      </p>
    </xsl:if>


    <xsl:if
      test="$updates//*[@about='this:subjectElement-9' and @property='transport:hasSubheading']/text() != ''">
      <p>
        <span about="this:subjectElement-9" property="transport:hasSubheading" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:subjectElement-9' and @property='transport:hasSubheading']/text()"
          />
        </span>
      </p>
    </xsl:if>


    <xsl:if
      test="$updates//*[@about='this:subjectElement-9' and @property='gaz:hasNoticeDetails']/text() != ''">
      <p>
        <span about="this:subjectElement-9" property="gaz:hasNoticeDetails" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:subjectElement-9' and @property='gaz:hasNoticeDetails']/text()"
          />
        </span>
      </p>
    </xsl:if>


    <xsl:if
      test="$updates//*[@about='this:subjectElement-10' and @property='gaz:hasSubject']/text() != ''">
      <p>
        <span about="this:subjectElement-10" property="gaz:hasSubject" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:subjectElement-10' and @property='gaz:hasSubject']/text()"
          />
        </span>
      </p>
    </xsl:if>


    <xsl:if
      test="$updates//*[@about='this:subjectElement-10' and @property='transport:hasSubheading']/text() != ''">
      <p>
        <span about="this:subjectElement-10" property="transport:hasSubheading"
          datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:subjectElement-10' and @property='transport:hasSubheading']/text()"
          />
        </span>
      </p>
    </xsl:if>

    <xsl:if
      test="$updates//*[@about='this:subjectElement-10' and @property='gaz:hasNoticeDetails']/text() != ''">
      <p>
        <span about="this:subjectElement-10" property="gaz:hasNoticeDetails" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:subjectElement-10' and @property='gaz:hasNoticeDetails']/text()"
          />
        </span>
      </p>
    </xsl:if>

    <xsl:if
      test="$updates//*[@about='this:notifiableThing' and @property='gaz:hasAdditionalInformation']/text() != ''">
      <p>
        <span about="this:notifiableThing" property="gaz:hasAdditionalInformation"
          datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:notifiableThing' and @property='gaz:hasAdditionalInformation']/text()"
          />
        </span>
      </p>
    </xsl:if>

    <p>
      <xsl:if test="$updates//*[@about='this:signatory-1' and @property='foaf:name']/text() != ''">
        <span about="this:signatory-1" property="foaf:name" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:signatory-1' and @property='foaf:name']/text()"/>
        </span>
        <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:if
        test="$updates//*[@about='this:role-signatory-1' and @property='person:roleName']/text() != ''">
        <span about="this:role-signatory-1" property="person:roleName" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:role-signatory-1' and @property='person:roleName']/text()"
          />
        </span>
        <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:if test="$updates//*[@about='this:authority-2' and @property='gazorg:name']/text() != ''">
        <span about="this:authority-2" property="gazorg:name" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:authority-2' and @property='gazorg:name']/text()"/>
        </span>
        <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:if
        test="$updates//*[@about='this:authority-2' and @property='authority:hasDepartment']/text() != ''">
        <span about="this:authority-2" property="authority:hasDepartment" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:authority-2' and @property='authority:hasDepartment']/text()"
          />
        </span>
        <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:authority-2-address-1'"/>
      </xsl:call-template>
      <xsl:if
        test="$updates//*[@about='this:authority-2' and @property='gaz:telephone']/text() != ''">
        <xsl:text>Telephone number: </xsl:text>
        <span about="this:authority-2" property="gaz:telephone" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:authority-2' and @property='gaz:telephone']/text()"/>
        </span>
        <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:if test="$updates//*[@about='this:authority-2' and @property='gaz:fax']/text() != ''">
        <xsl:text>Fax: </xsl:text>
        <span about="this:authority-2" property="gaz:fax" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:authority-2' and @property='gaz:fax']/text()"/>
        </span>
        <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:if test="$updates//*[@about='this:authority-2' and @property='gaz:email']/text() != ''">
        <xsl:text>Email: </xsl:text>
        <span about="this:authority-2" property="gaz:email" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:authority-2' and @property='gaz:email']/text()"/>
        </span>
      </xsl:if>
      <xsl:if
        test="$updates//*[@about='this:authority-2' and @property='authority:hasReferenceNumber']/text() != ''">
        <xsl:text> (Ref: </xsl:text>
        <span about="this:authority-2" property="authority:hasReferenceNumber" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:authority-2' and @property='authority:hasReferenceNumber']/text()"
          />
        </span>
        <xsl:text>)</xsl:text>
      </xsl:if>
      <xsl:variable name="dateAuthorisationSigned">
        <xsl:value-of
          select="$updates//*[@about='this:authoriser-1' and @property='gaz:dateAuthorisationSigned']/text()"
        />
      </xsl:variable>
      <xsl:if
        test="$updates//*[@about='this:authoriser-1' and @property='gaz:dateAuthorisationSigned']/text() != ''">
        <p>
          <span about="this:authoriser-1" property="gaz:dateAuthorisationSigned" datatype="xsd:date"
            content="{$dateAuthorisationSigned}">
            <xsl:value-of
              select="format-date(xs:date($dateAuthorisationSigned), '[FNn] [D01] [MNn] [Y0001]')"/>
          </span>
        </p>
      </xsl:if>
    </p>
  </xsl:template>

  <xsl:template name="boilerPlateText1601">
    <xsl:param name="updates"/>
    <p>
      <span about="this:authority-1" property="gazorg:name" datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:authority-1' and @property='gazorg:name']/text()"/>
      </span>
    </p>
    <p>
      <span about="this:legislation-1" property="legislation:legislationTitle" datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:legislation-1' and @property='legislation:legislationTitle']/text()"
        />
      </span>
    </p>
    <xsl:if
      test="$updates//*[@about='this:legislation-2' and @property='legislation:legislationTitle']/text() != ''">
      <p>
        <span about="this:legislation-2" property="legislation:legislationTitle"
          datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:legislation-2' and @property='legislation:legislationTitle']/text()"
          />
        </span>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:legislation-3' and @property='legislation:legislationTitle']/text() != ''">
      <p>
        <span about="this:legislation-3" property="legislation:legislationTitle"
          datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:legislation-3' and @property='legislation:legislationTitle']/text()"
          />
        </span>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:legislation-4' and @property='legislation:legislationTitle']/text() != ''">
      <p>
        <span about="this:legislation-4" property="legislation:legislationTitle"
          datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:legislation-4' and @property='legislation:legislationTitle']/text()"
          />
        </span>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:legislation-5' and @property='legislation:legislationTitle']/text() != ''">
      <p>
        <span about="this:legislation-5" property="legislation:legislationTitle"
          datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:legislation-5' and @property='legislation:legislationTitle']/text()"
          />
        </span>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:notifiableThing' and @property='gaz:hasSubject']/text() != ''">
      <p>
        <span about="this:notifiableThing" property="gaz:hasSubject" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:notifiableThing' and @property='gaz:hasSubject']/text()"
          />
        </span>
      </p>
    </xsl:if>
    <p>
      <span about="this:notifiableThing" property="planning:orderDetails" datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:notifiableThing' and @property='planning:orderDetails']/text()"
        />
      </span>
    </p>

    <p>
      <xsl:text>Proposal</xsl:text>
      <xsl:if
        test="$updates//*[@about='this:proposal-2' and @property='planning:proposalReference']/text() != ''">
        <xsl:text>(s)</xsl:text>
      </xsl:if>
    </p>
    <p>
      <span about="this:proposal-1" property="planning:proposalReference" datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:proposal-1' and @property='planning:proposalReference']/text()"
        />
      </span>
      <xsl:text>: </xsl:text>
      <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:proposal-1-address-1'"/>
      </xsl:call-template>
      <xsl:text>: </xsl:text>
      <xsl:if test="$updates//*[@about='this:applicant-1' and @property='foaf:name']/text() != ''">
        <span about="this:applicant-1" property="foaf:name">
          <xsl:value-of
            select="$updates//*[@about='this:applicant-1' and @property='foaf:name']/text()"/>
        </span>
        <xsl:text>: </xsl:text>
      </xsl:if>
      <span about="this:proposal-1" property="planning:proposalDescription" datatype="xsd:string">
        <xsl:value-of
          select="$updates//*[@about='this:proposal-1' and @property='planning:proposalDescription']/text()"
        />
      </span>
    </p>
    <xsl:if
      test="$updates//*[@about='this:proposal-2' and @property='planning:proposalReference']/text() != '' or $updates//*[@about='this:applicant-2' and @property='foaf:name']/text() != '' or $updates//*[@about='this:proposal-2' and @property='planning:proposalDescription']/text() != ''">
      <p>
        <xsl:if
          test="$updates//*[@about='this:proposal-2' and @property='planning:proposalReference']/text() != ''">
          <span about="this:proposal-2" property="planning:proposalReference" datatype="xsd:string">
            <xsl:value-of
              select="$updates//*[@about='this:proposal-2' and @property='planning:proposalReference']/text()"
            />
          </span>: </xsl:if>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:proposal-2-address-1'"/>
        </xsl:call-template>
        <xsl:if test="$updates//*[@about='this:applicant-2' and @property='foaf:name']/text() != ''">
          <xsl:text>: </xsl:text>
          <span about="this:applicant-2" property="foaf:name">
            <xsl:value-of
              select="$updates//*[@about='this:applicant-2' and @property='foaf:name']/text()"/>
          </span>
          <xsl:text>: </xsl:text>
        </xsl:if>
        <xsl:if
          test="$updates//*[@about='this:proposal-2' and @property='planning:proposalDescription']/text() != ''">
          <span about="this:proposal-2" property="planning:proposalDescription"
            datatype="xsd:string">
            <xsl:value-of
              select="$updates//*[@about='this:proposal-2' and @property='planning:proposalDescription']/text()"
            />
          </span>
        </xsl:if>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:proposal-3' and @property='planning:proposalReference']/text() != '' or $updates//*[@about='this:applicant-3' and @property='foaf:name']/text() != '' or $updates//*[@about='this:proposal-3' and @property='planning:proposalDescription']/text() != ''">

      <p>
        <xsl:if
          test="$updates//*[@about='this:proposal-3' and @property='planning:proposalReference']/text() != ''">
          <span about="this:proposal-3" property="planning:proposalReference" datatype="xsd:string">
            <xsl:value-of
              select="$updates//*[@about='this:proposal-3' and @property='planning:proposalReference']/text()"
            />
          </span>
          <xsl:text>: </xsl:text>
        </xsl:if>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:proposal-3-address-1'"/>
        </xsl:call-template>
        <xsl:if test="$updates//*[@about='this:applicant-3' and @property='foaf:name']/text() != ''">
          <xsl:text>: </xsl:text>
          <span about="this:applicant-3" property="foaf:name">
            <xsl:value-of
              select="$updates//*[@about='this:applicant-3' and @property='foaf:name']/text()"/>
          </span>
          <xsl:text>: </xsl:text>
        </xsl:if>
        <xsl:if
          test="$updates//*[@about='this:proposal-3' and @property='planning:proposalDescription']/text() != ''">
          <span about="this:proposal-3" property="planning:proposalDescription"
            datatype="xsd:string">
            <xsl:value-of
              select="$updates//*[@about='this:proposal-3' and @property='planning:proposalDescription']/text()"
            />
          </span>
        </xsl:if>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:proposal-4' and @property='planning:proposalReference']/text() != '' or $updates//*[@about='this:applicant-4' and @property='foaf:name']/text() != '' or $updates//*[@about='this:proposal-4' and @property='planning:proposalDescription']/text() != ''">

      <p>
        <xsl:if
          test="$updates//*[@about='this:proposal-4' and @property='planning:proposalReference']/text() != ''">
          <span about="this:proposal-4" property="planning:proposalReference" datatype="xsd:string">
            <xsl:value-of
              select="$updates//*[@about='this:proposal-4' and @property='planning:proposalReference']/text()"
            />
          </span>
          <xsl:text>: </xsl:text>
        </xsl:if>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:proposal-4-address-1'"/>
        </xsl:call-template>
        <xsl:if test="$updates//*[@about='this:applicant-4' and @property='foaf:name']/text() != ''">
          <xsl:text>: </xsl:text>
          <span about="this:applicant-4" property="foaf:name">
            <xsl:value-of
              select="$updates//*[@about='this:applicant-4' and @property='foaf:name']/text()"/>
          </span>
          <xsl:text>: </xsl:text>
        </xsl:if>
        <xsl:if
          test="$updates//*[@about='this:proposal-4' and @property='planning:proposalDescription']/text() != ''">
          <span about="this:proposal-4" property="planning:proposalDescription"
            datatype="xsd:string">
            <xsl:value-of
              select="$updates//*[@about='this:proposal-4' and @property='planning:proposalDescription']/text()"
            />
          </span>
        </xsl:if>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:proposal-5' and @property='planning:proposalReference']/text() != '' or $updates//*[@about='this:applicant-5' and @property='foaf:name']/text() != '' or $updates//*[@about='this:proposal-5' and @property='planning:proposalDescription']/text() != ''">

      <p>
        <xsl:if
          test="$updates//*[@about='this:proposal-5' and @property='planning:proposalReference']/text() != ''">
          <span about="this:proposal-5" property="planning:proposalReference" datatype="xsd:string">
            <xsl:value-of
              select="$updates//*[@about='this:proposal-5' and @property='planning:proposalReference']/text()"
            />
          </span>
          <xsl:text>: </xsl:text>
        </xsl:if>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:proposal-5-address-1'"/>
        </xsl:call-template>
        <xsl:if test="$updates//*[@about='this:applicant-5' and @property='foaf:name']/text() != ''">
          <xsl:text>: </xsl:text>
          <span about="this:applicant-5" property="foaf:name">
            <xsl:value-of
              select="$updates//*[@about='this:applicant-5' and @property='foaf:name']/text()"/>
          </span>
          <xsl:text>: </xsl:text>
        </xsl:if>
        <xsl:if
          test="$updates//*[@about='this:proposal-5' and @property='planning:proposalDescription']/text() != ''">
          <span about="this:proposal-5" property="planning:proposalDescription"
            datatype="xsd:string">
            <xsl:value-of
              select="$updates//*[@about='this:proposal-5' and @property='planning:proposalDescription']/text()"
            />
          </span>
        </xsl:if>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:proposal-6' and @property='planning:proposalReference']/text() != '' or $updates//*[@about='this:applicant-6' and @property='foaf:name']/text() != '' or $updates//*[@about='this:proposal-6' and @property='planning:proposalDescription']/text() != ''">

      <p>
        <xsl:if
          test="$updates//*[@about='this:proposal-6' and @property='planning:proposalReference']/text() != ''">
          <span about="this:proposal-6" property="planning:proposalReference" datatype="xsd:string">
            <xsl:value-of
              select="$updates//*[@about='this:proposal-6' and @property='planning:proposalReference']/text()"
            />
          </span>
          <xsl:text>: </xsl:text>
        </xsl:if>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:proposal-6-address-1'"/>
        </xsl:call-template>
        <xsl:if test="$updates//*[@about='this:applicant-6' and @property='foaf:name']/text() != ''">
          <xsl:text>: </xsl:text>
          <span about="this:applicant-6" property="foaf:name">
            <xsl:value-of
              select="$updates//*[@about='this:applicant-6' and @property='foaf:name']/text()"/>
          </span>
          <xsl:text>: </xsl:text>
        </xsl:if>
        <xsl:if
          test="$updates//*[@about='this:proposal-6' and @property='planning:proposalDescription']/text() != ''">
          <span about="this:proposal-6" property="planning:proposalDescription"
            datatype="xsd:string">
            <xsl:value-of
              select="$updates//*[@about='this:proposal-6' and @property='planning:proposalDescription']/text()"
            />
          </span>
        </xsl:if>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:proposal-7' and @property='planning:proposalReference']/text() != '' or $updates//*[@about='this:applicant-7' and @property='foaf:name']/text() != '' or $updates//*[@about='this:proposal-7' and @property='planning:proposalDescription']/text() != ''">

      <p>
        <xsl:if
          test="$updates//*[@about='this:proposal-7' and @property='planning:proposalReference']/text() != ''">
          <span about="this:proposal-7" property="planning:proposalReference" datatype="xsd:string">
            <xsl:value-of
              select="$updates//*[@about='this:proposal-7' and @property='planning:proposalReference']/text()"
            />
          </span>
          <xsl:text>: </xsl:text>
        </xsl:if>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:proposal-7-address-1'"/>
        </xsl:call-template>
        <xsl:if test="$updates//*[@about='this:applicant-7' and @property='foaf:name']/text() != ''">
          <xsl:text>: </xsl:text>
          <span about="this:applicant-7" property="foaf:name">
            <xsl:value-of
              select="$updates//*[@about='this:applicant-7' and @property='foaf:name']/text()"/>
          </span>
          <xsl:text>: </xsl:text>
        </xsl:if>
        <xsl:if
          test="$updates//*[@about='this:proposal-7' and @property='planning:proposalDescription']/text() != ''">
          <span about="this:proposal-7" property="planning:proposalDescription"
            datatype="xsd:string">
            <xsl:value-of
              select="$updates//*[@about='this:proposal-7' and @property='planning:proposalDescription']/text()"
            />
          </span>
        </xsl:if>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:proposal-8' and @property='planning:proposalReference']/text() != '' or $updates//*[@about='this:applicant-8' and @property='foaf:name']/text() != '' or $updates//*[@about='this:proposal-8' and @property='planning:proposalDescription']/text() != ''">

      <p>
        <xsl:if
          test="$updates//*[@about='this:proposal-8' and @property='planning:proposalReference']/text() != ''">
          <span about="this:proposal-8" property="planning:proposalReference" datatype="xsd:string">
            <xsl:value-of
              select="$updates//*[@about='this:proposal-8' and @property='planning:proposalReference']/text()"
            />
          </span>
          <xsl:text>: </xsl:text>
        </xsl:if>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:proposal-8-address-1'"/>
        </xsl:call-template>
        <xsl:if test="$updates//*[@about='this:applicant-8' and @property='foaf:name']/text() != ''">
          <xsl:text>: </xsl:text>
          <span about="this:applicant-8" property="foaf:name">
            <xsl:value-of
              select="$updates//*[@about='this:applicant-8' and @property='foaf:name']/text()"/>
          </span>
          <xsl:text>: </xsl:text>
        </xsl:if>
        <xsl:if
          test="$updates//*[@about='this:proposal-8' and @property='planning:proposalDescription']/text() != ''">
          <span about="this:proposal-8" property="planning:proposalDescription"
            datatype="xsd:string">
            <xsl:value-of
              select="$updates//*[@about='this:proposal-8' and @property='planning:proposalDescription']/text()"
            />
          </span>
        </xsl:if>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:proposal-9' and @property='planning:proposalReference']/text() != '' or $updates//*[@about='this:applicant-9' and @property='foaf:name']/text() != '' or $updates//*[@about='this:proposal-9' and @property='planning:proposalDescription']/text() != ''">

      <p>
        <xsl:if
          test="$updates//*[@about='this:proposal-9' and @property='planning:proposalReference']/text() != ''">
          <span about="this:proposal-9" property="planning:proposalReference" datatype="xsd:string">
            <xsl:value-of
              select="$updates//*[@about='this:proposal-9' and @property='planning:proposalReference']/text()"
            />
          </span>
          <xsl:text>: </xsl:text>
        </xsl:if>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:proposal-9-address-1'"/>
        </xsl:call-template>
        <xsl:if test="$updates//*[@about='this:applicant-9' and @property='foaf:name']/text() != ''">
          <xsl:text>: </xsl:text>
          <span about="this:applicant-9" property="foaf:name">
            <xsl:value-of
              select="$updates//*[@about='this:applicant-9' and @property='foaf:name']/text()"/>
          </span>
          <xsl:text>: </xsl:text>
        </xsl:if>
        <xsl:if
          test="$updates//*[@about='this:proposal-9' and @property='planning:proposalDescription']/text() != ''">
          <span about="this:proposal-9" property="planning:proposalDescription"
            datatype="xsd:string">
            <xsl:value-of
              select="$updates//*[@about='this:proposal-9' and @property='planning:proposalDescription']/text()"
            />
          </span>
        </xsl:if>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:proposal-10' and @property='planning:proposalReference']/text() != '' or $updates//*[@about='this:applicant-10' and @property='foaf:name']/text() != '' or $updates//*[@about='this:proposal-10' and @property='planning:proposalDescription']/text() != ''">

      <p>
        <xsl:if
          test="$updates//*[@about='this:proposal-10' and @property='planning:proposalReference']/text() != ''">
          <span about="this:proposal-10" property="planning:proposalReference" datatype="xsd:string">
            <xsl:value-of
              select="$updates//*[@about='this:proposal-10' and @property='planning:proposalReference']/text()"
            />
          </span>
          <xsl:text>: </xsl:text>
        </xsl:if>
        <xsl:call-template name="address">
          <xsl:with-param name="updates" select="$updates"/>
          <xsl:with-param name="about" select="'this:proposal-10-address-1'"/>
        </xsl:call-template>
        <xsl:if
          test="$updates//*[@about='this:applicant-10' and @property='foaf:name']/text() != ''">
          <xsl:text>: </xsl:text>
          <span about="this:applicant-10" property="foaf:name">
            <xsl:value-of
              select="$updates//*[@about='this:applicant-10' and @property='foaf:name']/text()"/>
          </span>
          <xsl:text>: </xsl:text>
        </xsl:if>
        <xsl:if
          test="$updates//*[@about='this:proposal-10' and @property='planning:proposalDescription']/text() != ''">
          <span about="this:proposal-10" property="planning:proposalDescription"
            datatype="xsd:string">
            <xsl:value-of
              select="$updates//*[@about='this:proposal-10' and @property='planning:proposalDescription']/text()"
            />
          </span>
        </xsl:if>
      </p>
    </xsl:if>
    <xsl:if
      test="$updates//*[@about='this:notifiableThing' and @property='gaz:hasAdditionalInformation']/text() != ''">
      <p>
        <span about="this:notifiableThing" property="gaz:hasAdditionalInformation"
          datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:notifiableThing' and @property='gaz:hasAdditionalInformation']/text()"
          />
        </span>
      </p>
    </xsl:if>

    <p>
      <xsl:if test="$updates//*[@about='this:signatory-1' and @property='foaf:name']/text() != ''">
        <span about="this:signatory-1" property="foaf:name" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:signatory-1' and @property='foaf:name']/text()"/>
        </span>
        <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:if
        test="$updates//*[@about='this:role-signatory-1' and @property='person:roleName']/text() != ''">
        <span about="this:role-signatory-1" property="person:roleName" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:role-signatory-1' and @property='person:roleName']/text()"
          />
        </span>
        <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:if test="$updates//*[@about='this:authority-2' and @property='gazorg:name']/text() != ''">
        <span about="this:authority-2" property="gazorg:name" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:authority-2' and @property='gazorg:name']/text()"/>
        </span>
        <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:if
        test="$updates//*[@about='this:authority-2' and @property='authority:hasDepartment']/text() != ''">
        <span about="this:authority-2" property="authority:hasDepartment" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:authority-2' and @property='authority:hasDepartment']/text()"
          />
        </span>
        <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:call-template name="address">
        <xsl:with-param name="updates" select="$updates"/>
        <xsl:with-param name="about" select="'this:authority-2-address-1'"/>
      </xsl:call-template>
      <xsl:if
        test="$updates//*[@about='this:authority-2' and @property='gaz:telephone']/text() != ''">
        <xsl:text>Telephone number: </xsl:text>
        <span about="this:authority-2" property="gaz:telephone" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:authority-2' and @property='gaz:telephone']/text()"/>
        </span>
        <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:if test="$updates//*[@about='this:authority-2' and @property='gaz:fax']/text() != ''">
        <xsl:text>Fax: </xsl:text><span about="this:authority-2" property="gaz:fax"
          datatype="xsd:string"><xsl:value-of
            select="$updates//*[@about='this:authority-2' and @property='gaz:fax']/text()"/></span>, </xsl:if>
      <xsl:if test="$updates//*[@about='this:authority-2' and @property='gaz:email']/text() != ''">
        <xsl:text>Email: </xsl:text>
        <span about="this:authority-2" property="gaz:email" datatype="xsd:string">
          <xsl:value-of
            select="$updates//*[@about='this:authority-2' and @property='gaz:email']/text()"/>
        </span>
      </xsl:if>
      <xsl:if
        test="$updates//*[@about='this:authority-2' and @property='authority:hasReferenceNumber']/text() != ''">
        <xsl:text> (Ref: </xsl:text>
        <span about="this:authority-2" property="authority:hasReferenceNumber" datatype="xsd:string"
          >
          <xsl:value-of
            select="$updates//*[@about='this:authority-2' and @property='authority:hasReferenceNumber']/text()"
          />
        </span>
        <xsl:text>)</xsl:text>
      </xsl:if>
      <xsl:variable name="dateAuthorisationSigned">
        <xsl:value-of
          select="$updates//*[@about='this:authoriser-1' and @property='gaz:dateAuthorisationSigned']/text()"
        />
      </xsl:variable>
      <xsl:if
        test="$updates//*[@about='this:authoriser-1' and @property='gaz:dateAuthorisationSigned']/text() != ''">
        <p>
          <span about="this:authoriser-1" property="gaz:dateAuthorisationSigned" datatype="xsd:date"
            content="{$dateAuthorisationSigned}">
            <xsl:value-of
              select="format-date(xs:date($dateAuthorisationSigned), '[FNn] [D01] [MNn] [Y0001]')"/>
          </span>
        </p>
      </xsl:if>
    </p>
  </xsl:template>

  <xsl:template name="titlecase">
    <xsl:param name="text" as="xs:string"/>
    <xsl:sequence
      select="string-join(for $x in tokenize($text,'\s') return concat(upper-case(substring($x, 1, 1)), lower-case(substring($x, 2))), ' ')"
    />
  </xsl:template>

  <xsl:template name="address">
    <xsl:param name="updates"/>
    <xsl:param name="about"/>
    <xsl:if test="$updates//*[@about=$about and @property='vcard:street-address']/text() != ''">
      <span about="{$about}" property="vcard:street-address" typeof="vcard:Address">
        <xsl:call-template name="titlecase">
          <xsl:with-param name="text">
            <xsl:value-of
              select="$updates//*[@about=$about and @property='vcard:street-address']/text()"/>
          </xsl:with-param>
        </xsl:call-template>
      </span>
      <xsl:text>, </xsl:text>
      <xsl:if test="$updates//*[@about=$about and @property='vcard:extended-address']/text() != ''">
        <span about="{$about}" property="vcard:extended-address">
          <xsl:call-template name="titlecase">
            <xsl:with-param name="text">
              <xsl:value-of
                select="$updates//*[@about=$about and @property='vcard:extended-address']/text()"/>
            </xsl:with-param>
          </xsl:call-template>
        </span>
        <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:if test="$updates//*[@about=$about and @property='vcard:locality']/text() != ''">
        <span about="{$about}" property="vcard:locality">
          <xsl:call-template name="titlecase">
            <xsl:with-param name="text">
              <xsl:value-of
                select="$updates//*[@about=$about and @property='vcard:locality']/text()"/>
            </xsl:with-param>
          </xsl:call-template>
        </span>
      </xsl:if>
      <xsl:if test="$updates//*[@about=$about and @property='vcard:region']/text() != ''"> ,<span
          about="{$about}" property="vcard:region">
          <xsl:call-template name="titlecase">
            <xsl:with-param name="text">
              <xsl:value-of select="$updates//*[@about=$about and @property='vcard:region']/text()"
              />
            </xsl:with-param>
          </xsl:call-template>
        </span>
      </xsl:if>
      <xsl:if test="$updates//*[@about=$about and @property='vcard:postal-code']/text() != ''">
        <xsl:text> </xsl:text>
        <span about="{$about}" property="vcard:postal-code">
          <!--<xsl:if
            test="$about='this:company-principal-trading-address-1' or $about='this:previous-trading-address-1' or $about='this:company-previous-registered-office-1'">
            <xsl:attribute name="style">margin-right:-4px</xsl:attribute>
          </xsl:if>-->
          <xsl:value-of
            select="upper-case($updates//*[@about=$about and @property='vcard:postal-code']/text())"
          />
        </span>
      </xsl:if>
      <xsl:if test="$updates//*[@about=$about and @property='vcard:country-name']/text() != ''">
        <span about="{$about}" property="vcard:country-name">
          <!--<xsl:if
            test="$about='this:company-principal-trading-address-1' or $about='this:previous-trading-address-1' or $about='this:company-previous-registered-office-1'">
            <xsl:attribute name="style">margin-right:-4px;margin-left:4px</xsl:attribute>
          </xsl:if>-->
          <xsl:call-template name="titlecase">
            <xsl:with-param name="text">
              <xsl:value-of
                select="$updates//*[@about=$about and @property='vcard:country-name']/text()"/>
            </xsl:with-param>
          </xsl:call-template>
        </span>
      </xsl:if>
      <xsl:if test="$about = 'this:authority-2-address-1'">
        <xsl:text>,</xsl:text>
      </xsl:if>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
