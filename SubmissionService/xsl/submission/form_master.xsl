<?xml version="1.0" encoding="UTF-8"?>
<!--©  Crown copyright
 
You may use and re-use this code free of charge under the terms of the Open Government Licence
 
http://www.nationalarchives.gov.uk/doc/open-government-licence/-->

<!--Version 1.0-->
<!--Created by Williams Lea XML Team-->
<!--
	  Purpose of transform: incorporate the Java layer draft format into an HTMLRDFa format document 
	  
      Change history
      1.0 Initial Release: 20th January 2014
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:u="http://www.williamslea.com/ns/updates" xmlns:wlf="http://www.williamslea.com/xslt/functions" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:x="http://www.w3.org/1999/xhtml" xmlns="http://www.w3.org/1999/xhtml" exclude-result-prefixes="u wlf xsl xs x">
	<xsl:param name="form">false</xsl:param>
	<!-- Hard coding for the time being, to be London, but it needs to be considered on the form submission -->
	<xsl:param name="edition" as="xs:string" required="no">London</xsl:param>
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
	<xsl:param name="updates" as="node()">
<form draftTitle="Draft 5897" draftURI="/my-gazette/draft/5897" noticeTypeCode="2451">
<entry about="this:IP1-address-1" property="vcard:street-address">10 RYLSTONE CLOSE</entry>
<entry about="this:IP1-address-1" property="vcard:locality">MILTON KEYNES</entry>
<entry about="this:company-1" property="gazorg:partnershipNumber">registeredNumbervalue</entry>
<entry about="this:company-registered-office-1" property="vcard:region"/>
<entry about="this:notifiableThing" property="corp-insolvency:nameOfPlaceOfHearing">hearingCourtName</entry>
<entry about="this:legislation-1" property="legislation:legislationTitle">LegislationValue</entry>
<entry about="this:IP1-address-1" property="vcard:extended-address">HEELANDS</entry>
<entry about="this:IP1" property="person:additionalInformationIP">additionalInformation</entry>
<entry about="this:company-previous-registered-office-1" property="vcard:postal-code">CR2 8LG</entry>
<entry about="this:company-1" property="gazorg:previouslyTradingAs">previouslyTradingAsValue</entry>
<entry about="noticeid:" property="gaz:earliestPublicationDateWITHtime">13:00</entry>
<entry about="this:notifiableThing" property="corp-insolvency:presentedBy">creditor</entry>
<entry about="this:IP1" property="gaz:fax">03242123231</entry>
<entry about="this:IP-company-1" property="gazorg:name">repOrgName</entry>
<entry about="this:notifiableThing" property="corp-insolvency:dateOfHearingWITHtime">16:00</entry>
<entry about="this:company-principal-trading-address-1" property="vcard:locality">SOUTH CROYDON</entry>
<entry about="this:hearingAddress" property="vcard:street-address">5 RYLSTONE CLOSE</entry>
<entry about="this:court-case-1" property="court:caseNumber">caseNumber</entry>
<entry about="this:company-registered-office-1" property="vcard:postal-code">CR2 9LG</entry>
<entry about="this:company-principal-trading-address-1" property="vcard:street-address">21 CHAPEL VIEW</entry>
<entry about="this:IP1-address-1" property="vcard:postal-code">MK13 7QT</entry>
<entry about="this:court-1" property="court:courtName">courtNameValue</entry>
<entry about="this:company-principal-trading-address-1" property="vcard:country-name"/>
<entry about="this:hearingAddress" property="vcard:extended-address">HEELANDS</entry>
<entry about="this:hearingAddress" property="vcard:region"/>
<entry about="this:company-registered-office-1" property="vcard:extended-address">133 LIMPSFIELD ROAD</entry>
<entry about="this:IP1" property="gaz:telephone">03242123231</entry>
<entry about="this:hearingAddress" property="vcard:locality">MILTON KEYNES</entry>
<entry about="this:company-1" property="gazorg:name">partnershipNamevalue</entry>
<entry about="this:court-1" property="court:courtDistrict">courtDistrictValue</entry>
<entry about="this:hearingAddress" property="vcard:postal-code">MK13 7QT</entry>
<entry about="this:IP1" property="gaz:email">sdwe@wwq.com</entry>
<entry about="this:company-1" property="gazorg:natureOfBusiness">natureOfBusinessValue</entry>
<entry about="this:company-registered-office-1" property="vcard:country-name"/>
<entry about="this:previous-trading-address-1" property="vcard:country-name"/>
<entry about="this:petitioner-address-1" property="vcard:postal-code">MK5 6EE</entry>
<entry about="this:company-previous-registered-office-1" property="vcard:locality">SOUTH CROYDON</entry>
<entry about="this:IP1" property="person:noticeDated">2014-01-30</entry>
<entry about="this:company-principal-trading-address-1" property="vcard:extended-address"/>
<entry about="this:hearingAddress" property="vcard:country-name"/>
<entry about="noticeid:" property="gaz:earliestPublicationDate">2014-01-28</entry>
<entry about="this:IP1" property="foaf:name">repName</entry>
<entry about="this:IP1" property="person:hasIPReferenceNumber">refNoValue</entry>
<entry about="this:company-registered-office-1" property="vcard:locality">SOUTH CROYDON</entry>
<entry about="this:previous-trading-address-1" property="vcard:street-address">10 MAYFIELD ROAD</entry>
<entry about="this:petitioner-address-1" property="vcard:locality">MILTON KEYNES</entry>
<entry about="this:petitioner-address-1" property="vcard:street-address">25 LOWNDES GROVE</entry>
<entry about="this:company-principal-trading-address-1" property="vcard:region"/>
<entry about="this:company-registered-office-1" property="vcard:street-address">FLAT 3</entry>
<entry about="this:petitioner-address-1" property="vcard:country-name"/>
<entry about="issue:" property="gaz:hasEdition">london</entry>
<entry about="this:petitioner-address-1" property="vcard:extended-address">SHENLEY CHURCH END</entry>
<entry about="this:previous-trading-address-1" property="vcard:locality">SOUTH CROYDON</entry>
<entry about="this:petitioner-address-1" property="vcard:region"/>
<entry about="this:notifiableThing" property="corp-insolvency:dateInsolvencyRule">2014-01-31</entry>
<entry about="this:previous-trading-address-1" property="vcard:region"/>
<entry about="this:company-1" property="gazorg:tradingAs">tradingAsValue</entry>
<entry about="this:notifiableThing" property="corp-insolvency:dateOfHearing">2014-01-31</entry>
<entry about="this:company-1" property="gazorg:previousCompanyName">previousPartnershipNameValue</entry>
<entry about="this:IP1-address-1" property="vcard:country-name"/>
<entry about="this:company-previous-registered-office-1" property="vcard:region"/>
<entry about="this:company-previous-registered-office-1" property="vcard:country-name"/>
<entry about="this:court-case-1" property="court:caseYear">2012</entry>
<entry about="this:company-previous-registered-office-1" property="vcard:extended-address"/>
<entry about="this:company-previous-registered-office-1" property="vcard:street-address">93 ADDINGTON ROAD</entry>
<entry about="this:previous-trading-address-1" property="vcard:extended-address"/>
<entry about="this:IP1-address-1" property="vcard:region"/>
<entry about="this:company-principal-trading-address-1" property="vcard:postal-code">CR2 7LG</entry>
<entry about="this:previous-trading-address-1" property="vcard:postal-code">CR2 0BE</entry>
<entry about="this:notifiableThing" property="corp-insolvency:dateOfPetitionPresentation">2014-01-19</entry>
<entry about="gzw:repDetails" property="gzw:repType">solicitor</entry>
<entry about="this:petitioner-1" property="foaf:name">petitionerNameValue</entry>
</form>
	</xsl:param>
	<!-- local functions -->
	<xsl:variable name="publicationDate" select="concat($updates//*:entry[@property='gaz:earliestPublicationDate'],'T', 
   if ($updates//*:entry[@property='gaz:earliestPublicationDateWITHtime']) then wlf:getTimeStamp($updates//*:entry[@property='gaz:earliestPublicationDateWITHtime']) else '15:30:00')"/>
	<xsl:function name="wlf:increment">
		<xsl:param name="propertytoincrement"/>
		<xsl:variable name="numeric" select="number(substring-before(substring-after($propertytoincrement,'['),']')) + 1"/>
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
				<xsl:analyze-string select="$arg" regex="^([0-9]*):([0-9]*):([0-9]*)([.0-9]*)|([0-9]*):([0-9]*)">
					<xsl:matching-substring>
						<xsl:if test="matches($arg,'^([0-9]*):([0-9]*):([0-9]*)([.0-9]*)')">
							<xsl:value-of select="concat(wlf:get2Digits(regex-group(1)),':', wlf:get2Digits(regex-group(2)),':',wlf:get2Digits(regex-group(3)))"/>
						</xsl:if>
						<xsl:if test="matches($arg,'^([0-9]*):([0-9]*)')">
							<xsl:value-of select="concat(wlf:get2Digits(regex-group(5)),':', wlf:get2Digits(regex-group(6)),':00')"/>
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
		<xsl:value-of select="if ($arg castable as xs:integer) then format-number(number($arg),'00') else $arg"/>
	</xsl:function>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="x:html">
		<xsl:element name="html" namespace="http://www.w3.org/1999/xhtml">
			<xsl:attribute name="IdURI" select="replace(@IdURI,'notice/undefined',concat('notice/',$noticeId))"/>
			<xsl:variable name="temp-edition" select="$updates//*:entry[@property='gaz:hasEdition']"/>
			<xsl:variable name="temp-prefix" select="@prefix"/>
			<xsl:attribute name="prefix"><xsl:value-of select="replace(replace($temp-prefix,'edition/undefined',concat('edition/', $temp-edition )),'notice/undefined',concat('notice/',$noticeId))"/></xsl:attribute>
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
			<img name="logoimage">
				<xsl:attribute name="src"><xsl:value-of select="$updates//*[@property='gzw:noticeImageFile']"/></xsl:attribute>
			</img>
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
				<xsl:value-of select="$edition"/>
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
			<notice-category-codes>
				<notice-category-code>
					<xsl:value-of select="substring($noticeType,1,2)"/>
				</notice-category-code>
			</notice-category-codes>
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
			<xsl:value-of select="string-join($updates//*:entry[@about=$this/@about and @property=$this/@property],', ')"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="x:dd[@about='this:deceasedPerson' and @property='person:alsoKnownAs']">
		<xsl:element name="{name(.)}">
			<xsl:copy-of select="@*"/>
			<xsl:value-of select="string-join($updates//*:entry[@about='this:deceasedPerson' and @property='person:alsoKnownAs'],', ')"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="x:dd[@about='this:deceasedPerson' and @property='personal-legal:dateOfDeath']"/>
	<xsl:template match="x:dt[following-sibling::x:dd[1][@about='this:deceasedPerson' and @property='personal-legal:dateOfDeath']]">
		<xsl:copy-of copy-namespaces="no" select="."/>
		<xsl:variable name="dd" select="following-sibling::x:dd[1]" as="node()"/>
		<xsl:element name="{name($dd)}">
			<xsl:copy-of copy-namespaces="no" select="$dd/@*"/>
			<xsl:value-of select="$updates//*/.[@about=$dd/@about and @property = $dd/@property]/text()"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="x:dd[x:span[@about='this:deceasedPerson' and @property='personal-legal:startDateOfDeath']]">
		<xsl:if test="$updates//*:entry[@about='this:deceasedPerson' and @property='personal-legal:startDateOfDeath']/normalize-space(.)">
			<xsl:next-match/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="x:dt[following-sibling::x:dd[1]/x:span[@about='this:deceasedPerson' and @property='personal-legal:startDateOfDeath']]">
		<xsl:if test="$updates//*:entry[@about='this:deceasedPerson' and @property='personal-legal:startDateOfDeath']/normalize-space(.)">
			<xsl:copy-of copy-namespaces="no" select="."/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="x:span[@about='noticeid:' and @property='gaz:earliestPublicationDate' and @datatype='xsd:dateTime']">
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
	<xsl:template match="x:div[@class = 'content' and not(@content)]//x:div[not(@data-container = 'address') and not(@data-container='boilerplate')]">
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
		<xsl:variable name="indistinct" select="$updates//*[contains(@about,$resourceWithoutPostfix)]/@about"/>
		<xsl:for-each select="distinct-values($indistinct)">
			<xsl:sort select="."/>
			<xsl:variable name="currentAddressAbout" select="."/>
			<div about="{$addressDivAbout}" property="{$addressDivProperty}" resource="{$currentAddressAbout}">
				<ul class="form-controls address">
					<h3>
						<xsl:value-of select="$dataGazettesValue"/>
					</h3>
					<li id="address-list-{$currentAddressAbout}">
						<xsl:choose>
							<xsl:when test="$context/x:dl">
								<dl>
									<xsl:apply-templates select="$context/x:dl/*">
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
					</li>
				</ul>
			</div>
		</xsl:for-each>
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
							<xsl:when test="($updates//*/@property = $copyablepropertyname) and ($updates//*[@property = $copyablepropertyname]/@about = $currentAbout)">
								<xsl:attribute name="data-container">fixed</xsl:attribute>
							</xsl:when>
							<xsl:otherwise/>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="($updates//*/@property = $currentProperty) and ($updates//*[@property = $currentProperty]/@about = $currentAbout)">
								<xsl:choose>
									<xsl:when test="x:span[1]/@datatype = 'xsd:dateTime' and ($updates//*/.[@about=$currentAbout and @property = $currentProperty]/text() != '')">
										<xsl:value-of select="$updates//*/.[@about=$currentAbout and @property = $currentProperty]/text()"/>T<xsl:value-of select="$updates//*/.[@about=$currentAbout and @property = concat($currentProperty,'WITHtime')]/text()"/>:00</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$updates//*/.[@about=$currentAbout and @property = $currentProperty]/text()"/>
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
		<dd>
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
			<xsl:when test="($form = 'true') and (ancestor::*/@class='content') and ((name() = 'span') or (name() = 'p') or (name() = 'strong') or (name()='em') ) and @property">
				<xsl:if test="not(@data-hide = 'true')">
					<!-- temp: get list of corresponding nodes in $updates -->
					<xsl:variable name="updatenodes" select="$updates//*[@about = $currentAbout and @property = $currentProperty]"/>
					<xsl:variable name="preambletext" select="../text()"/>
					<xsl:variable name="datatype" select="@datatype"/>
					<xsl:choose>
						<xsl:when test="$updates//*[@about = $currentAbout and @property = $currentProperty]">
							<!-- make the update -->
							<xsl:for-each select="$updatenodes">
								<xsl:variable name="atomicupdate" select="."/>
								<xsl:variable name="id">
									<xsl:value-of select="replace(@about,':','-')"/>_<xsl:value-of select="replace(@property,':','-')"/>-<xsl:value-of select="position()"/>
								</xsl:variable>
								<xsl:element name="li">
									<label for="{$id}">
										<xsl:value-of select="$preambletext"/>
									</label>
									<xsl:element name="input">
										<xsl:attribute name="id" select="$id"/>
										<xsl:attribute name="name"><xsl:variable name="namestructure"><xsl:value-of select="@about"/>[<xsl:value-of select="@property"/>]</xsl:variable><xsl:value-of select="$namestructure"/></xsl:attribute>
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
										<xsl:attribute name="value"><xsl:value-of select="normalize-space(.)"/></xsl:attribute>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<!-- just pass through the template -->
							<xsl:element name="li">
								<xsl:variable name="id">
									<xsl:value-of select="replace(@about,':','-')"/>_<xsl:value-of select="replace(@property,':','-')"/>
								</xsl:variable>
								<label for="{$id}">
									<xsl:value-of select="../text()"/>
								</label>
								<xsl:element name="input">
									<xsl:attribute name="id" select="$id"/>
									<xsl:attribute name="name"><xsl:variable name="namestructure"><xsl:value-of select="@about"/>[<xsl:value-of select="@property"/>]</xsl:variable><xsl:value-of select="$namestructure"/></xsl:attribute>
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
								<input class="{@data-class-inner}" formnovalidate="formnovalidate" name="{@data-name}" type="submit" value="{@data-title}"/>
							</span>
						</li>
					</xsl:if>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="($updates//*/@property = $currentProperty) and ($updates//*[@property = $currentProperty]/@about = $currentAbout)">
						<xsl:variable name="contents" select="$updates//*/.[@property = $currentProperty and @about = $currentAbout]/text()"/>
						<xsl:if test="$contents!=''">
							<xsl:choose>
								<xsl:when test="../../@data-container ='address' and name(.)='dd'">
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
											<xsl:when test="@datatype = 'xsd:dateTime' and ($updates//*/.[@about=$currentAbout and @property = $currentProperty]/text() != '')">
												<xsl:value-of select="$updates//*/.[@about=$currentAbout and @property = $currentProperty]/text()"/>T<xsl:value-of select="$updates//*/.[@about=$currentAbout and @property = concat($currentProperty,'WITHtime')]/text()"/>:00</xsl:when>
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
		<span about="{@about}" property="{@property}" datatype="{@datatype}" resource="{@resource}" typeof="{@typeof}">
			<xsl:apply-templates mode="duplicate"/>
		</span>
	</xsl:template>
	<xsl:template match="text()" mode="duplicate">
		<xsl:value-of select="."/>
	</xsl:template>
	<xsl:template match="area[not(node())]|bgsound[not(node())]|br[not(node())]|hr[not(node())]|img[not(node())]|input[not(node())]|param[not(node())]">
		<xsl:element name="{name()}">
			<xsl:apply-templates select="@*"/>
		</xsl:element>
	</xsl:template>
	<xsl:template name="boilerPlateText">
		<xsl:param name="updates"/>
		<xsl:variable name="noticeCode">
			<xsl:value-of select="/x:html/x:body/x:article/x:div[@class='rdfa-data']/x:span[@property = 'gaz:hasNoticeCode']/@content"/>
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
		</xsl:choose>
	</xsl:template>
	<xsl:template name="boilerPlateText2450">
		<xsl:param name="updates"/>
		<p>Petitions to Wind Up (Companies)</p>
		<p>In the <span about="this:court-1" property="court:courtName" datatype="xsd:string">
				<xsl:value-of select="$updates//*[@about='this:court-1' and @property='court:courtName']/text()"/>
			</span>
			<span about="this:court-1" property="court:courtDistrict" datatype="xsd:string">
				<xsl:value-of select="$updates//*[@about='this:court-1' and @property='court:courtDistrict']/text()"/>
			</span>
			<span about="this:court-case-1" property="court:caseNumber" datatype="xsd:string">
				<xsl:value-of select="$updates//*[@about='this:court-case-1' and @property='court:caseNumber']/text()"/>
			</span> of <span about="this:court-case-1" property="court:caseYear" datatype="xsd:gYear">
				<xsl:value-of select="$updates//*[@about='this:court-case-1' and @property='court:caseYear']/text()"/>
			</span>
		</p>
		<p>In the matter of <span about="this:company-1" property="gazorg:name" datatype="xsd:string">
				<xsl:value-of select="$updates//*[@about='this:company-1' and @property='gazorg:name']/text()"/>
			</span>
		</p>
		<p>(Company Number <span about="this:company-1" property="gazorg:companyNumber" datatype="xsd:integer">
				<xsl:value-of select="$updates//*[@about='this:company-1' and @property='gazorg:companyNumber']/text()"/>
			</span>)</p>
		<xsl:if test="$updates//*[@about='this:company-1' and @property='gazorg:previousCompanyName']/text() != ''">
			<p>(Previously known as <span about="this:company-1" property="gazorg:previousCompanyName" datatype="xsd:string">
					<xsl:value-of select="$updates//*[@about='this:company-1' and @property='gazorg:previousCompanyName']/text()"/>
				</span>
				<xsl:if test="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:street-address']/text() != ''"> of <span about="this:company-previous-registered-office-1" property="vcard:street-address" typeof="vcard:Address">
						<xsl:value-of select="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:street-address']/text()"/>
					</span>, <span about="this:company-previous-registered-office-1" property="vcard:extended-address">
						<xsl:value-of select="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:extended-address']/text()"/>
					</span>, <span about="this:company-previous-registered-office-1" property="vcard:locality">
						<xsl:value-of select="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:locality']/text()"/>
					</span>, <span about="this:company-previous-registered-office-1" property="vcard:region">
						<xsl:value-of select="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:region']/text()"/>
					</span>
					<span about="this:company-previous-registered-office-1" property="vcard:postal-code">
						<xsl:value-of select="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:postal-code']/text()"/>
					</span>
					<span about="this:company-previous-registered-office-1" property="vcard:country-name">
						<xsl:value-of select="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:country-name']/text()"/>
					</span>)</xsl:if>
			</p>
		</xsl:if>
		<xsl:if test="$updates//*[@about='this:company-1' and @property='gazorg:tradingAs']/text() != ''">
			<p> (Trading as <span about="this:company-1" property="gazorg:tradingAs" datatype="xsd:string">
					<xsl:value-of select="$updates//*[@about='this:company-1' and @property='gazorg:tradingAs']/text()"/>
				</span>
				<xsl:if test="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:street-address']/text() != ''"> of <span about="this:company-principal-trading-address-1" property="vcard:street-address" typeof="vcard:Address">
						<xsl:value-of select="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:street-address']/text()"/>
					</span>, <span about="this:company-principal-trading-address-1" property="vcard:extended-address">
						<xsl:value-of select="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:extended-address']/text()"/>
					</span>, <span about="this:company-principal-trading-address-1" property="vcard:locality">
						<xsl:value-of select="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:locality']/text()"/>
					</span>, <span about="this:company-principal-trading-address-1" property="vcard:region">
						<xsl:value-of select="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:region']/text()"/>
					</span>
					<span about="this:company-principal-trading-address-1" property="vcard:postal-code">
						<xsl:value-of select="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:postal-code']/text()"/>
					</span>
					<span about="this:company-principal-trading-address-1" property="vcard:country-name">
						<xsl:value-of select="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:country-name']/text()"/>
					</span>) </xsl:if>
			</p>
		</xsl:if>
		<xsl:if test="$updates//*[@about='this:company-1' and @property='gazorg:previouslyTradingAs']/text() != ''">
			<p>(Previously trading as <span about="this:company-1" property="gazorg:previouslyTradingAs" datatype="xsd:string">
					<xsl:value-of select="$updates//*[@about='this:company-1' and @property='gazorg:previouslyTradingAs']/text()"/>
				</span>
				<xsl:if test="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:street-address']/text() != ''"> of <span about="this:previous-trading-address-1" property="vcard:street-address" typeof="vcard:Address">
						<xsl:value-of select="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:street-address']/text()"/>
					</span>, <span about="this:previous-trading-address-1" property="vcard:extended-address">
						<xsl:value-of select="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:extended-address']/text()"/>
					</span>, <span about="this:previous-trading-address-1" property="vcard:locality">
						<xsl:value-of select="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:locality']/text()"/>
					</span>, <span about="this:previous-trading-address-1" property="vcard:region">
						<xsl:value-of select="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:region']/text()"/>
					</span>
					<span about="this:previous-trading-address-1" property="vcard:postal-code">
						<xsl:value-of select="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:postal-code']/text()"/>
					</span>
					<span about="this:previous-trading-address-1" property="vcard:country-name">
						<xsl:value-of select="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:country-name']/text()"/>
					</span>)</xsl:if>
			</p>
		</xsl:if>
		<xsl:if test="$updates//*[@about='this:company-1' and @property='gazorg:natureOfBusiness']/text() != ''">
			<p>Nature of Business: <span about="this:company-1" property="gazorg:natureOfBusiness" datatype="xsd:string">
					<xsl:value-of select="$updates//*[@about='this:company-1' and @property='gazorg:natureOfBusiness']/text()"/>
				</span>
			</p>
		</xsl:if>
		<p>and in the Matter of the <span about="this:legislation-1" property="legislation:legislationTitle" datatype="xsd:string">
				<xsl:value-of select="$updates//*[@about='this:legislation-1' and @property='legislation:legislationTitle']/text()"/>
			</span>
		</p>
		<p>A Petition to wind up the above-named Company of <span about="this:company-registered-office-1" property="vcard:street-address" typeof="vcard:Address">
				<xsl:value-of select="$updates//*[@about='this:company-registered-office-1' and @property='vcard:street-address']/text()"/>
			</span>
			<xsl:if test="$updates//*[@about='this:company-registered-office-1' and @property='vcard:extended-address']/text() != ''"> , <span about="this:company-registered-office-1" property="vcard:extended-address">
					<xsl:value-of select="$updates//*[@about='this:company-registered-office-1' and @property='vcard:extended-address']/text()"/>
				</span>
			</xsl:if> , <span about="this:company-registered-office-1" property="vcard:locality">
				<xsl:value-of select="$updates//*[@about='this:company-registered-office-1' and @property='vcard:locality']/text()"/>
			</span>
			<xsl:if test="$updates//*[@about='this:company-registered-office-1' and @property='vcard:region']/text() != ''"> , <span about="this:company-registered-office-1" property="vcard:region">
					<xsl:value-of select="$updates//*[@about='this:company-registered-office-1' and @property='vcard:region']/text()"/>
				</span>
			</xsl:if>
			<span about="this:company-registered-office-1" property="vcard:postal-code">
				<xsl:value-of select="$updates//*[@about='this:company-registered-office-1' and @property='vcard:postal-code']/text()"/>
			</span>
			<xsl:if test="$updates//*[@about='this:company-registered-office-1' and @property='vcard:country-name']/text() != ''">
				<span about="this:company-registered-office-1" property="vcard:country-name">
					<xsl:value-of select="$updates//*[@about='this:company-registered-office-1' and @property='vcard:country-name']/text()"/>
				</span>
			</xsl:if> presented on <xsl:variable name="dateOfPetitionPresentation">
				<xsl:value-of select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateOfPetitionPresentation']/text()"/>
			</xsl:variable>
			<span about="this:notifiableThing" property="corp-insolvency:dateOfPetitionPresentation" datatype="xsd:date" content="{$dateOfPetitionPresentation}">
				<xsl:value-of select="format-date(xs:date($dateOfPetitionPresentation), '[D01] [MNn] [Y0001]')"/>
			</span>
      by <span about="this:petitioner-1" property="foaf:name" datatype="xsd:string">
				<xsl:value-of select="$updates//*[@about='this:petitioner-1' and @property='foaf:name']/text()"/>
			</span>, of <span about="this:petitioner-address-1" property="vcard:street-address" typeof="vcard:Address">
				<xsl:value-of select="$updates//*[@about='this:petitioner-address-1' and @property='vcard:street-address']/text()"/>
			</span>, <xsl:if test="$updates//*[@about='this:petitioner-address-1' and @property='vcard:extended-addresse']/text() != ''">
				<span about="this:petitioner-address-1" property="vcard:extended-address">
					<xsl:value-of select="$updates//*[@about='this:petitioner-address-1' and @property='vcard:extended-address']/text()"/>
				</span>, </xsl:if>
			<span about="this:petitioner-address-1" property="vcard:locality">
				<xsl:value-of select="$updates//*[@about='this:petitioner-address-1' and @property='vcard:locality']/text()"/>
			</span>, <xsl:if test="$updates//*[@about='this:petitioner-address-1' and @property='vcard:region']/text() != ''">
				<span about="this:petitioner-address-1" property="vcard:region">
					<xsl:value-of select="$updates//*[@about='this:petitioner-address-1' and @property='vcard:region']/text()"/>
				</span>
			</xsl:if>
			<span about="this:petitioner-address-1" property="vcard:postal-code">
				<xsl:value-of select="$updates//*[@about='this:petitioner-address-1' and @property='vcard:postal-code']/text()"/>
			</span>
			<xsl:if test="$updates//*[@about='this:petitioner-address-1' and @property='vcard:country-name']/text() != ''">
				<span about="this:petitioner-address-1" property="vcard:country-name">
					<xsl:value-of select="$updates//*[@about='this:petitioner-address-1' and @property='vcard:country-name']/text()"/>
				</span>
			</xsl:if> claiming to be a <span about="this:notifiableThing" property="corp-insolvency:presentedBy" datatype="xsd:string">
				<xsl:value-of select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:presentedBy']/text()"/>
			</span> of the Company, will be heard at <span about="this:notifiableThing" property="corp-insolvency:nameOfPlaceOfHearing" datatype="xsd:string">
				<xsl:value-of select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:nameOfPlaceOfHearing']/text()"/>
			</span>, <span about="this:hearingAddress" property="vcard:street-address" typeof="vcard:Address">
				<xsl:value-of select="$updates//*[@about='this:hearingAddress' and @property='vcard:street-address']/text()"/>
			</span>, <xsl:if test="$updates//*[@about='this:hearingAddress' and @property='vcard:extended-address']/text() != ''">
				<span about="this:hearingAddress" property="vcard:extended-address">
					<xsl:value-of select="$updates//*[@about='this:hearingAddress' and @property='vcard:extended-address']/text()"/>
				</span> , </xsl:if>
			<span about="this:hearingAddress" property="vcard:locality">
				<xsl:value-of select="$updates//*[@about='this:hearingAddress' and @property='vcard:locality']/text()"/>
			</span>, <xsl:if test="$updates//*[@about='this:hearingAddress' and @property='vcard:region']/text() != ''">
				<span about="this:hearingAddress" property="vcard:region">
					<xsl:value-of select="$updates//*[@about='this:hearingAddress' and @property='vcard:region']/text()"/>
				</span>
			</xsl:if>
			<span about="this:hearingAddress" property="vcard:postal-code">
				<xsl:value-of select="$updates//*[@about='this:hearingAddress' and @property='vcard:postal-code']/text()"/>
			</span>
			<xsl:if test="$updates//*[@about='this:hearingAddress' and @property='vcard:country-name']/text() != ''">
				<span about="this:hearingAddress" property="vcard:country-name">
					<xsl:value-of select="$updates//*[@about='this:hearingAddress' and @property='vcard:country-name']/text()"/>
				</span>
			</xsl:if> on <!--
            <span about="this:notifiableThing" property="corp-insolvency:dateOfHearing"><xsl:value-of select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateOfHearing']/text()"/> </span>, at 
            
            <span about="this:notifiableThing" property="corp-insolvency:dateOfHearing"><xsl:value-of select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateOfHearingWITHtime']/text()"/></span>-->
			<xsl:variable name="dateOfHearing">
				<xsl:value-of select="format-date(xs:date($updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateOfHearing']/text()),'[D01] [MNn] [Y0001]')"/>
			</xsl:variable>
			<xsl:variable name="timeOfHearing">
				<xsl:value-of select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateOfHearingWITHtime']/text()"/>
			</xsl:variable>
			<xsl:variable name="dateOfHearingValue">
				<xsl:value-of select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateOfHearing']/text()"/>
			</xsl:variable>
			<xsl:variable name="hearing">
				<xsl:value-of select="concat($dateOfHearingValue,'T',$timeOfHearing,':00')"/>
			</xsl:variable>
			<span about="this:notifiableThing" datatype="xsd:dateTime" property="corp-insolvency:dateOfHearing" content="{$hearing}"/>
			<xsl:value-of select="concat($dateOfHearing,' at ',$timeOfHearing)"/> (or as soon thereafter
      as the Petition can be heard).</p>
		<xsl:variable name="dateInsolvencyRule">
			<xsl:value-of select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateInsolvencyRule']/text()"/>
		</xsl:variable>
		<p>Any person intending to appear on the hearing of the Petition (whether to support or oppose
      it) must give notice of intention to do so to the Petitioner or its Solicitor in accordance
      with Rule 4.16 by 16.00 hours on <span about="this:notifiableThing" property="corp-insolvency:dateInsolvencyRule" datatype="xsd:date" content="{$dateInsolvencyRule}">
				<xsl:value-of select="format-date(xs:date($dateInsolvencyRule), '[D01] [MNn] [Y0001]')"/>
			</span>.</p>
		<xsl:if test="$updates//*[@about='this:IP1' and @property='foaf:name']/text() != ''">
			<p>
				<xsl:choose>
					<xsl:when test="$updates//*[@about='gzw:repDetails' and @property='gzw:repType']/text() = 'petitioner'"> The Petitioner is </xsl:when>
					<xsl:otherwise> The Petitioner's Solicitor is </xsl:otherwise>
				</xsl:choose>
				<span about="this:IP1" property="foaf:name" datatype="xsd:string">
					<xsl:value-of select="$updates//*[@about='this:IP1' and @property='foaf:name']/text()"/>
				</span> of
          <span about="this:IP1" property="foaf:name" datatype="xsd:string">
					<xsl:value-of select="$updates//*[@about='this:IP1' and @property='foaf:name']/text()"/>
				</span>
				<xsl:if test="$updates//*[@about='this:IP-company-1' and @property='gazorg:name']/text() != ''">
					<span about="this:IP-company-1" property="gazorg:name" datatype="xsd:string">
						<xsl:value-of select="$updates//*[@about='this:IP-company-1' and @property='gazorg:name']/text()"/>
					</span>, </xsl:if>
				<xsl:if test="$updates//*[@about='this:IP1-address-1' and @property='vcard:street-address']/text() != ''">
					<span about="this:IP1-address-1" property="vcard:street-address" typeof="vcard:Address">
						<xsl:value-of select="$updates//*[@about='this:IP1-address-1' and @property='vcard:street-address']/text()"/>
					</span>, </xsl:if>
				<xsl:if test="$updates//*[@about='this:IP1-address-1' and @property='vcard:extended-address']/text() != ''">
					<span about="this:IP1-address-1" property="vcard:extended-address">
						<xsl:value-of select="$updates//*[@about='this:IP1-address-1' and @property='vcard:extended-address']/text()"/>
					</span>, </xsl:if>
				<xsl:if test="$updates//*[@about='this:IP1-address-1' and @property='vcard:locality']/text() != ''">
					<span about="this:IP1-address-1" property="vcard:locality">
						<xsl:value-of select="$updates//*[@about='this:IP1-address-1' and @property='vcard:locality']/text()"/>
					</span>, </xsl:if>
				<xsl:if test="$updates//*[@about='this:IP1-address-1' and @property='vcard:region']/text() != ''">
					<span about="this:IP1-address-1" property="vcard:region">
						<xsl:value-of select="$updates//*[@about='this:IP1-address-1' and @property='vcard:region']/text()"/>
					</span>
				</xsl:if>
				<xsl:if test="$updates//*[@about='this:IP1-address-1' and @property='vcard:postal-code']/text() != ''">
					<span about="this:IP1-address-1" property="vcard:postal-code">
						<xsl:value-of select="$updates//*[@about='this:IP1-address-1' and @property='vcard:postal-code']/text()"/>
					</span>
				</xsl:if>
				<xsl:if test="$updates//*[@about='this:IP1-address-1' and @property='vcard:country-name']/text() != ''">
					<span about="this:IP1-address-1" property="vcard:country-name">
						<xsl:value-of select="$updates//*[@about='this:IP1-address-1' and @property='vcard:country-name']/text()"/>
					</span>, </xsl:if>
				<xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != ''">
          Telephone: <span about="this:IP1" property="gaz:telephone" datatype="xsd:string">
						<xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:telephone']/text()"/>
					</span>, </xsl:if>
				<xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:fax']/text() != ''"> Fax:
            <span about="this:IP1" property="gaz:fax" datatype="xsd:string">
						<xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:fax']/text()"/>
					</span>, </xsl:if>
				<xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:email']/text() != ''"> Email:
            <span about="this:IP1" property="gaz:email" datatype="xsd:string">
						<xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:email']/text()"/>
					</span>
				</xsl:if>
				<xsl:if test="$updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text() != ''"> (Reference number: <span about="this:IP1" property="person:hasIPReferenceNumber" datatype="xsd:string">
						<xsl:value-of select="$updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text()"/>
					</span>.)</xsl:if>
			</p>
		</xsl:if>
		<xsl:if test="$updates//*[@about='this:IP1' and @property='person:noticeDated']/text() != ''">
			<p>
				<span about="this:IP1" property="person:noticeDated" datatype="xsd:string">
					<xsl:value-of select="$updates//*[@about='this:IP1' and @property='person:noticeDated']/text()"/>
				</span>
			</p>
		</xsl:if>
		<xsl:if test="$updates//*[@about='this:IP1' and @property='person:additionalInformationIP']/text() != ''">
			<p>
				<span about="this:IP1" property="person:additionalInformationIP" datatype="xsd:string">
					<xsl:value-of select="$updates//*[@about='this:IP1' and @property='person:additionalInformationIP']/text()"/>
				</span>
			</p>
		</xsl:if>
	</xsl:template>
	<xsl:template name="boilerPlateText2450Edinburgh">
		<xsl:param name="updates"/>
		<span about="edition:" property="gaz:editionName" datatype="xsd:string">
			<xsl:value-of select="$updates//*[@property='gaz:hasEdition']/text()"/>
		</span>
		<p>Petitions to Wind Up (Companies)</p>
		<p>In the Matter of <span about="this:legislation-1" property="legislation:legislationTitle" datatype="xsd:string">
				<xsl:value-of select="$updates//*[@about='this:legislation-1' and @property='legislation:legislationTitle']/text()"/>
			</span>
		</p>
		<p>
			<span about="this:company-1" property="gazorg:name" datatype="xsd:string">
				<xsl:value-of select="$updates//*[@about='this:company-1' and @property='gazorg:name']/text()"/>
			</span>
		</p>
		<p>
			<span about="this:company-1" property="gazorg:companyNumber" datatype="xsd:integer">
				<xsl:value-of select="$updates//*[@about='this:company-1' and @property='gazorg:companyNumber']/text()"/>
			</span>
		</p>
		<xsl:if test="$updates//*[@about='this:company-1' and @property='gazorg:previousCompanyName']/text() != ''">
			<p>(Previously known as <span about="this:company-1" property="gazorg:previousCompanyName" datatype="xsd:string">
					<xsl:value-of select="$updates//*[@about='this:company-1' and @property='gazorg:previousCompanyName']/text()"/>
				</span>
				<xsl:if test="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:street-address']/text() != ''"> of <span about="this:company-previous-registered-office-1" property="vcard:street-address" typeof="vcard:Address">
						<xsl:value-of select="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:street-address']/text()"/>
					</span>, <span about="this:company-previous-registered-office-1" property="vcard:extended-address">
						<xsl:value-of select="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:extended-address']/text()"/>
					</span>, <span about="this:company-previous-registered-office-1" property="vcard:locality">
						<xsl:value-of select="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:locality']/text()"/>
					</span>, <span about="this:company-previous-registered-office-1" property="vcard:region">
						<xsl:value-of select="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:region']/text()"/>
					</span>
					<span about="this:company-previous-registered-office-1" property="vcard:postal-code">
						<xsl:value-of select="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:postal-code']/text()"/>
					</span>
					<span about="this:company-previous-registered-office-1" property="vcard:country-name">
						<xsl:value-of select="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:country-name']/text()"/>
					</span>)</xsl:if>
			</p>
		</xsl:if>
		<xsl:if test="$updates//*[@about='this:company-1' and @property='gazorg:tradingAs']/text() != ''">
			<p> (Trading as <span about="this:company-1" property="gazorg:tradingAs" datatype="xsd:string">
					<xsl:value-of select="$updates//*[@about='this:company-1' and @property='gazorg:tradingAs']/text()"/>
				</span>
				<xsl:if test="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:street-address']/text() != ''"> of <span about="this:company-principal-trading-address-1" property="vcard:street-address" typeof="vcard:Address">
						<xsl:value-of select="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:street-address']/text()"/>
					</span>, <span about="this:company-principal-trading-address-1" property="vcard:extended-address">
						<xsl:value-of select="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:extended-address']/text()"/>
					</span>, <span about="this:company-principal-trading-address-1" property="vcard:locality">
						<xsl:value-of select="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:locality']/text()"/>
					</span>, <span about="this:company-principal-trading-address-1" property="vcard:region">
						<xsl:value-of select="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:region']/text()"/>
					</span>
					<span about="this:company-principal-trading-address-1" property="vcard:postal-code">
						<xsl:value-of select="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:postal-code']/text()"/>
					</span>
					<span about="this:company-principal-trading-address-1" property="vcard:country-name">
						<xsl:value-of select="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:country-name']/text()"/>
					</span>) </xsl:if>
			</p>
		</xsl:if>
		<xsl:if test="$updates//*[@about='this:company-1' and @property='gazorg:previouslyTradingAs']/text() != ''">
			<p>(Previously trading as <span about="this:company-1" property="gazorg:previouslyTradingAs" datatype="xsd:string">
					<xsl:value-of select="$updates//*[@about='this:company-1' and @property='gazorg:previouslyTradingAs']/text()"/>
				</span>
				<xsl:if test="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:street-address']/text() != ''"> of <span about="this:previous-trading-address-1" property="vcard:street-address" typeof="vcard:Address">
						<xsl:value-of select="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:street-address']/text()"/>
					</span>, <span about="this:previous-trading-address-1" property="vcard:extended-address">
						<xsl:value-of select="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:extended-address']/text()"/>
					</span>, <span about="this:previous-trading-address-1" property="vcard:locality">
						<xsl:value-of select="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:locality']/text()"/>
					</span>, <span about="this:previous-trading-address-1" property="vcard:region">
						<xsl:value-of select="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:region']/text()"/>
					</span>
					<span about="this:previous-trading-address-1" property="vcard:postal-code">
						<xsl:value-of select="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:postal-code']/text()"/>
					</span>
					<span about="this:previous-trading-address-1" property="vcard:country-name">
						<xsl:value-of select="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:country-name']/text()"/>
					</span>)</xsl:if>
			</p>
		</xsl:if>
		<xsl:if test="$updates//*[@about='this:company-1' and @property='gazorg:natureOfBusiness']/text() != ''">
			<p>Nature of Business: <span about="this:company-1" property="gazorg:natureOfBusiness" datatype="xsd:string">
					<xsl:value-of select="$updates//*[@about='this:company-1' and @property='gazorg:natureOfBusiness']/text()"/>
				</span>
			</p>
		</xsl:if>
		<p>Notice is hereby given that on 
      <xsl:variable name="dateOfPetitionPresentation">
				<xsl:value-of select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateOfPetitionPresentation']/text()"/>
			</xsl:variable>
			<span about="this:notifiableThing" property="corp-insolvency:dateOfPetitionPresentation" datatype="xsd:date" content="{$dateOfPetitionPresentation}">
				<xsl:value-of select="format-date(xs:date($dateOfPetitionPresentation), '[D01] [MNn] [Y0001]')"/>
			</span>
      a Petition was presented to 
      <span about="this:notifiableThing" property="corp-insolvency:nameOfPlaceOfHearing" datatype="xsd:string">
				<xsl:value-of select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:nameOfPlaceOfHearing']/text()"/>
			</span> by 
      <span about="this:petitioner-1" property="foaf:name" datatype="xsd:string">
				<xsl:value-of select="$updates//*[@about='this:petitioner-1' and @property='foaf:name']/text()"/>
			</span>, <span about="this:petitioner-address-1" property="vcard:street-address" typeof="vcard:Address">
				<xsl:value-of select="$updates//*[@about='this:petitioner-address-1' and @property='vcard:street-address']/text()"/>
			</span>, <xsl:if test="$updates//*[@about='this:petitioner-address-1' and @property='vcard:extended-addresse']/text() != ''">
				<span about="this:petitioner-address-1" property="vcard:extended-address">
					<xsl:value-of select="$updates//*[@about='this:petitioner-address-1' and @property='vcard:extended-address']/text()"/>
				</span>, </xsl:if>
			<span about="this:petitioner-address-1" property="vcard:locality">
				<xsl:value-of select="$updates//*[@about='this:petitioner-address-1' and @property='vcard:locality']/text()"/>
			</span>, <xsl:if test="$updates//*[@about='this:petitioner-address-1' and @property='vcard:region']/text() != ''">
				<span about="this:petitioner-address-1" property="vcard:region">
					<xsl:value-of select="$updates//*[@about='this:petitioner-address-1' and @property='vcard:region']/text()"/>
				</span>
			</xsl:if>
			<span about="this:petitioner-address-1" property="vcard:postal-code">
				<xsl:value-of select="$updates//*[@about='this:petitioner-address-1' and @property='vcard:postal-code']/text()"/>
			</span>
			<xsl:if test="$updates//*[@about='this:petitioner-address-1' and @property='vcard:country-name']/text() != ''">
				<span about="this:petitioner-address-1" property="vcard:country-name">
					<xsl:value-of select="$updates//*[@about='this:petitioner-address-1' and @property='vcard:country-name']/text()"/>
				</span>
			</xsl:if>
      craving the Court <i>inter alia</i> to order that <p>
				<span about="this:company-1" property="gazorg:name" datatype="xsd:string">
					<xsl:value-of select="$updates//*[@about='this:company-1' and @property='gazorg:name']/text()"/>
				</span>
			</p> having its registered office at <span about="this:company-registered-office-1" property="vcard:street-address" typeof="vcard:Address">
				<xsl:value-of select="$updates//*[@about='this:company-registered-office-1' and @property='vcard:street-address']/text()"/>
			</span>
			<xsl:if test="$updates//*[@about='this:company-registered-office-1' and @property='vcard:extended-address']/text() != ''"> , <span about="this:company-registered-office-1" property="vcard:extended-address">
					<xsl:value-of select="$updates//*[@about='this:company-registered-office-1' and @property='vcard:extended-address']/text()"/>
				</span>
			</xsl:if> , <span about="this:company-registered-office-1" property="vcard:locality">
				<xsl:value-of select="$updates//*[@about='this:company-registered-office-1' and @property='vcard:locality']/text()"/>
			</span>
			<xsl:if test="$updates//*[@about='this:company-registered-office-1' and @property='vcard:region']/text() != ''"> , <span about="this:company-registered-office-1" property="vcard:region">
					<xsl:value-of select="$updates//*[@about='this:company-registered-office-1' and @property='vcard:region']/text()"/>
				</span>
			</xsl:if>
			<span about="this:company-registered-office-1" property="vcard:postal-code">
				<xsl:value-of select="$updates//*[@about='this:company-registered-office-1' and @property='vcard:postal-code']/text()"/>
			</span>
			<xsl:if test="$updates//*[@about='this:company-registered-office-1' and @property='vcard:country-name']/text() != ''">
				<span about="this:company-registered-office-1" property="vcard:country-name">
					<xsl:value-of select="$updates//*[@about='this:company-registered-office-1' and @property='vcard:country-name']/text()"/>
				</span>
			</xsl:if>
      be wound up by the Court and to appoint a liquidator; the 
      <span about="this:notifiableThing" property="corp-insolvency:sheriffName" datatype="xsd:string">
				<xsl:value-of select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:sheriffName']/text()"/>
			</span>
      by Interlocutor dated 
      <xsl:variable name="dateOfInterlocutor">
				<xsl:value-of select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateOfInterlocutor']/text()"/>
			</xsl:variable>
			<span about="this:notifiableThing" property="corp-insolvency:dateOfInterlocutor" datatype="xsd:date" content="{dateOfInterlocutor}">
				<xsl:value-of select="format-date(xs:date(dateOfInterlocutor), '[D01] [MNn] [Y0001]')"/>
			</span>
      appointed all persons having an interest, if they intend to show cause why the prayer of the petition should not be granted, to lodge Answers in the hands of 
      <span about="this:notifiableThing" property="corp-insolvency:nameOfPlaceOfHearing" datatype="xsd:string">
				<xsl:value-of select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:nameOfPlaceOfHearing']/text()"/>
			</span> at <span about="this:hearingAddress" property="vcard:street-address" typeof="vcard:Address">
				<xsl:value-of select="$updates//*[@about='this:hearingAddress' and @property='vcard:street-address']/text()"/>
			</span>, <xsl:if test="$updates//*[@about='this:hearingAddress' and @property='vcard:extended-address']/text() != ''">
				<span about="this:hearingAddress" property="vcard:extended-address">
					<xsl:value-of select="$updates//*[@about='this:hearingAddress' and @property='vcard:extended-address']/text()"/>
				</span> , </xsl:if>
			<span about="this:hearingAddress" property="vcard:locality">
				<xsl:value-of select="$updates//*[@about='this:hearingAddress' and @property='vcard:locality']/text()"/>
			</span>, <xsl:if test="$updates//*[@about='this:hearingAddress' and @property='vcard:region']/text() != ''">
				<span about="this:hearingAddress" property="vcard:region">
					<xsl:value-of select="$updates//*[@about='this:hearingAddress' and @property='vcard:region']/text()"/>
				</span>
			</xsl:if>
			<span about="this:hearingAddress" property="vcard:postal-code">
				<xsl:value-of select="$updates//*[@about='this:hearingAddress' and @property='vcard:postal-code']/text()"/>
			</span>
			<xsl:if test="$updates//*[@about='this:hearingAddress' and @property='vcard:country-name']/text() != ''">
				<span about="this:hearingAddress" property="vcard:country-name">
					<xsl:value-of select="$updates//*[@about='this:hearingAddress' and @property='vcard:country-name']/text()"/>
				</span>
			</xsl:if>
      within eight days after such intimation, service or advertisement. 
    </p>
		<xsl:if test="$updates//*[@about='this:IP1' and @property='foaf:name']/text() != ''">
			<p>
				<span about="this:IP1" property="foaf:name" datatype="xsd:string">
					<xsl:value-of select="$updates//*[@about='this:IP1' and @property='foaf:name']/text()"/>
				</span> of
          <span about="this:IP1" property="foaf:name" datatype="xsd:string">
					<xsl:value-of select="$updates//*[@about='this:IP1' and @property='foaf:name']/text()"/>
				</span>
				<xsl:if test="$updates//*[@about='this:IP-company-1' and @property='gazorg:name']/text() != ''">
					<span about="this:IP-company-1" property="gazorg:name" datatype="xsd:string">
						<xsl:value-of select="$updates//*[@about='this:IP-company-1' and @property='gazorg:name']/text()"/>
					</span>, </xsl:if>
				<xsl:if test="$updates//*[@about='this:IP1-address-1' and @property='vcard:street-address']/text() != ''">
					<span about="this:IP1-address-1" property="vcard:street-address" typeof="vcard:Address">
						<xsl:value-of select="$updates//*[@about='this:IP1-address-1' and @property='vcard:street-address']/text()"/>
					</span>, </xsl:if>
				<xsl:if test="$updates//*[@about='this:IP1-address-1' and @property='vcard:extended-address']/text() != ''">
					<span about="this:IP1-address-1" property="vcard:extended-address">
						<xsl:value-of select="$updates//*[@about='this:IP1-address-1' and @property='vcard:extended-address']/text()"/>
					</span>, </xsl:if>
				<xsl:if test="$updates//*[@about='this:IP1-address-1' and @property='vcard:locality']/text() != ''">
					<span about="this:IP1-address-1" property="vcard:locality">
						<xsl:value-of select="$updates//*[@about='this:IP1-address-1' and @property='vcard:locality']/text()"/>
					</span>, </xsl:if>
				<xsl:if test="$updates//*[@about='this:IP1-address-1' and @property='vcard:region']/text() != ''">
					<span about="this:IP1-address-1" property="vcard:region">
						<xsl:value-of select="$updates//*[@about='this:IP1-address-1' and @property='vcard:region']/text()"/>
					</span>
				</xsl:if>
				<xsl:if test="$updates//*[@about='this:IP1-address-1' and @property='vcard:postal-code']/text() != ''">
					<span about="this:IP1-address-1" property="vcard:postal-code">
						<xsl:value-of select="$updates//*[@about='this:IP1-address-1' and @property='vcard:postal-code']/text()"/>
					</span>
				</xsl:if>
				<xsl:if test="$updates//*[@about='this:IP1-address-1' and @property='vcard:country-name']/text() != ''">
					<span about="this:IP1-address-1" property="vcard:country-name">
						<xsl:value-of select="$updates//*[@about='this:IP1-address-1' and @property='vcard:country-name']/text()"/>
					</span>, </xsl:if>
				<xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != ''">
          Tel: <span about="this:IP1" property="gaz:telephone" datatype="xsd:string">
						<xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:telephone']/text()"/>
					</span>, </xsl:if>
				<xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:fax']/text() != ''"> Fax:
            <span about="this:IP1" property="gaz:fax" datatype="xsd:string">
						<xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:fax']/text()"/>
					</span>, </xsl:if>
				<xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:email']/text() != ''"> Email:
            <span about="this:IP1" property="gaz:email" datatype="xsd:string">
						<xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:email']/text()"/>
					</span>
				</xsl:if>
				<xsl:if test="$updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text() != ''"> Ref: <span about="this:IP1" property="person:hasIPReferenceNumber" datatype="xsd:string">
						<xsl:value-of select="$updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text()"/>
					</span>
				</xsl:if>
			</p>
		</xsl:if>
		<xsl:if test="$updates//*[@about='this:IP1' and @property='person:noticeDated']/text() != ''">
			<p>
				<span about="this:IP1" property="person:noticeDated" datatype="xsd:string">
					<xsl:value-of select="$updates//*[@about='this:IP1' and @property='person:noticeDated']/text()"/>
				</span>
			</p>
		</xsl:if>
	</xsl:template>
	<xsl:template name="boilerPlateText2451">
		<xsl:param name="updates"/>
		<p>
Petitions to Wind Up (Partnerships)
In the <span about="this:court-1" property="court:courtName" datatype="xsd:string">
				<xsl:value-of select="$updates//*[@about='this:court-1' and @property='court:courtName']/text()"/>
			</span>
			<span about="this:court-1" property="court:courtDistrict" datatype="xsd:string">
				<xsl:value-of select="$updates//*[@about='this:court-1' and @property='court:courtDistrict']/text()"/>
			</span>
			<span about="this:court-case-1" property="court:caseNumber" datatype="xsd:string">
				<xsl:value-of select="$updates//*[@about='this:court-case-1' and @property='court:caseNumber']/text()"/>
			</span> of <span about="this:court-case-1" property="court:caseYear" datatype="xsd:gYear">
				<xsl:value-of select="$updates//*[@about='this:court-case-1' and @property='court:caseYear']/text()"/>
			</span>
		</p>
		<p>In the matter of <span about="this:company-1" property="gazorg:name" datatype="xsd:string">
				<xsl:value-of select="$updates//*[@about='this:company-1' and @property='gazorg:name']/text()"/>
			</span>
		</p>
		<xsl:if test="$updates//*[@about='this:company-1' and @property='gazorg:partnershipNumber']/text() != ''">
(Registered Number <span about="this:company-1" property="gazorg:partnershipNumber" datatype="xsd:string">
				<xsl:value-of select="$updates//*[@about='this:company-1' and @property='gazorg:partnershipNumber']/text()"/>
			</span>)
</xsl:if>
		<xsl:if test="$updates//*[@about='this:company-1' and @property='gazorg:previousCompanyName']/text() != ''">
			<p>
(Previously known as <span about="this:company-1" property="gazorg:previousCompanyName" datatype="xsd:string">
					<xsl:value-of select="$updates//*[@about='this:company-1' and @property='gazorg:previousCompanyName']/text()"/>
				</span>
				
				<xsl:if test="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:street-address']/text() != ''">
of <span about="this:company-previous-registered-office-1" property="vcard:street-address" typeof="vcard:Address">
						<xsl:value-of select="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:street-address']/text()"/>
					</span>, </xsl:if>
					
				<xsl:if test="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:extended-address']/text() != ''">
					<span about="this:company-previous-registered-office-1" property="vcard:extended-address">
						<xsl:value-of select="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:extended-address']/text()"/>
					</span>, 
</xsl:if>
				<xsl:if test="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:locality']/text() != ''">
					<span about="this:company-previous-registered-office-1" property="vcard:locality">
						<xsl:value-of select="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:locality']/text()"/>
					</span>, </xsl:if>
				<xsl:if test="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:region']/text() != ''">
					<span about="this:company-previous-registered-office-1" property="vcard:region">
						<xsl:value-of select="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:region']/text()"/>
					</span>
				</xsl:if>
				<xsl:if test="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:postal-code']/text() != ''">
					<span about="this:company-previous-registered-office-1" property="vcard:postal-code">
						<xsl:value-of select="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:postal-code']/text()"/>
					</span>
				</xsl:if>
				<xsl:if test="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:country-name']/text() != ''">
					<span about="this:company-previous-registered-office-1" property="vcard:country-name">
						<xsl:value-of select="$updates//*[@about='this:company-previous-registered-office-1' and @property='vcard:country-name']/text()"/>
					</span>
				</xsl:if>) 
</p>
		</xsl:if>
		
			<xsl:if test="$updates//*[@about='this:company-1' and @property='gazorg:tradingAs']/text() != ''">	
			<p>
		(Trading as <span about="this:company-1" property="gazorg:tradingAs"><xsl:value-of select="$updates//*[@about='this:company-1' and @property='gazorg:tradingAs']/text()"/></span>
		
<xsl:if test="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:street-address']/text() != ''">		
of <span about="this:company-principal-trading-address-1" property="vcard:street-address" typeof="vcard:Address"><xsl:value-of select="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:street-address']/text()"/></span>, 
</xsl:if>

<xsl:if test="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:extended-address']/text() != ''">
<span about="this:company-principal-trading-address-1" property="vcard:extended-address"><xsl:value-of select="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:extended-address']/text()"/></span>, 
</xsl:if>

<xsl:if test="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:locality']/text() != ''">
<span about="this:company-principal-trading-address-1" property="vcard:locality"><xsl:value-of select="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:locality']/text()"/></span>, 
</xsl:if>

<xsl:if test="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:region']/text() != ''">
<span about="this:company-principal-trading-address-1" property="vcard:region"><xsl:value-of select="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:region']/text()"/></span>
</xsl:if>

<xsl:if test="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:postal-code']/text() != ''">
 <span about="this:company-principal-trading-address-1" property="vcard:postal-code"><xsl:value-of select="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:postal-code']/text()"/></span> 
 </xsl:if>
 
 <xsl:if test="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:country-name']/text() != ''"> 
 <span about="this:company-principal-trading-address-1" property="vcard:country-name"><xsl:value-of select="$updates//*[@about='this:company-principal-trading-address-1' and @property='vcard:country-name']/text()"/></span>
 </xsl:if>)</p>
 </xsl:if>
		
		<xsl:if test="$updates//*[@about='this:company-1' and @property='gazorg:previouslyTradingAs']/text() != ''">
		<p>
	(Previously trading as <span about="this:company-1" property="gazorg:previouslyTradingAs"><xsl:value-of select="$updates//*[@about='this:company-1' and @property='gazorg:previouslyTradingAs']/text()"/></span>
	
	<xsl:if test="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:street-address']/text() != ''">
	 of <span about="this:previous-trading-address-1" property="vcard:street-address" typeof="vcard:Address"><xsl:value-of select="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:street-address']/text()"/></span>, 
	 </xsl:if>
	 
	 <xsl:if test="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:extended-address']/text() != ''">
	 <span about="this:previous-trading-address-1" property="vcard:extended-address"><xsl:value-of select="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:extended-address']/text()"/></span>, 
	 </xsl:if>
	
	<xsl:if test="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:locality']/text() != ''">
	 <span about="this:previous-trading-address-1" property="vcard:locality"><xsl:value-of select="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:locality']/text()"/></span>, 
	 </xsl:if>
	 
	 <xsl:if test="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:region']/text() != ''">
	 <span about="this:previous-trading-address-1" property="vcard:region"><xsl:value-of select="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:region']/text()"/></span>
	 </xsl:if>
	 
	 <xsl:if test="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:postal-code']/text() != ''">
	  <span about="this:previous-trading-address-1" property="vcard:postal-code"><xsl:value-of select="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:postal-code']/text()"/></span>
	  </xsl:if>
	  
	  <xsl:if test="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:country-name']/text() != ''">
	  <span about="this:previous-trading-address-1" property="vcard:country-name"><xsl:value-of select="$updates//*[@about='this:previous-trading-address-1' and @property='vcard:country-name']/text()"/></span>
	  </xsl:if>)
	  </p>
	</xsl:if>
	
	<xsl:if test="$updates//*[@about='this:company-1' and @property='gazorg:natureOfBusiness']/text() != ''">
	<p>Nature of Business: <span about="this:company-1" property="gazorg:natureOfBusiness" datatype="xsd:string"><xsl:value-of select="$updates//*[@about='this:company-1' and @property='gazorg:natureOfBusiness']/text()"/></span></p>
	</xsl:if>
	
	<xsl:if test="$updates//*[@about='this:legislation-1' and @property='legislation:legislationTitle']/text() != ''">
	<p>and in the Matter of the <span about="this:legislation-1" property="legislation:legislationTitle"  datatype="xsd:string"><xsl:value-of select="$updates//*[@about='this:legislation-1' and @property='legislation:legislationTitle']/text()"/></span></p>
	</xsl:if>
	
	<p>
	A Petition to wind up the above-named Partnership of <span about="this:company-registered-office-1" property="vcard:street-address" typeof="vcard:Address"><xsl:value-of select="$updates//*[@about='this:company-registered-office-1' and @property='vcard:street-address']/text()"/></span>, 
	
	<xsl:if test="$updates//*[@about='this:company-registered-office-1' and @property='vcard:extended-address']/text() != ''">
	<span about="this:company-registered-office-1"  property="vcard:extended-address"><xsl:value-of select="$updates//*[@about='this:company-registered-office-1' and @property='vcard:extended-address']/text()"/></span>, 
	</xsl:if>
	
	<span about="this:company-registered-office-1"  property="vcard:locality"><xsl:value-of select="$updates//*[@about='this:company-registered-office-1' and @property='vcard:locality']/text()"/></span>, 
	
	<xsl:if test="$updates//*[@about='this:company-registered-office-1' and @property='vcard:region']/text() != ''">
	<span about="this:company-registered-office-1"  property="vcard:region"><xsl:value-of select="$updates//*[@about='this:company-registered-office-1' and @property='vcard:region']/text()"/></span>, 
	</xsl:if>

	<span about="this:company-registered-office-1"  property="vcard:postal-code"><xsl:value-of select="$updates//*[@about='this:company-registered-office-1' and @property='vcard:postal-code']/text()"/></span>, 	
	
		<xsl:if test="$updates//*[@about='this:company-registered-office-1' and @property='vcard:country-name']/text() != ''">
	<span about="this:company-registered-office-1"  property="vcard:country-name"><xsl:value-of select="$updates//*[@about='this:company-registered-office-1' and @property='vcard:country-name']/text()"/></span>, 
	</xsl:if>

	presented on 
	
	<xsl:variable name="dateOfPetitionPresentation">
	<xsl:value-of select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateOfPetitionPresentation']/text()"/>
	</xsl:variable>
	<span about="this:notifiableThing" property="corp-insolvency:dateOfPetitionPresentation" datatype="xsd:date" content="{$dateOfPetitionPresentation}"><xsl:value-of select="format-date(xs:date($dateOfPetitionPresentation), '[D01] [MNn] [Y0001]')"/></span> by <span about="this:petitioner-1"  property="foaf:name" datatype="xsd:string" ><xsl:value-of select="$updates//*[@about='this:petitioner-1' and @property='foaf:name']/text()"/></span>, of <span about="this:petitioner-address-1" property="vcard:street-address" typeof="vcard:Address"><xsl:value-of select="$updates//*[@about='this:petitioner-address-1' and @property='vcard:street-address']/text()"/></span>, 
	
	<xsl:if test="$updates//*[@about='this:petitioner-address-1' and @property='vcard:extended-address']/text() != ''">
	<span about="this:petitioner-address-1"  property="vcard:extended-address"><xsl:value-of select="$updates//*[@about='this:petitioner-address-1' and @property='vcard:extended-address']/text()"/></span>, 
	</xsl:if>
	
		<span about="this:petitioner-address-1"  property="vcard:locality"><xsl:value-of select="$updates//*[@about='this:petitioner-address-1' and @property='vcard:locality']/text()"/></span>, 
		
		<xsl:if test="$updates//*[@about='this:petitioner-address-1' and @property='vcard:region']/text() != ''">
	<span about="this:petitioner-address-1"  property="vcard:region"><xsl:value-of select="$updates//*[@about='this:petitioner-address-1' and @property='vcard:region']/text()"/></span>
	</xsl:if>
	
	<span about="this:petitioner-address-1"  property="vcard:postal-code"><xsl:value-of select="$updates//*[@about='this:petitioner-address-1' and @property='vcard:postal-code']/text()"/></span>
	
	
		<xsl:if test="$updates//*[@about='this:petitioner-address-1' and @property='vcard:country-name']/text() != ''">
	<span about="this:petitioner-address-1"  property="vcard:country-name"><xsl:value-of select="$updates//*[@about='this:petitioner-address-1' and @property='vcard:country-name']/text()"/></span>
	</xsl:if>
	
claiming to be a <span about="this:notifiableThing" property="corp-insolvency:presentedBy"><xsl:value-of select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:presentedBy']/text()"/></span> of the Company, will be heard at <span about="this:notifiableThing" property="corp-insolvency:nameOfPlaceOfHearing"><xsl:value-of select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:nameOfPlaceOfHearing']/text()"/></span>, <span about="this:hearingAddress" property="vcard:street-address" typeof="vcard:Address"><xsl:value-of select="$updates//*[@about='this:hearingAddress' and @property='vcard:street-address']/text()"/></span>, 


		<xsl:if test="$updates//*[@about='this:hearingAddress' and @property='vcard:extended-address']/text() != ''">
	<span about="this:hearingAddress"  property="vcard:extended-address"><xsl:value-of select="$updates//*[@about='this:hearingAddress' and @property='vcard:extended-address']/text()"/></span>,
	</xsl:if>
	
	<span about="this:hearingAddress"  property="vcard:locality"><xsl:value-of select="$updates//*[@about='this:hearingAddress' and @property='vcard:locality']/text()"/></span>,

