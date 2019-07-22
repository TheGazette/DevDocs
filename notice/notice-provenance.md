[Home](../home.md)

# The Gazette Notice - Provenance #

The provenance of a notice can be retrieved using following URIs, content will be for a particular notice (notice-id). The user can optionally be registered for this endpoint. Being authenticated will allow users to retrieve their unpublished notices. For further info, see [register](../authentication/registration.md) and [sign-in](../authentication/sign-in.md).

Other related endpoints which give further information about the notice:

- [Current version of the notice](notice.md)
- [Previous versions of the notice](notice-version.md)

## Resource URL ##

`/notice/{notice-id}/provenance`

### Alternative representations ###

<table>
<tr>
<th>Representation URI</th>
<th>Method</th>
<th>Response type</th>
</tr>
<tr>
<td>/notice/{notice-id}/provenance</td>
<td rowspan=5>GET</td>
<td>HTML</td>
</tr>
<tr>
<td>/notice/{notice-id}/provenance/data.rdf</td>
<td>RDF</td>
</tr>
<tr>
<td>/notice/{notice-id}/provenance/data.ttl</td>
<td>TTL</td>
</tr>
<tr>
<td>/notice/{notice-id}/provenance/data.jsonld</td>
<td>JSON-LD</td>
</tr>
<tr>
<td>/notice/{notice-id}/provenance/data.xml</td>
<td>XML</td>
</tr>
</table>

### Content negotiation ###

<table>
<tr>
<th>Generic Document URI</th>
<th>Method</th>
<th>Accept header​</th>
<th>Response type</th>
</tr>
<tr>
<td rowspan=4>/notice/{notice-id}/provenance</td>
<td rowspan=4>GET</td>
<td>application/ld+json</td>
<td>JSON-LD</td>
</tr>
<tr>
<td>​application/rdf+xml</td>
<td>​RDF</td>
</tr>
<tr>
<td>application/xml</td>
<td>XML</td>
</tr>
<tr>
<td>text/ttl</td>
<td>​TTL</td>
</tr>
</table>

## Sample Responses ##

