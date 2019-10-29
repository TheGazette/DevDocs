[Home](../home.md)
# Existing Bundle #
Once a bundle has been created it can be accessed and deleted by the user who created it.
These end points are only available to authenticated Users, user needs  to [register](../authentication/registration.md) and [sign-in](../authentication/sign-in.md).

## Resource URL ##
`/my-gazette/bundle/{bundle-id}`

Valid bundle Ids can be found using:

- [List of Draft notices](mygazette.md)

See also

- [Create Bundle](create-bundle.md)
- [Add a Bundle to the Basket](../basket/add-to-basket.md)

### Available methods ###

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
</tr>
<tr>
	<td rowspan=2>/my-gazette/bundle/{bundle-id}</td>
	<td>GET</td>
</tr>
<tr>
	<td>DELETE</td>
</tr>
</table>


### Content negotiation ###
<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Accepts header</th>
<th>Response type</th>
</tr>
<tr>
	<td rowspan=4>/my-gazette/bundle/{bundle-id}</td>
	<td rowspan=4>GET</td>
	<td>application/xml</td>
	<td rowspan=2>XML (Atom)</td>
</tr>
<tr>
<td>application/atom+xml</td>
</tr>
<tr>
<td>application/json</td>
<td>JSON</td>
</tr>
<tr>
<td>text/html</td>
<td>(X)HTML5+RDFa</td>
</tr>
</table>

## Sample responses ##
### XML ###
	<feed xmlns="http://www.w3.org/2005/Atom" xmlns:f="https://www.thegazette.co.uk/facets" xmlns:geo="http://www.w3.org/2003/01/geo/wgs84_pos#" xmlns:openSearch="http://a9.com/-/spec/opensearch/1.1/">
	   <id>/my-gazette/bundle/12627/data.feed?&amp;results-page=1</id>
	   <link href="/my-gazette/bundle/12627/data.feed?&amp;results-page=1" rel="self" type="application/atom+xml"/>
	   <link href="/my-gazette/bundle/12627/data.feed?&amp;results-page=1" rel="first" type="application/atom+xml"/>
	   <link href="/my-gazette/bundle/12627/data.feed?&amp;results-page=1" rel="last" type="application/atom+xml"/>
	   <link href="/my-gazette/bundle/12627/data.htm?&amp;results-page=1" rel="alternate" title="HTML" type="application/xhtml+xml"/>
	   <link href="/my-gazette/bundle/12627/data.json?&amp;results-page=1" rel="alternate" title="JSON-SIMPLE" type="application/json"/>
	   <title>Search Result</title>
	   <updated>2017-08-24T14:11:37.82+01:00</updated>
	   <openSearch:Query role="request"/>
	   <f:page-number>1</f:page-number>
	   <f:page-size>10</f:page-size>
	   <f:page-start>1</f:page-start>
	   <f:page-stop>1</f:page-stop>
	   <f:total>1</f:total>
	   <f:facets/>
	   <entry>
		  <id>https://www.thegazette.co.uk/id/notice/508991</id>
		  <title>Notice title</title>
		  <link href="https://www.thegazette.co.uk/id/notice/508991" rel="self"/>
		  <link href="https://www.thegazette.co.uk/notice/508991"/>
		  <link href="https://www.thegazette.co.uk/notice/508991/data.ttl" rel="alternate" title="TURTLE" type="text/turtle"/>
		  <link href="https://www.thegazette.co.uk/notice/508991/data.jsonld" rel="alternate" title="JSON-LD" type="application/json"/>
		  <link href="https://www.thegazette.co.uk/notice/508991/data.rdf" rel="alternate" title="RDF/XML" type="application/rdf+xml"/>
		  <link href="https://www.thegazette.co.uk/notice/508991/data.ttl?view=linked-data" rel="alternate" title="TURTLE" type="text/turtle"/>
		  <link href="https://www.thegazette.co.uk/notice/508991/data.json?view=linked-data" rel="alternate" title="JSON-SIMPLE" type="application/json"/>
		  <link href="https://www.thegazette.co.uk/notice/508991/data.rdfjson?view=linked-data" rel="alternate" title="JSON-RDF" type="application/rdf+json"/>
		  <link href="https://www.thegazette.co.uk/notice/508991/data.rdf?view=linked-data" rel="alternate" title="RDF/XML" type="application/rdf+xml"/>
		  <link href="https://www.thegazette.co.uk/notice/508991/data.xml?view=linked-data" rel="alternate" title="XML" type="application/xml"/>
		  <link href="https://www.thegazette.co.uk/notice/508991/data.html?view=linked-data" rel="alternate" title="HTML" type="application/html"/>
		  <author>
			 <name>tso</name>
		  </author>
		  <updated>2017-06-09T15:32:05+01:00</updated>
		  <published>2017-06-09T00:01:00</published>
		  <category term="Deceased Estates"/>
		  <geo:Point>
			 <geo:lat>51.49276</geo:lat>
			 <geo:long>-0.080126</geo:long>
		  </geo:Point>
		  <content type="xhtml" xml:base="https://www.thegazette.co.uk/" xml:lang="en">
			 <div xmlns="http://www.w3.org/1999/xhtml">
				<dl>
				   <dt>Address of Deceased</dt>
				   <dd>PROGRESS HOUSE, LONDON, SE1 5SS</dd>
				   <dt>Date of Claim Deadline</dt>
				   <dd>
					  <time datetime="2017-10-11"/>
				   </dd>
				</dl>
			 </div>
		  </content>
	   </entry>
	   <links xmlns="http://www.w3.org/1999/xhtml">
		  <link href="https://www.thegazette.co.uk/my-gazette/bundle/12627/process-status" rel="prev" title="" type=""/>
		  <link href="https://www.thegazette.co.uk/my-gazette/bundle/12627/preview" rel="next" title="" type=""/>
		  <link href="https://www.thegazette.co.uk/my-gazette/bundle/12627/data.xml" rel="alternate" title="XML" type="application/xml"/>
		  <link href="https://www.thegazette.co.uk/my-gazette/bundle/12627/data.html" rel="alternate" title="HTML" type="application/html"/>
		  <link href="https://www.thegazette.co.uk/my-gazette/bundle/12627/data.json" rel="alternate" title="JSON" type="application/json"/>
	   </links>
	</feed>