<xsl:if test="$updates//*[@about='this:hearingAddress' and @property='vcard:region']/text() != ''">
	<span about="this:hearingAddress"  property="vcard:region"><xsl:value-of select="$updates//*[@about='this:hearingAddress' and @property='vcard:region']/text()"/></span>,
	</xsl:if>
	
	<span about="this:hearingAddress"  property="vcard:postal-code"><xsl:value-of select="$updates//*[@about='this:hearingAddress' and @property='vcard:postal-code']/text()"/></span>

<xsl:if test="$updates//*[@about='this:hearingAddress' and @property='vcard:country-name']/text() != ''">
	<span about="this:hearingAddress"  property="vcard:country-name"><xsl:value-of select="$updates//*[@about='this:hearingAddress' and @property='vcard:country-name']/text()"/></span>
	</xsl:if>

      <xsl:variable name="dateOfHearing">
				<xsl:value-of select="format-date(xs:date($updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateOfHearing']/text()),'[D01] [MNn] [Y0001]')"/>
			</xsl:variable>
			<xsl:variable name="timeOfHearing">
				<xsl:value-of select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateOfHearingWITHtime']/text()"/>
			</xsl:variable>
			<xsl:variable name="dateOfHearingValue">
				<xsl:value-of select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateOfHearing']/text()"/>
			</xsl:variable>
	<xsl:variable name="hearing">
				<xsl:value-of select="concat($dateOfHearingValue,'T',$timeOfHearing,':00')"/>
			</xsl:variable>