### JSON LD

	[
		  {
		  "@type": ["http://www.w3.org/ns/prov#Entity"],
		  "http://www.w3.org/2000/01/rdf-schema#label": [{"@value": "XSLT Document"}],
		  "@id": "https://www.thegazette.co.uk/id/Transformations/1.239/SubmissionService/xsl/submission/gazettes2XHTML/gazettes2XHTMLRDFa.xsl"
	   },
		  {
		  "@type": ["http://www.w3.org/ns/prov#Entity"],
		  "http://www.w3.org/2000/01/rdf-schema#label": [{"@value": "XSLT Document"}],
		  "@id": "https://www.thegazette.co.uk/id/Transformations/1.239/SubmissionService/xsl/submission/publish/publish_date.xsl"
	   },
		  {
		  "@type": ["http://www.w3.org/ns/prov#Entity"],
		  "http://www.w3.org/2000/01/rdf-schema#label": [{"@value": "XSLT Document"}],
		  "@id": "https://www.thegazette.co.uk/id/Transformations/1.239/SubmissionService/xsl/submission/splitNotices.xsl"
	   },
		  {
		  "@type": ["http://www.w3.org/ns/prov#Agent"],
		  "http://www.w3.org/2000/01/rdf-schema#label": [{"@value": "User Agent"}],
		  "@id": "https://www.thegazette.co.uk/id/account/329"
	   },
		  {
		  "http://www.w3.org/ns/prov#endedAtTime": [      {
			 "@type": "http://www.w3.org/2001/XMLSchema#dateTime",
			 "@value": "2017-05-02T16:09:04+01:00"
		  }],
		  "@type": ["http://www.w3.org/ns/prov#Activity"],
		  "http://www.w3.org/ns/prov#used":       [
			 {"@id": "https://www.thegazette.co.uk/id/notice/507319/version/2"},
			 {"@id": "https://www.thegazette.co.uk/id/notice/507319/submitted"},
			 {"@id": "https://www.thegazette.co.uk/id/notice/507319/version/1"},
			 {"@id": "https://www.thegazette.co.uk/id/Transformations/1.239/SubmissionService/xsl/submission/publish/publish_date.xsl"}
		  ],
		  "http://www.w3.org/ns/prov#startedAtTime": [      {
			 "@type": "http://www.w3.org/2001/XMLSchema#dateTime",
			 "@value": "2017-05-02T16:09:04+01:00"
		  }],
		  "http://www.w3.org/2000/01/rdf-schema#label": [{"@value": "Publish Activity"}],
		  "@id": "https://www.thegazette.co.uk/id/activity/publish/notice/507319",
		  "http://www.w3.org/ns/prov#wasAssociatedWith": [{"@id": "https://www.thegazette.co.uk/id/agent/xslt-processor/notice/507319/submitted"}]
	   },
		  {
		  "http://www.w3.org/ns/prov#endedAtTime": [      {
			 "@type": "http://www.w3.org/2001/XMLSchema#dateTime",
			 "@value": "2017-05-02T14:10:14+01:00"
		  }],
		  "@type": ["http://www.w3.org/ns/prov#Activity"],
		  "http://www.w3.org/ns/prov#startedAtTime": [      {
			 "@type": "http://www.w3.org/2001/XMLSchema#dateTime",
			 "@value": "2017-05-02T14:09:53+01:00"
		  }],
		  "http://www.w3.org/2000/01/rdf-schema#label": [{"@value": "Receive Bundle Activity"}],
		  "@id": "https://www.thegazette.co.uk/id/activity/receive/bundle/12047",
		  "http://www.w3.org/ns/prov#wasAssociatedWith": [{"@id": "https://www.thegazette.co.uk/id/agent/submission-workflow/bundle/12047"}]
	   },
		  {
		  "http://www.w3.org/ns/prov#endedAtTime": [      {
			 "@type": "http://www.w3.org/2001/XMLSchema#dateTime",
			 "@value": "2017-05-02T14:10:15+01:00"
		  }],
		  "@type": ["http://www.w3.org/ns/prov#Activity"],
		  "http://www.w3.org/ns/prov#used":       [
			 {"@id": "https://www.thegazette.co.uk/id/bundle/12047"},
			 {"@id": "https://www.thegazette.co.uk/id/Transformations/1.239/SubmissionService/xsl/submission/splitNotices.xsl"}
		  ],
		  "http://www.w3.org/ns/prov#startedAtTime": [      {
			 "@type": "http://www.w3.org/2001/XMLSchema#dateTime",
			 "@value": "2017-05-02T14:09:56+01:00"
		  }],
		  "http://www.w3.org/2000/01/rdf-schema#label": [{"@value": "Split Bundle Activity"}],
		  "@id": "https://www.thegazette.co.uk/id/activity/split/bundle/12047",
		  "http://www.w3.org/ns/prov#wasAssociatedWith": [{"@id": "https://www.thegazette.co.uk/id/agent/xslt-processor/bundle/12047"}]
	   },
		  {
		  "http://www.w3.org/ns/prov#endedAtTime": [      {
			 "@type": "http://www.w3.org/2001/XMLSchema#dateTime",
			 "@value": "2017-05-02T14:10:16+01:00"
		  }],
		  "@type": ["http://www.w3.org/ns/prov#Activity"],
		  "http://www.w3.org/ns/prov#used":       [
			 {"@id": "https://www.thegazette.co.uk/id/notice/507319/version/1"},
			 {"@id": "https://www.thegazette.co.uk/id/Transformations/1.239/SubmissionService/xsl/submission/gazettes2XHTML/gazettes2XHTMLRDFa.xsl"}
		  ],
		  "http://www.w3.org/ns/prov#startedAtTime": [      {
			 "@type": "http://www.w3.org/2001/XMLSchema#dateTime",
			 "@value": "2017-05-02T14:10:15+01:00"
		  }],
		  "http://www.w3.org/2000/01/rdf-schema#label": [{"@value": "Transform Notice Activity"}],
		  "@id": "https://www.thegazette.co.uk/id/activity/transform/notice/507319/version/2",
		  "http://www.w3.org/ns/prov#wasAssociatedWith": [{"@id": "https://www.thegazette.co.uk/id/agent/xslt-processor/notice/507319/version/2"}]
	   },
		  {
		  "@type": ["http://www.w3.org/ns/prov#Agent"],
		  "http://www.w3.org/2000/01/rdf-schema#label": [{"@value": "Enrichment Service Agent"}],
		  "@id": "https://www.thegazette.co.uk/id/agent/enrichment-service/version/1.239/notice/507319",
		  "http://www.w3.org/ns/prov#actedOnBehalfOf": [{"@id": "https://www.thegazette.co.uk/id/agent/submission-workflow/bundle/12047"}]
	   },
		  {
		  "@type": ["http://www.w3.org/ns/prov#Agent"],
		  "http://www.w3.org/2000/01/rdf-schema#label": [{"@value": "Submission Workflow Agent"}],
		  "@id": "https://www.thegazette.co.uk/id/agent/submission-workflow/bundle/12047",
		  "http://www.w3.org/ns/prov#actedOnBehalfOf": [{"@id": "https://www.thegazette.co.uk/id/account/329"}]
	   },
		  {
		  "@type": ["http://www.w3.org/ns/prov#Agent"],
		  "http://www.w3.org/2000/01/rdf-schema#label": [{"@value": "Web Publishing Job Agent"}],
		  "@id": "https://www.thegazette.co.uk/id/agent/web-publisher/notice/507319"
	   },
		  {
		  "@type": ["http://www.w3.org/ns/prov#Agent"],
		  "http://www.w3.org/2000/01/rdf-schema#label": [{"@value": "XSLT Processor Agent"}],
		  "@id": "https://www.thegazette.co.uk/id/agent/xslt-processor/bundle/12047",
		  "http://www.w3.org/ns/prov#actedOnBehalfOf": [{"@id": "https://www.thegazette.co.uk/id/agent/submission-workflow/bundle/12047"}]
	   },
		  {
		  "@type": ["http://www.w3.org/ns/prov#Agent"],
		  "http://www.w3.org/2000/01/rdf-schema#label": [{"@value": "XSLT Processor Agent"}],
		  "@id": "https://www.thegazette.co.uk/id/agent/xslt-processor/notice/507319/submitted",
		  "http://www.w3.org/ns/prov#actedOnBehalfOf": [{"@id": "https://www.thegazette.co.uk/id/agent/web-publisher/notice/507319"}]
	   },
		  {
		  "@type": ["http://www.w3.org/ns/prov#Agent"],
		  "http://www.w3.org/2000/01/rdf-schema#label": [{"@value": "XSLT Processor Agent"}],
		  "@id": "https://www.thegazette.co.uk/id/agent/xslt-processor/notice/507319/version/2",
		  "http://www.w3.org/ns/prov#actedOnBehalfOf": [{"@id": "https://www.thegazette.co.uk/id/agent/submission-workflow/bundle/12047"}]
	   },
		  {
		  "http://www.w3.org/ns/prov#wasGeneratedBy": [{"@id": "https://www.thegazette.co.uk/id/activity/receive/bundle/12047"}],
		  "@type": ["http://www.w3.org/ns/prov#Entity"],
		  "http://www.w3.org/2000/01/rdf-schema#label": [{"@value": "Bundle Document"}],
		  "@id": "https://www.thegazette.co.uk/id/bundle/12047"
	   },
		  {
		  "http://www.w3.org/ns/prov#wasDerivedFrom": [{"@id": "https://www.thegazette.co.uk/id/notice/507319/submitted"}],
		  "http://www.w3.org/ns/prov#wasGeneratedBy": [{"@id": "https://www.thegazette.co.uk/id/activity/publish/notice/507319"}],
		  "@type": ["http://www.w3.org/ns/prov#Entity"],
		  "http://xmlns.com/foaf/spec/#term_sha1": [{"@value": "4a17ec2891f8694c2da7f48180202c8fd66750c2"}],
		  "http://www.w3.org/2000/01/rdf-schema#label": [{"@value": "The Gazette Notice"}],
		  "@id": "https://www.thegazette.co.uk/id/notice/507319"
	   },
		  {
		  "http://www.w3.org/ns/prov#endedAtTime": [      {
			 "@type": "http://www.w3.org/2001/XMLSchema#dateTime",
			 "@value": "2017-05-02T14:10:16+01:00"
		  }],
		  "@type": ["http://www.w3.org/ns/prov#Activity"],
		  "http://www.w3.org/ns/prov#used": [{"@id": "https://www.thegazette.co.uk/id/notice/507319/version/2"}],
		  "http://www.w3.org/ns/prov#startedAtTime": [      {
			 "@type": "http://www.w3.org/2001/XMLSchema#dateTime",
			 "@value": "2017-05-02T14:10:16+01:00"
		  }],
		  "http://www.w3.org/2000/01/rdf-schema#label": [{"@value": "Enrich Notice Activity"}],
		  "@id": "https://www.thegazette.co.uk/id/notice/507319/activity/enrich-notice",
		  "http://www.w3.org/ns/prov#wasAssociatedWith": [{"@id": "https://www.thegazette.co.uk/id/agent/enrichment-service/version/1.239/notice/507319"}]
	   },
		  {
		  "http://www.w3.org/ns/prov#wasDerivedFrom": [{"@id": "https://www.thegazette.co.uk/id/notice/507319/version/2"}],
		  "http://www.w3.org/ns/prov#wasGeneratedBy": [{"@id": "https://www.thegazette.co.uk/id/notice/507319/activity/enrich-notice"}],
		  "@type": ["http://www.w3.org/ns/prov#Entity"],
		  "http://www.w3.org/2000/01/rdf-schema#label": [{"@value": "The Gazette Notice Preview"}],
		  "@id": "https://www.thegazette.co.uk/id/notice/507319/preview"
	   },
		  {
		  "@type": ["http://www.w3.org/ns/prov#Entity"],
		  "http://www.w3.org/2000/01/rdf-schema#label": [{"@value": "The Gazette Notice Submitted"}],
		  "@id": "https://www.thegazette.co.uk/id/notice/507319/submitted"
	   },
		  {
		  "http://www.w3.org/ns/prov#wasDerivedFrom": [{"@id": "https://www.thegazette.co.uk/id/bundle/12047"}],
		  "http://www.w3.org/ns/prov#wasGeneratedBy": [{"@id": "https://www.thegazette.co.uk/id/activity/split/bundle/12047"}],
		  "@type": ["http://www.w3.org/ns/prov#Entity"],
		  "http://www.w3.org/2000/01/rdf-schema#label": [{"@value": "Notice Version 1"}],
		  "@id": "https://www.thegazette.co.uk/id/notice/507319/version/1"
	   },
		  {
		  "http://www.w3.org/ns/prov#wasDerivedFrom": [{"@id": "https://www.thegazette.co.uk/id/notice/507319/version/1"}],
		  "http://www.w3.org/ns/prov#wasGeneratedBy": [{"@id": "https://www.thegazette.co.uk/id/activity/transform/notice/507319/version/2"}],
		  "@type": ["http://www.w3.org/ns/prov#Entity"],
		  "http://www.w3.org/2000/01/rdf-schema#label": [{"@value": "Notice Version 2"}],
		  "@id": "https://www.thegazette.co.uk/id/notice/507319/version/2"
	   }
	]

