[Home](../home.md)
# Bundle Status #
Once a [bundle has been submitted](create-bundle.md) this starts an asynchronous process whereby the bundle is transformed into notices and validated as containing the correct information.

These end points are only available to authenticated users with permission to place notices, user needs  to [register](../authentication/registration.md) as either an individual or an organisation and then [sign-in](../authentication/sign-in.md).

The registered user is only able to check the status of their own bundles.

See also

- [Existing Bundle](existing-bundle.md)
- [List of Draft notices](mygazette.md)

## Processing status ##

This end point allows the client to check the processing status of the user's bundle.

### Resource URL ###

`/my-gazette/bundle/{bundleId}/process-status`

### Available methods ###

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Accepts header</th>
	<th>Response type</th>
</tr>
<tr>
	<td rowspan=3>/my-gazette/bundle/{bundle-id}/process-status</td>
	<td rowspan=3>GET</td>
	<td>application/xml</td>
	<td>XML</td>
</tr>
<tr>
<td>application/json</td>
<td>JSON</td>
</tr>
<tr>
<td>text/html</td>
<td>HTML</td>
</tr>
</table>


### Sample responses ###
#### JSON ####
##### An in-progress bundle #####

	{
	    "process-status": "in-progress",
	    "total-notice-count": "100",
	    "processed-notice-count": "1",
	    "error-count": "0",
	    "links": {
	        "@xmlns": "http://www.w3.org/1999/xhtml",
	        "link": [
	            {
	                "@href": "https://www.thegazette.co.uk/my-gazette/bundle",
	                "@rel": "prev",
	                "@title": ""
	            },
	            {
	                "@href": "https://www.thegazette.co.uk/my-gazette/bundle/{bundle-id}",
	                "@rel": "next",
	                "@title": ""
	            },
	            {
	                "@href": "https://www.thegazette.co.uk/my-gazette/bundle/{bundle-id}/process-status/data.xml",
	                "@rel": "alternate",
	                "@title": "XML"
	            },
	            {
	                "@href": "https://www.thegazette.co.uk/my-gazette/bundle/{bundle-id}/process-status/data.html",
	                "@rel": "alternate",
	                "@title": "HTML"
	            },
	            {
	                "@href": "https://www.thegazette.co.uk/my-gazette/bundle/{bundle-id}/process-status/data.json",
	                "@rel": "self",
	                "@title": "JSON"
	            }
	        ]
	    }
	}
##### A completed bundle #####

	{
	    "process-status": "completed",
	    "total-notice-count": "1",
	    "processed-notice-count": "1",
	    "error-count": "0",
	    "links": {
	        "@xmlns": "http://www.w3.org/1999/xhtml",
	        "link": [
	            {
	                "@href": "https://www.thegazette.co.uk/my-gazette/bundle",
	                "@rel": "prev",
	                "@title": ""
	            },
	            {
	                "@href": "https://www.thegazette.co.uk/my-gazette/bundle/{bundle-id}",
	                "@rel": "next",
	                "@title": ""
	            },
	            {
	                "@href": "https://www.thegazette.co.uk/my-gazette/bundle/{bundle-id}/process-status/data.xml",
	                "@rel": "alternate",
	                "@title": "XML"
	            },
	            {
	                "@href": "https://www.thegazette.co.uk/my-gazette/bundle/{bundle-id}/process-status/data.html",
	                "@rel": "alternate",
	                "@title": "HTML"
	            },
	            {
	                "@href": "https://www.thegazette.co.uk/my-gazette/bundle/{bundle-id}/process-status/data.json",
	                "@rel": "self",
	                "@title": "JSON"
	            }
	        ]
	    }
	}
	
## Bundle details

Once processing is complete, it is possible to retreive the details of the uploaded bundle. If the processing status has shown that there were errors, the status of each notice will provide details of the reason for failure.

Details: [Existing bundle](existing-bundle.md)
	
## Validation report

If the response to the above endpoint contains validation errors, a report with further details can be retreived from the validation report endpoint. 