on 	<span about="this:notifiableThing" datatype="xsd:dateTime" property="corp-insolvency:dateOfHearing" content="{$hearing}"><xsl:value-of select="concat($dateOfHearing,' at ',$timeOfHearing)"/></span> (or as soon thereafter as the Petition can be heard). 

	</p>
	
	<p>
	
	
	<xsl:variable name="dateInsolvencyRule">
	<xsl:value-of select="$updates//*[@about='this:notifiableThing' and @property='corp-insolvency:dateInsolvencyRule']/text()"/>
	</xsl:variable>
	Any person intending to appear on the hearing of the Petition (whether to support or oppose it) must give notice of intention to do so to the Petitioner or its Solicitor in accordance with Rule 4.16 by 16.00 hours on <span about="this:notifiableThing" property="corp-insolvency:dateInsolvencyRule" datatype="xsd:date" content="{$dateInsolvencyRule}"><xsl:value-of select="format-date(xs:date($dateInsolvencyRule), '[D01] [MNn] [Y0001]')"/></span>. 
	</p>
	
	<xsl:if test="$updates//*[@about='this:IP1' and @property='foaf:name']/text() != ''">
	<p>
	<xsl:choose>
					<xsl:when test="$updates//*[@about='gzw:repDetails' and @property='gzw:repType']/text() = 'petitioner'"> The Petitioner is </xsl:when>
					<xsl:otherwise> The Petitioner's Solicitor is </xsl:otherwise>
				</xsl:choose>
	<span about="this:IP1" property="foaf:name" datatype="xsd:string"><xsl:value-of select="$updates//*[@about='this:IP1' and @property='foaf:name']/text()"/></span> 
	
	<xsl:if test="$updates//*[@about='this:IP-company-1' and @property='gazorg:name']/text() != ''">
	<span about="this:IP-company-1" property="gazorg:name" datatype="xsd:string"><xsl:value-of select="$updates//*[@about='this:IP-company-1' and @property='gazorg:name']/text()"/></span>, 
	</xsl:if>
	<xsl:if test="$updates//*[@about='this:IP1-address-1' and @property='vcard:street-address']/text() != ''">
	<span about="this:IP1-address-1" property="vcard:street-address" typeof="vcard:Address"><xsl:value-of select="$updates//*[@about='this:IP1-address-1' and @property='vcard:street-address']/text()"/></span>, 
	</xsl:if>
	<xsl:if test="$updates//*[@about='this:IP1-address-1' and @property='vcard:extended-address']/text() != ''">
	<span about="this:IP1-address-1" property="vcard:extended-address"><xsl:value-of select="$updates//*[@about='this:IP1-address-1' and @property='vcard:extended-address']/text()"/></span>, 
