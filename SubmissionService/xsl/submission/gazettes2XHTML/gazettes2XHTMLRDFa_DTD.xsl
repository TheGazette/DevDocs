<?xml version="1.0" encoding="UTF-8"?>
  <!--©  Crown copyright
 
You may use and re-use this code free of charge under the terms of the Open Government Licence
 
http://www.nationalarchives.gov.uk/doc/open-government-licence/-->
<!--Version 1.0-->
<!--Created by Williams Lea XML Team-->
<!--
	  Purpose of transform: transform legacy pre-2005 DTD format into HTML-RDFa for all notice types except 2903
	  
      Change history
      1.0 Initial Release: 20th January 2014
-->
   <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gz="http://www.tso.co.uk/assets/namespace/gazette" xmlns:ukm="http://www.tso.co.uk/assets/namespace/metadata" xmlns:wgs84="http://www.w3.org/2003/01/geo/wgs84_pos" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:personal-legal="http://www.thegazette.co.uk/ontology/personal-legal" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:gzc="http://www.tso.co.uk/assets/namespace/gazette/LGconfiguration" xmlns:math="http://www.w3.org/1998/Math/MathML" xmlns:html="http://www.w3.org/1999/xhtml" xmlns="http://www.w3.org/1999/xhtml" xmlns:functx="http://www.functx.com" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:dfn="http://www.dfn.org/dfn" exclude-result-prefixes="xs html gz ukm wgs84 personal-legal  dc gzc math" version="2.0">

  <!-- xsl:output method="xhtml" omit-xml-declaration="yes"/ -->

  <xsl:param name="issueNumber" as="xs:string" required="yes"/>
  <xsl:param name="edition" as="xs:string" required="yes"/>
  <!--<xsl:param name="legalInformation" as="node()" required="yes"/>-->

  <!-- Parameters to create metadata info -->
  <xsl:param name="bundleId" as="xs:string" required="yes"/>
  <xsl:param name="noticeId" as="xs:string" required="yes"/>
  <xsl:param name="legacyNoticeNumber" as="xs:string" required="yes"/>
  <xsl:param name="status" as="xs:string" required="yes"/>
  <xsl:param name="version-count" as="xs:string" required="yes"/>
  <xsl:param name="user-submitted" as="xs:string" required="yes"/>
  <xsl:param name="legal-information"/>

  <xsl:output encoding="utf-8"/>

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

  <xsl:variable name="paramConfigXml" select="if (doc-available('LGconfiguration.xml')) then doc('LGconfiguration.xml') else ()"/>
  <xsl:variable name="gaz">https://www.thegazette.co.uk/</xsl:variable>
  <xsl:variable name="noticeType" select="notice/@code"/>
  <xsl:variable name="noticeNo" select=" translate(translate($legacyNoticeNumber,'(',''),')','')"/>
  <xsl:variable name="idURI" select="concat($gaz,'id','/notice/', translate($noticeId,'/','-'))"/>
  <xsl:variable name="documentURI" select="concat($gaz,'notice/', translate($noticeId,'/','-'))"/>

  <xsl:variable name="noticeCode" select="notice/@code"/>
  <xsl:variable name="noticeURI" select="concat($gaz,'id','/notice/', translate($noticeId,'/','-'))"/>
  <xsl:variable name="oldNoticeURI" select="concat($gaz,'id/','edition/',$edition,'/issue/',$issueNumber,'/notice/', translate($noticeId,'/','-'))"/>
  <xsl:variable name="issueURI" select="concat($gaz,'id/','edition/',$edition,'/issue/',$issueNumber)"/>
  <xsl:variable name="editionURI" select="concat($gaz,'id/','edition/',$edition)"/>
  <xsl:variable name="getMonthofPubDate">
    <xsl:call-template name="getMonth">
      <xsl:with-param name="month" select="normalize-space(notice/date/month)"/>
    </xsl:call-template>
  </xsl:variable>
  
  <xsl:variable name="getDayofPubDate">
    <xsl:call-template name="getDay"/>
  </xsl:variable>

  <xsl:variable name="noticeDate">
    <xsl:value-of select="normalize-space(notice/date/year)"/>
    <xsl:text>-</xsl:text>
    <xsl:value-of select="$getMonthofPubDate"/>
    <xsl:text>-</xsl:text>
    <xsl:value-of select="$getDayofPubDate"/>
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

  <xsl:function name="functx:substring-before-match" as="xs:string">
    <xsl:param name="arg" as="xs:string?"/>
    <xsl:param name="regex" as="xs:string"/>
    <xsl:sequence select="        tokenize($arg,$regex)[1] "/>
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
      <xsl:when test="contains($address,'&lt;?BR?&gt;')">
        <xsl:value-of select="substring-after($address,'&lt;?BR?&gt;')"/>
      </xsl:when>
      <xsl:otherwise>
        <!-- xsl:analyze-string select="$address" regex="^(.*?)([0-9][0-9]?(rd|th|st|nd)\s+[January|February|March|April|May|June|July|August|September|October|November|December]\s+[0-9][0-9][0-9][0-9])(.*)$" -->
        <xsl:analyze-string select="$address" regex="((\d\d?)([n|r|s|t]?[d|h|t]?.)(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)([a-z]*.)(\d\d\d\d))">

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
    <xsl:variable name="olddate-cleaned" select="replace($olddate,' ',' ')"/>
    <xsl:analyze-string select="$olddate-cleaned" regex="(\d\d?)[n|r|s|t]?[d|h|t]?.(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)[a-z]*.(\d\d\d\d)">
      <xsl:matching-substring>
        <xsl:value-of select="regex-group(3)"/>
        <xsl:text>-</xsl:text>
        <xsl:choose>
          <xsl:when test="regex-group(2)='Jan'">01</xsl:when>
          <xsl:when test="regex-group(2)='Feb'">02</xsl:when>
          <xsl:when test="regex-group(2)='Mar'">03</xsl:when>
          <xsl:when test="regex-group(2)='Apr'">04</xsl:when>
          <xsl:when test="regex-group(2)='May'">05</xsl:when>
          <xsl:when test="regex-group(2)='Jun'">06</xsl:when>
          <xsl:when test="regex-group(2)='Jul'">07</xsl:when>
          <xsl:when test="regex-group(2)='Aug'">08</xsl:when>
          <xsl:when test="regex-group(2)='Sep'">09</xsl:when>
          <xsl:when test="regex-group(2)='Oct'">10</xsl:when>
          <xsl:when test="regex-group(2)='Nov'">11</xsl:when>
          <xsl:when test="regex-group(2)='Dec'">12</xsl:when>
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
  
  <xsl:template name="getDay">
    	<xsl:variable name="dayInMonth">
    		<xsl:value-of select="format-number(number(normalize-space(translate(translate(translate(translate(normalize-space(notice/date/day),'st',''),'nd',''),'rd',''),'th',''))),'00')"/>
    	</xsl:variable>
    	<xsl:choose>
    		<xsl:when test="$dayInMonth = 'NaN'">
    			<xsl:value-of select="number(normalize-space(notice/date/weekday))"/>
    		</xsl:when>
    		<xsl:otherwise>
    			<xsl:value-of select="$dayInMonth"/>
    		</xsl:otherwise>
    	</xsl:choose>
  </xsl:template>


  <xsl:template match="processing-instruction('BR')">
    <br/>
  </xsl:template>

  <xsl:template match="processing-instruction('SPACE3')">
    <br/>
  </xsl:template>

  <!-- ########################################### -->
  <!-- ############### START HERE ################ -->
  <!-- ########################################### -->

  <xsl:template match="/">
    <xsl:apply-templates select="notice"/>
  </xsl:template>

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
          <bundle-id>
            <xsl:value-of select="$bundleId"/>
          </bundle-id>
          <notice-id>
            <xsl:value-of select="translate($noticeId,'/','-')"/>
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
          <notice-capture-method>pre-2005-dtd-xml</notice-capture-method>
          <edition>
            <xsl:value-of select="$edition"/>
          </edition>
          <issue>
            <xsl:value-of select="$issueNumber"/>
          </issue>
          <xsl:if test="date/year">
            <publication-date>
              <xsl:value-of select="$noticeDate"/>
            </publication-date>
            <publication-year>
              <xsl:value-of select="substring($noticeDate,1,4)"/>
            </publication-year>
          </xsl:if>
          <legacy-notice-number>
            <xsl:value-of select="$noticeNo"/>
          </legacy-notice-number>
          <user-submitted>
            <xsl:value-of select="$user-submitted"/>
          </user-submitted>
          <!-- source>DTD</source -->
        </gazette-metadata>
      </head>
      <body>
        <article>

          <!--<h1>
            <xsl:value-of select="$noticeId"/>
          </h1>-->

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
            <xsl:comment>Notice Classes</xsl:comment>
            <span resource="{$noticeURI}" typeof="https://www.thegazette.co.uk/def/publication#Notice"/>
            <xsl:for-each select="$class/*/*[@noticecode = $noticeType and @type='notice']">
              <span resource="{$noticeURI}" typeof="{.}"/>
            </xsl:for-each>
            <span about="https://www.thegazette.co.uk/id/notice/{$noticeId}" property="gaz:hasNoticeNumber" datatype="xsd:integer" content="{$noticeNo}"/>

            <span resource="this:notifiableThing" typeof="https://www.thegazette.co.uk/def/publication#NotifiableThing"/>
            <xsl:for-each select="$class/*/*[@noticecode = $noticeType and @type='notifiablething']">
              <span resource="this:notifiableThing" typeof="{.}"/>
            </xsl:for-each>

            <!-- <span about="{$noticeURI}" property="owl:sameAs" resource="{$oldNoticeURI}" typeof="gaz:Notice"/>-->

            
            <!-- Common to all 2903 notices -->
            <xsl:choose>
              <xsl:when test="$noticeType = '2903'">
                <span about="{$noticeURI}" property="gaz:isRequiredByLegislation" resource="http://www.legislation.gov.uk/ukpga/Geo5/15-16/19/section/27"/>
                <span resource="this:notifiableThing" typeof="personal-legal:NoticeForClaimsAgainstEstate/"/>

                <span about="this:notifiableThing" property="personal-legal:hasPersonalRepresentative" resource="this:estateExecutor"/>
                <span resource="this:addressOfDeceased" typeof="vcard:Address"/>
                <span resource="this:addressOfExecutor" typeof="vcard:Address"/>
                <span resource="this:estateExecutor" typeof="foaf:Agent"/>
                <span about="this:estateExecutor" property="vcard:adr" resource="this:addressOfExecutor"/>
                <!-- Needed for all 2903 notices -->
                <span resource="{$noticeURI}" typeof="gaz:DeceasedEstatesNotice gaz:WillsAndProbateNotice gaz:Notice"/>
                <!-- span about="this:notifiableThing" property="personal-legal:hasEstateOf" resource="{$personURI}"/>
                <span about="{$personURI}" typeof="gaz:Person"/>
                <span about="{$personURI}" property="person:hasAddress" resource="this:addressOfDeceased-address-1"/>
                <span about="{$personURI}" content="{$personFullName}" property="foaf:name"/ -->
              </xsl:when>

            </xsl:choose>
          </div>
          <dl class="metadata">
            <dt>Notice category:</dt>
            <dd data-ui-class="category">
              <xsl:value-of select="$paramConfigXml/gzc:Configuration//gzc:Category[@Code = substring($noticeType,1,2)]/@Name"/>
            </dd>
            <dt>Notice type:</dt>
            <dd data-ui-class="notice-type">
              <xsl:value-of select="$paramConfigXml/gzc:Configuration//gzc:Notice[@Code = $noticeCode]/gzc:Name"/>
            </dd>

            <!-- dt>Claim expires:</dt>
            <dd about="this:notifiableThing" property="personal-legal:hasClaimDeadline" datatype="xsd:date" content="{dfn:marklogicdate($claimsDate)}">
              <time datetime="{dfn:marklogicdate($claimsDate)}">
                <xsl:value-of select="$claimsDate"/>
              </time>
            </dd -->
            <dt>Publication date:</dt>
            <dd about="{$noticeURI}" property="gaz:hasPublicationDate dc:issued" content="{$noticeDate}">
              <time datetime="{$noticeDate}">
                <xsl:value-of select="$publicationDate"/>
              </time>
            </dd>

            <dt>Edition:</dt>
            <dd>
              <xsl:value-of select="$edition"/>
            </dd>
            <dt>Issue number:</dt>
            <dd>
              <xsl:value-of select="$issueNumber"/>
            </dd>
            <dt>Notice ID:</dt>
            <!-- updated to add  attribute gz:hasNoticeNumber-->
            <dd about="{$noticeURI}" property="gaz:hasNoticeID">
              <xsl:value-of select="$noticeId"/>
            </dd>
            <dt>Notice code:</dt>
            <dd property="gaz:hasNoticeCode" datatype="xsd:integer" about="{$noticeURI}">
              <xsl:value-of select="$noticeCode"/>
            </dd>
          </dl>
          <div class="content">
            <xsl:apply-templates/>

            <xsl:if test="$noticeCode = '2903' and $edition = 'London'">
              <section>
                <h2>Legal information</h2>
                <p>
                  <xsl:value-of select="$legal-information"/>
                </p>
              </section>
            </xsl:if>
          </div>
        </article>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="head3[1]">
    <xsl:if test="$paramConfigXml//gzc:Notice[@Code = $noticeType]/gzc:Name/text() != ./text()">
      <h3 data-gazettes="h3">
        <xsl:apply-templates/>
      </h3>
    </xsl:if>
  </xsl:template>

  <xsl:template match="head3">
    <h3 data-gazettes="h3">
      <xsl:apply-templates/>
    </h3>
  </xsl:template>

  <xsl:template match="head4">
    <h4 data-gazettes="h4">
      <xsl:apply-templates/>
    </h4>
  </xsl:template>

  <xsl:template match="head5">
    <h5 data-gazettes="h5">
      <xsl:apply-templates/>
    </h5>
  </xsl:template>

  <xsl:template match="text">
    <p data-gazettes="text">
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="hw1">
    <span data-gazettes="hw1"><strong><xsl:apply-templates/></strong></span><xsl:text> </xsl:text>
  </xsl:template>

  <xsl:template match="hw2">
    <span data-gazettes="hw2"><strong><xsl:apply-templates/></strong></span><xsl:text> </xsl:text>
  </xsl:template>

  <xsl:template match="hw3">
    <span data-gazettes="hw3"><strong><xsl:apply-templates/></strong></span><xsl:text> </xsl:text>
  </xsl:template>

  <xsl:template match="hw4">
    <span data-gazettes="hw4"><strong><xsl:apply-templates/></strong>
    </span>
  </xsl:template>

  <xsl:template match="sig">
    <span data-gazettes="sig">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="number"/>
  <!-- p data-gazettes="number"><xsl:apply-templates/></p>
  </xsl:template -->

  <xsl:template match="notice/date"/>

  <xsl:template match="img">
    <xsl:copy-of select="@*"/>
    <xsl:copy-of select="."/>
  </xsl:template>

  <xsl:template match="IMG">
    <xsl:copy-of select="@*"/>
    <xsl:copy-of select="."/>
  </xsl:template>

  <xsl:template match="br"><br/></xsl:template>
  
  <xsl:template match="BR"><br/></xsl:template>
  
  <xsl:template match="space3"><br/></xsl:template>
  
  <xsl:template match="SPACE3"><br/></xsl:template>

  <xsl:template match="t">
    <table>
      <xsl:if test="@cols">
        <colgroup>
          <xsl:for-each select="1 to @cols">
            <col span="1"/>
          </xsl:for-each>
        </colgroup>
      </xsl:if>
      <xsl:apply-templates/>
    </table>
  </xsl:template>
  
  <xsl:template match="bt"><xsl:apply-templates/></xsl:template>
  
  <xsl:template match="r"><tr><xsl:apply-templates/></tr></xsl:template>
  
  <xsl:template match="c"><td><xsl:apply-templates/></td></xsl:template>

</xsl:stylesheet>