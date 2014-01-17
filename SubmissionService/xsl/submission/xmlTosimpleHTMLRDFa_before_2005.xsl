<?xml version="1.0" encoding="UTF-8"?>
  <!--©  Crown copyright
 
You may use and re-use this code free of charge under the terms of the Open Government Licence
 
http://www.nationalarchives.gov.uk/doc/open-government-licence/-->
   <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gz="http://www.tso.co.uk/assets/namespace/gazette" xmlns:ukm="http://www.tso.co.uk/assets/namespace/metadata" xmlns:wgs84="http://www.w3.org/2003/01/geo/wgs84_pos" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:personal-legal="http://www.thegazette.co.uk/ontology/personal-legal" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:gzc="http://www.tso.co.uk/assets/namespace/gazette/LGconfiguration" xmlns:math="http://www.w3.org/1998/Math/MathML" xmlns:html="http://www.w3.org/1999/xhtml" xmlns="http://www.w3.org/1999/xhtml" xmlns:functx="http://www.functx.com" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:dfn="http://www.dfn.org/dfn" exclude-result-prefixes="xs html gz ukm wgs84 personal-legal  dc gzc math" version="2.0">
        
      
        <xsl:output method="xml" omit-xml-declaration="yes" indent="no" encoding="UTF-8"/>
        
        <xsl:param name="issueNumber" as="xs:string" required="yes"/>
        <xsl:param name="edition" as="xs:string" required="yes"/>
        <!--<xsl:param name="legalInformation" as="node()" required="yes"/>-->
        
        <!-- Parameters to create metadata info -->
        <xsl:param name="bundleId" as="xs:string" required="yes"/>
        <xsl:param name="noticeId" as="xs:string" required="yes"/>
        <xsl:param name="status" as="xs:string" required="yes"/>
        <xsl:param name="version-count" as="xs:string" required="yes"/>
        <xsl:param name="user-submitted" as="xs:string" required="yes"/>
        <xsl:param name="legacyNoticeNumber" as="xs:string" required="yes"/>
        
        <xsl:variable name="paramConfigXml" select="if (doc-available('../../configuration/LGconfiguration.xml')) then doc('../../configuration/LGconfiguration.xml') else ()"/>
        <xsl:variable name="gaz">https://www.thegazette.co.uk/</xsl:variable>
        <xsl:variable name="noticeType" select="notice/@code"/>
        <!-- xsl:variable name="noticeNo" select="translate(translate(notice/legal[1]/r/c[1],'(',''),')','')"/ -->
        <xsl:variable name="noticeNo" select=" translate(translate($legacyNoticeNumber,'(',''),')','')"/>
        <H1>|<xsl:value-of select="$noticeNo"/>|</H1>
        <xsl:variable name="idURI" select="concat($gaz,'id','/notice/', $noticeId)"/>      
        <xsl:variable name="documentURI" select="concat($gaz,'notice/', $noticeId)"/>
       
        <xsl:variable name="name">
          <xsl:choose>
            <xsl:when test="contains(notice/legal/r/c[1],',')"><xsl:value-of select="normalize-space(replace(substring-after(notice/legal/r/c[1],','),'\(.*\)',''))"/></xsl:when>
            <xsl:otherwise><xsl:value-of select="normalize-space(substring-after(notice/legal/r/c[1],' '))"/></xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
		<xsl:variable name="names" as="xs:string*" select="tokenize($name,' ')"/>
		
        <xsl:variable name="surName">
          <xsl:choose>
            <xsl:when test="contains(notice/legal/r/c[1],',')"><xsl:value-of select="normalize-space(substring-before(notice/legal/r/c[1],','))"/></xsl:when>
            <xsl:otherwise><xsl:value-of select="normalize-space(substring-before(notice/legal/r/c[1],' '))"/></xsl:otherwise>
          </xsl:choose>         
        </xsl:variable>
      
        <xsl:variable name="firstName" select="normalize-space($names[1])"/>
        <xsl:variable name="middleName" select="normalize-space(substring-after($name,$names[1]))"/>
        
        <xsl:variable name="fullName" select="concat(substring-after(notice/legal[1]/r/c[1],','),' ',substring-before(notice/legal[1]/r/c[1],','))"/> 
        <xsl:variable name="personFullName" select="normalize-space(replace($fullName,'\s+',' '))"/>
      <xsl:variable name="personURI" select="string-join(('this:','deceasedPerson'),'')"/>        
                    
        <xsl:variable name="noticeCode" select="notice/@code"/>
        <xsl:variable name="noticeURI" select="concat($gaz,'id','/notice/', $noticeId)"/>
        <xsl:variable name="oldNoticeURI" select="concat($gaz,'id/','edition/',$edition,'/issue/',$issueNumber,'/notice/', $noticeNo)"/>
        <xsl:variable name="issueURI" select="concat($gaz,'id/','edition/',$edition,'/issue/',$issueNumber)"/>
        <xsl:variable name="editionURI" select="concat($gaz,'id/','edition/',$edition)"/>
        <xsl:variable name="getMonthofPubDate">
            <xsl:call-template name="getMonth">
                <xsl:with-param name="month" select="normalize-space(notice/date/month)"/>
            </xsl:call-template>
        </xsl:variable>
       
        <xsl:variable name="noticeDate">
            <xsl:value-of select="normalize-space(notice/date/year)"/>
            <xsl:text>-</xsl:text>
            <xsl:value-of select="$getMonthofPubDate"/>
            <xsl:text>-</xsl:text>
            <xsl:value-of select="format-number(number(normalize-space(notice/date/day)),'00')"/>
			<xsl:text>T15:30:00</xsl:text>
        </xsl:variable>
     
  		<xsl:variable name="publicationDate">
    		<xsl:choose>
				<xsl:when test="$noticeDate castable as xs:dateTime">
					<xsl:value-of select="format-dateTime(xs:dateTime($noticeDate), '[D] [MNn] [Y] [h]:[m]:[s] [P]')"/>
				</xsl:when>
				<xsl:otherwise>
    				<xsl:value-of select="normalize-space(notice/date/day)"/>
    				<xsl:text> </xsl:text>
    				<xsl:value-of select="normalize-space(notice/date/month)"/>
    				<xsl:text> </xsl:text>
    				<xsl:value-of select="normalize-space(notice/date/year)"/>
				</xsl:otherwise>
    		</xsl:choose>
  		</xsl:variable>

        <xsl:variable name="claimsDate" select="normalize-space(notice/legal[1]/r/c[4])"/>
        
        <!-- xsl:variable name="deathDate" select="functx:getDeathofDate(notice/legal/r/c[2])"/ -->
      <xsl:variable name="deathDate" select="functx:getDeathofDate(/notice/legal/r/c[2])"/>
        
        <xsl:template match="/">
            <xsl:apply-templates select="notice"/>
        </xsl:template>
        
        <!-- handle content with processing instructions embedded -->
        
        <xsl:template mode="handle_pi" match="processing-instruction('BR')"><br/></xsl:template>
        <xsl:template mode="handle_pi" match="text()"><xsl:value-of select="replace(.,'\s+',' ')" disable-output-escaping="no"/></xsl:template>
      
        
        <!-- ## -->
        
        <xsl:template match="notice">
          <html prefix="dc11: http://purl.org/dc/elements/1.1/             gaz: https://www.thegazette.co.uk/def/publication#             person: https://www.thegazette.co.uk/def/person#               personal-legal: https://www.thegazette.co.uk/def/personal-legal#               org: http://www.w3.org/ns/org#              this: {$idURI}#              prov: http://www.w3.org/ns/prov#">
                <xsl:attribute name="DocumentURI" select="$documentURI"/>
                <xsl:attribute name="IdURI" select="$idURI"/>  
                <xsl:attribute name="version">XHTML+RDFa 1.1</xsl:attribute>
                <head>
                    <title>
                        <xsl:value-of select="$paramConfigXml//gzc:Notice[@Code = $noticeType]/gzc:Name"/>                   
                    </title>
                    <!-- metadata-->
                  <gazette-metadata xmlns="http://www.gazettes.co.uk/metadata">
                        <bundle-id><xsl:value-of select="$bundleId"/></bundle-id>
                        <notice-id><xsl:value-of select="$noticeId"/></notice-id>
                        <status><xsl:value-of select="$status"/></status>
                        <version-count><xsl:value-of select="$version-count"/></version-count>
                        <notice-code><xsl:value-of select="$noticeType"/></notice-code>
                        <notice-category-codes>
                          <xsl:variable name="thecategory" select="substring($noticeType,1,2)"/>
                          <notice-category-code><xsl:value-of select="$thecategory"/></notice-category-code>
                          <xsl:if test="$paramConfigXml/gzc:Configuration//gzc:Notice[@Code = $noticeType]/ancestor::gzc:Section/@Code">
                            <notice-category-code><xsl:value-of select="$paramConfigXml/gzc:Configuration//gzc:Notice[@Code = $noticeType]/ancestor::gzc:Section/@Code"/></notice-category-code>
                          </xsl:if>
                        </notice-category-codes>
                        <notice-capture-method>pre-2005-dtd-xml</notice-capture-method>
                        <edition><xsl:value-of select="$edition"/></edition>
                        <issue><xsl:value-of select="$issueNumber"/></issue>
                        <legacy-notice-number><xsl:value-of select="$noticeNo"/></legacy-notice-number>                  
                        <user-submitted><xsl:value-of select="$user-submitted"/></user-submitted>
                        <source>DTD</source>
                        <notice-logo>
                          <xsl:value-of select="//*[local-name()='Image']"/>
                        </notice-logo>
                    </gazette-metadata>
                </head>
            <body>
                <article>
                  
                        <h1>
                            <xsl:value-of select="$noticeId"/>                            
                        </h1>
                    
                      <div class="rdfa-data">
                        <span about="{$noticeURI}" property="dc11:publisher" content="TSO (The Stationery Office), St Crispins, Duke Street, Norwich, NR3 1PD, 01603 622211, customer.services@tso.co.uk"/>
                        <span about="{$noticeURI}" property="gaz:isAbout" resource="this:notifiableThing"/>   
                        <span about="{$noticeURI}" property="owl:sameAs" resource="https://www.thegazette.co.uk/id/notice/{$noticeId}"/>
                        <span about="{$noticeURI}" property="prov:has_provenance" resource="https://www.thegazette.co.uk/id/notice/{$noticeId}/provenance"/> 
                        <span about="{$noticeURI}" property="prov:has_anchor" resource="{$noticeURI}"/> 
                        <span about="{$noticeURI}" property="gaz:isInIssue" resource="{$issueURI}"/>
                        <span resource="{$issueURI}" typeof="gaz:Issue"/>
                        <span about="{$issueURI}" property="gaz:hasEdition" resource="{$editionURI}"/>
                        <span about="{$issueURI}" content="{$issueNumber}" datatype="xsd:string" property="gaz:hasIssueNumber"/>
                        <span resource="{$editionURI}" typeof="gaz:Edition"/>
                        
                        <span about="https://www.thegazette.co.uk/id/notice/{$noticeId}" property="owl:sameAs" resource="https://www.thegazette.co.uk/id/edition/{$edition}/issue/{$issueNumber}/notice/{$noticeNo}" typeof="gaz:Notice"/>
                        <span about="https://www.thegazette.co.uk/id/notice/{$noticeId}" property="prov:alternateOf" resource="http://www.{lower-case($edition)}-gazette.co.uk/id/issues/{$issueNumber}/notices/{$noticeNo}" typeof="gaz:Notice"/>
                        
                        <span about="https://www.thegazette.co.uk/id/notice/{$noticeId}" property="gaz:hasNoticeNumber" datatype="xsd:integer" content="{$noticeNo}"/>
                        
                       <!-- <span about="{$noticeURI}" property="owl:sameAs" resource="{$oldNoticeURI}" typeof="gaz:Notice"/>-->
                        
                        
                        <!-- Common to all 2903 notices -->
                        <xsl:choose>
                          <xsl:when test="$noticeType = '2903'">
                            <span resource="this:notifiableThing" typeof="personal-legal:NoticeForClaimsAgainstEstate/"/>
                            <span about="{$noticeURI}" property="gaz:isRequiredByLegislation" resource="http://www.legislation.gov.uk/ukpga/Geo5/15-16/19/section/27"/>
                            <span about="this:notifiableThing" property="personal-legal:hasPersonalRepresentative" resource="this:estateExecutor"/>
                            <span resource="this:addressOfDeceased" typeof="vcard:Address"/>
                            <span resource="this:addressOfExecutor" typeof="vcard:Address"/>
                            <span resource="this:estateExecutor" typeof="foaf:Agent"/>
                            <span about="this:estateExecutor" property="vcard:adr" resource="this:addressOfExecutor"/>
                            <!-- Needed for all 2903 notices -->
                            <span resource="{$noticeURI}" typeof="gaz:DeceasedEstatesNotice gaz:WillsAndProbateNotice gaz:Notice"/>
                            <span about="this:notifiableThing" property="personal-legal:hasEstateOf" resource="{$personURI}"/>
                            <span about="{$personURI}" typeof="gaz:Person"/>
                            <span about="{$personURI}" property="person:hasAddress" resource="this:addressOfDeceased-address-1"/>
                            <span about="{$personURI}" content="{$personFullName}" property="foaf:name"/>
                          </xsl:when>
                          
                        </xsl:choose>
                    </div>
                    <dl class="metadata">   
                        <dt>Notice type:</dt>
                        <dd property="gaz:hasNoticeCode" datatype="xsd:integer" about="{$noticeURI}">
                            <xsl:value-of select="$noticeCode"/>
                        </dd>
                      <xsl:choose>
                        <xsl:when test="not($claimsDate) or $claimsDate = ''"/>
                      <xsl:otherwise>
                        <dt>Claim expires:</dt>
                      <dd about="this:notifiableThing" property="personal-legal:hasClaimDeadline" datatype="xsd:date" content="{dfn:marklogicdate($claimsDate)}">
                            <time datetime="{dfn:marklogicdate($claimsDate)}">
                                <xsl:value-of select="$claimsDate"/>
                            </time>
                        </dd>
                      </xsl:otherwise>
                      </xsl:choose>
                        <dt>Publication date:</dt>
                      <dd about="{$noticeURI}" property="gaz:hasPublicationDate" content="{$noticeDate}">
                        <time datetime="{$noticeDate}"><xsl:value-of select="$publicationDate"/></time>
                      </dd>
                       
                        <dt>Edition:</dt>
                        <dd><xsl:value-of select="$edition"/></dd>
                        <dt>issue Number:</dt>
                        <dd><xsl:value-of select="$issueNumber"/></dd>
                      <dt>Notice ID:</dt>
                      <!-- updated to add  attribute gz:hasNoticeNumber-->
                      <dd about="{$noticeURI}" property="gaz:hasNoticeID">
                        <xsl:value-of select="$noticeId"/>
                      </dd>
                  
                    <!-- Details of executor-->
                    <xsl:apply-templates select="legal/r/c[3]"/>
                    
                    <!-- Details of decaesed-->
                    <xsl:call-template name="deathDetails"/>
                    
                    <!-- Person address details-->
                    <xsl:apply-templates select="legal/r/c[2]"/>
                    

               </dl> 
             </article>
            </body>
            </html>
        </xsl:template>
        
        <xsl:template match="legal/r/c[3]">
         <dt>Executor:</dt>
        <dd about="this:estateExecutor" property="foaf:name" typeof="foaf:Agent">
            <xsl:apply-templates/>
        </dd>
        </xsl:template>     
        
        <xsl:template match="legal/r/c[2]">
           <dt>Person address details:</dt>
          <dd about="this:addressOfDeceased-address-1" typeof="vcard:Address" property="vcard:address"><xsl:value-of select="functx:getAddress(.)"/></dd>
         <!-- <dt>Address and date of death</dt>
          <dd><xsl:apply-templates mode="handle_pi"/></dd>-->
        </xsl:template>
        
      
    <xsl:template name="deathDetails">            
        <dt>Surname:</dt>
        <dd property="foaf:familyName" typeof="gaz:Person" about="{$personURI}">
          <xsl:value-of select="$surName"/>
        </dd> 
        <dt>First name:</dt>
        <dd property="foaf:firstName" typeof="gaz:Person" about="{$personURI}">
            <xsl:value-of select="$firstName"/>
        </dd>                    
         <xsl:if test="$middleName">                       
             <dt>Middle name(s):</dt>
             <dd property="foaf:givenName" typeof="gaz:Person" about="{$personURI}">
              <xsl:value-of select="$middleName"/>
             </dd>                         
           </xsl:if>
         <dt>Fullname:</dt>
         <dd><xsl:value-of select="legal/r/c[1]"/></dd>
      <xsl:choose>
        <xsl:when test="not(legal/r/c[2]) or legal/r/c[2] = ''"/>
        <xsl:otherwise>
          <dt>Date of death:</dt>
          <dd property="personal-legal:dateOfDeath" typeof="gaz:Person" datatype="xsd:date" about="{$personURI}" content="{dfn:marklogicdate(legal/r/c[2])}">
            <!-- time property="personal-legal:diedOn" typeof="gaz:Person" datatype="xsd:date" about="{$personURI}" content="{$deathDate}" datetime="{$deathDate}" -->
            <time datetime="{dfn:marklogicdate(legal/r/c[2])}">
              <xsl:value-of select="$deathDate"/>
            </time>
          </dd>
        </xsl:otherwise>
      </xsl:choose>
      
    </xsl:template>        
        
        <xsl:template name="getMonth">
            <xsl:param name="month" required="yes"/>
            <xsl:choose>
		        <xsl:when test="lower-case($month)='january'">01</xsl:when>
		        <xsl:when test="lower-case($month)='february'">02</xsl:when>
		        <xsl:when test="lower-case($month)='march'">03</xsl:when>
		        <xsl:when test="lower-case($month)='april'">04</xsl:when>
		        <xsl:when test="lower-case($month)='may'">05</xsl:when>
		        <xsl:when test="lower-case($month)='june'">06</xsl:when>
		        <xsl:when test="lower-case($month)='july'">07</xsl:when>
		        <xsl:when test="lower-case($month)='august'">08</xsl:when>
		        <xsl:when test="lower-case($month)='september'">09</xsl:when>
		        <xsl:when test="lower-case($month)='october'">10</xsl:when>
		        <xsl:when test="lower-case($month)='november'">11</xsl:when>
		        <xsl:when test="lower-case($month)='december'">12</xsl:when>
		        <xsl:when test="lower-case($month)='jan'">01</xsl:when>
		        <xsl:when test="lower-case($month)='feb'">02</xsl:when>
		        <xsl:when test="lower-case($month)='mar'">03</xsl:when>
		        <xsl:when test="lower-case($month)='apr'">04</xsl:when>
		        <xsl:when test="lower-case($month)='may'">05</xsl:when>
		        <xsl:when test="lower-case($month)='jun'">06</xsl:when>
		        <xsl:when test="lower-case($month)='jul'">07</xsl:when>
		        <xsl:when test="lower-case($month)='aug'">08</xsl:when>
		        <xsl:when test="lower-case($month)='sept'">09</xsl:when>
		        <xsl:when test="lower-case($month)='oct'">10</xsl:when>
		        <xsl:when test="lower-case($month)='nov'">11</xsl:when>
		        <xsl:when test="lower-case($month)='dec'">12</xsl:when>
		    </xsl:choose>           
        </xsl:template>


        <xsl:template match="text()">
            <xsl:value-of select="replace(.,'\s+',' ')" disable-output-escaping="no"/>
        </xsl:template>        

      <xsl:function name="functx:substring-before-match" as="xs:string">           
            <xsl:param name="arg" as="xs:string?"/> 
            <xsl:param name="regex" as="xs:string"/>             
            <xsl:sequence select="                  tokenize($arg,$regex)[1] "/>
        </xsl:function>
        
        <xsl:function name="functx:getAddress">       
            <xsl:param name="address"/>
            <xsl:choose>
                <xsl:when test="contains($address,'&lt;?BR?&gt;')">
                    <xsl:value-of select="substring-before($address,'&lt;?BR?&gt;')"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:analyze-string select="$address" regex="^(.*?)((\d\d?)([n|r|s|t]?[d|h|t]?.)(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)([a-z]*.)(\d\d\d\d))(.*)$">
                        <xsl:matching-substring>                   
                            <xsl:value-of select="normalize-space(regex-group(1))"/> 
                        </xsl:matching-substring>
                    </xsl:analyze-string>
                </xsl:otherwise>
            </xsl:choose>
           
        </xsl:function>
        
       <xsl:function name="functx:getDeathofDate"> 
           <xsl:param name="address"/>
           <xsl:choose>
               <xsl:when test="contains($address[1],'&lt;?BR?&gt;')">
                   <xsl:value-of select="substring-after($address,'&lt;?BR?&gt;')"/>
               </xsl:when>
               <xsl:otherwise>
                <!-- xsl:analyze-string select="$address" regex="^(.*?)([0-9][0-9]?(rd|th|st|nd)\s+[January|February|March|April|May|June|July|August|September|October|November|December]\s+[0-9][0-9][0-9][0-9])(.*)$" -->
                 <xsl:analyze-string select="$address[1]" regex="((\d\d?)([n|r|s|t]?[d|h|t]?.)(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)([a-z]*.)(\d\d\d\d))">
                
                 <xsl:matching-substring>                   
                        <xsl:value-of select="normalize-space(regex-group(1))"/> 
                  </xsl:matching-substring>
                </xsl:analyze-string>
               </xsl:otherwise>
           </xsl:choose>           
       </xsl:function>
      
      <xsl:function name="dfn:marklogicdate">
        <xsl:param name="olddate"/>
        <!-- xsl:analyze-string select="$olddate" regex="(\d\d?)\w?\w?\s+(\w\w\w)\w*\s+(\d\d\d\d)" -->
          <!-- p><xsl:value-of select="$olddate"/></p -->
        <xsl:variable name="olddate-cleaned" select="replace($olddate[1],' ',' ')"/>
        <xsl:analyze-string select="$olddate-cleaned" regex="(\d\d?)[n|r|s|t]?[d|h|t]?.(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)[a-z]*.(\d\d\d\d)">  
          <xsl:matching-substring>
            <xsl:value-of select="regex-group(3)"/>
            <xsl:text>-</xsl:text>
            <xsl:choose>
              <xsl:when test="regex-group(2)='Jan'">01</xsl:when><xsl:when test="regex-group(2)='Feb'">02</xsl:when>
              <xsl:when test="regex-group(2)='Mar'">03</xsl:when><xsl:when test="regex-group(2)='Apr'">04</xsl:when>
              <xsl:when test="regex-group(2)='May'">05</xsl:when><xsl:when test="regex-group(2)='Jun'">06</xsl:when>
              <xsl:when test="regex-group(2)='Jul'">07</xsl:when><xsl:when test="regex-group(2)='Aug'">08</xsl:when>
              <xsl:when test="regex-group(2)='Sep'">09</xsl:when><xsl:when test="regex-group(2)='Oct'">10</xsl:when>
              <xsl:when test="regex-group(2)='Nov'">11</xsl:when><xsl:when test="regex-group(2)='Dec'">12</xsl:when>
            </xsl:choose>
            <xsl:text>-</xsl:text>
            <xsl:variable name="day" select="regex-group(1)"/>
            <xsl:if test="xs:integer($day)&lt;10">
              <xsl:text>0</xsl:text>
            </xsl:if>
            <xsl:value-of select="$day"/>
          </xsl:matching-substring>
        </xsl:analyze-string>
      </xsl:function>      
      
</xsl:stylesheet>