### RDF

	<rdf:RDF xmlns:councils="https://www.thegazette.co.uk/def/councils#" xmlns:court="https://www.thegazette.co.uk/def/court#" xmlns:legislation="https://www.thegazette.co.uk/def/legislation#" xmlns:org="http://www.w3.org/ns/org#" xmlns:prov="http://www.w3.org/ns/prov#" xmlns:public-finance="https://www.thegazette.co.uk/def/public-finance#" xmlns:j.0="http://xmlns.com/foaf/spec/#" xmlns:personal-legal="https://www.thegazette.co.uk/def/personal-legal#" xmlns:honours="https://www.thegazette.co.uk/def/honours#" xmlns:gazdef="https://www.thegazette.co.uk/def/" xmlns:state="https://www.thegazette.co.uk/def/state#" xmlns:agriculture="https://www.thegazette.co.uk/def/agriculture#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:other-notices="https://www.thegazette.co.uk/def/other-notices#" xmlns:transport="https://www.thegazette.co.uk/def/transport#" xmlns:foaf="http://xmlns.com/foaf/0.1/" xmlns:person="https://www.thegazette.co.uk/def/person#" xmlns:royal-warrants="https://www.thegazette.co.uk/def/royal-warrants#" xmlns:geometry="http://data.ordnancesurvey.co.uk/ontology/geometry/" xmlns:telecom="https://www.thegazette.co.uk/def/telecom#" xmlns:health="https://www.thegazette.co.uk/def/health#" xmlns:military="https://www.thegazette.co.uk/def/military#" xmlns:geo="http://www.w3.org/2003/01/geo/wgs84_pos#" xmlns:church="https://www.thegazette.co.uk/def/church#" xmlns:water="https://www.thegazette.co.uk/def/water#" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:spatialrelations="http://data.ordnancesurvey.co.uk/ontology/spatialrelations/" xmlns:gaz="https://www.thegazette.co.uk/def/publication#" xmlns:geonames="http://www.geonames.org/ontology#" xmlns:os="http://data.ordnancesurvey.co.uk/ontology/postcode/" xmlns:vcard="http://www.w3.org/2006/vcard/ns#" xmlns:consultation="https://www.thegazette.co.uk/def/consultation#" xmlns:admingeo="http://data.ordnancesurvey.co.uk/ontology/admingeo/" xmlns:environment="https://www.thegazette.co.uk/def/environment#" xmlns:partnerships="https://www.thegazette.co.uk/def/partnerships#" xmlns:appointments="https://www.thegazette.co.uk/def/appointments#" xmlns:authority="https://www.thegazette.co.uk/def/authority#" xmlns:location="https://www.thegazette.co.uk/def/location#" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:gazorg="https://www.thegazette.co.uk/def/organisation#" xmlns:insolvency="https://www.thegazette.co.uk/def/insolvency#" xmlns:planning="https://www.thegazette.co.uk/def/planning#" xmlns:societies="https://www.thegazette.co.uk/def/societies#" xmlns:energy="https://www.thegazette.co.uk/def/energy#" xmlns:companies-partnerships="https://www.thegazette.co.uk/def/companies-partnerships#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:parliament="https://www.thegazette.co.uk/def/parliament#">
	   <rdf:Description rdf:about="https://www.thegazette.co.uk/id/activity/split/bundle/12047">
		  <prov:used rdf:resource="https://www.thegazette.co.uk/id/bundle/12047"/>
		  <prov:wasAssociatedWith rdf:resource="https://www.thegazette.co.uk/id/agent/xslt-processor/bundle/12047"/>
		  <rdf:type rdf:resource="http://www.w3.org/ns/prov#Activity"/>
		  <prov:used rdf:resource="https://www.thegazette.co.uk/id/Transformations/1.239/SubmissionService/xsl/submission/splitNotices.xsl"/>
		  <rdfs:label>Split Bundle Activity</rdfs:label>
		  <prov:endedAtTime rdf:datatype="http://www.w3.org/2001/XMLSchema#dateTime">2017-05-02T14:10:15+01:00</prov:endedAtTime>
		  <prov:startedAtTime rdf:datatype="http://www.w3.org/2001/XMLSchema#dateTime">2017-05-02T14:09:56+01:00</prov:startedAtTime>
	   </rdf:Description>
	   <rdf:Description rdf:about="https://www.thegazette.co.uk/id/bundle/12047">
		  <prov:wasGeneratedBy rdf:resource="https://www.thegazette.co.uk/id/activity/receive/bundle/12047"/>
		  <rdf:type rdf:resource="http://www.w3.org/ns/prov#Entity"/>
		  <rdfs:label>Bundle Document</rdfs:label>
	   </rdf:Description>
	   <rdf:Description rdf:about="https://www.thegazette.co.uk/id/activity/transform/notice/507319/version/2">
		  <prov:wasAssociatedWith rdf:resource="https://www.thegazette.co.uk/id/agent/xslt-processor/notice/507319/version/2"/>
		  <prov:used rdf:resource="https://www.thegazette.co.uk/id/notice/507319/version/1"/>
		  <rdf:type rdf:resource="http://www.w3.org/ns/prov#Activity"/>
		  <prov:used rdf:resource="https://www.thegazette.co.uk/id/Transformations/1.239/SubmissionService/xsl/submission/gazettes2XHTML/gazettes2XHTMLRDFa.xsl"/>
		  <rdfs:label>Transform Notice Activity</rdfs:label>
		  <prov:endedAtTime rdf:datatype="http://www.w3.org/2001/XMLSchema#dateTime">2017-05-02T14:10:16+01:00</prov:endedAtTime>
		  <prov:startedAtTime rdf:datatype="http://www.w3.org/2001/XMLSchema#dateTime">2017-05-02T14:10:15+01:00</prov:startedAtTime>
	   </rdf:Description>
	   <rdf:Description rdf:about="https://www.thegazette.co.uk/id/agent/xslt-processor/bundle/12047">
		  <prov:actedOnBehalfOf rdf:resource="https://www.thegazette.co.uk/id/agent/submission-workflow/bundle/12047"/>
		  <rdf:type rdf:resource="http://www.w3.org/ns/prov#Agent"/>
		  <rdfs:label>XSLT Processor Agent</rdfs:label>
	   </rdf:Description>
	   <rdf:Description rdf:about="https://www.thegazette.co.uk/id/notice/507319/activity/enrich-notice">
		  <prov:used rdf:resource="https://www.thegazette.co.uk/id/notice/507319/version/2"/>
		  <prov:wasAssociatedWith rdf:resource="https://www.thegazette.co.uk/id/agent/enrichment-service/version/1.239/notice/507319"/>
		  <rdf:type rdf:resource="http://www.w3.org/ns/prov#Activity"/>
		  <rdfs:label>Enrich Notice Activity</rdfs:label>
		  <prov:endedAtTime rdf:datatype="http://www.w3.org/2001/XMLSchema#dateTime">2017-05-02T14:10:16+01:00</prov:endedAtTime>
		  <prov:startedAtTime rdf:datatype="http://www.w3.org/2001/XMLSchema#dateTime">2017-05-02T14:10:16+01:00</prov:startedAtTime>
	   </rdf:Description>
	   <rdf:Description rdf:about="https://www.thegazette.co.uk/id/agent/submission-workflow/bundle/12047">
		  <rdf:type rdf:resource="http://www.w3.org/ns/prov#Agent"/>
		  <prov:actedOnBehalfOf rdf:resource="https://www.thegazette.co.uk/id/account/329"/>
		  <rdfs:label>Submission Workflow Agent</rdfs:label>
	   </rdf:Description>
	   <rdf:Description rdf:about="https://www.thegazette.co.uk/id/Transformations/1.239/SubmissionService/xsl/submission/splitNotices.xsl">
		  <rdf:type rdf:resource="http://www.w3.org/ns/prov#Entity"/>
		  <rdfs:label>XSLT Document</rdfs:label>
	   </rdf:Description>
	   <rdf:Description rdf:about="https://www.thegazette.co.uk/id/notice/507319/version/1">
		  <prov:wasDerivedFrom rdf:resource="https://www.thegazette.co.uk/id/bundle/12047"/>
		  <prov:wasGeneratedBy rdf:resource="https://www.thegazette.co.uk/id/activity/split/bundle/12047"/>
		  <rdf:type rdf:resource="http://www.w3.org/ns/prov#Entity"/>
		  <rdfs:label>Notice Version 1</rdfs:label>
	   </rdf:Description>
	   <rdf:Description rdf:about="https://www.thegazette.co.uk/id/notice/507319/version/2">
		  <prov:wasDerivedFrom rdf:resource="https://www.thegazette.co.uk/id/notice/507319/version/1"/>
		  <prov:wasGeneratedBy rdf:resource="https://www.thegazette.co.uk/id/activity/transform/notice/507319/version/2"/>
		  <rdf:type rdf:resource="http://www.w3.org/ns/prov#Entity"/>
		  <rdfs:label>Notice Version 2</rdfs:label>
	   </rdf:Description>
	   <rdf:Description rdf:about="https://www.thegazette.co.uk/id/agent/web-publisher/notice/507319">
		  <rdf:type rdf:resource="http://www.w3.org/ns/prov#Agent"/>
		  <rdfs:label>Web Publishing Job Agent</rdfs:label>
	   </rdf:Description>
	   <rdf:Description rdf:about="https://www.thegazette.co.uk/id/notice/507319/submitted">
		  <rdf:type rdf:resource="http://www.w3.org/ns/prov#Entity"/>
		  <rdfs:label>The Gazette Notice Submitted</rdfs:label>
	   </rdf:Description>
	   <rdf:Description rdf:about="https://www.thegazette.co.uk/id/agent/xslt-processor/notice/507319/version/2">
		  <prov:actedOnBehalfOf rdf:resource="https://www.thegazette.co.uk/id/agent/submission-workflow/bundle/12047"/>
		  <rdf:type rdf:resource="http://www.w3.org/ns/prov#Agent"/>
		  <rdfs:label>XSLT Processor Agent</rdfs:label>
	   </rdf:Description>
	   <rdf:Description rdf:about="https://www.thegazette.co.uk/id/notice/507319">
		  <prov:wasDerivedFrom rdf:resource="https://www.thegazette.co.uk/id/notice/507319/submitted"/>
		  <prov:wasGeneratedBy rdf:resource="https://www.thegazette.co.uk/id/activity/publish/notice/507319"/>
		  <rdf:type rdf:resource="http://www.w3.org/ns/prov#Entity"/>
		  <j.0:term_sha1 rdf:datatype="http://www.w3.org/2001/XMLSchema#string">4a17ec2891f8694c2da7f48180202c8fd66750c2</j.0:term_sha1>
		  <rdfs:label>The Gazette Notice</rdfs:label>
	   </rdf:Description>
	   <rdf:Description rdf:about="https://www.thegazette.co.uk/id/Transformations/1.239/SubmissionService/xsl/submission/gazettes2XHTML/gazettes2XHTMLRDFa.xsl">
		  <rdf:type rdf:resource="http://www.w3.org/ns/prov#Entity"/>
		  <rdfs:label>XSLT Document</rdfs:label>
	   </rdf:Description>
	   <rdf:Description rdf:about="https://www.thegazette.co.uk/id/notice/507319/preview">
		  <prov:wasDerivedFrom rdf:resource="https://www.thegazette.co.uk/id/notice/507319/version/2"/>
		  <prov:wasGeneratedBy rdf:resource="https://www.thegazette.co.uk/id/notice/507319/activity/enrich-notice"/>
		  <rdf:type rdf:resource="http://www.w3.org/ns/prov#Entity"/>
		  <rdfs:label>The Gazette Notice Preview</rdfs:label>
	   </rdf:Description>
	   <rdf:Description rdf:about="https://www.thegazette.co.uk/id/agent/xslt-processor/notice/507319/submitted">
		  <rdf:type rdf:resource="http://www.w3.org/ns/prov#Agent"/>
		  <prov:actedOnBehalfOf rdf:resource="https://www.thegazette.co.uk/id/agent/web-publisher/notice/507319"/>
		  <rdfs:label>XSLT Processor Agent</rdfs:label>
	   </rdf:Description>
	   <rdf:Description rdf:about="https://www.thegazette.co.uk/id/account/329">
		  <rdf:type rdf:resource="http://www.w3.org/ns/prov#Agent"/>
		  <rdfs:label>User Agent</rdfs:label>
	   </rdf:Description>
	   <rdf:Description rdf:about="https://www.thegazette.co.uk/id/Transformations/1.239/SubmissionService/xsl/submission/publish/publish_date.xsl">
		  <rdf:type rdf:resource="http://www.w3.org/ns/prov#Entity"/>
		  <rdfs:label>XSLT Document</rdfs:label>
	   </rdf:Description>
	   <rdf:Description rdf:about="https://www.thegazette.co.uk/id/activity/receive/bundle/12047">
		  <prov:wasAssociatedWith rdf:resource="https://www.thegazette.co.uk/id/agent/submission-workflow/bundle/12047"/>
		  <rdf:type rdf:resource="http://www.w3.org/ns/prov#Activity"/>
		  <rdfs:label>Receive Bundle Activity</rdfs:label>
		  <prov:startedAtTime rdf:datatype="http://www.w3.org/2001/XMLSchema#dateTime">2017-05-02T14:09:53+01:00</prov:startedAtTime>
		  <prov:endedAtTime rdf:datatype="http://www.w3.org/2001/XMLSchema#dateTime">2017-05-02T14:10:14+01:00</prov:endedAtTime>
	   </rdf:Description>
	   <rdf:Description rdf:about="https://www.thegazette.co.uk/id/agent/enrichment-service/version/1.239/notice/507319">
		  <prov:actedOnBehalfOf rdf:resource="https://www.thegazette.co.uk/id/agent/submission-workflow/bundle/12047"/>
		  <rdf:type rdf:resource="http://www.w3.org/ns/prov#Agent"/>
		  <rdfs:label>Enrichment Service Agent</rdfs:label>
	   </rdf:Description>
	   <rdf:Description rdf:about="https://www.thegazette.co.uk/id/activity/publish/notice/507319">
		  <prov:used rdf:resource="https://www.thegazette.co.uk/id/notice/507319/version/2"/>
		  <prov:used rdf:resource="https://www.thegazette.co.uk/id/notice/507319/submitted"/>
		  <prov:used rdf:resource="https://www.thegazette.co.uk/id/notice/507319/version/1"/>
		  <prov:used rdf:resource="https://www.thegazette.co.uk/id/Transformations/1.239/SubmissionService/xsl/submission/publish/publish_date.xsl"/>
		  <rdf:type rdf:resource="http://www.w3.org/ns/prov#Activity"/>
		  <prov:wasAssociatedWith rdf:resource="https://www.thegazette.co.uk/id/agent/xslt-processor/notice/507319/submitted"/>
		  <rdfs:label>Publish Activity</rdfs:label>
		  <prov:endedAtTime rdf:datatype="http://www.w3.org/2001/XMLSchema#dateTime">2017-05-02T16:09:04+01:00</prov:endedAtTime>
		  <prov:startedAtTime rdf:datatype="http://www.w3.org/2001/XMLSchema#dateTime">2017-05-02T16:09:04+01:00</prov:startedAtTime>
	   </rdf:Description>
	</rdf:RDF>