### Available methods ###

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Accepts header</th>
	<th>Response type</th>
</tr>
<tr>
	<td rowspan=3>/my-gazette/notice/{notice-id}/validation-report</td>
	<td rowspan=3>GET</td>
	<td>application/xml</td>
	<td>XML</td>
</tr>
<tr>
<td>application/json</td>
<td>JSON</td>
</tr>
<tr>
<td>text/html</td>
<td>HTML</td>
</tr>
</table>

## Bundle preview ##

Bundle preview is applicable for a bundle having more than one notice.

### Resource URL ###

`/my-gazette/bundle/{bundleId}/preview`

### Available methods ###

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Accepts header</th>
	<th>Response type</th>
</tr>
<tr>
	<td rowspan=3>/my-gazette/bundle/{bundle-id}/preview</td>
	<td rowspan=3>GET</td>
	<td>application/xml</td>
	<td>XML</td>
</tr>
<tr>
<td>application/json</td>
<td>JSON</td>
</tr>
<tr>
<td>text/html</td>
<td>HTML</td>
</tr>
</table>


### Sample responses ###
#### JSON ####
	{"id":"/my-gazette/bundle/12627/preview/data.feed?&results-page=1","link":[{"@href":"/my-gazette/bundle/12627/preview/data.feed?&results-page=1","@rel":"alternate","@type":"application/atom+xml","@title":"ATOM"},{"@href":"/my-gazette/bundle/12627/preview/data.json?&results-page=1","@rel":"first","@type":"application/json"},{"@href":"/my-gazette/bundle/12627/preview/data.json?&results-page=1","@rel":"last","@type":"application/json"},{"@href":"/my-gazette/bundle/12627/preview/data.htm?&results-page=1","@rel":"alternate","@title":"HTML","@type":"application/xhtml+xml"},{"@href":"/my-gazette/bundle/12627/preview/data.json?&results-page=1","@rel":"self","@type":"application/json"}],"title":"Search Result","updated":"2017-08-24T14:35:29.487+01:00","openSearch:Query":{"@role":"request"},"f:page-number":"1","f:page-size":"10","f:page-start":"1","f:page-stop":"1","f:total":"1","f:facets":null,"entry":[{"id":"gaz: https://www.thegazette.co.uk/id/notice/508991","title":"fdfdg gfdhgfh","author":{"name":"tso"},"updated":"2017-08-24T14:35:29.518+01:00","gazette-metadata":{
      "status":"valid",
      "submitted-date":"2017-06-09T14:32:07",
      "notice-code":"2903",
      "publication-date":"2017-06-09T00:01:00",
      "publication-year":"2017",
      "bundle-id":"12627",
      "edition":"London",
      "claim-deadline-date":"2017-10-11",
      "death-date":"2017-06-01",
      "draft-uri":"/my-gazette/draft/9987",
      "organisation-id":"0",
      "notice-id":"508991",
      "sort-by-date":"2017-10-11",
      "title":"fdfdg gfdhgfh",
      "user-submitted":"369",
      "version-count":"2",
      "has-supporting-doc":"true",
      "xhtml-validation":"failed",
      "chargeable-events":"1",
      "notice-logo":null,
      "notice-category-codes":{
	"notice-category-code":"29",
	"notice-category-code":"G106000000",
	"notice-category-code":"G206040000",
	"notice-category-code":"G406040001"
      },
      "locations":{
	"location":{"@about":"deceasedPersonAddress""@searchable":"true"
	  "geo-spatial":{
	    "latitude":"51.492763",
	    "longitude":"-0.080126"
	  },
	  "local-authority":"The London Borough of Southwark",
	  "postcode":"SE1 5SS"
	}
      },
      "notice-capture-method":"webform"
    },"content":"<div><article><div class=\"rdfa-data\"><span about=\"this:deceased-address-1\" property=\"https://www.thegazette.co.uk/def/postcode\" resource=\"https://www.thegazette.co.uk/id/postcode/SE15SS\"></span><span about=\"https://www.thegazette.co.uk/id/postcode/SE15SS\" content=\"-0.080126\" datatype=\"http://www.w3.org/2001/XMLSchema#decimal\" property=\"http://www.w3.org/2003/01/geo/wgs84_pos#long\"></span><span about=\"https://www.thegazette.co.uk/id/postcode/SE15SS\" content=\"51.492763\" datatype=\"http://www.w3.org/2001/XMLSchema#decimal\" property=\"http://www.w3.org/2003/01/geo/wgs84_pos#lat\"></span><span about=\"https://www.thegazette.co.uk/id/postcode/SE15SS\" content=\"SE1 5SS\" property=\"http://www.w3.org/2000/01/rdf-schema#label\"></span><span about=\"https://www.thegazette.co.uk/id/postcode/SE15SS\" property=\"https://www.thegazette.co.uk/def/administrative-area\" resource=\"https://www.thegazette.co.uk/id/administrative-area/gb/7000000000011013\"></span><span about=\"https://www.thegazette.co.uk/id/administrative-area/gb/7000000000011013\" content=\"The London Borough of Southwark\" property=\"http://www.w3.org/2000/01/rdf-schema#label\"></span><span about=\"this:notifiableThing\" property=\"https://www.thegazette.co.uk/def/publication#relatedLegislation\" resource=\"http://www.legislation.gov.uk/id/ukpga/Geo5/15-16/19/section/27\"></span><span about=\"this:notifiableThing\" content=\"2017-06-01\" datatype=\"http://www.w3.org/2001/XMLSchema#date\" property=\"https://www.thegazette.co.uk/def/publication#relatedDate\"></span><span about=\"this:notifiableThing\" property=\"https://www.thegazette.co.uk/def/publication#relatedLegislation\" resource=\"http://www.legislation.gov.uk/id/ukpga/Geo5/15-16/19\"></span><span about=\"this:notifiableThing\" content=\"2017-10-11\" datatype=\"http://www.w3.org/2001/XMLSchema#date\" property=\"https://www.thegazette.co.uk/def/publication#relatedDate\"></span><span about=\"this:notifiableThing\" content=\"2017-06-09\" datatype=\"http://www.w3.org/2001/XMLSchema#date\" property=\"https://www.thegazette.co.uk/def/publication#relatedDate\"></span><span about=\"http://www.legislation.gov.uk/id/ukpga/Geo5/15-16/19/section/27\" content=\"Trustee Act 1925, s. 27\" property=\"http://www.w3.org/2000/01/rdf-schema#label\"></span><span resource=\"http://www.legislation.gov.uk/id/ukpga/Geo5/15-16/19/section/27\" typeof=\"https://www.thegazette.co.uk/def/legislation#LegislationSection\"></span><span about=\"http://www.legislation.gov.uk/id/ukpga/Geo5/15-16/19\" content=\"Trustee Act 1925\" property=\"http://www.w3.org/2000/01/rdf-schema#label\"></span><span resource=\"http://www.legislation.gov.uk/id/ukpga/Geo5/15-16/19\" typeof=\"https://www.thegazette.co.uk/def/legislation#Legislation\"></span><span about=\"this:addressOfExecutor-1\" property=\"https://www.thegazette.co.uk/def/postcode\" resource=\"https://www.thegazette.co.uk/id/postcode/SE15SS\"></span><span about=\"noticeid:\" content=\"TSO (The Stationery Office), St Crispins, Duke Street, Norwich, NR3 1PD, 01603 622211, customer.services@tso.co.uk\" property=\"dc11:publisher\"></span><span about=\"noticeid:\" property=\"gaz:isAbout\" resource=\"this:notifiableThing\"></span><span about=\"noticeid:\" property=\"prov:has_provenance\" resource=\"provenance:\"></span><span about=\"noticeid:\" property=\"prov:hasAnchor\" resource=\"noticeid:\"></span><span about=\"noticeid:\" property=\"gaz:isInIssue\" resource=\"issue:\"></span><span about=\"noticeid:\" content=\"2903\" datatype=\"xsd:integer\" property=\"gaz:hasNoticeCode\"></span><span resource=\"noticeid:\" typeof=\"gaz:Notice gaz:WillsAndProbateNotice\"></span><span resource=\"issue:\" typeof=\"gaz:Issue\"></span><span about=\"issue:\" property=\"gaz:hasEdition\" resource=\"edition:\"></span><span about=\"issue:\" content=\"0\" datatype=\"xsd:string\" property=\"gaz:hasIssueNumber\"></span><span resource=\"edition:\" typeof=\"gaz:Edition\"></span><span about=\"noticeid:\" content=\"508991\" datatype=\"xsd:integer\" property=\"gaz:hasNoticeNumber\"></span><span resource=\"issue:\" typeof=\"gaz:Issue\"></span><span resource=\"this:notifiableThing\" typeof=\"personal-legal:NoticeForClaimsAgainstEstate\"></span><span data-hide=\"true\" resource=\"this:deceasedPerson\" typeof=\"gaz:Person\"></span><span about=\"this:deceasedPerson\" data-hide=\"true\" property=\"person:hasEmployment\" resource=\"this:occupationOfDeceased\"></span><span data-hide=\"true\" resource=\"this:occupationOfDeceased\" typeof=\"person:Employment\"></span><span data-hide=\"true\" resource=\"this:estateExecutor\" typeof=\"foaf:Agent\"></span></div><dl class=\"metadata\"><dt>Notice category:</dt><dd data-ui-class=\"category\">Personal Legal</dd><dt>Notice type:</dt><dd data-ui-class=\"notice-type\">Deceased Estates</dd><dt data-gazettes=\"earliestpublicationdate\">Earliest publication date:</dt><dd about=\"noticeid:\" content=\"2017-06-09T00:01:00\" data-required=\"true\" datatype=\"xsd:dateTime\" property=\"gaz:earliestPublicationDate\"><time datetime=\"2017-06-09T00:01:00\">2017-06-09T00:01:00</time></dd><dt>Claim expires:</dt><dd about=\"this:notifiableThing\" datatype=\"xsd:date\" property=\"personal-legal:hasClaimDeadline\">2017-10-11</dd><dt>Edition:</dt><dd>The<span about=\"edition:\" datatype=\"xsd:string\" property=\"gaz:editionName\">London</span>Gazette</dd><dt>Notice ID:</dt><dd about=\"noticeid:\" property=\"gaz:hasNoticeID\">508991</dd><dt>Notice code:</dt><dd about=\"noticeid:\" datatype=\"xsd:integer\" property=\"gaz:hasNoticeCode\">2903</dd></dl><div about=\"this:notifiableThing\" class=\"content\" data-gazettes=\"Notice\" data-gazettes-type=\"2903\"><div class=\"full-form\"><div class=\"error-list\"></div><dl data-gazettes=\"Notice Details\"></dl><dl about=\"this:notifiableThing\" data-gazettes=\"Legislation\" property=\"legislation:isEnabledByLegislation\" resource=\"this:legislation-1\"><dt>Legislation:</dt><dd about=\"this:legislation-1\" datatype=\"xsd:string\" property=\"legislation:legislationTitle\" typeof=\"legislation:Act\">Trustee Act 1925</dd><dt>Legislation Section:</dt><dd about=\"this:legislation-1\" datatype=\"xsd:string\" property=\"legislation:legislationSection\">Section 27 (Deceased Estates)</dd></dl><div about=\"this:notifiableThing\" data-gazettes=\"Deceased details\" property=\"personal-legal:hasEstateOf\" resource=\"this:deceasedPerson\"><dl><dt>Deceased Surname:</dt><dd about=\"this:deceasedPerson\" data-required=\"true\" datatype=\"xsd:string\" property=\"foaf:familyName\">gfdhgfh</dd><dt>Deceased First name:</dt><dd about=\"this:deceasedPerson\" data-required=\"true\" datatype=\"xsd:string\" property=\"foaf:firstName\">fdfdg</dd><dt>Date of Death:</dt><dd about=\"this:deceasedPerson\" datatype=\"xsd:date\" property=\"personal-legal:dateOfDeath\">2017-06-01</dd></dl></div><div about=\"this:deceasedPerson\" property=\"person:hasAddress\" resource=\"this:deceased-address-1\"><dl><dt>Address Line 1:</dt><dd about=\"this:deceased-address-1\" data-required=\"true\" data-ui-class=\"addressLine1\" property=\"vcard:street-address\" typeof=\"vcard:Address\">PROGRESS HOUSE</dd><dt>Address Line 2:</dt><dd about=\"this:deceased-address-1\" data-ui-class=\"addressLine2\" property=\"vcard:extended-address\">5 MANDELA WAY</dd><dt>Town:</dt><dd about=\"this:deceased-address-1\" data-ui-class=\"locality\" property=\"vcard:locality\">LONDON</dd><dt>Postcode:</dt><dd about=\"this:deceased-address-1\" data-required=\"true\" data-ui-class=\"postcode\" property=\"vcard:postal-code\">SE1 5SS</dd></dl></div><div about=\"this:notifiableThing\" data-gazettes=\"Executors Details\" property=\"personal-legal:hasPersonalRepresentative\" resource=\"this:estateExecutor\"><dl><dt>Executor/Administrator Surname:</dt><dd about=\"this:estateExecutor\" data-required=\"true\" datatype=\"xsd:string\" property=\"foaf:familyName\">wer</dd><dt>Executor/Administrator First name:</dt><dd about=\"this:estateExecutor\" data-required=\"true\" datatype=\"xsd:string\" property=\"foaf:firstName\">wer</dd></dl><div about=\"this:estateExecutor\" property=\"vcard:adr\" resource=\"this:addressOfExecutor-1\"><dl><dt>Address 1:</dt><dd about=\"this:addressOfExecutor-1\" property=\"vcard:street-address\" typeof=\"vcard:Address\">PROGRESS HOUSE</dd><dt>Address 2:</dt><dd about=\"this:addressOfExecutor-1\" property=\"vcard:extended-address\">5 MANDELA WAY</dd><dt>Town:</dt><dd about=\"this:addressOfExecutor-1\" property=\"vcard:locality\">LONDON</dd><dt>Postcode:</dt><dd about=\"this:addressOfExecutor-1\" property=\"vcard:postal-code\">SE1 5SS</dd></dl></div><dl><dt>Telephone:</dt><dd about=\"this:estateExecutor\" datatype=\"xsd:string\" property=\"gaz:telephone\">01203 456 7879</dd><dt>Email address:</dt><dd about=\"this:estateExecutor\" datatype=\"xsd:string\" property=\"gaz:email\">email@email.com</dd></dl></div><dl><dt>Claims Date:</dt><dd about=\"this:notifiableThing\" datatype=\"xsd:date\" property=\"personal-legal:hasClaimDeadline\">2017-10-11</dd></dl></div></div><section><p>Notice is hereby given pursuant to section 27 (Deceased Estates) of the Trustee Act 1925, that any person having a claim against or an interest in the estate of any of the deceased persons whose names and addresses are set out above is hereby required to send particulars in writing of his claim or interest to the person or persons whose names and addresses are set out above, and to send such particulars before the date specified in relation to that deceased person displayed above, after which date the personal representatives will distribute the estate among the persons entitled thereto having regard only to the claims and interests of which they have had notice and will not, as respects the property so distributed, be liable to any person of whose claim they shall not then have had notice.<span about=\"\" datatype=\"\" property=\"\" resource=\"\" typeof=\"\"></span></p></section></article></div>"}],"links":{"link":[{"@href":"https://www.thegazette.co.uk/my-gazette/bundle/12627","@rel":"prev","@title":"","@type":""},{"@href":"https://www.thegazette.co.uk/my-gazette/bundle/12627/preview","@rel":"self","@title":"","@type":""},{"@href":"https://www.thegazette.co.uk/my-gazette/basket/multiple-items/bundle","@rel":"next","@title":"","@type":""}],}}
	