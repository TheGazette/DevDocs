<?xml version="1.0" encoding="UTF-8"?>
  <!--©  Crown copyright
 
You may use and re-use this code free of charge under the terms of the Open Government Licence
 
http://www.nationalarchives.gov.uk/doc/open-government-licence/-->

<!--Version 1.0-->
<!--Created by Williams Lea XML Team-->
<!--
	  Purpose of transform: transform legacy post-2005 format XML format to HTML-RDFa
	  
      Change history
      1.0 Initial Release: 20th January 2014
-->

  <!-- ############################################ -->
  <!-- ##### FROM POST-2005 XML TO XHTML5RDFa ##### -->
  <!-- ############################################ --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gz="http://www.tso.co.uk/assets/namespace/gazette" xmlns:ukm="http://www.tso.co.uk/assets/namespace/metadata" xmlns:wgs84="http://www.w3.org/2003/01/geo/wgs84_pos" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:personal-legal="http://www.thegazette.co.uk/def/personal-legal" xmlns:leg="http://www.thegazette.co.uk/def/legislation" xmlns:foaf="http://xmlns.com/foaf/0.1/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:gzc="http://www.tso.co.uk/assets/namespace/gazette/LGconfiguration" xmlns:math="http://www.w3.org/1998/Math/MathML" xmlns:html="http://www.w3.org/1999/xhtml" xmlns:wlf="http://www.williamslea.com/xsl/functions" xmlns:saxon="http://saxon.sf.net/" xmlns="http://www.w3.org/1999/xhtml" xmlns:fnx="http://www.tso.co.uk/xslt/functions" exclude-result-prefixes="#all" version="2.0">
	<xsl:output method="xml" omit-xml-declaration="no" indent="no" exclude-result-prefixes="#all" encoding="utf-8"/>
	<!-- xsl:strip-space elements="*"/ -->
	<xsl:param name="issueNumber" as="xs:string" required="no">0</xsl:param>
	<xsl:param name="edition" as="xs:string" required="no">0</xsl:param>
	<!-- xsl:param name="legalInformation" required="no"/ -->
	<!-- Parameters to create metadata info -->
	<!-- xsl:param name="bundleId" as="xs:positiveInteger" required="no"/ -->
	<xsl:param name="bundleId" required="no">0</xsl:param>
	<xsl:param name="noticeId" as="xs:string" required="no">0</xsl:param>
	<xsl:param name="status" as="xs:string" required="no">0</xsl:param>
	<xsl:param name="version-count" as="xs:string" required="no">0</xsl:param>
	<xsl:param name="user-submitted" as="xs:string" required="no">0</xsl:param>
	<!-- xsl:param name="pageNumber" as="xs:integer" required="no"/ -->
	<xsl:param name="pageNumber" required="no">0</xsl:param>
	<!-- xsl:param name="issue" as="xs:positiveInteger" required="no"/ -->
	<xsl:param name="issue" required="no">0</xsl:param>
	<xsl:param name="issue-isbn" as="xs:string" required="no">0</xsl:param>
	<xsl:param name="organisationId" as="xs:string" required="no">0</xsl:param>
	<xsl:param name="debug">false</xsl:param>
	<xsl:variable name="noticeCode" select="//gz:Notice/@Type"/>
	<xsl:function name="wlf:name">
		<xsl:param name="source"/>
		<xsl:variable name="prefix">this:</xsl:variable>
		<xsl:variable name="content" select="$source/text()" as="xs:string"/>
		<xsl:variable name="clean" select="replace(replace(replace(replace(replace($content,' ',''),'\.',''),'’',''),'‘',''),',','')"/>
		<xsl:value-of select="concat($prefix,$clean)"/>
	</xsl:function>
	<xsl:function name="wlf:clean">
		<xsl:param name="source"/>
		<xsl:variable name="prefix">this:</xsl:variable>
		<xsl:variable name="clean" select="replace(replace(replace(replace(replace($source,' ',''),'\.',''),'’',''),'‘',''),',','')"/>
		<xsl:value-of select="concat($prefix,$clean)"/>
	</xsl:function>
	<xsl:function name="wlf:name-sibling">
		<xsl:param name="source"/>
		<xsl:variable name="namespace">this:</xsl:variable>
		<xsl:variable name="prefix">
			<xsl:value-of select="$source/name()"/>
		</xsl:variable>
		<xsl:variable name="thiscount">
			<xsl:value-of select="concat('-',count($source/preceding-sibling::*[name()=$source/name()]) + 1)"/>
		</xsl:variable>
		<xsl:variable name="name" select="concat($prefix,$thiscount)"/>
		<xsl:variable name="firstletter" select="lower-case(substring($name,1,1))"/>
		<xsl:variable name="remainder" select="substring($name,2)"/>
		<xsl:value-of select="concat($namespace,concat($firstletter,$remainder))"/>
	</xsl:function>
	<xsl:function name="wlf:compound-name">
		<xsl:param name="first"/>
		<xsl:param name="second"/>
		<xsl:variable name="compound" select="concat(wlf:name-sibling($first),concat('-',wlf:name-sibling-no-namespace($second)))"/>
		<xsl:value-of select="$compound"/>
	</xsl:function>
	<xsl:function name="wlf:triple-compound-name">
		<xsl:param name="first"/>
		<xsl:param name="second"/>
		<xsl:param name="third"/>
		<xsl:variable name="compound" select="concat(wlf:name-sibling($first),concat('-',concat(wlf:name-sibling-no-namespace($second),concat('-',wlf:name-sibling-no-namespace($third)))))"/>
		<xsl:value-of select="$compound"/>
	</xsl:function>
	<xsl:function name="wlf:name-sibling-no-namespace">
		<xsl:param name="source"/>
		<xsl:variable name="prefix">
			<xsl:value-of select="$source/name()"/>
		</xsl:variable>
		<xsl:variable name="thiscount">
			<xsl:value-of select="concat('-',count($source/preceding-sibling::*[name()=$source/name()]) + 1)"/>
		</xsl:variable>
		<xsl:value-of select="concat($prefix,$thiscount)"/>
	</xsl:function>
	<xsl:function name="wlf:serialize">
		<xsl:param name="node-set" as="node()"/>
		<xsl:variable name="result-string">
			<xsl:apply-templates mode="serialize" select="$node-set"/>
		</xsl:variable>
		<xsl:value-of select="normalize-space($result-string)"/>
	</xsl:function>
	<xsl:template match="*" mode="serialize">
		<xsl:apply-templates mode="serialize"/>
	</xsl:template>
	<xsl:variable name="paramConfigXml" select="if (doc-available('LGconfiguration.xml')) then doc('LGconfiguration.xml') else ()"/>
	<xsl:variable name="gaz">https://www.thegazette.co.uk/</xsl:variable>
	<xsl:variable name="osPostcode" as="xs:string*">http://data.ordnancesurvey.co.uk/ontology/postcode/</xsl:variable>
	<xsl:variable name="osPostcodeUnit" as="xs:string*">http://data.ordnancesurvey.co.uk/id/postcodeunit/</xsl:variable>
	<xsl:variable name="noticeType" select="//gz:Notice/@Type"/>
	<xsl:variable name="noticeNo" select="//gz:Notice/@Reference"/>
	<xsl:variable name="idURI" select="concat($gaz,'id','/notice/', $noticeId)"/>
	<xsl:variable name="documentURI" select="concat($gaz,'notice/', $noticeId)"/>
	<xsl:variable name="publishDate" select="concat(//ukm:PublishDate,'T',(if (//ukm:TimeStamp) then fnx:getTimeStamp(//ukm:TimeStamp) else '15:30:00'))"/>
	<!-- ############### -->
	<!-- # OWL CLASSES # -->
	<!-- ############### -->
	<xsl:variable name="class">
		<classlist>
			<!--classentry noticecode="2903" type="notice">https://www.thegazette.co.uk/def/personal-legal#WillsAndProbateNotice</classentry-->
			<!--classentry noticecode="2903" type="notice">https://www.thegazette.co.uk/def/personal-legal#DeceasedEstatesNotice</classentry-->
			<!--classentry noticecode="2903" type="notifiablething">https://www.thegazette.co.uk/def/personal-legal#NoticeForClaimsAgainstEstate</classentry-->
			<classentry noticecode="1101" type="notice">https://www.thegazette.co.uk/def/state#ProclamationNotice</classentry>
			<classentry noticecode="1102" type="notice">https://www.thegazette.co.uk/def/state#NoticeConcerningRoyalFamilyNotice</classentry>
			<classentry noticecode="1103" type="notice">https://www.thegazette.co.uk/def/appointments#AppointmentToRoyalHouseholdNotice</classentry>
			<classentry noticecode="1104" type="notice">https://www.thegazette.co.uk/def/state#LoyalAddressesNotice</classentry>
			<classentry noticecode="1106" type="notice">https://www.thegazette.co.uk/def/state#PrivyCouncilOfficeNotice</classentry>
			<classentry noticecode="1105" type="notice">https://www.thegazette.co.uk/def/honours#AwardandHonourNotice</classentry>
			<classentry noticecode="1107" type="notice">https://www.thegazette.co.uk/def/state#ChangeOfNameAndArmsNotice</classentry>
			<classentry noticecode="1108" type="notice">https://www.thegazette.co.uk/def/appointments#CrownOfficeNotice</classentry>
			<classentry noticecode="1109" type="notice">https://www.thegazette.co.uk/def/appointments#DuchyOfCornwallNotice</classentry>
			<classentry noticecode="1110" type="notice">https://www.thegazette.co.uk/def/appointments#SheriffsNotice</classentry>
			<classentry noticecode="1111" type="notice">https://www.thegazette.co.uk/def/appointments#DeputyLieutenantNotice</classentry>
			<classentry noticecode="1112" type="notice">https://www.thegazette.co.uk/def/state#RoyalCommissionNotice</classentry>
			<classentry noticecode="1113" type="notice">https://www.thegazette.co.uk/def/appointments#JudgesNotice</classentry>
			<classentry noticecode="1114" type="notice">https://www.thegazette.co.uk/def/appointments#PrimeMinistersOfficeNotice</classentry>
			<classentry noticecode="1115" type="notice">https://www.thegazette.co.uk/def/appointments#LordLieutenantsNotice</classentry>
			<classentry noticecode="1116" type="notice">https://www.thegazette.co.uk/def/royal-warrants#RoyalWarrantsAndChartersNotice</classentry>
			<classentry noticecode="1117" type="notice">https://www.thegazette.co.uk/def/royal-warrants#RoyalWarrantsAndChartersScotlandNotice</classentry>
			<classentry noticecode="1118" type="notice">https://www.thegazette.co.uk/def/state#ChancellorOfExchequerNotice</classentry>
			<classentry noticecode="1119" type="notice">https://www.thegazette.co.uk/def/royal-warrants#WarrantsRoyalSignManualNotice</classentry>
			<classentry noticecode="1120" type="notice">https://www.thegazette.co.uk/def/honours#OrderStJohnNotice</classentry>
			<classentry noticecode="1121" type="notice">https://www.thegazette.co.uk/def/state#ImmigrationNotice</classentry>
			<classentry noticecode="1201" type="notice">https://www.thegazette.co.uk/def/parliament#BillsRoyalAssentNotice</classentry>
			<classentry noticecode="1202" type="notice">https://www.thegazette.co.uk/def/parliament#BillsInParliamentNotice</classentry>
			<classentry noticecode="1204" type="notice">https://www.thegazette.co.uk/def/parliament#SpeakersNotice</classentry>
			<classentry noticecode="1205" type="notice">https://www.thegazette.co.uk/def/parliament#LordChancellorsOfficeNotice</classentry>
			<classentry noticecode="1207" type="notice">https://www.thegazette.co.uk/def/parliament#HouseOfCommonsNotice</classentry>
			<classentry noticecode="1208" type="notice">https://www.thegazette.co.uk/def/parliament#BillsRoyalAssentScotlandNotice</classentry>
			<classentry noticecode="1209" type="notice">https://www.thegazette.co.uk/def/parliament#BillsRoyalAssentIrelandNotice</classentry>
			<classentry noticecode="1210" type="notice">https://www.thegazette.co.uk/def/parliament#BillsRoyalAssentWalesNotice</classentry>
			<classentry noticecode="1211" type="notice">https://www.thegazette.co.uk/def/parliament#RecordOfLegislationNotice</classentry>
			<classentry noticecode="1301" type="notice">https://www.thegazette.co.uk/def/church#ChurchCommissionersNotice</classentry>
			<classentry noticecode="1302" type="notice">https://www.thegazette.co.uk/def/church#PlaceOfMarriageNotice</classentry>
			<classentry noticecode="1303" type="notice">https://www.thegazette.co.uk/def/church#ChurchOfScotlandNotice</classentry>
			<classentry noticecode="1304" type="notice">https://www.thegazette.co.uk/def/church#ChurchWorkNotice</classentry>
			<classentry noticecode="1401" type="notice">https://www.thegazette.co.uk/def/public-finance#TreasuryNotice</classentry>
			<classentry noticecode="1402" type="notice">https://www.thegazette.co.uk/def/public-finance#SavingInvestmentNotice</classentry>
			<classentry noticecode="1403" type="notice">https://www.thegazette.co.uk/def/public-finance#BankOfEnglandNotice</classentry>
			<classentry noticecode="1404" type="notice">https://www.thegazette.co.uk/def/public-finance#BankOfIssueScotlandNotice</classentry>
			<classentry noticecode="1405" type="notice">https://www.thegazette.co.uk/def/public-finance#TaxNotice</classentry>
			<classentry noticecode="1405" type="notice">https://www.thegazette.co.uk/def/public-finance#VatNotice</classentry>
			<classentry noticecode="1406" type="notice">https://www.thegazette.co.uk/def/public-finance#BankersActNotice</classentry>
			<classentry noticecode="1406" type="notice">https://www.thegazette.co.uk/def/public-finance#CurrencyNotice</classentry>
			<classentry noticecode="1501" type="notice">https://www.thegazette.co.uk/def/transport#RoadTrafficActsNotice</classentry>
			<classentry noticecode="1502" type="notice">https://www.thegazette.co.uk/def/transport#NewRoadsAndStreetWorksNotice</classentry>
			<classentry noticecode="1503" type="notice">https://www.thegazette.co.uk/def/transport#HighwaysNotice</classentry>
			<classentry noticecode="1504" type="notice">https://www.thegazette.co.uk/def/transport#LondonHackneyCarriagesNotice</classentry>
			<classentry noticecode="1505" type="notice">https://www.thegazette.co.uk/def/transport#RailwaysNotice</classentry>
			<classentry noticecode="1506" type="notice">https://www.thegazette.co.uk/def/transport#TransportActsNotice</classentry>
			<classentry noticecode="1507" type="notice">https://www.thegazette.co.uk/def/transport#PortsNotice</classentry>
			<classentry noticecode="1508" type="notice">https://www.thegazette.co.uk/def/transport#CivilAviationNotice</classentry>
			<classentry noticecode="1509" type="notice">https://www.thegazette.co.uk/def/transport#CycleTracksNotice</classentry>
			<classentry noticecode="1510" type="notice">https://www.thegazette.co.uk/def/transport#RoadsNIOrderNotice</classentry>
			<classentry noticecode="1511" type="notice">https://www.thegazette.co.uk/def/transport#VehicleImpoundingNotice</classentry>
			<classentry noticecode="1601" type="notice">https://www.thegazette.co.uk/def/planning#TownAndCountryPlanningNotice</classentry>
			<classentry noticecode="1602" type="notice">https://www.thegazette.co.uk/def/planning#NewTownsNotice</classentry>
			<classentry noticecode="1603" type="notice">https://www.thegazette.co.uk/def/planning#AcquisitionAndDisposalOfLandNotice</classentry>
			<classentry noticecode="1604" type="notice">https://www.thegazette.co.uk/def/planning#LocalGovernmentAndHousingNotice</classentry>
			<classentry noticecode="1605" type="notice">https://www.thegazette.co.uk/def/planning#CommonsRegistrationNotice</classentry>
			<classentry noticecode="1606" type="notice">https://www.thegazette.co.uk/def/planning#OpenSpacesNotice</classentry>
			<classentry noticecode="1607" type="notice">https://www.thegazette.co.uk/def/planning#InnerUrbanAreasNotice</classentry>
			<classentry noticecode="1608" type="notice">https://www.thegazette.co.uk/def/planning#PipeLinesNotice</classentry>
			<classentry noticecode="1609" type="notice">https://www.thegazette.co.uk/def/planning#ZooLicensingNotice</classentry>
			<classentry noticecode="1701" type="notice">https://www.thegazette.co.uk/def/health#MedicinesNotice</classentry>
			<classentry noticecode="1702" type="notice">https://www.thegazette.co.uk/def/health#ProductLicensingNotice</classentry>
			<classentry noticecode="1801" type="notice">https://www.thegazette.co.uk/def/environment#CleanAirNotice</classentry>
			<classentry noticecode="1802" type="notice">https://www.thegazette.co.uk/def/environment#ControlOfPollutionNotice</classentry>
			<classentry noticecode="1803" type="notice">https://www.thegazette.co.uk/def/environment#EnvironmentalProtectionNotice</classentry>
			<classentry noticecode="1804" type="notice">https://www.thegazette.co.uk/def/environment#CoastProtectionNotice</classentry>
			<classentry noticecode="1805" type="notice">https://www.thegazette.co.uk/def/environment#NationalParksAndAccessToTheCountrysideNotice</classentry>
			<classentry noticecode="1806" type="notice">https://www.thegazette.co.uk/def/environment#WildlifeAndCountrysideNotice</classentry>
			<classentry noticecode="1807" type="notice">https://www.thegazette.co.uk/def/environment#HarboursNotice</classentry>
			<classentry noticecode="1808" type="notice">https://www.thegazette.co.uk/def/environment#FloodPreventionNotice</classentry>
			<classentry noticecode="1901" type="notice">https://www.thegazette.co.uk/def/water#WaterResourcesNotice</classentry>
			<classentry noticecode="1902" type="notice">https://www.thegazette.co.uk/def/water#WaterIndustryNotice</classentry>
			<classentry noticecode="1903" type="notice">https://www.thegazette.co.uk/def/water#LandDrainageNotice</classentry>
			<classentry noticecode="1904" type="notice">https://www.thegazette.co.uk/def/water#NaturalMineralWatersNotice</classentry>
			<classentry noticecode="2001" type="notice">https://www.thegazette.co.uk/def/agriculture#FisheriesNotice</classentry>
			<classentry noticecode="2002" type="notice">https://www.thegazette.co.uk/def/health#VeterinaryMedicinesNotice</classentry>
			<classentry noticecode="2003" type="notice">https://www.thegazette.co.uk/def/agriculture#CornReturnsNotice</classentry>
			<classentry noticecode="2004" type="notice">https://www.thegazette.co.uk/def/agriculture#AnimalHealthNotice</classentry>
			<classentry noticecode="2005" type="notice">https://www.thegazette.co.uk/def/agriculture#ForestryHealthNotice</classentry>
			<classentry noticecode="2006" type="notice">https://www.thegazette.co.uk/def/agriculture#InterventionBoardNotice</classentry>
			<classentry noticecode="2101" type="notice">https://www.thegazette.co.uk/def/energy#GasNotice</classentry>
			<classentry noticecode="2102" type="notice">https://www.thegazette.co.uk/def/energy#CoalNotice</classentry>
			<classentry noticecode="2103" type="notice">https://www.thegazette.co.uk/def/energy#ElectricityNotice</classentry>
			<classentry noticecode="2201" type="notice">https://www.thegazette.co.uk/def/telecom#PostOfficeNotice</classentry>
			<classentry noticecode="2202" type="notice">https://www.thegazette.co.uk/def/telecom#TelecommunicationNotice</classentry>
			<classentry noticecode="2203" type="notice">https://www.thegazette.co.uk/def/telecom#ElectronicCommunicationNotice</classentry>
			<classentry noticecode="2301" type="notice">https://www.thegazette.co.uk/def/other-notices#OtherNoticesNotice</classentry>
			<classentry noticecode="2401" type="notice">https://www.thegazette.co.uk/def/insolvency#MoratoriumComingIntoForceNotice</classentry>
			<classentry noticecode="2402" type="notice">https://www.thegazette.co.uk/def/insolvency#MoratoriumComingToAnEndNotice</classentry>
			<classentry noticecode="2403" type="notice">https://www.thegazette.co.uk/def/insolvency#MoratoriumReuseOfProhibitedNameNotice</classentry>
			<classentry noticecode="2404" type="notice">https://www.thegazette.co.uk/def/insolvency#CourtPetitionsAndOrdersCrossborderInsolvenciesNotice</classentry>
			<classentry noticecode="2405" type="notice">https://www.thegazette.co.uk/def/insolvency#MoratoriumOverseasTerritoriesNotice</classentry>
			<classentry noticecode="2406" type="notice">https://www.thegazette.co.uk/def/insolvency#NoticeOfIntendedDividends</classentry>
			<classentry noticecode="2407" type="notice">https://www.thegazette.co.uk/def/insolvency#NoticeOfDividends</classentry>
			<classentry noticecode="2408" type="notice">https://www.thegazette.co.uk/def/insolvency#MoratoriumOtherNotice</classentry>
			<classentry noticecode="2410" type="notice">https://www.thegazette.co.uk/def/insolvency#AppointmentOfAdministratorNotice</classentry>
			<classentry noticecode="2411" type="notice">https://www.thegazette.co.uk/def/insolvency#AdministratorOrderNotice</classentry>
			<classentry noticecode="2412" type="notice">https://www.thegazette.co.uk/def/insolvency#MeetingOfCreditorsNotice</classentry>
			<classentry noticecode="2413" type="notice">https://www.thegazette.co.uk/def/insolvency#NoticeToMembers</classentry>
			<classentry noticecode="2414" type="notice">https://www.thegazette.co.uk/def/insolvency#MeetingsOfCreditorsOverseasTerritoriesAndDependenciesNotice</classentry>
			<classentry noticecode="2421" type="notice">https://www.thegazette.co.uk/def/insolvency#AppointmentOfAdministrativeReceiversNotice</classentry>
			<classentry noticecode="2422" type="notice">https://www.thegazette.co.uk/def/insolvency#ReceivershipMeetingOfCreditorsNotice</classentry>
			<classentry noticecode="2423" type="notice">https://www.thegazette.co.uk/def/insolvency#AppointmentOfReceiversNotice</classentry>
			<classentry noticecode="2431" type="notice">https://www.thegazette.co.uk/def/insolvency#MembersResolutionsForWindingUpNotice</classentry>
			<classentry noticecode="2432" type="notice">https://www.thegazette.co.uk/def/insolvency#MembersAppointmentOfLiquidatorsNotice</classentry>
			<classentry noticecode="2433" type="notice">https://www.thegazette.co.uk/def/insolvency#MembersNoticeToCreditors</classentry>
			<classentry noticecode="2434" type="notice">https://www.thegazette.co.uk/def/insolvency#MembersAnnualLiquidationMeetingsNotice</classentry>
			<classentry noticecode="2435" type="notice">https://www.thegazette.co.uk/def/insolvency#MembersFinalMeetingsNotice</classentry>
			<classentry noticecode="2436" type="notice">https://www.thegazette.co.uk/def/insolvency#MembersFinalMeetingsOverseasTerritoriesAndDependenciesNotice</classentry>
			<classentry noticecode="2441" type="notice">https://www.thegazette.co.uk/def/insolvency#CreditorsResolutionsForWindingUpNotice</classentry>
			<classentry noticecode="2442" type="notice">https://www.thegazette.co.uk/def/insolvency#CreditorsMeetingsOfCreditorsNotice</classentry>
			<classentry noticecode="2443" type="notice">https://www.thegazette.co.uk/def/insolvency#CreditorsAppointmentOfLiquidatorsNotice</classentry>
			<classentry noticecode="2444" type="notice">https://www.thegazette.co.uk/def/insolvency#CreditorsAnnualLiquidationMeetingsNotice</classentry>
			<classentry noticecode="2445" type="notice">https://www.thegazette.co.uk/def/insolvency#CreditorsFinalMeetingsNotice</classentry>
			<classentry noticecode="2446" type="notice">https://www.thegazette.co.uk/def/insolvency#CreditorsNoticeToCreditors</classentry>
			<classentry noticecode="2447" type="notice">https://www.thegazette.co.uk/def/insolvency#CreditorsMeetingsOfCreditorsOverseasTerritoriesAndDependenciesNotice</classentry>
			<classentry noticecode="2448" type="notice">https://www.thegazette.co.uk/def/insolvency#CreditorsAppointmentOfLiquidatorsOverseasTerritoriesAndDependenciesNotice</classentry>
			<classentry noticecode="2449" type="notice">https://www.thegazette.co.uk/def/insolvency#CreditorsFinalMeetingsOverseasTerritoriesAndDependenciesNotice</classentry>
			<classentry noticecode="2450" type="notice">https://www.thegazette.co.uk/def/insolvency#PetitionsToWindUpCompaniesNotice</classentry>
			<classentry noticecode="2451" type="notice">https://www.thegazette.co.uk/def/insolvency#PetitionsToWindUpPartnershipsNotice</classentry>
			<classentry noticecode="2452" type="notice">https://www.thegazette.co.uk/def/insolvency#WindingUpOrdersNotice</classentry>
			<classentry noticecode="2453" type="notice">https://www.thegazette.co.uk/def/insolvency#WindingUpOrdersPartnershipsNotice</classentry>
			<classentry noticecode="2454" type="notice">https://www.thegazette.co.uk/def/insolvency#CourtAppointmentOfLiquidatorsNotice</classentry>
			<classentry noticecode="2455" type="notice">https://www.thegazette.co.uk/def/insolvency#CourtMeetingsOfCreditorsNotice</classentry>
			<classentry noticecode="2458" type="notice">https://www.thegazette.co.uk/def/insolvency#CourtFinalMeetingsNotice</classentry>
			<classentry noticecode="2459" type="notice">https://www.thegazette.co.uk/def/insolvency#ReleaseOfLiquidatorNotice</classentry>
			<classentry noticecode="2460" type="notice">https://www.thegazette.co.uk/def/insolvency#CourtNoticeToCreditors</classentry>
			<classentry noticecode="2461" type="notice">https://www.thegazette.co.uk/def/insolvency#DismissalOfWindingUpPetitionNotice</classentry>
			<classentry noticecode="2462" type="notice">https://www.thegazette.co.uk/def/insolvency#ServiceOfPetitionNotice</classentry>
			<classentry noticecode="2464" type="notice">https://www.thegazette.co.uk/def/insolvency#PublicExaminationsNotice</classentry>
			<classentry noticecode="2465" type="notice">https://www.thegazette.co.uk/def/insolvency#CourtNoticeToCreditorsOverseasTerritoriesAndDependencies</classentry>
			<classentry noticecode="2501" type="notice">https://www.thegazette.co.uk/def/insolvency#NoticeOfStatuoryDemandNotice</classentry>
			<classentry noticecode="2502" type="notice">https://www.thegazette.co.uk/def/insolvency#SubstitutedServiceOfPetitionNotice</classentry>
			<classentry noticecode="2503" type="notice">https://www.thegazette.co.uk/def/insolvency#BankruptcyOrderNotice</classentry>
			<classentry noticecode="2504" type="notice">https://www.thegazette.co.uk/def/insolvency#BankruptcyOrderPartnershipNotice</classentry>
			<classentry noticecode="2505" type="notice">https://www.thegazette.co.uk/def/insolvency#AdministrationOrderPersonalNotice</classentry>
			<classentry noticecode="2506" type="notice">https://www.thegazette.co.uk/def/insolvency#AmendmentOfTitleOfProceedingsNotice</classentry>
			<classentry noticecode="2507" type="notice">https://www.thegazette.co.uk/def/insolvency#AppointmentOfTrusteesNotice</classentry>
			<classentry noticecode="2508" type="notice">https://www.thegazette.co.uk/def/insolvency#NoticetoCreditorsNotice</classentry>
			<classentry noticecode="2509" type="notice">https://www.thegazette.co.uk/def/insolvency#NoticeOfIntendedDividendNotice</classentry>
			<classentry noticecode="2510" type="notice">https://www.thegazette.co.uk/def/insolvency#NoticeOfDividendNotice</classentry>
			<classentry noticecode="2511" type="notice">https://www.thegazette.co.uk/def/insolvency#FinalMeetingsNotice</classentry>
			<classentry noticecode="2512" type="notice">https://www.thegazette.co.uk/def/insolvency#AnnulmentOfProceedingsNotice</classentry>
			<classentry noticecode="2513" type="notice">https://www.thegazette.co.uk/def/insolvency#ApplicationOfDischargeNotice</classentry>
			<classentry noticecode="2514" type="notice">https://www.thegazette.co.uk/def/insolvency#ReleaseOfTrusteesNotice</classentry>
			<classentry noticecode="2515" type="notice">https://www.thegazette.co.uk/def/insolvency#DischargeOrderNotice</classentry>
			<classentry noticecode="2516" type="notice">https://www.thegazette.co.uk/def/insolvency#ARROrderNotice</classentry>
			<classentry noticecode="2517" type="notice">https://www.thegazette.co.uk/def/insolvency#SequestrationNotice</classentry>
			<classentry noticecode="2518" type="notice">https://www.thegazette.co.uk/def/insolvency#TrustDeedsNotice</classentry>
			<classentry noticecode="2519" type="notice">https://www.thegazette.co.uk/def/insolvency#SatisfactionOfTrustDeedNotice</classentry>
			<classentry noticecode="2526" type="notice">https://www.thegazette.co.uk/def/insolvency#MeetingsOfCreditorsPersonalNotice</classentry>
			<classentry noticecode="2527" type="notice">https://www.thegazette.co.uk/def/insolvency#PublicExaminationsNotice</classentry>
			<classentry noticecode="2600" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#CompaniesRestoredFromRegisterNotice</classentry>
			<classentry noticecode="2601" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#TakeoverPreemptionOffersNotice</classentry>
			<classentry noticecode="2602" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#RedemptionOrPurchaseNotice</classentry>
			<classentry noticecode="2603" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#PropertyDisclaimerNotice</classentry>
			<classentry noticecode="2604" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#ClaimAgainstPensionSchemesNotice</classentry>
			<classentry noticecode="2605" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#TakeoverInsuranceCompaniesNotice</classentry>
			<classentry noticecode="2606" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#EmploymentAgenciesNotice</classentry>
			<classentry noticecode="2607" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#IPApplicationsNotice</classentry>
			<classentry noticecode="2608" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#CompanyDirectorDisqualificationOrderNotice</classentry>
			<classentry noticecode="2609" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#CompaniesRemovedFromRegisterNotice</classentry>
			<classentry noticecode="2610" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#ReductionOfCapitalNotice</classentry>
			<classentry noticecode="2611" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#CompanyDocumentsNotice</classentry>
			<classentry noticecode="2612" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#EEInterestGroupingsNotice</classentry>
			<classentry noticecode="2613" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#MeetingOfCreditorsNotice</classentry>
			<classentry noticecode="2614" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#TakeoverPetitionToTransferNotice</classentry>
			<classentry noticecode="2615" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#OtherOffersToShareholdersNotice</classentry>
			<classentry noticecode="2701" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#PartnershipChangeInMembersNotice</classentry>
			<classentry noticecode="2702" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#PartnershipDissolutionNotice</classentry>
			<classentry noticecode="2703" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#PartnershipLimitedNotice</classentry>
			<classentry noticecode="2801" type="notice">https://www.thegazette.co.uk/def/societies#FriendlySocietiesNotice</classentry>
			<classentry noticecode="2802" type="notice">https://www.thegazette.co.uk/def/societies#IndustrialSocietiesNotice</classentry>
			<classentry noticecode="2803" type="notice">https://www.thegazette.co.uk/def/societies#BuildingSocietiesNotice</classentry>
			<classentry noticecode="2901" type="notice">https://www.thegazette.co.uk/def/personal-legal#ChangeOfNameNotice</classentry>
			<classentry noticecode="2902" type="notice">https://www.thegazette.co.uk/def/personal-legal#NextOfKinNotice</classentry>
			<classentry noticecode="2903" type="notice">https://www.thegazette.co.uk/def/personal-legal#DeceasedEstatesNotice</classentry>
			<classentry noticecode="3101" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#CompetitionCommisionNotice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/insolvency#TransferOfAppointmentsNotice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/military#RNAwardsNotice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/military#RNAppointmentsNotice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/military#RAFAppointmentsNotice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/military#ArmyAppointmentsNotice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/military#ArmyAwardsNotice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/military#TAAppointmentsNotice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/military#TAAwardsNotice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/military#RAFAwardsNotice</classentry>
			<classentry noticecode="" type="notice">https://www.thegazette.co.uk/def/honours#PrivyCounsellorsNotice</classentry>
			<classentry noticecode="" type="notice">https://www.thegazette.co.uk/def/honours#KnightsBatchelorNotice</classentry>
			<classentry noticecode="" type="notice">https://www.thegazette.co.uk/def/honours#QueensCommendationBraveryNotice</classentry>
			<classentry noticecode="" type="notice">https://www.thegazette.co.uk/def/honours#ImperialServiceMedalNotice</classentry>
			<classentry noticecode="" type="notice">https://www.thegazette.co.uk/def/honours#OrderBritishEmpireNotice</classentry>
			<classentry noticecode="" type="notice">https://www.thegazette.co.uk/def/honours#CommonwealthHonoursNotice</classentry>
			<classentry noticecode="" type="notice">https://www.thegazette.co.uk/def/honours#ColonialPoliceMedalNotice</classentry>
			<classentry noticecode="" type="notice">https://www.thegazette.co.uk/def/honours#QueensFireMedalNotice</classentry>
			<classentry noticecode="" type="notice">https://www.thegazette.co.uk/def/honours#GeorgeMedalNotice</classentry>
			<classentry noticecode="" type="notice">https://www.thegazette.co.uk/def/honours#OrderStMichaelNotice</classentry>
			<classentry noticecode="" type="notice">https://www.thegazette.co.uk/def/honours#QueensAwardEnterpriseNotice</classentry>
			<classentry noticecode="" type="notice">https://www.thegazette.co.uk/def/honours#RoyalVictorianOrderNotice</classentry>
			<classentry noticecode="" type="notice">https://www.thegazette.co.uk/def/honours#RoyalRedCrossNotice</classentry>
			<classentry noticecode="" type="notice">https://www.thegazette.co.uk/def/honours#PeerageNotice</classentry>
			<classentry noticecode="" type="notice">https://www.thegazette.co.uk/def/honours#OrderOfBathNotice</classentry>
			<classentry noticecode="" type="notice">https://www.thegazette.co.uk/def/honours#PolarMedalNotice</classentry>
			<classentry noticecode="" type="notice">https://www.thegazette.co.uk/def/honours#RoyalVictorianMedalNotice</classentry>
			<classentry noticecode="" type="notice">https://www.thegazette.co.uk/def/honours#QueensPoliceMedalNotice</classentry>
			<classentry noticecode="" type="notice">https://www.thegazette.co.uk/def/honours#QueensAwardVoluntaryServiceNotice</classentry>
			<classentry noticecode="" type="notice">https://www.thegazette.co.uk/def/honours#OrderCompanionsNotice</classentry>
			<classentry noticecode="" type="notice">https://www.thegazette.co.uk/def/honours#QueensGallantryMedalNotice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/other-notices#SeizureOfGoodsNotice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/other-notices#SeizureOfGoodsNotice</classentry>
			<classentry noticecode="Supplements" type="notice">https://www.thegazette.co.uk/def/other-notices#UnclaimedPremiumBondsNotice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/planning#PlanningAct2008Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/planning#PlanningApplicationsNotice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/planning#BurialGroundsNotice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseANotice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseG9Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#StrikingOff3MonthsNotice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseG7Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseG10Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseK4Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseG1Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseG4Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseD1Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseF1Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseG11Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseB3Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseJ1Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseK1Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseC1Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseC2Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseK5Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseH1Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseF2Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseB2Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseG2Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseG3Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseD2Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseC3Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseB1Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseG5Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseF3Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#StrikingOffDissolutionNotice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseB4Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseK3Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseG6Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseH2Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseE1Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseG8Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseK2Notice</classentry>
			<classentry noticecode="NEW" type="notice">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseF4Notice</classentry>
			<classentry noticecode="1101" type="notifiablething">https://www.thegazette.co.uk/def/state#Proclamation</classentry>
			<classentry noticecode="1102" type="notifiablething">https://www.thegazette.co.uk/def/state#NoticeConcerningRoyalFamily</classentry>
			<classentry noticecode="1103" type="notifiablething">https://www.thegazette.co.uk/def/appointments#AppointmentToRoyalHousehold</classentry>
			<classentry noticecode="1104" type="notifiablething">https://www.thegazette.co.uk/def/state#LoyalAddresses</classentry>
			<classentry noticecode="1105" type="notifiablething">https://www.thegazette.co.uk/def/honours#AwardandHonourThing</classentry>
			<classentry noticecode="1106" type="notifiablething">https://www.thegazette.co.uk/def/state#PrivyCouncilOffice</classentry>
			<classentry noticecode="1107" type="notifiablething">https://www.thegazette.co.uk/def/state#ChangeOfNameAndArms</classentry>
			<classentry noticecode="1108" type="notifiablething">https://www.thegazette.co.uk/def/appointments#CrownOffice</classentry>
			<classentry noticecode="1109" type="notifiablething">https://www.thegazette.co.uk/def/appointments#DuchyOfCornwall</classentry>
			<classentry noticecode="1110" type="notifiablething">https://www.thegazette.co.uk/def/appointments#Sheriffs</classentry>
			<classentry noticecode="1111" type="notifiablething">https://www.thegazette.co.uk/def/appointments#DeputyLieutenant</classentry>
			<classentry noticecode="1112" type="notifiablething">https://www.thegazette.co.uk/def/state#RoyalCommission</classentry>
			<classentry noticecode="1113" type="notifiablething">https://www.thegazette.co.uk/def/appointments#Judges</classentry>
			<classentry noticecode="1114" type="notifiablething">https://www.thegazette.co.uk/def/appointments#PrimeMinistersOffice</classentry>
			<classentry noticecode="1115" type="notifiablething">https://www.thegazette.co.uk/def/appointments#LordLieutenants</classentry>
			<classentry noticecode="1116" type="notifiablething">https://www.thegazette.co.uk/def/royal-warrants#RoyalWarrantsAndCharters</classentry>
			<classentry noticecode="1117" type="notifiablething">https://www.thegazette.co.uk/def/royal-warrants#RoyalWarrantsAndChartersScotland</classentry>
			<classentry noticecode="1118" type="notifiablething">https://www.thegazette.co.uk/def/state#ChancellorOfExchequerNotice</classentry>
			<classentry noticecode="1119" type="notifiablething">https://www.thegazette.co.uk/def/royal-warrants#WarrantsRoyalSignManual</classentry>
			<classentry noticecode="1120" type="notifiablething">https://www.thegazette.co.uk/def/honours#OrderStJohn</classentry>
			<classentry noticecode="1120" type="notifiablething">https://www.thegazette.co.uk/def/honours#AwardandHonourThing</classentry>
			<classentry noticecode="1121" type="notifiablething">https://www.thegazette.co.uk/def/state#Immigration</classentry>
			<classentry noticecode="1201" type="notifiablething">https://www.thegazette.co.uk/def/parliament#BillsRoyalAssent</classentry>
			<classentry noticecode="1202" type="notifiablething">https://www.thegazette.co.uk/def/parliament#BillsInParliament</classentry>
			<classentry noticecode="1204" type="notifiablething">https://www.thegazette.co.uk/def/parliament#Speakers</classentry>
			<classentry noticecode="1205" type="notifiablething">https://www.thegazette.co.uk/def/parliament#LordChancellorsOffice</classentry>
			<classentry noticecode="1207" type="notifiablething">https://www.thegazette.co.uk/def/parliament#HouseOfCommons</classentry>
			<classentry noticecode="1208" type="notifiablething">https://www.thegazette.co.uk/def/parliament#BillsRoyalAssentScotland</classentry>
			<classentry noticecode="1209" type="notifiablething">https://www.thegazette.co.uk/def/parliament#BillsRoyalAssentIreland</classentry>
			<classentry noticecode="1210" type="notifiablething">https://www.thegazette.co.uk/def/parliament#BillsRoyalAssentWales</classentry>
			<classentry noticecode="1211" type="notifiablething">https://www.thegazette.co.uk/def/parliament#RecordOfLegislation</classentry>
			<classentry noticecode="1301" type="notifiablething">https://www.thegazette.co.uk/def/church#ChurchCommissioners</classentry>
			<classentry noticecode="1302" type="notifiablething">https://www.thegazette.co.uk/def/church#PlaceOfMarriage</classentry>
			<classentry noticecode="1303" type="notifiablething">https://www.thegazette.co.uk/def/church#ChurchOfScotland</classentry>
			<classentry noticecode="1304" type="notifiablething">https://www.thegazette.co.uk/def/church#ChurchWork</classentry>
			<classentry noticecode="1401" type="notifiablething">https://www.thegazette.co.uk/def/public-finance#Treasury</classentry>
			<classentry noticecode="1402" type="notifiablething">https://www.thegazette.co.uk/def/public-finance#SavingInvestment</classentry>
			<classentry noticecode="1403" type="notifiablething">https://www.thegazette.co.uk/def/public-finance#BankOfEngland</classentry>
			<classentry noticecode="1404" type="notifiablething">https://www.thegazette.co.uk/def/public-finance#BankOfIssueScotland</classentry>
			<classentry noticecode="1405" type="notifiablething">https://www.thegazette.co.uk/def/public-finance#Tax</classentry>
			<classentry noticecode="1405" type="notifiablething">https://www.thegazette.co.uk/def/public-finance#Vat</classentry>
			<classentry noticecode="1406" type="notifiablething">https://www.thegazette.co.uk/def/public-finance#BankersAct</classentry>
			<classentry noticecode="1406" type="notifiablething">https://www.thegazette.co.uk/def/public-finance#Currency</classentry>
			<classentry noticecode="1501" type="notifiablething">https://www.thegazette.co.uk/def/transport#TransportThing</classentry>
			<classentry noticecode="1501" type="notifiablething">https://www.thegazette.co.uk/def/consultation#StatutoryConsultationNotification</classentry>
			<classentry noticecode="1502" type="notifiablething">https://www.thegazette.co.uk/def/transport#NewRoadsAndStreetWorks</classentry>
			<classentry noticecode="1503" type="notifiablething">https://www.thegazette.co.uk/def/transport#TransportThing</classentry>
			<classentry noticecode="1503" type="notifiablething">https://www.thegazette.co.uk/def/consultation#StatutoryConsultationNotification</classentry>
			<classentry noticecode="1504" type="notifiablething">https://www.thegazette.co.uk/def/transport#TransportThing</classentry>
			<classentry noticecode="1504" type="notifiablething">https://www.thegazette.co.uk/def/consultation#StatutoryConsultationNotification</classentry>
			<classentry noticecode="1505" type="notifiablething">https://www.thegazette.co.uk/def/transport#TransportThing</classentry>
			<classentry noticecode="1505" type="notifiablething">https://www.thegazette.co.uk/def/consultation#StatutoryConsultationNotification</classentry>
			<classentry noticecode="1506" type="notifiablething">https://www.thegazette.co.uk/def/transport#TransportThing</classentry>
			<classentry noticecode="1506" type="notifiablething">https://www.thegazette.co.uk/def/consultation#StatutoryConsultationNotification</classentry>
			<classentry noticecode="1507" type="notifiablething">https://www.thegazette.co.uk/def/transport#TransportThing</classentry>
			<classentry noticecode="1507" type="notifiablething">https://www.thegazette.co.uk/def/consultation#StatutoryConsultationNotification</classentry>
			<classentry noticecode="1508" type="notifiablething">https://www.thegazette.co.uk/def/transport#CivilAviation</classentry>
			<classentry noticecode="1509" type="notifiablething">https://www.thegazette.co.uk/def/transport#TransportThing</classentry>
			<classentry noticecode="1509" type="notifiablething">https://www.thegazette.co.uk/def/consultation#StatutoryConsultationNotification</classentry>
			<classentry noticecode="1510" type="notifiablething">https://www.thegazette.co.uk/def/transport#TransportThing</classentry>
			<classentry noticecode="1510" type="notifiablething">https://www.thegazette.co.uk/def/consultation#StatutoryConsultationNotification</classentry>
			<classentry noticecode="1511" type="notifiablething">https://www.thegazette.co.uk/def/transport#TransportThing</classentry>
			<classentry noticecode="1511" type="notifiablething">https://www.thegazette.co.uk/def/consultation#StatutoryConsultationNotification</classentry>
			<classentry noticecode="1601" type="notifiablething">https://www.thegazette.co.uk/def/planning#TownAndCountryPlanning</classentry>
			<classentry noticecode="1602" type="notifiablething">https://www.thegazette.co.uk/def/planning#PlanningThing</classentry>
			<classentry noticecode="1602" type="notifiablething">https://www.thegazette.co.uk/def/consultation#StatutoryConsultationNotification</classentry>
			<classentry noticecode="1603" type="notifiablething">https://www.thegazette.co.uk/def/planning#AcquisitionAndDisposalOfLand</classentry>
			<classentry noticecode="1603" type="notifiablething">https://www.thegazette.co.uk/def/consultation#StatutoryConsultationNotification</classentry>
			<classentry noticecode="1604" type="notifiablething">https://www.thegazette.co.uk/def/planning#PlanningThing</classentry>
			<classentry noticecode="1604" type="notifiablething">https://www.thegazette.co.uk/def/consultation#StatutoryConsultationNotification</classentry>
			<classentry noticecode="1605" type="notifiablething">https://www.thegazette.co.uk/def/planning#PlanningThing</classentry>
			<classentry noticecode="1605" type="notifiablething">https://www.thegazette.co.uk/def/consultation#StatutoryConsultationNotification</classentry>
			<classentry noticecode="1606" type="notifiablething">https://www.thegazette.co.uk/def/planning#PlanningThing</classentry>
			<classentry noticecode="1606" type="notifiablething">https://www.thegazette.co.uk/def/consultation#StatutoryConsultationNotification</classentry>
			<classentry noticecode="1607" type="notifiablething">https://www.thegazette.co.uk/def/planning#PlanningThing</classentry>
			<classentry noticecode="1607" type="notifiablething">https://www.thegazette.co.uk/def/consultation#StatutoryConsultationNotification</classentry>
			<classentry noticecode="1608" type="notifiablething">https://www.thegazette.co.uk/def/planning#PipeLines</classentry>
			<classentry noticecode="1609" type="notifiablething">https://www.thegazette.co.uk/def/planning#ZooLicenceApplicationIntention</classentry>
			<classentry noticecode="1609" type="notifiablething">https://www.thegazette.co.uk/def/planning#ZooLicensing</classentry>
			<classentry noticecode="1701" type="notifiablething">https://www.thegazette.co.uk/def/health#Medicines</classentry>
			<classentry noticecode="1702" type="notifiablething">https://www.thegazette.co.uk/def/health#ProductLicensing</classentry>
			<classentry noticecode="1801" type="notifiablething">https://www.thegazette.co.uk/def/environment#EnvironmentThing</classentry>
			<classentry noticecode="1801" type="notifiablething">https://www.thegazette.co.uk/def/consultation#StatutoryConsultationNotification</classentry>
			<classentry noticecode="1802" type="notifiablething">https://www.thegazette.co.uk/def/environment#EnvironmentThing</classentry>
			<classentry noticecode="1802" type="notifiablething">https://www.thegazette.co.uk/def/consultation#StatutoryConsultationNotification</classentry>
			<classentry noticecode="1803" type="notifiablething">https://www.thegazette.co.uk/def/environment#EnvironmentThing</classentry>
			<classentry noticecode="1803" type="notifiablething">https://www.thegazette.co.uk/def/consultation#StatutoryConsultationNotification</classentry>
			<classentry noticecode="1804" type="notifiablething">https://www.thegazette.co.uk/def/environment#EnvironmentThing</classentry>
			<classentry noticecode="1804" type="notifiablething">https://www.thegazette.co.uk/def/consultation#StatutoryConsultationNotification</classentry>
			<classentry noticecode="1805" type="notifiablething">https://www.thegazette.co.uk/def/environment#EnvironmentThing</classentry>
			<classentry noticecode="1805" type="notifiablething">https://www.thegazette.co.uk/def/consultation#StatutoryConsultationNotification</classentry>
			<classentry noticecode="1806" type="notifiablething">https://www.thegazette.co.uk/def/environment#EnvironmentThing</classentry>
			<classentry noticecode="1806" type="notifiablething">https://www.thegazette.co.uk/def/consultation#StatutoryConsultationNotification</classentry>
			<classentry noticecode="1807" type="notifiablething">https://www.thegazette.co.uk/def/environment#EnvironmentThing</classentry>
			<classentry noticecode="1807" type="notifiablething">https://www.thegazette.co.uk/def/consultation#StatutoryConsultationNotification</classentry>
			<classentry noticecode="1808" type="notifiablething">https://www.thegazette.co.uk/def/environment#EnvironmentThing</classentry>
			<classentry noticecode="1808" type="notifiablething">https://www.thegazette.co.uk/def/consultation#StatutoryConsultationNotification</classentry>
			<classentry noticecode="1901" type="notifiablething">https://www.thegazette.co.uk/def/water#WaterThing</classentry>
			<classentry noticecode="1901" type="notifiablething">https://www.thegazette.co.uk/def/consultation#StatutoryConsultationNotification</classentry>
			<classentry noticecode="1902" type="notifiablething">https://www.thegazette.co.uk/def/water#WaterThing</classentry>
			<classentry noticecode="1902" type="notifiablething">https://www.thegazette.co.uk/def/consultation#StatutoryConsultationNotification</classentry>
			<classentry noticecode="1903" type="notifiablething">https://www.thegazette.co.uk/def/water#WaterThing</classentry>
			<classentry noticecode="1903" type="notifiablething">https://www.thegazette.co.uk/def/consultation#StatutoryConsultationNotification</classentry>
			<classentry noticecode="1904" type="notifiablething">https://www.thegazette.co.uk/def/water#WaterThing</classentry>
			<classentry noticecode="1904" type="notifiablething">https://www.thegazette.co.uk/def/consultation#StatutoryConsultationNotification</classentry>
			<classentry noticecode="2001" type="notifiablething">https://www.thegazette.co.uk/def/agriculture#Fisheries</classentry>
			<classentry noticecode="2002" type="notifiablething">https://www.thegazette.co.uk/def/health#VeterinaryMedicines</classentry>
			<classentry noticecode="2003" type="notifiablething">https://www.thegazette.co.uk/def/agriculture#CornReturns</classentry>
			<classentry noticecode="2004" type="notifiablething">https://www.thegazette.co.uk/def/agriculture#AnimalHealth</classentry>
			<classentry noticecode="2005" type="notifiablething">https://www.thegazette.co.uk/def/agriculture#ForestryHealth</classentry>
			<classentry noticecode="2006" type="notifiablething">https://www.thegazette.co.uk/def/agriculture#InterventionBoard</classentry>
			<classentry noticecode="2101" type="notifiablething">https://www.thegazette.co.uk/def/energy#Gas</classentry>
			<classentry noticecode="2102" type="notifiablething">https://www.thegazette.co.uk/def/energy#Coal</classentry>
			<classentry noticecode="2103" type="notifiablething">https://www.thegazette.co.uk/def/energy#Electricity</classentry>
			<classentry noticecode="2201" type="notifiablething">https://www.thegazette.co.uk/def/telecom#PostOffice</classentry>
			<classentry noticecode="2202" type="notifiablething">https://www.thegazette.co.uk/def/telecom#Telecommunication</classentry>
			<classentry noticecode="2203" type="notifiablething">https://www.thegazette.co.uk/def/telecom#ElectronicCommunication</classentry>
			<classentry noticecode="2301" type="notifiablething">https://www.thegazette.co.uk/def/other-notices#OtherNotices</classentry>
			<classentry noticecode="2401" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CompanyIssuedNotice</classentry>
			<classentry noticecode="2402" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CompanyIssuedNotice</classentry>
			<classentry noticecode="2403" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CompanyIssuedNotice</classentry>
			<classentry noticecode="2404" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CourtIssuedNotice</classentry>
			<classentry noticecode="2405" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CompanyIssuedNotice</classentry>
			<classentry noticecode="2406" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CompanyIssuedNotice</classentry>
			<classentry noticecode="2406" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CourtIssuedNotice</classentry>
			<classentry noticecode="2407" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CompanyIssuedNotice</classentry>
			<classentry noticecode="2407" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CourtIssuedNotice</classentry>
			<classentry noticecode="2408" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CompanyIssuedNotice</classentry>
			<classentry noticecode="2410" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CompanyIssuedAdministratorAppointment</classentry>
			<classentry noticecode="2410" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CourtAdministratorAppointment</classentry>
			<classentry noticecode="2411" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#AdministratorOrder</classentry>
			<classentry noticecode="2412" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CourtIssuedMeeting</classentry>
			<classentry noticecode="2413" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CompanyIssuedNotice</classentry>
			<classentry noticecode="2414" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CourtIssuedMeeting</classentry>
			<classentry noticecode="2421" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CompanyIssuedAdministratorAppointment</classentry>
			<classentry noticecode="2422" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CompanyIssuedMeeting</classentry>
			<classentry noticecode="2423" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CompanyIssuedReceiverAppointment</classentry>
			<classentry noticecode="2431" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#Resolution</classentry>
			<classentry noticecode="2432" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CompanyIssuedLiquidatorAppointment</classentry>
			<classentry noticecode="2433" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CompanyIssuedNotice</classentry>
			<classentry noticecode="2434" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CompanyIssuedMeeting</classentry>
			<classentry noticecode="2435" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CompanyIssuedMeeting</classentry>
			<classentry noticecode="2436" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CompanyIssuedMeeting</classentry>
			<classentry noticecode="2441" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#Resolution</classentry>
			<classentry noticecode="2442" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CompanyIssuedMeeting</classentry>
			<classentry noticecode="2443" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CompanyIssuedLiquidatorAppointment</classentry>
			<classentry noticecode="2444" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CompanyIssuedMeeting</classentry>
			<classentry noticecode="2445" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CompanyIssuedMeeting</classentry>
			<classentry noticecode="2446" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CompanyIssuedNotice</classentry>
			<classentry noticecode="2447" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CompanyIssuedMeeting</classentry>
			<classentry noticecode="2448" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CompanyIssuedLiquidatorAppointment</classentry>
			<classentry noticecode="2449" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CompanyIssuedMeeting</classentry>
			<classentry noticecode="2450" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#Petition</classentry>
			<classentry noticecode="2451" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#Petition</classentry>
			<classentry noticecode="2452" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#WindingUpOrder</classentry>
			<classentry noticecode="2453" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#WindingUpOrder</classentry>
			<classentry noticecode="2454" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CourtLiquidatorAppointment</classentry>
			<classentry noticecode="2455" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CourtIssuedMeeting</classentry>
			<classentry noticecode="2458" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CourtIssuedMeeting</classentry>
			<classentry noticecode="2459" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#Release</classentry>
			<classentry noticecode="2460" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CourtIssuedNotice</classentry>
			<classentry noticecode="2461" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CourtIssuedNotice</classentry>
			<classentry noticecode="2462" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CourtIssuedNotice</classentry>
			<classentry noticecode="2464" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#PublicExaminations</classentry>
			<classentry noticecode="2465" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#CourtIssuedNotice</classentry>
			<classentry noticecode="2501" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#NoticeOfStatuoryDemand</classentry>
			<classentry noticecode="2502" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#SubstitutedServiceOfPetition</classentry>
			<classentry noticecode="2503" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#BankruptcyOrder</classentry>
			<classentry noticecode="2504" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#BankruptcyOrderPartnership</classentry>
			<classentry noticecode="2505" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#AdministrationOrder</classentry>
			<classentry noticecode="2506" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#AmendmentOfTitleOfProceedings</classentry>
			<classentry noticecode="2507" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#AppointmentOfTrustees</classentry>
			<classentry noticecode="2508" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#NoticetoCreditors</classentry>
			<classentry noticecode="2509" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#NoticeOfIntendedDividend</classentry>
			<classentry noticecode="2510" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#NoticeOfDividend</classentry>
			<classentry noticecode="2511" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#FinalMeetings</classentry>
			<classentry noticecode="2512" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#AnnulmentOfProceedings</classentry>
			<classentry noticecode="2513" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#ApplicationOfDischarge</classentry>
			<classentry noticecode="2514" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#ReleaseOfTrustees</classentry>
			<classentry noticecode="2515" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#DischargeOrder</classentry>
			<classentry noticecode="2516" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#ARROrder</classentry>
			<classentry noticecode="2517" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#Sequestration</classentry>
			<classentry noticecode="2518" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#TrustDeeds</classentry>
			<classentry noticecode="2519" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#SatisfactionOfTrustDeed</classentry>
			<classentry noticecode="2526" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#MeetingsOfCreditors</classentry>
			<classentry noticecode="2527" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#PublicExaminations</classentry>
			<classentry noticecode="2600" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#CompaniesRestoredFromRegister</classentry>
			<classentry noticecode="2601" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#TakeoverPreemptionOffers</classentry>
			<classentry noticecode="2602" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#RedemptionOrPurchase</classentry>
			<classentry noticecode="2603" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#PropertyDisclaimer</classentry>
			<classentry noticecode="2604" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#ClaimAgainstPensionSchemes</classentry>
			<classentry noticecode="2605" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#TakeoverInsuranceCompanies</classentry>
			<classentry noticecode="2606" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#EmploymentAgencies</classentry>
			<classentry noticecode="2607" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#IPApplications</classentry>
			<classentry noticecode="2608" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#CompanyDirectorDisqualificationOrder</classentry>
			<classentry noticecode="2609" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#CompaniesRemovedFromRegister</classentry>
			<classentry noticecode="2610" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#ReductionOfCapital</classentry>
			<classentry noticecode="2611" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#CompanyDocuments</classentry>
			<classentry noticecode="2612" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#EEInterestGroupings</classentry>
			<classentry noticecode="2613" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#MeetingOfCreditors</classentry>
			<classentry noticecode="2614" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#TakeoverPetitionToTransfer</classentry>
			<classentry noticecode="2615" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#TakeoverOffers</classentry>
			<classentry noticecode="2615" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#OtherOffersToShareholders</classentry>
			<classentry noticecode="2701" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#PartnershipChangeInMembers</classentry>
			<classentry noticecode="2702" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#PartnershipDissolution</classentry>
			<classentry noticecode="2703" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#PartnershipLimited</classentry>
			<classentry noticecode="2801" type="notifiablething">https://www.thegazette.co.uk/def/societies#FriendlySocieties</classentry>
			<classentry noticecode="2802" type="notifiablething">https://www.thegazette.co.uk/def/societies#IndustrialSocieties</classentry>
			<classentry noticecode="2803" type="notifiablething">https://www.thegazette.co.uk/def/societies#BuildingSocieties</classentry>
			<classentry noticecode="2901" type="notifiablething">https://www.thegazette.co.uk/def/personal-legal#ChangeOfName</classentry>
			<classentry noticecode="2902" type="notifiablething">https://www.thegazette.co.uk/def/personal-legal#SearchForNextOfKin</classentry>
			<classentry noticecode="2903" type="notifiablething">https://www.thegazette.co.uk/def/personal-legal#NoticeForClaimsAgainstEstate</classentry>
			<classentry noticecode="3101" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#CompetitionCommision</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/insolvency#TransferOfAppointments</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/other-notices#SeizureOfGoods</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/other-notices#SeizureOfGoods</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/other-notices#SeizureOfGoods</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/other-notices#SeizureOfGoods</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/military#RNAwards</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/military#RNAppointments</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/military#RAFAppointments</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/military#ArmyAppointments</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/military#ArmyAwards</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/military#TAAppointments</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/military#TAAwards</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/military#RAFAwards</classentry>
			<classentry noticecode="Supplements" type="notifiablething">https://www.thegazette.co.uk/def/other-notices#UnclaimedPremiumBonds</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/planning#PlanningAct2008</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/planning#PlanningApplications</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/planning#BurialGrounds</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseA</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseG9</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#StrikingOff3Months</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseG7</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseG10</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseK4</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseG1</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseG4</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseD1</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseF1</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseG11</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseB3</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseJ1</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseK1</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseC1</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseC2</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseK5</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseH1</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseF2</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseB2</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseG2</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseG3</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseD2</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseC3</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseB1</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseG5</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseF3</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#StrikingOffDissolution</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseB4</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseK3</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseG6</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseH2</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseE1</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseG8</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseK2</classentry>
			<classentry noticecode="NEW" type="notifiablething">https://www.thegazette.co.uk/def/companies-partnerships#FilingAtCompaniesHouseF4</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#PrivyCounsellors</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#AwardandHonourThing</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#KnightsBatchelor</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#AwardandHonourThing</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#QueensCommendationBravery</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#AwardandHonourThing</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#ImperialServiceMedal</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#AwardandHonourThing</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#OrderBritishEmpire</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#AwardandHonourThing</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#CommonwealthHonours</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#AwardandHonourThing</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#ColonialPoliceMedal</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#AwardandHonourThing</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#QueensFireMedal</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#AwardandHonourThing</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#GeorgeMedal</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#AwardandHonourThing</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#OrderStMichael</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#AwardandHonourThing</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#QueensAwardEnterprise</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#AwardandHonourThing</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#RoyalVictorianOrder</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#AwardandHonourThing</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#RoyalRedCross</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#AwardandHonourThing</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#Peerage</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#AwardandHonourThing</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#OrderOfBath</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#AwardandHonourThing</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#PolarMedal</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#AwardandHonourThing</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#RoyalVictorianMedal</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#AwardandHonourThing</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#QueensPoliceMedal</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#AwardandHonourThing</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#QueensAwardVoluntaryService</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#AwardandHonourThing</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#OrderCompanions</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#AwardandHonourThing</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#QueensGallantryMedal</classentry>
			<classentry noticecode="" type="notifiablething">https://www.thegazette.co.uk/def/honours#AwardandHonourThing</classentry>
		</classlist>
	</xsl:variable>
	<!-- ####################### -->
	<!-- ##### "RESOURCES" ##### -->
	<!-- ####################### -->
	<xsl:variable name="noticeURI" select="concat($gaz,'id','/notice/', $noticeId)"/>
	<xsl:variable name="long-notice-uri">http://www.<xsl:value-of select="lower-case($edition)"/>-gazette.co.uk/id/issues/<xsl:value-of select="$issueNumber"/>/notices/<xsl:value-of select="$noticeNo"/>
	</xsl:variable>
	<xsl:variable name="notifiable-thing">this:notifiableThing</xsl:variable>
	<xsl:variable name="address-of-administrator">this:addressOfAdministrator</xsl:variable>
	<xsl:variable name="notice-provenance">https://www.thegazette.co.uk/id/notice/<xsl:value-of select="$noticeId"/>/provenance</xsl:variable>
	<xsl:variable name="trustee-act-1925-part-2-section-27-uri">http://www.legislation.gov.uk/ukpga/Geo5/15-16/19/section/27</xsl:variable>
	<!-- ######################## -->
	<!-- ##### ASSOCIATIONS ##### -->
	<!-- ######################## -->
	<xsl:variable name="applies-bankruptcy-restrictions">gzw:appliesBankruptcyRestrictions</xsl:variable>
	<xsl:variable name="has-administrator">insolvency:hasAdministrator</xsl:variable>
	<xsl:variable name="has-additional-contact">gzw:hasAdditionalContact</xsl:variable>
	<xsl:variable name="has-appointer">insolvency:hasAppointer</xsl:variable>
	<xsl:variable name="has-birth-details">gzw:hasBirthDetails</xsl:variable>
	<xsl:variable name="has-company">gaz:hasCompany</xsl:variable>
	<xsl:variable name="has-company-group">gzw:companyGroup</xsl:variable>
	<xsl:variable name="has-company-name">gazorg:name</xsl:variable>
	<xsl:variable name="has-company-number">gazorg:companyNumber</xsl:variable>
	<xsl:variable name="has-company-status">gzw:companyStatus</xsl:variable>
	<xsl:variable name="has-court">court:hasCourt</xsl:variable>
	<xsl:variable name="has-court-case">insolvency:hasCourtCase</xsl:variable>
	<xsl:variable name="has-court-district">court:courtDistrict</xsl:variable>
	<xsl:variable name="has-court-name">court:courtName</xsl:variable>
	<xsl:variable name="has-court-number">court:caseNumber</xsl:variable>
	<xsl:variable name="has-court-year">court:caseYear</xsl:variable>
	<xsl:variable name="has-court-previous">gzw:courtPrevious</xsl:variable>
	<xsl:variable name="has-date-of-appointment">insolvency:dateOfAppointment</xsl:variable>
	<xsl:variable name="has-death-details">gzw:hasDeathDetails</xsl:variable>
	<xsl:variable name="has-edition">gaz:hasEdition</xsl:variable>
	<xsl:variable name="has-issue-number">gaz:hasIssueNumber</xsl:variable>
	<xsl:variable name="has-liquidation-type">insolvency:typeOfLiquidation</xsl:variable>
	<xsl:variable name="has-name">foaf:name</xsl:variable>
	<xsl:variable name="has-nature-of-business">gazorg:natureOfBusiness</xsl:variable>
	<xsl:variable name="has-notice-code">gaz:hasNoticeCode</xsl:variable>
	<xsl:variable name="has-notice-id">gaz:hasNoticeID</xsl:variable>
	<xsl:variable name="has-notice-number">gaz:hasNoticeNumber</xsl:variable>
	<xsl:variable name="has-notice-type">gaz:hasNoticeType</xsl:variable>
	<xsl:variable name="has-occupation">gzw:hasOccupation</xsl:variable>
	<xsl:variable name="has-office-holder-capacity">gzw:hasOfficeHolderCapacity</xsl:variable>
	<xsl:variable name="has-office-holder-number">gzw:hasOfficeHolderNumber</xsl:variable>
	<xsl:variable name="has-office-holder-numbers">gzw:hasOfficeHolderNumbers</xsl:variable>
	<xsl:variable name="has-other-company-names">gzw:companyOtherNames</xsl:variable>
	<xsl:variable name="has-partnership-address">gzw:partnershipAddress</xsl:variable>
	<xsl:variable name="has-partnership-details">gzw:partnershipDetails</xsl:variable>
	<xsl:variable name="has-partnership-name">gzw:partnershipName</xsl:variable>
	<xsl:variable name="has-partnership-number">gzw:partnershipNumber</xsl:variable>
	<xsl:variable name="has-person-details">gzw:hasPersonDetails</xsl:variable>
	<xsl:variable name="has-previous-partnership">gzw:partnershipPrevious</xsl:variable>
	<xsl:variable name="has-principal-trading-address">gazorg:hasPrincipalTradingAddress</xsl:variable>
	<xsl:variable name="has-private-address">gzw:hasPrivateAddress</xsl:variable>
	<xsl:variable name="has-provenance">prov:has_provenance</xsl:variable>
	<xsl:variable name="has-publication-date">gaz:earliestPublicationDate</xsl:variable>
	<!--xsl:variable name="has-publication-date">gaz:hasPublicationDate</xsl:variable-->
	<xsl:variable name="has-publisher">dc11:publisher</xsl:variable>
	<xsl:variable name="has-registered-office">gazorg:hasRegisteredOffice</xsl:variable>
	<xsl:variable name="has-society-name">gzw:hasSocietyName</xsl:variable>
	<xsl:variable name="has-society-number">gzw:hasSocietyNumber</xsl:variable>
	<xsl:variable name="has-status">gzw:hasStatus</xsl:variable>
	<xsl:variable name="has-trade-classification">gazorg:hasITCTradeClassification</xsl:variable>
	<xsl:variable name="is-about">gaz:isAbout</xsl:variable>
	<xsl:variable name="is-an-alternate-of">prov:alternateOf</xsl:variable>
	<xsl:variable name="is-required-by-legislation">gaz:isRequiredByLegislation</xsl:variable>
	<xsl:variable name="is-registered-in">gzw:isRegisteredIn</xsl:variable>
	<xsl:variable name="is-the-same-as">owl:sameAs</xsl:variable>
	<xsl:variable name="recognizes-bankruptcy-order-time">gzw:bankruptcyOrderTime</xsl:variable>
	<xsl:variable name="recognizes-petition-bankruptcy-order-date">gzw:petitionBankruptcyOrderDate</xsl:variable>
	<xsl:variable name="recognizes-petition-filing-date">insolvency:datePetitionFiled</xsl:variable>
	<xsl:variable name="recognizes-vol-winding-up-resolution-date">insolvency:dateResolvedVoluntaryWindingUp</xsl:variable>
	<xsl:variable name="recognizes-winding-up-order-date">insolvency:dateWoundUp</xsl:variable>
	<xsl:variable name="signed-on-date">gaz:dateAuthorisationSigned</xsl:variable>
	<!-- ################# -->
	<!-- ##### TYPES ##### -->
	<!-- ################# -->
	<xsl:variable name="edition-type">gaz:Edition</xsl:variable>
	<xsl:variable name="issue-type">gaz:Issue</xsl:variable>
	<xsl:variable name="notice-type">gaz:Notice</xsl:variable>
	<!-- ################ -->
	<!-- ##### ROOT ##### -->
	<!-- ################ -->
	<xsl:template match="/">
		<!-- xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html></xsl:text -->
		<html IdURI="https://www.thegazette.co.uk/id/notice/{$noticeId}" prefix="gaz: https://www.thegazette.co.uk/def/publication#       gzw: https://www.thegazette.co.uk/def/working#       person: https://www.thegazette.co.uk/def/person#       personal-legal: https://www.thegazette.co.uk/def/personal-legal#       court: https://www.thegazette.co.uk/def/court#       insolvency: https://www.thegazette.co.uk/def/insolvency#       partnerships: https://www.thegazette.co.uk/def/partnerships#       org: http://www.w3.org/ns/org#       gazorg: https://www.thegazette.co.uk/def/organisation#       leg: https://www.thegazette.co.uk/def/legislation#       loc: https://www.thegazette.co.uk/def/location#       dc11: http://purl.org/dc/elements/1.1/       this: https://www.thegazette.co.uk/id/notice/{$noticeId}#       prov: http://www.w3.org/ns/prov#">
			<head>
				<title>
					<xsl:value-of select="$paramConfigXml/gzc:Configuration//gzc:Notice[@Code = $noticeCode]/gzc:Name"/>
				</title>
				<xsl:call-template name="gazettes-metadata"/>
			</head>
			<body>
				<xsl:if test="$debug='true'">
					<h1>DEBUG START</h1>paramconfigxml should appear here: |<xsl:copy-of select="$paramConfigXml/gzc:Configuration//gzc:Notice[@Code = $noticeCode]"/>|<h1>DEBUG END</h1>
				</xsl:if>
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="gz:Notice">
      <article class="full-notice full-notice-{$noticeCode}">
	    <xsl:call-template name="rdfa-data"/>
	    <xsl:call-template name="metadata"/>
	    <xsl:call-template name="content"/>

	  </article>
	</xsl:template>

	<xsl:template name="content">
			<div class="content" about="{$notifiable-thing}" data-gazettes="Notice" data-gazettes-type="{$noticeCode}">
				<xsl:choose>
					<xsl:when test="$noticeCode = '2903'">
						<xsl:call-template name="type2903"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="notice-content"/>
					</xsl:otherwise>
				</xsl:choose>
			</div>
	</xsl:template>

	<xsl:template name="notice-content">
		<xsl:variable name="items" as="item()*" select="*"/>
		<xsl:variable name="p1s" as="xs:integer*" select="fnx:findP1s($items)"/>

		<xsl:for-each select="$items">
		  <xsl:choose>
		  <xsl:when test="name(.) = ('P1','P2','P3')">
		    <xsl:if test="position() = $p1s">
			  <xsl:copy-of select="fnx:apply-subsequence(position(), $p1s, $items)"/>
		    </xsl:if>
		  </xsl:when>
		  <xsl:otherwise>
		    <xsl:apply-templates select="."/>
		  </xsl:otherwise>
		  </xsl:choose>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="rdfa-data">
		<xsl:variable name="issueURI" select="concat($gaz,'id/','edition/',$edition,'/issue/',$issueNumber)"/>
		<xsl:variable name="editionURI" select="concat($gaz,'id/','edition/',$edition)"/>
			<div class="rdfa-data">
				<span about="{$noticeURI}" property="{$has-publisher}" content="TSO (The Stationery Office), St Crispins, Duke Street, Norwich, NR3 1PD, 01603 622211, customer.services@tso.co.uk"/>
				<span about="{$noticeURI}" property="{$is-about}" resource="{$notifiable-thing}"/>
				<span about="{$noticeURI}" property="{$has-provenance}" resource="{$notice-provenance}"/>
				<span about="{$noticeURI}" property="prov:has_anchor" resource="{$noticeURI}"/>
				<span about="{$noticeURI}" property="gaz:isInIssue" resource="{$issueURI}"/>
				<span resource="{$issueURI}" typeof="{$issue-type}"/>
				<span about="{$issueURI}" property="{$has-edition}" resource="{$editionURI}"/>
				<!--span about="{$issueURI}"  property="{$has-issue-number}" datatype="xsd:string" content="{$issueNumber}"/-->
				<span resource="{$editionURI}" typeof="{$edition-type}"/>
				<span about="{$noticeURI}" property="{$has-notice-number}" datatype="xsd:integer" content="{if ($noticeNo) then $noticeNo else '0'}"/>
				<span about="{$noticeURI}" property="{$is-the-same-as}" resource="https://www.thegazette.co.uk/id/edition/{$edition}/issue/{$issueNumber}/notice/{$noticeNo}" typeof="{$notice-type}"/>
				<span about="{$noticeURI}" property="{$is-an-alternate-of}" resource="{$long-notice-uri}" typeof="{$notice-type}"/>
				<xsl:comment>Notice Classes</xsl:comment>
				<span resource="{$noticeURI}" typeof="https://www.thegazette.co.uk/def/publication#Notice"/>
				<xsl:for-each select="$class/*/*[@noticecode = $noticeType and @type='notice']">
					<span resource="{$noticeURI}" typeof="{.}"/>
				</xsl:for-each>
				<xsl:comment>Notifiable Thing</xsl:comment>
				<span resource="this:notifiableThing" typeof="https://www.thegazette.co.uk/def/publication#NotifiableThing"/>
				<xsl:for-each select="$class/*/*[@noticecode = $noticeType and @type='notifiablething']">
					<span resource="this:notifiableThing" typeof="{.}"/>
				</xsl:for-each>
				<xsl:choose>
					<xsl:when test="$noticeCode = '2903'">
						<xsl:variable name="fullName">
							<xsl:value-of select="//gz:Person/gz:PersonName/gz:Forename"/>
							<!-- &#160; -->
							<xsl:text> </xsl:text>
							<xsl:value-of select="//gz:Person/gz:PersonName/gz:MiddleNames"/>
							<!-- &#160; -->
							<xsl:text> </xsl:text>
							<xsl:value-of select="//gz:Person/gz:PersonName/gz:Surname"/>
						</xsl:variable>
						<xsl:variable name="personURI" select="string-join(('this:','deceasedPerson'),'')"/>
						<xsl:variable name="personFullName" select="replace($fullName,'\s+',' ')"/>
						<span about="this:notifiableThing" property="personal-legal:hasPersonalRepresentative" resource="this:estateExecutor"/>
						<span resource="this:addressOfDeceased-address-1" typeof="vcard:Address"/>
						<span resource="this:addressOfExecutor" typeof="vcard:Address"/>
						<span resource="this:estateExecutor" typeof="foaf:Agent"/>
						<span about="this:estateExecutor" property="vcard:adr" resource="this:addressOfExecutor"/>
						<!-- Needed for all 2903 notices -->
						<span resource="{$noticeURI}" typeof="personal-legal:DeceasedEstatesNotice personal-legal:WillsAndProbateNotice gaz:Notice"/>
						<span about="this:notifiableThing" property="personal-legal:hasEstateOf" resource="{$personURI}"/>
						<span about="{$personURI}" typeof="gaz:Person"/>
						<span about="{$personURI}" property="person:hasAddress" resource="this:addressOfDeceased-address-1"/>
						<span about="{$personURI}" content="{$personFullName}" property="foaf:name"/>
					</xsl:when>
				</xsl:choose>
			</div>
	</xsl:template>

	<xsl:template name="metadata">
		<xsl:variable name="issueURI" select="concat($gaz,'id/','edition/',$edition,'/issue/',$issueNumber)"/>
			<dl class="metadata">
				<dt>Notice category:</dt>
				<dd data-ui-class="category">
					<xsl:value-of select="$paramConfigXml/gzc:Configuration//gzc:Category[@Code = substring($noticeType,1,2)]/@Name"/>
				</dd>
				<dt>Notice type:</dt>
				<dd data-ui-class="notice-type">
					<xsl:value-of select="$paramConfigXml/gzc:Configuration//gzc:Notice[@Code = $noticeType]/gzc:Name"/>
				</dd>
				<dt>Publication date:</dt>
				<dd about="{$noticeURI}" property="{$has-publication-date}" content="{$publishDate}" datatype="xsd:dateTime">
					<time datetime="{$publishDate}">
						<xsl:value-of select="$publishDate"/>
					</time>
				</dd>
				<xsl:if test="$noticeCode = '2903'">
					<dt>Claim expires:</dt>
					<dd about="this:notifiableThing" property="personal-legal:hasClaimDeadline" content="{gz:Person/gz:DeathDetails/gz:NoticeOfClaimsDate/@Date}" datatype="xsd:date">
						<time datetime="{gz:Person/gz:DeathDetails/gz:NoticeOfClaimsDate/@Date}">
							<xsl:value-of select="gz:Person/gz:DeathDetails/gz:NoticeOfClaimsDate"/>
						</time>
					</dd>
				</xsl:if>
				<dt>Edition:</dt>
				<dd>
					<xsl:value-of select="$edition"/>
				</dd>
				<dt>Issue number:</dt>
				<dd about="{$issueURI}" property="{$has-issue-number}" datatype="xsd:string">
					<xsl:value-of select="$issueNumber"/>
				</dd>
				<dt>Notice ID:</dt>
				<dd about="{$noticeURI}" property="{$has-notice-id}">
					<xsl:value-of select="$noticeId"/>
				</dd>
				<dt>Notice code:</dt>
				<dd about="{$noticeURI}" property="{$has-notice-code}" datatype="xsd:integer">
					<xsl:value-of select="$noticeType"/>
				</dd>
			</dl>
	</xsl:template>

	<xsl:template name="type2903">
		<xsl:variable name="personURI" select="string-join(('this:','deceasedPerson'),'')"/>
		<dl>
			<dt>Surname:</dt>
			<dd typeof="gaz:Person" about="{$personURI}" property="foaf:familyName" data-gazettes="Surname">
				<xsl:value-of select="gz:Person/gz:PersonName/gz:Surname"/>
			</dd>
			<dt>First name:</dt>
			<dd typeof="gaz:Person" about="{$personURI}" property="foaf:firstName" data-gazettes="Forename">
				<xsl:value-of select="gz:Person/gz:PersonName/gz:Forename"/>
			</dd>
			<xsl:if test="gz:Person/gz:PersonName/gz:MiddleNames">
				<dt>Middle name(s):</dt>
				<dd property="foaf:givenName" typeof="gaz:Person" about="{$personURI}">
					<xsl:value-of select="gz:Person/gz:PersonName/gz:MiddleNames"/>
				</dd>
			</xsl:if>
			<xsl:if test="gz:Person//gz:AlsoKnownAs">
				<dt typeof="gaz:Person" about="{$personURI}" property="person:alsoKnownAs">Alternative name:</dt>
				<dd>
					<xsl:value-of select="."/>
				</dd>
			</xsl:if>
			<xsl:if test="gz:Person/gz:PersonName/text()">
				<xsl:variable name="rawname" select="gz:Person/gz:PersonName/text()"/>
				<xsl:choose>
					<xsl:when test="$rawname[1] = ', '">
						<dt>Alternative name(s):</dt>
						<dd typeof="gaz:Person" about="{$personURI}" property="person:alsoKnownAs">
							<xsl:for-each select="$rawname">
								<xsl:if test="position() = 1">
									<xsl:choose>
										<xsl:when test=". = ', '"/>
										<xsl:otherwise>
											<xsl:value-of select="replace(replace(.,'\(','' ), '\)','')"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="position() &gt; 1">
									<xsl:variable name="cleanedname" select="replace(replace(.,'\(','' ), '\)','')"/>
									<xsl:value-of select="$cleanedname"/>
								</xsl:if>
							</xsl:for-each>
						</dd>
					</xsl:when>
					<xsl:otherwise/>
				</xsl:choose>
			</xsl:if>
			<dt>Date of death:</dt>
			<dd property="personal-legal:dateOfDeath" typeof="gaz:Person" datatype="xsd:date" about="{$personURI}" content="{gz:Person/gz:DeathDetails/gz:Date/@Date}">
				<time datetime="{gz:Person/gz:DeathDetails/gz:Date/@Date}">
					<xsl:value-of select="gz:Person/gz:DeathDetails/gz:Date"/>
				</time>
			</dd>
			<dt>Person Address Details</dt>
			<dd about="this:addressOfDeceased-address-1" typeof="vcard:Address" property="vcard:adr">
				<xsl:value-of select="gz:Person/gz:PersonDetails"/>
			</dd>
			<dt>Executor:</dt>
			<dd about="this:estateExecutor" property="foaf:name" typeof="foaf:Agent">
				<xsl:value-of select="gz:Person/gz:DeathDetails/gz:NoticeOfClaims"/>
			</dd>
		</dl>
	</xsl:template>
	<!-- ######################## -->
	<!-- ##### ukm:Metadata ##### -->
	<!-- ######################## -->
	<xsl:template match="ukm:Metadata"/>
	<!-- ############################ -->
	<!-- ##### NOTICE TOP LEVEL ##### -->
	<!-- ############################ -->
	<xsl:template match="gz:Notice/gz:Title">
		<xsl:choose>
			<xsl:when test="$noticeCode = '1101'">
				<xsl:if test="count(preceding-sibling::gz:Title) &lt; 1">
					<h3 data-gazettes="Title" property="gaz:has{name()}">
						<!--concat all the titles in one-->
						<xsl:call-template name="join">
							<xsl:with-param name="valueList" select="..//gz:Title"/>
							<xsl:with-param name="separator" select="' '"/>
						</xsl:call-template>
					</h3>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<h3 data-gazettes="Title" property="gaz:has{name()}">
					<xsl:value-of select="upper-case(wlf:serialize(.))"/>
				</h3>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- template 'join' accepts valueList and separator -->
	<xsl:template name="join">
		<xsl:param name="valueList" select="''"/>
		<xsl:param name="separator" select="','"/>
		<xsl:for-each select="$valueList">
			<xsl:choose>
				<xsl:when test="position() = 1">
					<xsl:value-of select="."/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat($separator, .) "/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Legislation">
		<h3 data-gazettes="Legislation">
			<span about="this:notifiableThing" property="gaz:isRelatedToLegislation" resource="{wlf:clean(wlf:serialize(.))}" typeof="leg:Legislation" data-gazettes="Legislation">
				<span about="{wlf:clean(wlf:serialize(.))}" property="rdfs:label" content="{wlf:serialize(.)}">
					<xsl:value-of select="upper-case(wlf:serialize(.))"/>
				</span>
			</span>
		</h3>
	</xsl:template>

	<xsl:template match="gz:Notice/gz:Note">
		<div data-gazettes="Note"> <xsl:apply-templates/> </div>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Note/gz:P">
	  <p data-gazettes="Text">Note: <xsl:apply-templates/></p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Note/gz:P/gz:Text">
	  <xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="gz:Notice/gz:P">
		<div data-gazettes="P"> <xsl:next-match/> </div>
	</xsl:template>

	<xsl:template match="gz:P">
			<xsl:apply-templates select="gz:Text"/>
			<xsl:choose>
				<xsl:when test="gz:P1">
					<ul> <xsl:apply-templates select="gz:P1"/> </ul>
				</xsl:when>
				<xsl:when test="gz:P2">
					<ul> <xsl:apply-templates select="gz:P2"/> </ul>
				</xsl:when>
				<xsl:when test="gz:P3">
					<ul> <xsl:apply-templates select="gz:P3"/> </ul>
				</xsl:when>
				<xsl:when test="gz:P4">
					<ul> <xsl:apply-templates select="gz:P4"/> </ul>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="* except gz:Text"/>
				</xsl:otherwise>
			</xsl:choose>
	</xsl:template>

	<xsl:template match="gz:Notice/gz:P/gz:Text[gz:AddressLineGroup[@Class='Meeting']]" priority="3">
	    <xsl:variable name="nodes" select="text()|*"/>
		<xsl:variable name="dates" as="xs:integer*">
			<xsl:for-each select="$nodes">
				<xsl:if test="name(.) = 'AddressLineGroup'">
					<xsl:variable name="i" as="xs:integer" select="position()"/>
					<xsl:if test="$nodes[$i + 1] instance of text() and $nodes[$i + 2]/name(.) = 'Date'">
						<xsl:sequence select="($i + 1, $i + 2)"/>
					</xsl:if>
					<xsl:if test="$nodes[$i + 3] instance of text() and $nodes[$i + 4]/name(.) = 'Time'">
						<xsl:sequence select="($i + 3, $i + 4)"/>
					</xsl:if>
					<xsl:if test="$nodes[$i + 5] instance of text() and $nodes[$i + 6]/name(.) = 'Time'">
						<xsl:sequence select="($i + 5, $i + 6)"/>
					</xsl:if>
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>
		<p data-gazettes="Text">
		  <xsl:for-each select="$nodes">
		    <xsl:choose>
			  <xsl:when test="name(.)='AddressLineGroup'">
	            <div data-gazettes="Meeting Details">
                  <div data-container="address" about="this:notifiableThing" property="insolvency:meetingLocation" resource="this:meetingAddress-1">
		            <span about="this:meetingAddress-1" typeof="vcard:Address">
		              <span about="this:meetingAddress-1" property="vcard:street-address" content="{.}"><xsl:value-of select="."/></span>
		            </span>
		          </div>
				  <xsl:variable name="i" as="xs:integer" select="position() + 1"/>
				  <xsl:if test="$i = $dates">
		          <xsl:value-of select="$nodes[$i]"/>
		          <p>Meeting Date and Time: <span about="this:notifiableThing" property="insolvency:meetingTime" datatype="xsd:dateTime" content="{concat($nodes[$i + 1]/@Date,'T',$nodes[$i + 3]/@Time)}">
					<xsl:for-each select="$dates">
						<xsl:variable name="j" as="xs:integer" select="."/>
						<xsl:if test="$i != $j">
		          			<xsl:value-of select="$nodes[$j]"/>
				  		</xsl:if>
					</xsl:for-each>
		          </span></p>
				  </xsl:if>
	            </div>
			  </xsl:when>
			  <xsl:when test="position() = $dates"/>
			  <xsl:otherwise>
			    <xsl:apply-templates select="."/>
			  </xsl:otherwise>
		    </xsl:choose>
		  </xsl:for-each>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:P/gz:Text">
		<p data-gazettes="Text">
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	<!-- ################### -->
	<!-- ##### COMPANY ##### -->
	<!-- ################### -->
	<xsl:template match="gz:Notice/gz:Company">
		<xsl:variable name="prop">
			<xsl:choose>
				<xsl:when test="substring($noticeType,1,2)='25'">insolvency:hasCompany</xsl:when>
				<xsl:when test="substring($noticeType,1,2)='24'">insolvency:hasCompany</xsl:when>
				<xsl:otherwise>gaz:hasCompany</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<div data-gazettes="Company" property="{$prop}" resource="{wlf:name-sibling(.)}" typeof="gazorg:LimitedCompany">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Company/gz:CompanyName">
		<xsl:choose>
			<xsl:when test="$noticeCode = '2443'">
				<p> Name of Company: <strong property="{$has-company-name}" datatype="xsd:string" data-gazettes="CompanyName" data-gazettes-class="{@Class}">
						<xsl:value-of select="upper-case(.)"/>
					</strong>
				</p>
			</xsl:when>
			<xsl:otherwise>
				<h3 property="{$has-company-name}" datatype="xsd:string" data-gazettes="CompanyName" data-gazettes-class="{@Class}">
					<xsl:value-of select="upper-case(.)"/>
				</h3>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Company/gz:CompanyNumber">
		<xsl:choose>
			<xsl:when test="$noticeCode = '2443'">
				<p>Company Number: <span property="{$has-company-number}" datatype="xsd:integer" data-gazettes="CompanyNumber">
						<xsl:apply-templates/>
					</span>
				</p>
			</xsl:when>
			<xsl:otherwise>
				<p>(Company Number <span property="{$has-company-number}" datatype="xsd:integer" data-gazettes="CompanyNumber">
						<xsl:apply-templates/>
					</span>)</p>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Company/gz:CompanyStatus">
		<p>
			<xsl:choose>
				<xsl:when test="$noticeCode = '2405'"/>
				<xsl:otherwise>Company status: </xsl:otherwise>
			</xsl:choose>
			<span property="gazorg:status" datatype="xsd:string" data-gazettes="CompanyStatus">
				<xsl:apply-templates/>
			</span>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:CompanyGroup">
		<p data-gazettes="CompanyGroup">and in the Matter of <xsl:apply-templates/>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:CompanyGroup/gz:Legislation">
		<span about="this:notifiableThing" property="leg:isRequiredByLegislation" resource="{wlf:clean(wlf:serialize(.))}" typeof="leg:Legislation" data-gazettes="Legislation">
			<span about="{wlf:clean(wlf:serialize(.))}" property="rdfs:label" content="{wlf:serialize(.)}">
				<xsl:apply-templates/>
			</span>
		</span>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Company/gz:CompanyGroup">
		<p property="{$has-company-group}" datatype="xsd:string" data-gazettes="CompanyGroup">
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Company/gz:CompanyOtherNames">
		<xsl:choose>
			<xsl:when test="gz:TradingAs and $noticeCode = '2443'">
				<p>Trading Name: <span property="gazorg:otherNames" datatype="xsd:string" data-gazettes="CompanyOtherNames">
						<xsl:apply-templates/>
					</span>
				</p>
			</xsl:when>
			<xsl:when test="gz:TradingAs">
				<p>Other Names of Company: <span property="gazorg:otherNames" datatype="xsd:string" data-gazettes="CompanyOtherNames">
						<xsl:apply-templates/>
					</span>
				</p>
			</xsl:when>
			<xsl:when test="gz:CompanyPrevious">
				<p>Previous Name of Company: <span property="gazorg:otherNames" datatype="xsd:string" data-gazettes="CompanyOtherNames">
						<xsl:apply-templates/>
					</span>
				</p>
			</xsl:when>
			<xsl:otherwise>
				<p>
					<span property="gazorg:otherNames" datatype="xsd:string" data-gazettes="CompanyOtherNames">
						<xsl:apply-templates/>
					</span>
				</p>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Company/gz:NatureOfBusiness">
		<p data-gazettes="NatureOfBusiness">Nature of Business: <span property="{$has-nature-of-business}" datatype="xsd:string">
				<xsl:apply-templates/>
			</span>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Company/gz:TradeClassification">
		<p data-gazettes="TradeClassification">Trade classification: <span property="{$has-trade-classification}" datatype="xsd:string">
				<xsl:apply-templates/>
			</span>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Company/gz:TypeOfLiquidation">
		<p data-gazettes="TypeOfLiquidation">Type of Liquidation: <span property="{$has-liquidation-type}" datatype="xsd:string">
				<xsl:apply-templates/>
			</span>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Company/gz:CompanyRegisteredOffice">
		<p property="{$has-registered-office}" resource="{wlf:compound-name(..,.)}" typeof="vcard:Address" data-gazettes="CompanyRegisteredOffice"> Registered office: <span property="vcard:label">
				<xsl:apply-templates/>
			</span>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Company/gz:PrincipalTradingAddress">
		<p property="{$has-principal-trading-address}" resource="{wlf:compound-name(..,.)}" typeof="vcard:Address" data-gazettes="PrincipalTradingAddress"> Principal trading address: <span property="vcard:label">
				<xsl:apply-templates/>
			</span>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Company/gz:CompanyRegisteredCountries"> Countries where registered: <p property="{$is-registered-in}" data-gazettes="CompanyRegisteredCountries">
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	<!-- SNC structural change -->
	<xsl:template match="gz:Notice/gz:Company//gz:AddressLineGroup">
		<span property="vcard:label" content="{wlf:serialize(.)}"/>
		<xsl:apply-templates/>
	</xsl:template>
	<!--xsl:template match="gz:Company//gz:AddressLineGroup/gz:AddressLine[1]"><span property="vcard:street-address" data-gazettes="AddressLine"><xsl:apply-templates/></span></xsl:template>
  
  <xsl:template match="gz:Company//gz:AddressLine[position() &gt; 1]"><span property="vcard:extended-address" data-gazettes="AddressLine"><xsl:apply-templates/></span></xsl:template>
  
  <xsl:template match="gz:Company//gz:Postcode"><span property="vcard:postal-code" data-gazettes="Postcode"><xsl:apply-templates/></span></xsl:template-->
	<xsl:template match="gz:CompanyPrevious/gz:CompanyName">
		<span data-gazettes="CompanyName" data-gazettes-class="{@Class}">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:CompanyOtherNames/gz:TradingAs">
		<span property="gazorg:isTradingAs" data-gazettes="TradingAs">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<!-- ######################## -->
	<!-- ##### PARTNERSHIPS ##### -->
	<!-- ######################## -->
	<xsl:template match="gz:Notice/gz:Partnership">
		<div property="partnerships:isAbout" resource="{wlf:name-sibling(.)}" typeof="gazorg:Partnership" data-gazettes="Partnership">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Partnership/gz:PartnershipName">
		<h3 property="gazorg:name" datatype="xsd:string" data-gazettes="PartnershipName">
			<xsl:apply-templates/>
		</h3>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Partnership/gz:PartnershipAddress">
		<p property="vcard:adr" resource="{wlf:compound-name(..,.)}" typeof="vcard:Address" data-gazettes="PartnershipAddress">
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Partnership/gz:PartnershipNumber"> Partnership number: <p property="gazorg:partnershipNumber" datatype="xsd:string" data-gazettes="PartnershipNumber">
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Partnership/gz:PartnershipDetails"> Partnership details: <p property="{$has-partnership-details}" datatype="xsd:string" data-gazettes="PartnershipDetails">
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Partnership/gz:PartnershipPrevious"> Previous partnership: <p property="{$has-previous-partnership}" datatype="xsd:string" data-gazettes="PartnershipPrevious">
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	<!-- ################## -->
	<!-- ##### COURTS ##### -->
	<!-- ################## -->
	<xsl:template match="gz:Notice/gz:Court">
		<div property="{$has-court-case}" resource="this:courtCase" typeof="court:CourtCase" data-gazettes="Court">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Court/gz:CourtName">
		<p property="{$has-court}" resource="this:court" typeof="court:Court">In the <span property="{$has-court-name}" datatype="xsd:string" data-gazettes="CourtName">
				<xsl:apply-templates/>
			</span>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Court/gz:CourtDistrict">
		<xsl:variable name="fs" select="following-sibling::gz:CourtNumber"/>
		<p>
			<span data-gazettes="CourtDistrict" resource="this:court" property="{$has-court-district}" datatype="xsd:string">
				<xsl:apply-templates/>
			</span>
			<xsl:if test="$fs">
				<span data-gazettes="CourtNumber" data-court-number="{$fs/@Number}" data-year="{$fs/@Year}">No <span property="{$has-court-number}" datatype="xsd:string">
						<xsl:if test="$fs = ''">
							<xsl:value-of select="$fs/@Number"/>
						</xsl:if>
						<xsl:value-of select="$fs"/>
					</span> of <span property="{$has-court-year}" datatype="xsd:gYear" content="{$fs/@Year}">
						<xsl:value-of select="$fs/@Year"/>
					</span>
				</span>
			</xsl:if>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Court/gz:CourtNumber">
		<xsl:if test="not(preceding-sibling::gz:CourtDistrict)">
			<p data-gazettes="CourtNumber" data-court-number="{@Number}" data-year="{@Year}">No <span property="{$has-court-number}" datatype="xsd:string">
					<xsl:if test=". = ''">
						<xsl:value-of select="@Number"/>
					</xsl:if>
					<xsl:apply-templates/>
				</span> of <span property="{$has-court-year}" datatype="xsd:gYear">
					<xsl:value-of select="@Year"/>
				</span>
			</p>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Court/gz:CourtPrevious">
		<p property="{$has-court-previous}" datatype="xsd:string" data-gazettes="CourtPrevious">Previous court: <xsl:apply-templates/>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Court/gz:PetitionFilingDate">
		<p resource="this:notifiableThing" property="{$recognizes-petition-filing-date}" datatype="xsd:date" content="{@Date}" data-gazettes="PetitionFilingDate" data-date="{@Date}">Petition filing date: <xsl:apply-templates/>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Court/gz:WindingUpOrderDate">
		<p resource="this:notifiableThing" property="{$recognizes-winding-up-order-date}" datatype="xsd:date" content="{@Date}" data-gazettes="WindingUpOrderDate" data-date="{@Date}">Winding up order date: <xsl:apply-templates/>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Court/gz:VolWindingUpResolutionDate">
		<p about="this:notifiableThing" property="{$recognizes-vol-winding-up-resolution-date}" datatype="xsd:date" data-gazettes="VolWindingUpResolutionDate" data-date="{@Date}">Voluntary winding up resolution date: <xsl:apply-templates/>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Court/gz:BankruptcyOrderTime">
		<p data-gazettes="BankruptcyOrderTime" data-time="{.}">Bankruptcy order time: <xsl:apply-templates/>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Court/gz:BankruptcyOrderDate">
		<!-- Need to build dateTime value, but time may be missing -->
		<xsl:variable name="time">
			<xsl:choose>
				<xsl:when test="../gz:BankruptcyOrderTime">
					<xsl:value-of select="../gz:BankruptcyOrderTime"/>
				</xsl:when>
				<xsl:otherwise>00:00</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<p about="this:notifiableThing" property="insolvency:dateOfBankruptcyOrder" content="{concat(@Date,concat('T',concat($time,':00')))}" datatype="xsd:dateTime" data-gazettes="BankruptcyOrderDate" data-date="{@Date}">Bankruptcy order date: <xsl:apply-templates/>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Court/gz:BankruptcyRestrictions">
		<p about="this:notifiableThing" property="{$applies-bankruptcy-restrictions}" datatype="xsd:date" data-gazettes="BankruptcyRestrictions">Bankruptcy restrictions: <xsl:apply-templates/>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Court/gz:TypeOfPetition">
		<p resource="this:notifiableThing" property="insolvency:typeOfPetition" datatype="xsd:string" content="{wlf:serialize(.)}" data-gazettes="TypeOfPetition">Type of petition: <xsl:apply-templates/>
		</p>
	</xsl:template>
	<!-- ##################### -->
	<!-- ##### SOCIETIES ##### -->
	<!-- ##################### -->
	<xsl:template match="gz:Notice/gz:Society">
		<div data-gazettes="Society">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Society/gz:SocietyName">Society name: <p about="{wlf:name(.)}" property="{$has-society-name}" datatype="xsd:string" data-gazettes="SocietyName">
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Society/gz:SocietyNumber">
		<p about="{wlf:name(../gz:SocietyName)}" property="{$has-society-number}" datatype="xsd:string" data-gazettes="SocietyNumber">Society number: <xsl:apply-templates/>
		</p>
	</xsl:template>
	<!-- ################## -->
	<!-- ##### PERSON ##### -->
	<!-- ################## -->
	<xsl:template match="gz:Notice/gz:Person">
		<xsl:variable name="prop">
			<xsl:choose>
				<xsl:when test="substring($noticeType,1,2)='25'">gaz:hasPerson</xsl:when>
				<xsl:when test="$noticeType='2901'">personal-legal:changesNameOf</xsl:when>
				<xsl:when test="$noticeType='2902'">personal-legal:isSearchForNextOfKinOf</xsl:when>
				<xsl:otherwise>gaz:hasPerson</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<div property="{$prop}" resource="{wlf:name-sibling(.)}" typeof="person:Person" data-gazettes="Person">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	<!-- As above, if the XML randomly misses out gz:Person element -->
	<xsl:template match="gz:Notice/gz:PersonName[not(@Class='Administrator')] | gz:Notice/gz:Text/gz:PersonName[not(@Class='Administrator')]">
		<xsl:variable name="prop">
			<xsl:choose>
				<xsl:when test="substring($noticeType,1,2)='25'">insolvency:BankruptPerson</xsl:when>
				<xsl:when test="$noticeType='2901'">personal-legal:changesNameOf</xsl:when>
				<xsl:when test="$noticeType='2902'">personal-legal:isSearchForNextOfKinOf</xsl:when>
				<xsl:otherwise>person:isAbout</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<div property="{$prop}" resource="{wlf:name-sibling(.)}" typeof="person:Person" data-gazettes="Person">
			<h2 data-gazettes="PersonName">
				<xsl:choose>
					<xsl:when test="$noticeType='2901'">
						<span property="foaf:name personal-legal:assumesName" content="{wlf:serialize(.)}"/>
					</xsl:when>
					<xsl:otherwise>
						<span property="foaf:name" content="{wlf:serialize(.)}"/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:apply-templates/>
			</h2>
		</div>
	</xsl:template>
	<xsl:template match=" gz:Notice/gz:P/gz:Text/gz:PersonName[not(@Class='Administrator')]">
		<xsl:variable name="prop">
			<xsl:choose>
				<xsl:when test="substring($noticeType,1,2)='25'">insolvency:BankruptPerson</xsl:when>
				<xsl:when test="$noticeType='2901'">personal-legal:changesNameOf</xsl:when>
				<xsl:when test="$noticeType='2902'">personal-legal:isSearchForNextOfKinOf</xsl:when>
				<xsl:otherwise>person:isAbout</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<span property="{$prop}" resource="{wlf:name-sibling(.)}" typeof="person:Person" data-gazettes="Person">
			<!-- &#160; -->
			<span data-gazettes="PersonName">
				<xsl:choose>
					<xsl:when test="$noticeType='2901'">
						<span property="foaf:name personal-legal:assumesName" content="{wlf:serialize(.)}"/>
					</xsl:when>
					<xsl:otherwise>
						<span property="foaf:name" content="{wlf:serialize(.)}"/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:apply-templates/>
			</span>
		</span>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Person/gz:PersonName">
		<h2 data-gazettes="PersonName">
			<xsl:choose>
				<xsl:when test="$noticeType='2901'">
					<span property="foaf:name personal-legal:assumesName" content="{wlf:serialize(.)}"/>
				</xsl:when>
				<xsl:otherwise>
					<span property="foaf:name" content="{wlf:serialize(.)}"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates/>
		</h2>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Person/gz:PersonAddress">
		<!--xsl:variable name="person-name"><xsl:apply-templates select="../gz:PersonName" mode="serialize"/></xsl:variable-->
		<!--p about="{wlf:name($person-name)}" property="{$has-private-address}" datatype="xsd:string" data-gazettes="PersonAddress"><xsl:apply-templates/></p-->
		<p typeof="vcard:Address" property="person:hasAddress" resource="{wlf:compound-name(..,.)}" data-gazettes="PersonAddress">
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Person/gz:PersonAddress/gz:AddressLineGroup">
		<span property="vcard:label" content="{wlf:serialize(.)}" data-gazettes="AddressLineGroup" data-gazettes-class="{@Class}"/>
		<xsl:apply-templates/>
	</xsl:template>
	<!--xsl:template match="gz:Notice/gz:Person/gz:PersonAddress/gz:AddressLineGroup/gz:AddressLine">
    <span resource="{wlf:clean(wlf:serialize(..))}" property="gzw:has{name()}" content="{wlf:serialize(.)}" data-gazettes="AddressLine"><xsl:apply-templates/></span>
  </xsl:template-->
	<!--xsl:template match="gz:Notice/gz:Person/gz:PersonAddress/gz:AddressLineGroup/gz:Postcode">
    <span resource="{wlf:clean(wlf:serialize(..))}" property="gzw:has{name()}" content="{wlf:serialize(.)}" data-gazettes="Postcode"><xsl:apply-templates/></span>
  </xsl:template-->
	<xsl:template match="gz:Notice/gz:Person/gz:PersonStatus">
		<!--xsl:variable name="person-name"><xsl:apply-templates select="../gz:PersonName" mode="serialize"/></xsl:variable-->
		<p about="{wlf:name-sibling(..)}" property="person:hasStatus" datatype="xsd:string" data-gazettes="PersonStatus">
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Person/gz:Occupation">
		<!--xsl:variable name="person" select="wlf:name-sibling(..)"></xsl:variable-->
		<p about="{wlf:name-sibling(..)}" property="person:hasEmployment" resource="{wlf:compound-name(..,.)}" typeof="gaz:Employment" data-gazettes="Occupation">
			<span property="person:jobTitle" datatype="xsd:string">
				<xsl:apply-templates/>
			</span>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Person/gz:PersonDetails">
		<p resource="{wlf:name-sibling(..)}" data-gazettes="PersonDetails">
			<span property="person:hasPersonDetails" datatype="xsd:string" content="{wlf:serialize(.)}"/>
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Person/gz:BirthDetails">
		<!--xsl:variable name="person-name"><xsl:apply-templates select="../gz:PersonName" mode="serialize"/></xsl:variable-->
		<xsl:variable name="birth-date" select="gz:Date/@Date"/>
		<p about="{wlf:name-sibling(..)}" property="person:dateOfBirth" datatype="xsd:date" content="{gz:Date/@Date}" data-gazettes="BirthDetails">Birth details: <xsl:apply-templates mode="serialize"/>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Person/gz:DeathDetails">
		<xsl:variable name="person-name">
			<xsl:apply-templates select="../gz:PersonName" mode="serialize"/>
		</xsl:variable>
		<xsl:variable name="death-details">
			<xsl:apply-templates select="." mode="serialize"/>
		</xsl:variable>
		<p about="{wlf:name($person-name)}" property="{$has-death-details}" datatype="xsd:string" content="{normalize-space($death-details)}" data-gazettes="DeathDetails">Death details: <xsl:apply-templates/>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Person/gz:AlsoKnownAs">
		<p data-gazettes="AlsoKnownAs">Also known as: <span resource="{wlf:name-sibling(..)}" property="person:alsoKnownAs">
				<xsl:apply-templates/>
			</span>
		</p>
	</xsl:template>
	<!-- ########################## -->
	<!-- ##### ADMINISTRATION ##### -->
	<!-- ########################## -->
	<xsl:template match="gz:Notice/gz:Administration">
		<div data-gazettes="Administration">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Administration/gz:Administrator">
		<p data-gazettes="Administrator">
			<xsl:apply-templates/>
		</p>
		<!-- FIXME change it for <p data-gazettes="Administrator">Administrator: <span property="{$has-administrator}" datatype="xsd:string"><xsl:apply-templates/></span></p>-->
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Administration/gz:Appointer">
		<p data-gazettes="Appointer">By whom Appointed: <span property="{$has-appointer}" datatype="xsd:string">
				<xsl:apply-templates/>
			</span>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Administration/gz:AdditionalContact">
		<p data-gazettes="AdditionalContact">Additional contact: <span property="gaz:hasAdditionalContact" datatype="xsd:string">
				<xsl:apply-templates/>
			</span>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Administration/gz:OfficeHolderCapacity">
		<xsl:variable name="previous-administrator" select="wlf:name-sibling(preceding::gz:Administrator)"/>
		<p data-gazettes="OfficeHolderCapacity">
			<xsl:choose>
				<xsl:when test="$noticeCode = '2443'"/>
				<xsl:otherwise>Capacity of office holder(s): </xsl:otherwise>
			</xsl:choose>
			<span about="{$previous-administrator}" property="person:hasRole" resource="{concat($previous-administrator,'-role')}">
				<span resource="{concat($previous-administrator,'-role')}" typeof="person:Role" property="person:roleName" datatype="xsd:string">
					<xsl:apply-templates/>
				</span>
			</span>
		</p>
	</xsl:template>
	<!-- RDFa for these two are now handled within rule for gz:Administration//gz:PersonName - SNC -->
	<xsl:template match="gz:Notice/gz:Administration/gz:OfficeHolderNumbers">
		<p>Office Holder Number(s): <span data-gazettes="OfficeHolderNumbers">
				<xsl:apply-templates/>
			</span>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Administration//gz:OfficeHolderNumber">
		<span data-gazettes="OfficeHolderNumber">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Administration/gz:DateOfAppointment">
		<p>Date of Appointment: <span property="{$has-date-of-appointment}" datatype="xsd:date" content="{@Date}" data-gazettes="DateOfAppointment" data-date="{@Date}">
				<xsl:apply-templates/>
			</span>
		</p>
	</xsl:template>
	<xsl:template match="gz:Notice/gz:Administration/gz:DateSigned">
		<p property="gaz:hasAuthoriser" resource="this:authoriser" typeof="gaz:Authoriser">
			<span property="{$signed-on-date}" datatype="xsd:date" content="{@Date}" data-gazettes="DateSigned" data-date="{@Date}">
				<xsl:apply-templates/>
			</span>
		</p>
	</xsl:template>
	<xsl:template match="gz:Administration/gz:Administrator/gz:AddressLineGroup">
		<!-- FIXME move the following span (insolvency:hasAdministrator) to gz:Administration/gz:Administrator-->
		<span property="insolvency:hasAdministrator" resource="{wlf:name-sibling(..)}" typeof="foaf:Agent" data-gazettes="AddressLineGroup" data-gazettes-class="{@Class}">
			<span property="vcard:adr" resource="{wlf:compound-name(..,.)}" typeof="vcard:Address">
				<span property="vcard:label" content="{wlf:serialize(.)}"/>
				<xsl:apply-templates/>
			</span>
		</span>
	</xsl:template>
	<!--xsl:template match="gz:Administration/gz:Administrator/gz:AddressLineGroup/gz:AddressLine[1]">
    <span property="vcard:street-address" data-gazettes="AddressLine">
      <xsl:apply-templates/>
    </span>
  </xsl:template>
  
  <xsl:template match="gz:Administration//gz:AddressLine[position() &gt; 1]">
    <span property="vcard:extended-address" data-gazettes="AddressLine">
      <xsl:apply-templates/>
    </span>
  </xsl:template>
  
  <xsl:template match="gz:Administration//gz:Postcode">
    <span property="vcard:postal-code" data-gazettes="Postcode">
      <xsl:apply-templates/>
    </span>
  </xsl:template-->
	<xsl:template match="gz:Administration//gz:PersonName">
		<span property="{$has-administrator}" resource="{wlf:compound-name(..,.)}" typeof="foaf:Person" data-gazettes="PersonName">
			<xsl:if test="../gz:OfficeHolderNumber[1]">
				<xsl:variable name="previous-siblings" select="(count(preceding-sibling::gz:PersonName) + 1)" as="xs:integer"/>
				<span property="person:hasIPnum" datatype="xsd:string" content="{../gz:OfficeHolderNumber[$previous-siblings]/text()}"/>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="$noticeCode = '2443'">Liquidator's Name and Address: <xsl:apply-templates/>
				</xsl:when>
				<xsl:otherwise>
					<em>
						<xsl:apply-templates/>
					</em>
				</xsl:otherwise>
			</xsl:choose>
		</span>
	</xsl:template>
	<xsl:template match="gz:Administration//gz:Email">
		<span property="gaz:email" data-gazettes="Email" data-gazettes-class="{@Class}">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<!-- ##### AUTHORITY ##### -->
	<xsl:template match="gz:Notice/gz:Authority">
		<xsl:choose>
			<xsl:when test="$noticeCode = '1105'">
				<xsl:if test="count(preceding-sibling::gz:Authority) &lt; 1">
					<h2 property="gaz:hasAuthority" resource="{wlf:name-sibling(.)}" typeof="gaz:Authority">
						<span property="rdfs:label">
							<!--concat all the titles in one-->
							<xsl:call-template name="join">
								<xsl:with-param name="valueList" select="..//gz:Authority"/>
								<xsl:with-param name="separator" select="' '"/>
							</xsl:call-template>
						</span>
					</h2>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<h2 property="gaz:hasAuthority" resource="{wlf:name-sibling(.)}" typeof="gaz:Authority">
					<span property="rdfs:label">
						<xsl:apply-templates/>
					</span>
				</h2>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- ################ -->
	<!-- ##### TEXT ##### -->
	<!-- ################ -->
	<!-- FIXME - this should be when ... otherwise -->
	<xsl:template match="gz:Text/gz:AddressLineGroup[@Class='Company']">
		<span about="this:company-1" property="vcard:adr" resource="this:company-1-address-0" data-gazettes="AddressLineGroup" data-gazettes-class="{@Class}">
			<span about="this:company-1-address-0" typeof="vcard:Address" property="vcard:label" content="{wlf:serialize(.)}">
				<xsl:apply-templates/>
			</span>
		</span>
	</xsl:template>
	<xsl:template match="gz:Text/gz:AddressLineGroup[@Class='Petitioner']">
		<span about="this:petitioner-1" property="vcard:adr" resource="this:petitioner-1-address-0" data-gazettes="AddressLineGroup" data-gazettes-class="{@Class}">
			<span about="this:petitioner-1-address-0" typeof="vcard:Address" property="vcard:label" content="{wlf:serialize(.)}">
				<xsl:apply-templates/>
			</span>
		</span>
	</xsl:template>
	<xsl:template match="gz:Text/gz:AddressLineGroup[@Class='Court']">
		<span about="this:court" property="vcard:adr" resource="this:court-address-0" data-gazettes="AddressLineGroup" data-gazettes-class="{@Class}">
			<span about="this:court-address-0" typeof="vcard:Address" property="vcard:label" content="{wlf:serialize(.)}">
				<xsl:apply-templates/>
			</span>
		</span>
	</xsl:template>
	<xsl:template match="gz:Text/gz:AddressLineGroup[@Class='Administrator']">
		<span property="insolvency:hasAdministrator" resource="{concat(wlf:compound-name(..,.),'-administrator')}" typeof="foaf:Agent" data-gazettes="AddressLineGroup" data-gazettes-class="{@Class}">
			<span property="vcard:adr" resource="{wlf:compound-name(..,.)}" typeof="vcard:Address">
				<span property="vcard:label" content="{wlf:serialize(.)}"/>
				<xsl:apply-templates/>
			</span>
		</span>
	</xsl:template>

	<!--
	<xsl:template match="gz:Text/gz:AddressLineGroup[@Class='Meeting']">
		<span about="this:notifiableThing" property="insolvency:meetingLocation" resource="this:meeting" data-gazettes="AddressLineGroup" data-gazettes-class="{@Class}">
			<span about="this:meeting" property="vcard:adr" resource="this:meeting-address-0">
				<span about="this:meeting-address-0" typeof="vcard:Address" property="vcard:label" content="{wlf:serialize(.)}">
					<xsl:apply-templates/>
				</span>
			</span>
		</span>
	</xsl:template>
		-->
	<xsl:template match="gz:Text/gz:AddressLineGroup[@Class='Person']">
		<span property="gaz:hasPerson" resource="person-1" typeof="person:Person" data-gazettes="AddressLineGroup" data-gazettes-class="{@Class}">
			<span property="vcard:adr" resource="{wlf:compound-name(..,.)}" typeof="vcard:Address">
				<span property="vcard:label" content="{wlf:serialize(.)}"/>
				<xsl:apply-templates/>
			</span>
		</span>
	</xsl:template>
	<xsl:template match="gz:Text/gz:AddressLineGroup[@Class='Partnership']">
		<span resource="this:partnership-1">
			<span property="vcard:adr" resource="{wlf:compound-name(..,.)}" typeof="vcard:Address" data-gazettes="AddressLineGroup" data-gazettes-class="{@Class}">
				<span property="vcard:label" content="{wlf:serialize(.)}"/>
				<xsl:apply-templates/>
			</span>
		</span>
	</xsl:template>
	<xsl:template match="gz:Text/gz:AddressLineGroup[(@Class!='Company' and @Class!='Petitioner' and @Class!='Court' and @Class!='Administrator' and @Class!='Meeting' and @Class!='Person' and @Class!='Partnership') or not(@Class)]">
		<span about="{wlf:clean(wlf:serialize(.))}" property="gzw:has{name()}" content="{wlf:serialize(.)}" data-gazettes="AddressLineGroup" data-gazettes-class="{@Class}">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<!--xsl:template match="gz:Text/gz:AddressLineGroup"><span resource="{wlf:clean(wlf:serialize(.))}" property="gzw:has{name()}" content="{wlf:serialize(.)}" data-gazettes="AddressLineGroup" data-gazettes-class="{@Class}"><xsl:apply-templates/></span></xsl:template-->
	<xsl:template match="gz:Text/gz:CompanyName[@Class='Petitioner']">
		<span property="insolvency:hasPetitioner" resource="this:petitioner-1" typeof="gazorg:Organisation" data-gazettes="CompanyName" data-gazettes-class="{@Class}">
			<span property="gazorg:name" datatype="xsd:string">
				<xsl:value-of select="upper-case(.)"/>
			</span>
		</span>
	</xsl:template>
	<!-- ################### -->
	<!-- ##### GENERIC ##### -->
	<!-- ################### -->
	<xsl:template match="gz:AddressLineGroup">
		<span resource="{wlf:clean(wlf:serialize(.))}" property="gzw:has{name()}" content="{wlf:serialize(.)}" data-gazettes="AddressLineGroup" data-gazettes-class="{@Class}">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:AddressLine[1]">
		<span property="vcard:street-address" data-gazettes="AddressLine">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:AddressLine[position() &gt; 1]">
		<span property="vcard:extended-address" data-gazettes="AddressLine">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:AlsoKnownAs">
		<span resource="{wlf:name-sibling(..)}" property="person:alsoKnownAs" data-gazettes="AlsoKnownAs">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:Authority">
		<h2 property="gaz:hasAuthority" resource="{wlf:name-sibling(.)}" typeof="gaz:Authority">
			<span property="rdfs:label">
				<xsl:apply-templates/>
			</span>
		</h2>
	</xsl:template>
	<xsl:template match="gz:Character">
		<span data-gazettes="Character">
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:CompanyRegisteredCountry">
		<span data-gazettes="CompanyRegisteredCountry">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<!-- Damon! please fix problem with matching Date to following Time sibling - currently defaults to midnight.
       You might also want to make a tidier conditional structure to replace
       3 templates on same element
  -->
	<xsl:template match="gz:Date[@Class='Hearing']">
		<span property="insolvency:dateOfHearing" datatype="xsd:dateTime" content="{concat(@Date,'T00:00:00')}" data-gazettes="Date" data-gazettes-class="{@Class}" data-date="{@Date}">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:Date[@Class='Presentation']">
		<span property="insolvency:dateOfPetitionPresentation" datatype="xsd:date" content="{@Date}" data-gazettes="Date" data-gazettes-class="{@Class}" data-date="{@Date}">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:Date[@Class='Resolution']">
		<span property="insolvency:dateOfResolution" datatype="xsd:date" content="{@Date}" data-gazettes="Date" data-gazettes-class="{@Class}" data-date="{@Date}">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:Date[@Class='Appointment']">
		<span property="{$has-date-of-appointment}" datatype="xsd:date" content="{@Date}" data-gazettes="Date" data-gazettes-class="{@Class}" data-date="{@Date}">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:Date">
		<span property="gaz:relatedDate" content="{@Date}" datatype="xsd:date" data-gazettes="Date" data-gazettes-class="{@Class}" data-date="{@Date}">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:DateOfAnnulment">Date of annulment: <span resource="{wlf:clean(wlf:serialize(../*[1]))}" property="gzw:has{name()}" content="{wlf:serialize(.)}" data-gazettes="DateOfAnnulment" data-date="{@Date}">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:DateOfDischarge">Date of discharge: <span resource="{wlf:clean(wlf:serialize(../*[1]))}" property="gzw:has{name()}" content="{wlf:serialize(.)}" data-gazettes="DateOfDischarge" data-date="{@Date}">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:DateOfCertificateOfDischarge">Date of certificate of discharge: <span resource="{wlf:clean(wlf:serialize(../*[1]))}" property="gzw:has{name()}" content="{wlf:serialize(.)}" data-gazettes="DateOfCertificateOfDischarge" data-date="{@Date}">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:Email">
		<span property="gaz:email" data-gazettes="Email" data-gazettes-class="{@Class}">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:FirmName">
		<span property="insolvency:hasAdministrator" resource="{wlf:name-sibling(.)}" typeof="gazorg:ForProfitOrganisation" data-gazettes="FirmName">
			<span property="gazorg:name">
				<xsl:apply-templates/>
			</span>
		</span>
	</xsl:template>
	<xsl:template match="gz:Forename">
		<span property="foaf:firstName" data-gazettes="Forename">
			<xsl:apply-templates/>
		</span>
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="gz:GroundsOfAnnulment">Grounds of annulment: <span resource="{wlf:clean(wlf:serialize(../*[1]))}" property="gzw:has{name()}" content="{wlf:serialize(.)}" data-gazettes="GroundsOfAnnulment">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:Initials">
		<span property="person:initials" data-gazettes="Initials">
			<xsl:apply-templates/>
		</span>
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="gz:IVAdate">
		<span data-gazettes="IVAdate" data-date="{@Date}">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:Legislation">Legislation: <span resource="this:notifiableThing"/>
		<span property="leg:isRequiredByLegislation" resource="{wlf:clean(wlf:serialize(.))}" typeof="leg:Legislation" data-gazettes="Legislation">
			<span property="rdfs:label" datatype="xsd:string">
				<xsl:apply-templates/>
			</span>
		</span>
	</xsl:template>
	<xsl:template match="gz:LegislationSection">Legislation section: <xsl:variable name="legislation">
			<xsl:choose>
				<xsl:when test="following-sibling::gz:Legislation">
					<xsl:value-of select="wlf:clean(following-sibling::gz:Legislation[1])"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="wlf:clean(wlf:serialize(.))"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<span resource="{$legislation}" data-gazettes="LegislationSection">
			<span property="leg:legislationSection" resource="{concat($legislation,'-',wlf:serialize(.))}" typeof="legislation:LegislationSection">
				<span property="rdfs:label">
					<xsl:apply-templates/>
				</span>
			</span>
		</span>
	</xsl:template>
	<xsl:template match="gz:LegislationType">Legislation type: <span data-gazettes="LegislationType">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:LegislationSubType">Legislation subtype: <span data-gazettes="LegislationSubType">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:MiddleNames">
		<span property="foaf:givenName" data-gazettes="MiddleNames">
			<xsl:apply-templates/>
		</span>
		<!-- &#160; -->
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="gz:Note">
		<span data-gazettes="Note">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:NoticeOfClaims">Notice of claims: <span resource="{wlf:clean(wlf:serialize(.))}" property="gzw:has{name()}" content="{wlf:serialize(.)}" data-gazettes="NoticeOfClaims">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:NoticeOfClaimsDate">Notice of claims date: <span data-gazettes="NoticeOfClaimsDate" data-date="{@Date}">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:NoticeHeading">
		<span property="gaz:has{name()}" content="{wlf:serialize(.)}" data-gazettes="NoticeHeading">
			<strong>
				<xsl:apply-templates/>
			</strong>
		</span>
	</xsl:template>
	<xsl:template match="gz:OfficeHolderCapacity">
		<xsl:variable name="previous-administrator" select="wlf:compound-name(..,preceding-sibling::*[1])"/>Office holder capacity: <span about="{$previous-administrator}" property="person:hasRole" typeof="person:Role" resource="{concat($previous-administrator,'-role')}" data-gazettes="OfficeHolderCapacity">
			<span property="person:roleName" datatype="xsd:string">
				<xsl:apply-templates/>
			</span>
		</span>
	</xsl:template>
	<!-- xsl:template match="gz:OfficeHolderNumber">Office holder number: <span resource="{wlf:clean(wlf:serialize(../*[1]))}" property="gzw:has{name()}" content="{wlf:serialize(.)}" data-gazettes="OfficeHolderNumber"><xsl:apply-templates/></span></xsl:template-->
	<xsl:template match="gz:Petitioner">
		<p about="this:notifiableThing" property="insolvency:hasPetitioner" resource="{wlf:name-sibling(.)}" typeof="foaf:Agent" data-gazettes="Petitioner">
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	<xsl:template match="gz:PetitionerAddress">
		<span property="vcard:adr" resource="{wlf:compound-name(..,.)}" typeof="vcard:Address" data-gazettes="PetitionerAddress">
			<span property="vcard:label" content="{wlf:serialize(.)}"/>
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:PetitionerAddress//gz:AddressLineGroup">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="gz:PetitionerName">
		<xsl:choose>
			<xsl:when test="following-sibling::gz:PetitionerAddress">Name and address of petitioner: </xsl:when>
			<xsl:otherwise>Name of petitioner: </xsl:otherwise>
		</xsl:choose>
		<span property="foaf:name" content="{wlf:serialize(.)}" data-gazettes="PetitionerName">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:Pblock |gz:PsubBlock">
	  <xsl:variable name="here" select="."/>
	  <xsl:variable name="p1s" as="xs:integer*" select="fnx:findP1s(*)"/>
		<div data-gazettes="{name()}">
		  <xsl:for-each select="*">
		    <xsl:choose>
			<xsl:when test="name(.) = 'P1'">
			  <xsl:if test="position()=$p1s">
			  <ul><xsl:apply-templates select="$here/gz:P1"/></ul>
			  </xsl:if>
			</xsl:when>
			<xsl:when test="name(.) = 'P2'">
			  <xsl:if test="position()=$p1s">
			  <ul><xsl:apply-templates select="$here/gz:P2"/></ul>
			  </xsl:if>
			</xsl:when>
			<xsl:when test="name(.) = 'P3'">
			  <xsl:if test="position()=$p1s">
			  <ul><xsl:apply-templates select="$here/gz:P3"/></ul>
			  </xsl:if>
			</xsl:when>
			<xsl:otherwise>
			  <xsl:apply-templates select="."/>
			</xsl:otherwise>
		    </xsl:choose>
		  </xsl:for-each>
		</div>
	</xsl:template>
	<xsl:template match="gz:Pblock/gz:Title">
		<h4 data-gazettes="Title">
			<xsl:apply-templates/>
		</h4>
	</xsl:template>
	<xsl:template match="gz:PsubBlock/gz:Title">
		<h5 data-gazettes="Title">
			<xsl:apply-templates/>
		</h5>
	</xsl:template>
	<xsl:template match="gz:PsubBlock/gz:P/gz:Text">
		<p data-gazettes="Text">
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	
	<xsl:template match="gz:Pblock/gz:P">
		<p data-gazettes="P">
			<xsl:next-match/>
		</p>
	</xsl:template>

	<xsl:template match="gz:Pnumber">
		<span data-gazettes="{name()}">
			<xsl:apply-templates/>
		</span>
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="gz:Postcode">
		<span property="vcard:postal-code" data-gazettes="Postcode">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<!--
	<xsl:template match="gz:PsubBlock">
		<div data-gazettes="PsubBlock">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
		-->
	<xsl:template match="gz:Ref">
		<span data-gazettes="Ref">
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:RelatedCase">Related case: <span resource="{wlf:clean(wlf:serialize(../*[1]))}" property="gzw:has{name()}" content="{wlf:serialize(.)}" data-gazettes="RelatedCase">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:Retraction">Retraction: <span resource="{wlf:clean(wlf:serialize(../*[1]))}" property="gzw:has{name()}" content="{wlf:serialize(.)}" data-gazettes="Retraction">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:Salutation">
		<span resource="{wlf:clean(wlf:serialize(..))}" property="gzw:has{name()}" content="{wlf:serialize(.)}" data-gazettes="Salutation">
			<xsl:apply-templates/>
		</span>
		<!-- &#160; -->
	</xsl:template>
	<xsl:template match="gz:Substitution">
		<p class="substitution" data-gazettes="Substitution">
			<span resource="{wlf:clean(wlf:serialize(../*[1]))}" property="gzw:has{name()}" content="{wlf:serialize(.)}" data-gazettes="Substitution">
				<xsl:apply-templates/>
			</span>
		</p>
	</xsl:template>
	<xsl:template match="gz:Surname">
		<span property="foaf:familyName" data-gazettes="Surname">
			<xsl:apply-templates/>
		</span>
		<!-- &#160; -->
	</xsl:template>
	<xsl:template match="gz:Telephone">
		<span property="loc:phoneNumber" content="{wlf:serialize(.)}" data-gazettes="Telephone" data-gazettes-class="{@Class}">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:Text">
		<span data-gazettes="Text">
			<xsl:if test="@SpaceBefore">
				<xsl:attribute name="data-gazettes-space-before" select="@SpaceBefore"/>
			</xsl:if>
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<!-- ISSUE: - how to deal with SpaceBefore attribute long-term? -->
	<!--xsl:template match="gz:Text/gz:PersonName"><span resource="{wlf:clean(wlf:serialize(../*[1]))}" property="gzw:has{name()}" content="{wlf:serialize(.)}" data-gazettes="PersonName" data-gazettes-class="{@Class}"><xsl:apply-templates/></span></xsl:template-->
	<xsl:template match="gz:Text//gz:PersonName[@Class='Administrator']">
		<!--xsl:if test="@Class='Administrator'"-->
		<span property="{$has-administrator}" resource="{wlf:triple-compound-name(../..,..,.)}" typeof="foaf:Person" data-gazettes="PersonName">
			<xsl:apply-templates/>
			<xsl:if test="../gz:OfficeHolderNumber[1]">
				<xsl:variable name="previous-siblings" select="(count(preceding-sibling::gz:PersonName) + 1)" as="xs:integer"/>
				<span property="person:hasIPnum" datatype="xsd:string" content="{../gz:OfficeHolderNumber[$previous-siblings]/text()}"/>
			</xsl:if>
		</span>
		<!--/xsl:if-->
	</xsl:template>
	<xsl:template match="gz:Time">
	  <xsl:choose>
	    <xsl:when test="@Class='Meeting'">
	      <span about="this:notifiableThing" property="insolvency:meetingTime" datatype="xsd:dateTime"><xsl:value-of select="preceding-sibling::gz:Date[@Class='Meeting']/@Date"/>T<xsl:value-of select="@Time"/></span>
	    </xsl:when>
	    <xsl:otherwise>
	      <span data-gazettes="Time" data-gazettes-class="{@Class}" data-time="{@Time}">
	        <xsl:apply-templates/>
	      </span>
	    </xsl:otherwise>
	  </xsl:choose>


	  
	</xsl:template>
	<xsl:template match="gz:Notice/gz:TradingAs">
		<p resource="{wlf:name-sibling(../*[1])}" property="gazorg:isTradingAs" content="{wlf:serialize(.)}" data-gazettes="TradingAs">(t/a <xsl:apply-templates/>)</p>
	</xsl:template>
	<xsl:template match="gz:TradingAs">Trading as: <span resource="{wlf:name-sibling(..)}" property="gazorg:isTradingAs" data-gazettes="TradingAs">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:TradingDetails">Trading details: <span resource="{wlf:clean(wlf:serialize(../*[1]))}" property="gzw:has{name()}" content="{wlf:serialize(.)}" data-gazettes="TradingDetails">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:TradingPrevious">Previously trading as: <span property="gazorg:previousCompanyName" datatype="xsd:string" data-gazettes="TradingPrevious">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:TradingAddress">Trading address: <span resource="{wlf:clean(wlf:serialize(.))}" property="gzw:has{name()}" content="{wlf:serialize(.)}" data-gazettes="TradingAddress">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:TypeOfPetition">Type of petition: <span resource="this:notifiableThing" property="insolvency:typeOfPetition" datatype="xsd:string" data-gazettes="TypeOfPetition">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<!-- ############################# -->
	<!-- ##### Nested Paragraphs ##### -->
	<!-- ############################# -->
	<xsl:template match="gz:P1 | gz:P2 | gz:P3 | gz:P4">
			<li data-gazettes="{name()}">
				<xsl:if test="@SpaceBefore">
					<xsl:attribute name="data-gazettes-space-before" select="@SpaceBefore"/>
				</xsl:if>
				<xsl:apply-templates/>
			</li>
	</xsl:template>

    <xsl:template match="gz:P1para">
	  <span data-gazettes="{name()}">
		<xsl:if test="@SpaceBefore">
		  <xsl:attribute name="data-gazettes-space-before" select="@SpaceBefore"/>
		</xsl:if>
	  <xsl:apply-templates select="gz:Text"/>
	  <xsl:if test="gz:P2 | gz:P3 | gz:P4 | gz:P2group | gz:P3group">
	  <ul><xsl:apply-templates select="* except gz:Text"/></ul>
	  </xsl:if>
	  </span>
	</xsl:template>

    <xsl:template match="gz:P2para">
	  <span data-gazettes="{name()}">
		<xsl:if test="@SpaceBefore">
		  <xsl:attribute name="data-gazettes-space-before" select="@SpaceBefore"/>
		</xsl:if>
	  <xsl:apply-templates select="gz:Text"/>
	  <xsl:if test="gz:P3 | gz:P4 | gz:P2group | gz:P3group">
	  <ul><xsl:apply-templates select="* except gz:Text"/></ul>
	  </xsl:if>
	  </span>
	</xsl:template>

    <xsl:template match="gz:P3para">
	  <span data-gazettes="{name()}">
		<xsl:if test="@SpaceBefore">
		  <xsl:attribute name="data-gazettes-space-before" select="@SpaceBefore"/>
		</xsl:if>
	  <xsl:apply-templates select="gz:Text"/>
	  <xsl:if test="gz:P4">
	  <ul><xsl:apply-templates select="* except gz:Text"/></ul>
	  </xsl:if>
	  </span>
	</xsl:template>

    <xsl:template match="gz:P4para | gz:ForceP">
	  <span data-gazettes="{name()}">
		<xsl:if test="@SpaceBefore">
		  <xsl:attribute name="data-gazettes-space-before" select="@SpaceBefore"/>
		</xsl:if>
	  <xsl:apply-templates/>
	  </span>
	</xsl:template>

	<!-- ######################## -->
	<!-- ##### Very General ##### -->
	<!-- ######################## -->
	<xsl:template match=" gz:P1group | gz:P2group | gz:P3group | gz:P4group ">
		<xsl:choose>
			<xsl:when test="../name() = 'P'">
				<p data-gazettes="{name()}">
					<xsl:if test="@SpaceBefore">
						<xsl:attribute name="data-gazettes-space-before" select="@SpaceBefore"/>
					</xsl:if>
					<xsl:apply-templates/>
				</p>
			</xsl:when>
			<xsl:otherwise>
				<span data-gazettes="{name()}">
					<xsl:if test="@SpaceBefore">
						<xsl:attribute name="data-gazettes-space-before" select="@SpaceBefore"/>
					</xsl:if>
					<xsl:apply-templates/>
				</span>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="gz:Span">
		<span data-gazettes="Span" data-gazettes-parent="{name(parent::node())}">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="gz:Emphasis">
		<em>
			<xsl:apply-templates/>
		</em>
	</xsl:template>
	<xsl:template match="gz:Strong">
		<strong>
			<xsl:apply-templates/>
		</strong>
	</xsl:template>
	<xsl:template match="gz:Superior">
		<sup>
			<xsl:apply-templates/>
		</sup>
	</xsl:template>
	<xsl:template match="gz:Inferior">
		<sub>
			<xsl:apply-templates/>
		</sub>
	</xsl:template>
	<xsl:template match="gz:Image">
		<img>
			<xsl:if test="@Width">
				<xsl:copy-of select="@Width"/>
			</xsl:if>
			<xsl:if test="@Height">
				<xsl:copy-of select="@Height"/>
			</xsl:if>
			<xsl:attribute name="alt"><xsl:value-of select="@Description"/></xsl:attribute>
			<xsl:attribute name="src"><xsl:value-of select="normalize-space(.)"/></xsl:attribute>
			<!--
         <xsl:copy-of select="@*"/>
        <xsl:apply-templates/>
      -->
		</img>
	</xsl:template>
	<!-- ################## -->
	<!-- ##### TABLES ##### -->
	<!-- ################## -->
	<xsl:template match="gz:Tabular">
		<div data-gazettes="Tabular">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	<xsl:template match="gz:Number">
		<dl>
			<dd>Number:</dd>
			<dt id="number">
				<xsl:apply-templates/>
			</dt>
		</dl>
	</xsl:template>
	<xsl:template match="gz:TableText">
		<dl>
			<dd>Table text:</dd>
			<dt id="tableText">
				<xsl:apply-templates/>
			</dt>
		</dl>
	</xsl:template>
	<xsl:template match="html:table">
		<table>
			<xsl:copy-of select="@cols"/>
			<xsl:apply-templates/>
		</table>
	</xsl:template>
	<xsl:template match="html:caption">
		<caption>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</caption>
	</xsl:template>
	<xsl:template match="html:colgroup">
		<colgroup>
			<xsl:copy-of select="@*"/>
			<xsl:variable name="totalwidth">
				<xsl:value-of select="sum(html:col/number(replace(@width, 'pt', '')))"/>
			</xsl:variable>
			<!-- xsl:variable name="totalcolumns"><xsl:value-of select="count(html:col)"/></xsl:variable -->
			<!--xsl:message>
				<xsl:value-of select="$totalwidth"/>
			</xsl:message-->
			<xsl:for-each select="html:col">
				<col>
					<xsl:variable name="thiscolumn" select="number(replace(@width, 'pt', ''))"/>
					<xsl:attribute name="width"><xsl:value-of select="round((100 div $totalwidth) * $thiscolumn)"/>%</xsl:attribute>
				</col>
			</xsl:for-each>
		</colgroup>
	</xsl:template>
	<xsl:template match="html:col">
		<col>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</col>
	</xsl:template>
	<xsl:template match="html:thead">
		<thead>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</thead>
	</xsl:template>
	<xsl:template match="html:tfoot">
		<tfoot>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</tfoot>
	</xsl:template>
	<xsl:template match="html:tbody">
		<tbody>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</tbody>
	</xsl:template>
	<xsl:template match="html:tr">
		<tr>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</tr>
	</xsl:template>
	<xsl:template match="html:td">
		<td>
			<xsl:apply-templates/>
		</td>
	</xsl:template>
	<xsl:template match="html:td/gz:P/gz:Text">
		<p data-gazettes="Text">
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	<xsl:template match="html:th">
		<th>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</th>
	</xsl:template>
	<xsl:template name="gazettes-metadata">
		<gazette-metadata xmlns="http://www.gazettes.co.uk/metadata">
			<bundle-id>
				<xsl:value-of select="$bundleId"/>
			</bundle-id>
			<notice-id>
				<xsl:value-of select="$noticeId"/>
			</notice-id>
			<status>
				<xsl:value-of select="$status"/>
			</status>
			<version-count>
				<xsl:value-of select="$version-count"/>
			</version-count>
			<notice-code>
				<xsl:value-of select="$noticeType"/>
			</notice-code>
			<notice-category-codes>
				<xsl:variable name="thecategory" select="substring($noticeType,1,2)"/>
				<notice-category-code>
					<xsl:value-of select="$thecategory"/>
				</notice-category-code>
				<xsl:if test="$paramConfigXml/gzc:Configuration//gzc:Notice[@Code = $noticeType]/ancestor::gzc:Section/@Code">
					<notice-category-code>
						<xsl:value-of select="$paramConfigXml/gzc:Configuration//gzc:Notice[@Code = $noticeType]/ancestor::gzc:Section/@Code"/>
					</notice-category-code>
				</xsl:if>
			</notice-category-codes>
			<notice-logo>
			   <xsl:value-of select="//*[local-name()='Image']"/>
			</notice-logo>			
			<notice-capture-method>gazette-schema-xml</notice-capture-method>
			<edition>
				<xsl:value-of select="$edition"/>
			</edition>
			<xsl:if test="$issueNumber">
				<issue>
					<xsl:value-of select="$issueNumber"/>
				</issue>
			</xsl:if>
			<legacy-notice-number>
				<xsl:value-of select="$noticeNo"/>
			</legacy-notice-number>
			<user-submitted>
				<xsl:value-of select="$user-submitted"/>
			</user-submitted>
			<xsl:variable name="publicationDate">
				<xsl:apply-templates select="//ukm:PublishDate"/>
			</xsl:variable>
			<publication-date>
				<xsl:value-of select="$publishDate"/>
			</publication-date>
			<publication-year>
				<xsl:value-of select="substring($publicationDate,1,4)"/>
			</publication-year>
			<issue-isbn>
				<xsl:value-of select="$issue-isbn"/>
			</issue-isbn>
			<organisation-id>
				<xsl:value-of select="$organisationId"/>
			</organisation-id>
		</gazette-metadata>
	</xsl:template>

	<xsl:template match="processing-instruction('BR')">
	<br/>
	</xsl:template>

	<!-- 
	This function generates P1|P2|P3|P4 blocks 
	depends on function fnx:findP1s for param p1s

	eg:
currentPos: 2
items:
	<P/>       pos 1    - line 1
	<P1/><P1/> pos 2, 3 - line 2
	<P/>       pos 4    - line 3
	<P1/>      pos 5    - line 4
	<P>        pos 6    - line 5
positions: (2,4,5,6)
result: apply-templates on subsequence (line 2) for currentPos=2
result: apply-templates on subsequence (line 4) for currentPos=5
	-->
	<xsl:function name="fnx:apply-subsequence">
	  <xsl:param name="currentPos" as="xs:integer"/>
	  <xsl:param name="positions" as="xs:integer*"/>
	  <xsl:param name="items" as="item()*"/>

	  <xsl:variable name="start" as="xs:integer" select="index-of($positions, $currentPos)"/>
	  <xsl:variable name="end" as="xs:integer" select="$start + 1"/>
	  <xsl:variable name="count" as="xs:integer" select="$positions[$end] - $positions[$start]"/>
	  <ul><xsl:apply-templates select="subsequence($items, $positions[$start], $count)"/></ul>
	</xsl:function>

	<!-- 
	This function returns a set of integer positions as follows:
	index 1: start position of P1|P2|P3|P4
	index 2: end position + 1 of P1|P2|P3|P4
	index 3: start position of next P1|P2|P3|P4
	index 4: end position + 1 of next P1|P2|P3|P4
	...
	eg:
items:
	<P/>       pos 1 
	<P1/><P1/> pos 2, 3
	<P/>       pos 4
	<P1/>      pos 5
	<P>        pos 6
returns integer set: (2,4,5,6)
	count of integer set must always be even
	-->
	<xsl:function name="fnx:findP1s" as="xs:integer*">
	<xsl:param name="items" as="item()*"/>
	<xsl:for-each select="$items">
	  <xsl:variable name="prevPos" as="xs:integer" select="position() - 1"/>
	  <xsl:variable name="nextPos" as="xs:integer" select="position() + 1"/>
	   <xsl:if test="name(.) = ('P1','P2','P3') and not(name(.) = name($items[$prevPos]))">
	    <xsl:sequence select="position()"/>
	   </xsl:if>
	   <xsl:if test="name(.) = ('P1','P2','P3') and not(name(.) = name($items[$nextPos]))">
	      <xsl:sequence select="$nextPos"/>
	   </xsl:if>
	</xsl:for-each>
	</xsl:function>

	<xsl:function name="fnx:getTimeStamp">
		<xsl:param name="arg"/>
		<xsl:choose>
			<xsl:when test="$arg castable as xs:time">
				<xsl:value-of select="$arg"/>
			</xsl:when>
			<xsl:otherwise>
			<xsl:analyze-string select="$arg" regex="^([0-9]*):([0-9]*):([0-9]*)([.0-9]*)">
				<xsl:matching-substring>
				<xsl:value-of select="concat(fnx:get2Digits(regex-group(1)),':', fnx:get2Digits(regex-group(2)),':',fnx:get2Digits(regex-group(3)))"/>
				</xsl:matching-substring>

				<xsl:non-matching-substring>
				<xsl:value-of select="$arg"/>
				</xsl:non-matching-substring>
			</xsl:analyze-string>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>


	<xsl:function name="fnx:get2Digits">
	  <xsl:param name="arg"/>
	  <xsl:value-of select="if ($arg castable as xs:integer and xs:integer($arg) &lt; 10) then concat('0',$arg) else $arg"/>
	</xsl:function>

</xsl:stylesheet>