</xsl:if>	
<xsl:if test="$updates//*[@about='this:IP1-address-1' and @property='vcard:locality']/text() != ''">
	<span about="this:IP1-address-1" property="vcard:locality"><xsl:value-of select="$updates//*[@about='this:IP1-address-1' and @property='vcard:locality']/text()"/></span>, 
	</xsl:if>
	<xsl:if test="$updates//*[@about='this:IP1-address-1' and @property='vcard:region']/text() != ''">
	<span about="this:IP1-address-1" property="vcard:region"><xsl:value-of select="$updates//*[@about='this:IP1-address-1' and @property='vcard:region']/text()"/></span>
</xsl:if>
<xsl:if test="$updates//*[@about='this:IP1-address-1' and @property='vcard:postal-code']/text() != ''">	
	<span about="this:IP1-address-1" property="vcard:postal-code"><xsl:value-of select="$updates//*[@about='this:IP1-address-1' and @property='vcard:postal-code']/text()"/></span>
</xsl:if>
<xsl:if test="$updates//*[@about='this:IP1-address-1' and @property='vcard:country-name']/text() != ''">
	 <span about="this:IP1-address-1" property="vcard:country-name"><xsl:value-of select="$updates//*[@about='this:IP1-address-1' and @property='vcard:country-name']/text()"/></span>, 
