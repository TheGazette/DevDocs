<?xml version="1.0" encoding="UTF-8"?>
  <!--©  Crown copyright
 
You may use and re-use this code free of charge under the terms of the Open Government Licence
 
http://www.nationalarchives.gov.uk/doc/open-government-licence/-->
   <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gzc="http://www.tso.co.uk/assets/namespace/gazette/LGconfiguration" xmlns="http://www.w3.org/1999/xhtml" version="2.0">
  <xsl:param name="debug">false</xsl:param>
  <xsl:param name="paramConfigXml" as="node()">
    <test/>
  </xsl:param>
  <xsl:param name="noticeId" required="yes"/>
  <xsl:param name="bundleId" required="yes"/>
  <xsl:param name="noticeCode" required="yes"/>
  <xsl:param name="status" required="yes"/>
  <xsl:param name="version-count" required="yes"/>
  <xsl:param name="edition" required="yes"/>
  <xsl:param name="issueNumber"/>
  <xsl:param name="user-submitted" required="yes"/>
  <xsl:param name="organisationId" required="yes"/>
  <xsl:param name="publishDate" required="yes"/>

  <!-- extra comment to check latest version 10:55am on Thursday 9th January -->

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

  <xsl:variable name="updates" select="/text-submission/user-updates"/>
  <xsl:variable name="updates-removed" select="/text-submission/user-updates[@update-type='removed']"/>
  <xsl:variable name="updates-added" select="/text-submission/user-updates[@update-type='added']"/>

  <xsl:template match="/">

    <html IdURI="https://www.thegazette.co.uk/id/notice/{$noticeId}" prefix="gaz: https://www.thegazette.co.uk/def/publication#       gzw: https://www.thegazette.co.uk/def/working#       person: https://www.thegazette.co.uk/def/person#       personal-legal: https://www.thegazette.co.uk/def/personal-legal#       court: https://www.thegazette.co.uk/def/court#       insolvency: https://www.thegazette.co.uk/def/insolvency#       partnerships: https://www.thegazette.co.uk/def/partnerships#       org: http://www.w3.org/ns/org#       gazorg: https://www.thegazette.co.uk/def/organisation#       leg: https://www.thegazette.co.uk/def/legislation#       loc: https://www.thegazette.co.uk/def/location#       dc11: http://purl.org/dc/elements/1.1/       this: https://www.thegazette.co.uk/id/notice/{$noticeId}#       royal-warrants: https://www.thegazette.co.uk/def/royal-warrants#       noticeid: https://www.thegazette.co.uk/id/notice/{$noticeId}#        issue: https://www.thegazette.co.uk/id/edition/undefined/issue/undefined       edition: https://www.thegazette.co.uk/id/edition/undefined       provenance: https://www.thegazette.co.uk/id/notice/{$noticeId}/provenance       prov: http://www.w3.org/ns/prov#">
      <head>
        <title>Warrants Under the Royal Sign Manual</title>
        <!-- title>
          <xsl:value-of select="$paramConfigXml/gzc:Configuration//gzc:Notice[@Code = $noticeCode]/gzc:Name"/>
        </title -->
        <xsl:call-template name="gazettes-metadata"/>
      </head>
      <body>
        <xsl:if test="$debug='true'">
          <hr/>
          <h1>DEBUG START</h1>
          <code>paramconfigxml: |<xsl:copy-of select="$paramConfigXml/gzc:Configuration//gzc:Notice[@Code = $noticeCode]"/>|</code>
          <code>Updates: |<xsl:copy-of select="$updates"/>|</code>
          <code>Updates-removed: |<xsl:copy-of select="$updates-removed"/>|</code>
          <code>Updates-added: |<xsl:copy-of select="$updates-added"/>|</code>
          <hr/>
        </xsl:if>
        <xsl:apply-templates/>
      </body>
    </html>

  </xsl:template>

  <xsl:template match="text-submission">
    <article class="full-notice full-notice-{$noticeCode}">
      <!-- header>
        <h1>
          <xsl:value-of select="$paramConfigXml/gzc:Configuration//gzc:Notice[@Code = $noticeCode]/gzc:Name"/>
        </h1>
      </header -->
      <div class="rdfa-data">
        <span about="noticeid:" property="dc11:publisher" content="TSO (The Stationery Office), St Crispins, Duke Street, Norwich, NR3 1PD, 01603 622211, customer.services@tso.co.uk"/>
        <span about="noticeid:" property="gaz:isAbout" resource="this:notifiableThing"/>
        <span about="noticeid:" property="prov:has_provenance" resource="provenance:"/>
        <span about="noticeid:" property="gaz:isInIssue" resource="issue:"/>
        <span about="noticeid:" property="gaz:hasNoticeCode" datatype="xsd:integer" content="{$noticeCode}"/>
        <span resource="issue:" typeof="gaz:Issue"/>
        <span about="issue:" property="gaz:hasEdition" resource="edition:"/>
        <span about="issue:" property="gaz:hasIssueNumber" datatype="xsd:string" content="0"/>
        <span resource="edition:" typeof="gaz:Edition"/>
        <span about="noticeid:" property="gaz:hasNoticeNumber" datatype="xsd:integer" content="0"/>

        <!-- span about="noticeid:" property="owl:sameAs" resource="https://www.thegazette.co.uk/id/edition/99999/issue/99999/notice/1556160" typeof="gaz:Notice"></span -->
        <!--Notice Classes-->
        <span resource="issue:" typeof="gaz:Issue"/>
        <xsl:if test="$noticeCode = '1119'">
          <!-- notice specific RDFa -->
          <span resource="noticeid:" typeof="gaz:Notice royal-warrants:WarrantsRoyalSignManualNotice"/>
          <span resource="this:notifiableThing" typeof="royal-warrants:WarrantsRoyalSignManual"/>
        </xsl:if>

      </div>
      <dl class="metadata">
        <dt>Notice category:</dt>
        <dd data-ui-class="category">State</dd>
        <dt>Notice type:</dt>
        <dd data-ui-class="notice-type">
          <xsl:text>Warrants Under the Royal Sign Manual</xsl:text>
          <!-- xsl:value-of select="$paramConfigXml/gzc:Configuration//gzc:Notice[@Code = $noticeCode]/gzc:Name"/ -->
        </dd>
        <dt data-gazettes="earliestpublicationdate">Earliest publication date:</dt>
        <dd>
          <span about="noticeid:" property="gaz:earliestPublicationDate" datatype="xsd:dateTime">
            <time datetime="{/*/@publicationDateTime[1]}">
              <!-- xsl:value-of select="substring-before(/*/@publicationDateTime[1],'T')"/ -->
              <xsl:value-of select="/*/@publicationDateTime[1]"/>
            </time>
          </span>
        </dd>
        <dt>Edition:</dt>
        <dd>
          <span about="issue:" property="gaz:hasEdition" datatype="xsd:string">
            <xsl:value-of select="$edition"/>
          </span>
        </dd>
        <dt>Notice ID:</dt>
        <dd data-gazettes="noticeid">
          <xsl:value-of select="$noticeId"/>
        </dd>
        <dt>Notice code:</dt>
        <dd about="noticeid:" datatype="xsd:integer" property="gaz:hasNoticeCode">
          <xsl:value-of select="$noticeCode"/>
        </dd>
      </dl>
      <xsl:apply-templates/>
    </article>
  </xsl:template>

  <xsl:template match="enriched-text">
    <div class="content" about="this:notifiableThing" data-gazettes="Notice" data-gazettes-type="{$noticeCode}">
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="original-text"><!-- suppress --></xsl:template>
  <xsl:template match="user-updates"><!-- suppress --></xsl:template>

  <xsl:template match="DesDocument">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="Paragraph">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="Appointee">
    <xsl:choose>
      <xsl:when test="not(@id = $updates-removed/@id)">
        <span about="this:notifiableThing" property="royal-warrants:hasAppointee" resource="gaz:appointee-1"/>
        <span about="gaz:appointee-1" property="foaf:name">
          <xsl:choose>
            <xsl:when test="@id = $updates-added/@id">
              <xsl:variable name="key" select="@id"/>
              <xsl:value-of select="$updates-added[@id = $key]/@value"/>
            </xsl:when>
            <xsl:otherwise>
              <span about="this:notifiableThing" property="royal-warrants:hasAppointee" resource="gaz:appointee-1"/>
              <span about="gaz:appointee-1" property="foaf:name">
                <xsl:apply-templates/>
              </span>
            </xsl:otherwise>
          </xsl:choose>
        </span>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="Authority">
    <xsl:choose>
      <xsl:when test="not(@id = $updates-removed/@id)">
        <span about="this:notifiableThing" property="gaz:hasAuthority" resource="gaz:authority-1"/>
        <span about="gaz:appointee-1" property="authority:isKnownAs">
          <xsl:choose>
            <xsl:when test="@id = $updates-added/@id">
              <xsl:variable name="key" select="@id"/>
              <xsl:value-of select="$updates-added[@id = $key]/@value"/>
            </xsl:when>
            <xsl:otherwise>
              <span about="this:notifiableThing" property="gaz:hasAuthority" resource="gaz:authority-1"/>
              <span about="gaz:appointee-1" property="authority:isKnownAs">
                <xsl:apply-templates/>
              </span>
            </xsl:otherwise>
          </xsl:choose>
        </span>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="Legislation">
    <xsl:choose>
      <xsl:when test="not(@id = $updates-removed/@id)">
        <span about="this:notifiableThing" property="gaz:isEnabledByLegislation" resource="gaz:legislation-1"/>
        <span about="gaz:legislation-1" property="legislation:legislationTitle">
          <xsl:choose>
            <xsl:when test="@id = $updates-added/@id">
              <xsl:variable name="key" select="@id"/>
              <xsl:value-of select="$updates-added[@id = $key]/@value"/>
            </xsl:when>
            <xsl:otherwise>
              <span about="this:notifiableThing" property="gaz:isEnabledByLegislation" resource="gaz:legislation-1"/>
              <span about="gaz:legislation-1" property="legislation:legislationTitle">             
                <xsl:apply-templates/>
              </span>
            </xsl:otherwise>
          </xsl:choose>
        </span>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="Period">
    <xsl:choose>
      <xsl:when test="not(@id = $updates-removed/@id)">
        <xsl:choose>
          <xsl:when test="@id = $updates-added/@id">
            <span about="this:notifiableThing" property="royal-warrants:hasPeriod">
              <xsl:choose>
                <xsl:when test="@id = $updates-added/@id">
                  <xsl:variable name="key" select="@id"/>
                  <xsl:value-of select="$updates-added[@id = $key]/@value"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:apply-templates/>
                </xsl:otherwise>
              </xsl:choose>
            </span>
          </xsl:when>
          <xsl:otherwise>
            <span about="this:notifiableThing" property="royal-warrants:hasPeriod">
              <xsl:apply-templates/>
            </span>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="Person">
    <xsl:choose>
      <xsl:when test="not(@id = $updates-removed/@id)">
        <xsl:choose>
          <xsl:when test="@id = $updates-added/@id">
            <span about="this:notifiableThing" property="gzw:hasPerson">
              <xsl:choose>
                <xsl:when test="@id = $updates-added/@id">
                  <xsl:variable name="key" select="@id"/>
                  <xsl:value-of select="$updates-added[@id = $key]/@value"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:apply-templates/>
                </xsl:otherwise>
              </xsl:choose>
            </span>
          </xsl:when>
          <xsl:otherwise>
            <span about="this:notifiableThing" property="gzw:hasPerson">
              <xsl:apply-templates/>
            </span>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="Role">
    <xsl:choose>
      <xsl:when test="not(@id = $updates-removed/@id)">
        <xsl:choose>
          <xsl:when test="@id = $updates-added/@id">
            <span about="this:notifiableThing" property="royal-warrants:hasRole" resource="gaz:role-1"/>
            <span about="gaz:role-1" property="person:roleName">
              <xsl:choose>
                <xsl:when test="@id = $updates-added/@id">
                  <xsl:variable name="key" select="@id"/>
                  <xsl:value-of select="$updates-added[@id = $key]/@value"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:apply-templates/>
                </xsl:otherwise>
              </xsl:choose>
            </span>
          </xsl:when>
          <xsl:otherwise>
            <span about="this:notifiableThing" property="royal-warrants:hasRole" resource="gaz:role-1"/>
            <span about="gaz:role-1" property="person:roleName">          
            <xsl:apply-templates/>
            </span>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="Signature">
    <xsl:choose>
      <xsl:when test="not(@id = $updates-removed/@id)">
        <xsl:choose>
          <xsl:when test="@id = $updates-added/@id">
            <span about="this:notifiableThing" property="gaz:hasAuthoriser" resource="gaz:authoriser-1"/>
            <span about="https://www.thegazette.co.uk/def/publication#authoriser-1" property="gaz:hasAuthorisingPerson" resource="https://www.thegazette.co.uk/def/publication#signatory-1"/>
            <span about="https://www.thegazette.co.uk/def/publication#signatory-1" property="foaf:name">
              <xsl:choose>
                <xsl:when test="@id = $updates-added/@id">
                  <xsl:variable name="key" select="@id"/>
                  <xsl:value-of select="$updates-added[@id = $key]/@value"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:apply-templates/>
                </xsl:otherwise>
              </xsl:choose>
            </span>
          </xsl:when>
          <xsl:otherwise>
            <span about="this:notifiableThing" property="gaz:hasAuthoriser" resource="gaz:authoriser-1"/>
            <span about="https://www.thegazette.co.uk/def/publication#authoriser-1" property="gaz:hasAuthorisingPerson" resource="https://www.thegazette.co.uk/def/publication#signatory-1"/>
            <span about="https://www.thegazette.co.uk/def/publication#signatory-1" property="foaf:name">
              <xsl:apply-templates/>
            </span>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- DateTimes etc. -->

  <xsl:template match="EndDate">
    <xsl:choose>
      <xsl:when test="not(@id = $updates-removed/@id)">
        <xsl:choose>
          <xsl:when test="@id = $updates-added/@id">
            <span about="this:notifiableThing" property="royal-warrants:hasEndDate">
              <time>
                <xsl:choose>
                  <xsl:when test="@id = $updates-added/@id">
                    <xsl:variable name="key" select="@id"/>
                    <xsl:value-of select="$updates-added[@id = $key]/@value"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:apply-templates/>
                  </xsl:otherwise>
                </xsl:choose>
              </time>
            </span>
          </xsl:when>
          <xsl:otherwise>
            <span about="this:notifiableThing" property="royal-warrants:hasEndDate">
              <time>
                <xsl:apply-templates/>
              </time>
            </span>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>

  <xsl:template match="EffectiveDate">
    <xsl:choose>
      <xsl:when test="not(@id = $updates-removed/@id)">
        <xsl:choose>
          <xsl:when test="@id = $updates-added/@id">
            <span about="this:notifiableThing" property="royal-warrants:hasEffectiveDate">
              <time>
                <xsl:choose>
                  <xsl:when test="@id = $updates-added/@id">
                    <xsl:variable name="key" select="@id"/>
                    <xsl:value-of select="$updates-added[@id = $key]/@value"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:apply-templates/>
                  </xsl:otherwise>
                </xsl:choose>
              </time>
            </span>
          </xsl:when>
          <xsl:otherwise>
            <span about="this:notifiableThing" property="royal-warrants:hasEffectiveDate">
              <time>
                <xsl:apply-templates/>
              </time>
            </span>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="WarrantDate">
    <xsl:choose>
      <xsl:when test="not(@id = $updates-removed/@id)">
        <xsl:choose>
          <xsl:when test="@id = $updates-added/@id">
            <span about="this:notifiableThing" property="royal-warrants:hasWarrantDate">
              <time>
                <xsl:choose>
                  <xsl:when test="@id = $updates-added/@id">
                    <xsl:variable name="key" select="@id"/>
                    <xsl:value-of select="$updates-added[@id = $key]/@value"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:apply-templates/>
                  </xsl:otherwise>
                </xsl:choose>
              </time>
            </span>
          </xsl:when>
          <xsl:otherwise>
            <span about="this:notifiableThing" property="royal-warrants:hasWarrantDate">
              <time>
                <xsl:apply-templates/>
              </time>
            </span>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>

  <xsl:template match="text()">
    <xsl:value-of select="."/>
  </xsl:template>

  <xsl:template name="gazettes-metadata">
    <gazette-metadata xmlns="http://www.gazettes.co.uk/metadata">
      <notice-id>
        <xsl:value-of select="$noticeId"/>
      </notice-id>
      <bundle-id>
        <xsl:value-of select="$bundleId"/>
      </bundle-id>
      <status>
        <xsl:value-of select="$status"/>
      </status>
      <version-count>
        <xsl:value-of select="$version-count"/>
      </version-count>
      <notice-code>
        <xsl:value-of select="$noticeCode"/>
      </notice-code>
      <notice-category-codes>
        <xsl:variable name="thecategory" select="substring($noticeCode,1,2)"/>
        <notice-category-code>
          <xsl:value-of select="$thecategory"/>
        </notice-category-code>
        <xsl:if test="$paramConfigXml/gzc:Configuration//gzc:Notice[@Code = $noticeCode]/ancestor::gzc:Section/@Code">
          <notice-category-code>
            <xsl:value-of select="$paramConfigXml/gzc:Configuration//gzc:Notice[@Code = $noticeCode]/ancestor::gzc:Section/@Code"/>
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
      <!-- legacy-notice-number>
        <xsl:value-of select="$noticeNo"/>
      </legacy-notice-number -->
      <user-submitted>
        <xsl:value-of select="$user-submitted"/>
      </user-submitted>
      <publication-date>
        <xsl:value-of select="$publishDate"/>
      </publication-date>
      <publication-year>
        <xsl:value-of select="substring($publishDate,1,4)"/>
      </publication-year>
      <!-- issue-isbn>
        <xsl:value-of select="$issue-isbn"/>
      </issue-isbn -->
      <xsl:if test="$organisationId">
        <organisation-id>
          <xsl:value-of select="$organisationId"/>
        </organisation-id>
      </xsl:if>
    </gazette-metadata>
  </xsl:template>


</xsl:stylesheet>