### JSON ###

	{
	   "id": "/my-gazette/bundle/12627/data.feed?&results-page=1",
	   "link":    [
				{
			 "@href": "/my-gazette/bundle/12627/data.feed?&results-page=1",
			 "@rel": "alternate",
			 "@type": "application/atom+xml",
			 "@title": "ATOM"
		  },
				{
			 "@href": "/my-gazette/bundle/12627/data.json?&results-page=1",
			 "@rel": "first",
			 "@type": "application/json"
		  },
				{
			 "@href": "/my-gazette/bundle/12627/data.json?&results-page=1",
			 "@rel": "last",
			 "@type": "application/json"
		  },
				{
			 "@href": "/my-gazette/bundle/12627/data.htm?&results-page=1",
			 "@rel": "alternate",
			 "@title": "HTML",
			 "@type": "application/xhtml+xml"
		  },
				{
			 "@href": "/my-gazette/bundle/12627/data.json?&results-page=1",
			 "@rel": "self",
			 "@type": "application/json"
		  }
	   ],
	   "title": "Search Result",
	   "updated": "2017-08-24T14:15:36.977+01:00",
	   "openSearch:Query": {"@role": "request"},
	   "f:page-number": "1",
	   "f:page-size": "10",
	   "f:page-start": "1",
	   "f:page-stop": "1",
	   "f:total": "1",
	   "f:facets": null,
	   "entry": [   {
		  "id": "https://www.thegazette.co.uk/id/notice/508991",
		  "title": "Notice title",
		  "link":       [
					  {
				"@href": "https://www.thegazette.co.uk/id/notice/508991",
				"@rel": "self"
			 },
			 {"@href": "https://www.thegazette.co.uk/notice/508991"},
					  {
				"@href": "https://www.thegazette.co.uk/notice/508991/data.ttl",
				"@rel": "alternate",
				"@title": "TURTLE",
				"@type": "text/turtle"
			 },
					  {
				"@href": "https://www.thegazette.co.uk/notice/508991/data.jsonld",
				"@rel": "alternate",
				"@title": "JSON-LD",
				"@type": "application/json"
			 },
					  {
				"@href": "https://www.thegazette.co.uk/notice/508991/data.rdf",
				"@rel": "alternate",
				"@title": "RDF/XML",
				"@type": "application/rdf+xml"
			 },
					  {
				"@href": "https://www.thegazette.co.uk/notice/508991/data.ttl?view=linked-data",
				"@rel": "alternate",
				"@title": "TURTLE",
				"@type": "text/turtle"
			 },
					  {
				"@href": "https://www.thegazette.co.uk/notice/508991/data.json?view=linked-data",
				"@rel": "alternate",
				"@title": "JSON-SIMPLE",
				"@type": "application/json"
			 },
					  {
				"@href": "https://www.thegazette.co.uk/notice/508991/data.rdfjson?view=linked-data",
				"@rel": "alternate",
				"@title": "JSON-RDF",
				"@type": "application/rdf+json"
			 },
					  {
				"@href": "https://www.thegazette.co.uk/notice/508991/data.rdf?view=linked-data",
				"@rel": "alternate",
				"@title": "RDF/XML",
				"@type": "application/rdf+xml"
			 },
					  {
				"@href": "https://www.thegazette.co.uk/notice/508991/data.xml?view=linked-data",
				"@rel": "alternate",
				"@title": "XML",
				"@type": "application/xml"
			 },
					  {
				"@href": "https://www.thegazette.co.uk/notice/508991/data.html?view=linked-data",
				"@rel": "alternate",
				"@title": "HTML",
				"@type": "application/html"
			 }
		  ],
		  "author": {"name": "tso"},
		  "updated": "2017-06-09T15:32:05+01:00",
		  "published": "2017-06-09T00:01:00",
		  "category": {"@term": "Deceased Estates"},
		  "geo:Point":       {
			 "geo:lat": "51.49276",
			 "geo:long": "-0.080126"
		  },
		  "content": "<div><dl><dt>Address of Deceased<\/dt><dd>PROGRESS HOUSE, LONDON, SE1 5SS<\/dd><dt>Date of Claim Deadline<\/dt><dd><time datetime=\"2017-10-11\"><\/time><\/dd><\/dl><\/div>"
	   }],
	   "links": {"link":    [
				{
			 "@href": "https://www.thegazette.co.uk/my-gazette/bundle/12627/process-status",
			 "@rel": "prev",
			 "@title": "",
			 "@type": ""
		  },
				{
			 "@href": "https://www.thegazette.co.uk/my-gazette/bundle/12627/preview",
			 "@rel": "next",
			 "@title": "",
			 "@type": ""
		  },
				{
			 "@href": "https://www.thegazette.co.uk/my-gazette/bundle/12627/data.xml",
			 "@rel": "alternate",
			 "@title": "XML",
			 "@type": "application/xml"
		  },
				{
			 "@href": "https://www.thegazette.co.uk/my-gazette/bundle/12627/data.html",
			 "@rel": "alternate",
			 "@title": "HTML",
			 "@type": "application/html"
		  },
				{
			 "@href": "https://www.thegazette.co.uk/my-gazette/bundle/12627/data.json",
			 "@rel": "self",
			 "@title": "JSON",
			 "@type": "application/json"
		  }
	   ]}
	}

## Code samples ##
### Java ###

To run the sample below you need to have JDK and [Apache HttpClient](https://hc.apache.org/httpcomponents-client-ga/index.html) on the class path.

	CloseableHttpClient httpClient = HttpClients.createDefault();

	final String uri = "https://www.thegazette.co.uk/my-gazette/bundle/76838";
	HttpGet httpGet = new HttpGet(uri);
	httpGet.addHeader("Accept", "application/json");
	httpGet.addHeader("Authorization", "Bearer xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

	try {
		HttpResponse response = httpClient.execute(httpGet);
		System.out.println("Http response code: " + response.getStatusLine().getStatusCode());
		System.out.println("Response body: \n" + EntityUtils.toString(response.getEntity()));
	} catch (IOException e) {
		e.printStackTrace();
	} finally {
		try {
			httpGet.releaseConnection();
			httpClient.close();
		} catch (IOException e) { 
			System.out.println("unable to close HttpClient at this time"); 
		}
	}