</xsl:if>
<xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:telephone']/text() != ''">	 
	 Telephone: <span about="this:IP1" property="gaz:telephone" datatype="xsd:string"><xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:telephone']/text()"/></span>,  
</xsl:if>	
<xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:fax']/text() != ''">	 
 
	 Fax: <span about="this:IP1" property="gaz:fax" datatype="xsd:string"><xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:fax']/text()"/></span>, 
	 </xsl:if>
	 <xsl:if test="$updates//*[@about='this:IP1' and @property='gaz:email']/text() != ''">	 

	 Email: <span about="this:IP1" property="gaz:email" datatype="xsd:string"><xsl:value-of select="$updates//*[@about='this:IP1' and @property='gaz:email']/text()"/></span>
	 </xsl:if>
	 <xsl:if test="$updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text() != ''">	 

	 (Reference number: <span about="this:IP1" property="person:hasIPReferenceNumber" datatype="xsd:string"><xsl:value-of select="$updates//*[@about='this:IP1' and @property='person:hasIPReferenceNumber']/text()"/></span>.
	 </xsl:if>
	 )
	 </p>
	 <xsl:if test="$updates//*[@about='this:IP1' and @property='person:noticeDated']/text() != ''">	 
	 <xsl:variable name="noticeDated">
	 <xsl:value-of select="$updates//*[@about='this:IP1' and @property='person:noticeDated']/text()"/>
	 </xsl:variable>
<p>
<span about="this:IP1" property="person:noticeDated" datatype="xsd:date" content="{$noticeDated}"><xsl:value-of select="format-date(xs:date($noticeDated), '[D01] [MNn] [Y0001]')"/></span>
</p>
</xsl:if>
<xsl:if test="$updates//*[@about='this:IP1' and @property='person:additionalInformationIP']/text() != ''">	 
<p>
<span about="this:IP1" property="person:additionalInformationIP"><xsl:value-of select="$updates//*[@about='this:IP1' and @property='person:additionalInformationIP']/text()"/></span>
</p>
</xsl:if>
</xsl:if>
	</xsl:template>
</xsl:stylesheet>
