[Home](../home.md)


# REST API: Notice Feed #
Used to perform searches against the database of published notices.
The user can optionally be registered for this endpoint, being authenticated will include an extra element in the response which indicates if the notices has been saved by the user. 
More information on authentication is available, [register](../authentication/registration.md) and [sign-in](../authentication/sign-in.md).
## Resource URL ##

`/{service}/notice/`

or

`/{service}/{edition}/notice`


Each of the services available has a specific set of constraint which is applied to the result set as a whole
<table>
<tr>
<th style="width:12em">{service}</th>
<th>Constraint</th>
</tr>
<tr>
<td><code>all-notices</code></td>
<td>No constraints, will also return relevant matches from supplements</td>
</tr>
<tr>
<td><code>insolvency</code></td>
<td>Constrains the notices returned to Corporate Insolvency(24) and Personal Insolvency(25) notices </td>
</tr>
<tr>
<td><code>wills-and-probate</code></td>
<td>Constraints the notices returned to Deceased Estates(2903) notices</td>
</tr>
</table>

### Alternative Representations ###

Alternative representations of notice feeds can be retrieved by utilising either representation specific filenames or via content negotiation.
In each instance the base URI can be either `/{service}/notice` or  `/{service}/{edition}/notice`.

<table>
<tr>
	<th style="width:12em">Representation URI</th>
	<th>Method</th>
	<th>Response format</th>
</tr>
<tr>
	<td>/{service}/notice/data.feed</td>
	<td rowspan=3>GET</td>
	<td>XML (Atom)</td>
</tr>
<tr>
	<td>/{service}/notice/data.htm</td>
	<td>HTML</td>	
</tr>
<tr>
	<td>/{service}/notice/data.json</td>
	<td>JSON</td>
</tr>
</table>

#### Content Negotiation ####

<table>
<tr>
	<th style="width:12em">Generic Document URI</th>
	<th>Method</th>
	<th>Accept header​</th>
	<th>Response format</th>
</tr>
<tr>
<td rowspan=5>/{service}/notice</td>
<td rowspan=5>GET</td>
<td>application/xml</td>
<td rowspan=2>XML (Atom)</td>
</tr>
<tr>
<td>​application/atom+xml</td>
</tr>
<tr>
<td>​​application/json</td>
<td>JSON</td>
</tr>
<tr>
<td>​text/html</td>
<td rowspan=2>HTML</td>
</tr>
<tr>
<td>​*/*</td>
</tr>
</table>

## Parameters ##
<table>
<tr>
<td rowspan=2 style="width:12em">noticetype</td>
<td>1 or more 4 digit notice code(s) separated by +. <a href="../local-auth">Complete notice taxonomy</a>
</td>
</tr>
<tr>
<td><b>Example Values:</b> 2903+2450</td>
</tr>
<tr>
<td rowspan=2>categorycode</td>
<td>1 or more 2 digit notice category code(s) separated by +. <a href="../local-auth">Complete notice taxonomy</a></td>
</tr>
<tr>
<td><b>Example Values:</b> 24+25</td>
</tr>
<tr>
<th rowspan=2>Date Range Searching</th>
<td>All of the date searching parameters accept ISO 8601 format calendar dates(YYYY-MM-DD).<br />All of these types of parameters are a paired as  start-{parameter} and end-{parameter}.
The start and end parameter for each pair may be used independently.</td>
</tr>
<tr>
<td><b>Example Values:</b> 1665-11-07</td>
</tr>
<tr>
<td>start-publish-date<br />end-publish-date</td>
<td>Publication Dates of notices.</td>
</tr>
<tr>
<td>start-date-of-death<br />end-date-of-death</td>
<td><em>Date of death is a data item only applicable to Deceased Estates notices. Using this parameter has the effect of limiting the search to that notice type (2903)</em></td>
</tr>
<tr>
<td>start-claim-expiry-date<br />end-claim-expiry-date</td>
<td><em>Claim expiry date is a data item only applicable to Deceased Estates notices. Using this parameter has the effect of limiting the search to that notice type (2903)</em></td>
</tr>
<tr>
<th>Location Searching</th>
<td>Any number of location search parameters can be included as part of a search. These are processed as an OR instruction meaning that notices returned will match at least one of the locations specified.
<br />The <code>[n]</code> specified should be a positive integer, the <code>location-local-authority-[n]</code> takes precedence over that of the location-postcode
</td>
</tr>
<tr>
<td rowspan=2>location-postcode-[n]</td>
<td>UK postcode or Location (City or Town), <b>N.B. for each use a matching location-distance-[n] is also required</b></td>
</tr>
<tr>
<td><b>Example Values:</b> NR3 1PD or London</td>
</tr>
<tr>
<td rowspan=2>location-distance-[n]</td>
<td>Constrains the radius (in miles) of the search from the central point derived from <code>location-postcode-[n]</code>.</td>
</tr>
<tr>
<td><b>Example Values:</b> 1</td>
</tr>
<tr>
<td rowspan=2>location-local-authority-[n]</td>
<td>Constrains search to the named local authority. <a href="../local-auth">Complete list of local authorities</a></td>
</tr>
<tr>
<td><b>Example Values:</b> City of London</td>
</tr>
<tr>
<th>Edition Searching</th>
<td></td>
<tr>
<td rowspan=2>edition</td>
<td>1 or more of  London, Edinburgh and Belfast. Limits the search to </td>
</tr>
<tr>
<td><b>Example Values:</b> 10</td>
</tr>
<tr>
<td rowspan=2>issue</td>
<td>1 or more of issue numbers, searches across multiple editions</td>
</tr>
<tr>
<td><b>Example Values:</b> 1+15858</td>
</tr>

<tr>
<th>Pagination and ordering</th>
<td></td>
</tr>
<tr>
<td rowspan=2>results-page</td>
<td>Positive Integer, highest valid page number in a result set can be determined by inspecting the HATEOAS links in a response</td>
</tr>
<tr>
<td><b>Example Values:</b> 2</td>
</tr>
<tr>
<td rowspan=2>results-page-size</td>
<td>Positive Integer</td>
</tr>
<tr>
<td><b>Example Values:</b> 10</td>
</tr>
<tr>
<td rowspan=2>sort-by</td>
<td>Change the ordering of </td>
</tr>
<tr>
<td><b>Example Values:</b> latest-date | oldest-date</td>
</tr>

</table>

## Sample Responses ##
A results feed is available in 3 distinct formats. The first of these is the html format which is presented as the website. The other 2 formats are Atom xml and a json format below is a sample response in each of these.

	https://www.thegazette.co.uk/all-notices/notice/data.feed?categorycode=11&results-page-size=1

### XML (Atom) ###
	<?xml version="1.0" encoding="UTF-8"?>
	<feed xmlns="http://www.w3.org/2005/Atom" xmlns:f="https://www.thegazette.co.uk/facets"
	      xmlns:geo="http://www.w3.org/2003/01/geo/wgs84_pos#"
	      xmlns:openSearch="http://a9.com/-/spec/opensearch/1.1/">
	    <id>https://www.thegazette.co.uk/all-notices/notice/data.feed?amp;categorycode=11&amp;location-distance-1=1&amp;numberOfLocationSearches=1&amp;results-page-size=10&amp;results-page-size=1&amp;results-page=1</id>
	    <link
	        href="https://www.thegazette.co.uk/all-notices/notice/data.feed?amp;categorycode=11&amp;location-distance-1=1&amp;numberOfLocationSearches=1&amp;results-page-size=10&amp;results-page-size=1&amp;results-page=1"
	        rel="self" type="application/atom+xml"/>
	    <link
	        href="https://www.thegazette.co.uk/all-notices/notice/data.feed?amp;categorycode=11&amp;location-distance-1=1&amp;numberOfLocationSearches=1&amp;results-page=1"
	        rel="first" type="application/atom+xml"/>
	    <link
	        href="https://www.thegazette.co.uk/all-notices/notice/data.feed?amp;categorycode=11&amp;location-distance-1=1&amp;numberOfLocationSearches=1&amp;results-page=2"
	        rel="next" type="application/atom+xml"/>
	    <link
	        href="https://www.thegazette.co.uk/all-notices/notice/data.feed?amp;categorycode=11&amp;location-distance-1=1&amp;numberOfLocationSearches=1&amp;results-page=9082"
	        rel="last" type="application/atom+xml"/>
	    <link
	        href="https://www.thegazette.co.uk/all-notices/notice/data.htm?amp;categorycode=11&amp;location-distance-1=1&amp;numberOfLocationSearches=1&amp;results-page-size=10&amp;results-page-size=1&amp;results-page=1"
	        rel="alternate" title="HTML" type="application/xhtml+xml"/>
	    <link
	        href="https://www.thegazette.co.uk/all-notices/notice/data.json?amp;categorycode=11&amp;location-distance-1=1&amp;numberOfLocationSearches=1&amp;results-page-size=10&amp;results-page-size=1&amp;results-page=1"
	        rel="alternate" title="JSON-SIMPLE" type="application/json"/>
	    <title>Search Result</title>
	    <updated>2014-01-31T11:46:53.702Z</updated>
	    <openSearch:Query role="request"/>
	    <f:page-number>1</f:page-number>
	    <f:page-size>1</f:page-size>
	    <f:page-start>1</f:page-start>
	    <f:page-stop>1</f:page-stop>
	    <f:total>9082</f:total>
	    <f:facets/>
	    <entry>
	        <id>https://www.thegazette.co.uk/id/notice/L-60768-1986497</id>
	        <f:status>published</f:status>
	        <f:notice-code>1119</f:notice-code>
	        <title>Warrants Under the Royal Sign Manual</title>
	        <link href="https://www.thegazette.co.uk/id/notice/L-60768-1986497" rel="self"/>
	        <link href="https://www.thegazette.co.uk/notice/L-60768-1986497"/>
	        <link href="https://www.thegazette.co.uk/notice/L-60768-1986497/data.ttl" rel="alternate"
	            title="TURTLE" type="text/turtle"/>
	        <link href="https://www.thegazette.co.uk/notice/L-60768-1986497/data.jsonld" rel="alternate"
	            title="JSON-LD" type="application/json"/>
	        <link href="https://www.thegazette.co.uk/notice/L-60768-1986497/data.rdf" rel="alternate"
	            title="RDF/XML" type="application/rdf+xml"/>
	        <link href="https://www.thegazette.co.uk/notice/L-60768-1986497.ttl?view=linked-data"
	            rel="alternate" title="TURTLE" type="text/turtle"/>
	        <link href="https://www.thegazette.co.uk/notice/L-60768-1986497.json?view=linked-data"
	            rel="alternate" title="JSON-SIMPLE" type="application/json"/>
	        <link href="https://www.thegazette.co.uk/notice/L-60768-1986497.rdfjson?view=linked-data"
	            rel="alternate" title="JSON-RDF" type="application/rdf+json"/>
	        <link href="https://www.thegazette.co.uk/notice/L-60768-1986497.rdf?view=linked-data"
	            rel="alternate" title="RDF/XML" type="application/rdf+xml"/>
	        <link href="https://www.thegazette.co.uk/notice/L-60768-1986497.xml?view=linked-data"
	            rel="alternate" title="XML" type="application/xml"/>
	        <link href="https://www.thegazette.co.uk/notice/L-60768-1986497.html?view=linked-data"
	            rel="alternate" title="HTML" type="application/html"/>
	        <author>
	            <name>tso</name>
	        </author>
	        <updated>2014-01-30T15:24:00Z</updated>
	        <published>2014-01-30T07:43:53</published>
	        <category term="Warrants Under the Royal Sign Manual"/>
	        <content type="xhtml" xml:base="https://www.thegazette.co.uk/" xml:lang="en">
	            <div xmlns="http://www.w3.org/1999/xhtml">
	                <p>The Queen has been pleased by Royal Warrants bearing date 27 January 2014 to
	                    appoint the following: Sir Brian Frederick James Langstaff, Knight - as an
	                    Umpire Her Honour Judge Jennifer Jane Eady – as ...</p>
	            </div>
	        </content>
	    </entry>
	</feed>

### JSON ###
The JSON structure is derived from the atom xml format and contains an array of link elements which are designed to mirror the standard HATEOAS links found in the atom format. 

	{
	    "id": "https://www.thegazette.co.uk/all-notices/notice/data.feed?categorycode=11&results-page-size=1",
	    "link": [
	        {
	            "@href": "https://www.thegazette.co.uk/all-notices/notice/data.feed?categorycode=11&results-page-size=1",
	            "@rel": "alternate",
	            "@type": "application/atom+xml",
	            "@title": "ATOM"
	        },
	        {
	            "@href": "https://www.thegazette.co.uk/all-notices/notice/data.json?categorycode=11",
	            "@rel": "first",
	            "@type": "application/json"
	        },
	        {
	            "@href": "https://www.thegazette.co.uk/all-notices/notice/data.json?categorycode=11&results-page=2",
	            "@rel": "next",
	            "@type": "application/json"
	        },
	        {
	            "@href": "https://www.thegazette.co.uk/all-notices/notice/data.json?categorycode=11&results-page=9082",
	            "@rel": "last",
	            "@type": "application/json"
	        },
	        {
	            "@href": "https://www.thegazette.co.uk/all-notices/notice/data.htm?categorycode=11&results-page-size=1",
	            "@rel": "alternate",
	            "@title": "HTML",
	            "@type": "application/xhtml+xml"
	        },
	        {
	            "@href": "https://www.thegazette.co.uk/all-notices/notice/data.json?categorycode=11&results-page-size=1",
	            "@rel": "self",
	            "@type": "application/json"
	        }
	    ],
	    "title": "Search Result",
	    "updated": "2014-01-31T11:48:43.044Z",
	    "openSearch:Query": {
	        "@role": "request"
	    },
	    "f:page-number": "1",
	    "f:page-size": "1",
	    "f:page-start": "1",
	    "f:page-stop": "1",
	    "f:total": "9082",
	    "f:facets": null,
	    "entry": [
	        {
	            "id": "https://www.thegazette.co.uk/id/notice/L-60768-1986497",
	            "f:status": "published",
	            "f:notice-code": "1119",
	            "title": "Warrants Under the Royal Sign Manual",
	            "link": [
	                {
	                    "@href": "https://www.thegazette.co.uk/id/notice/L-60768-1986497",
	                    "@rel": "self"
	                },
	                {
	                    "@href": "https://www.thegazette.co.uk/notice/L-60768-1986497"
	                },
	                {
	                    "@href": "https://www.thegazette.co.uk/notice/L-60768-1986497/data.ttl",
	                    "@rel": "alternate",
	                    "@title": "TURTLE",
	                    "@type": "text/turtle"
	                },
	                {
	                    "@href": "https://www.thegazette.co.uk/notice/L-60768-1986497/data.jsonld",
	                    "@rel": "alternate",
	                    "@title": "JSON-LD",
	                    "@type": "application/json"
	                },
	                {
	                    "@href": "https://www.thegazette.co.uk/notice/L-60768-1986497/data.rdf",
	                    "@rel": "alternate",
	                    "@title": "RDF/XML",
	                    "@type": "application/rdf+xml"
	                },
	                {
	                    "@href": "https://www.thegazette.co.uk/notice/L-60768-1986497.ttl?view=linked-data",
	                    "@rel": "alternate",
	                    "@title": "TURTLE",
	                    "@type": "text/turtle"
	                },
	                {
	                    "@href": "https://www.thegazette.co.uk/notice/L-60768-1986497.json?view=linked-data",
	                    "@rel": "alternate",
	                    "@title": "JSON-SIMPLE",
	                    "@type": "application/json"
	                },
	                {
	                    "@href": "https://www.thegazette.co.uk/notice/L-60768-1986497.rdfjson?view=linked-data",
	                    "@rel": "alternate",
	                    "@title": "JSON-RDF",
	                    "@type": "application/rdf+json"
	                },
	                {
	                    "@href": "https://www.thegazette.co.uk/notice/L-60768-1986497.rdf?view=linked-data",
	                    "@rel": "alternate",
	                    "@title": "RDF/XML",
	                    "@type": "application/rdf+xml"
	                },
	                {
	                    "@href": "https://www.thegazette.co.uk/notice/L-60768-1986497.xml?view=linked-data",
	                    "@rel": "alternate",
	                    "@title": "XML",
	                    "@type": "application/xml"
	                },
	                {
	                    "@href": "https://www.thegazette.co.uk/notice/L-60768-1986497.html?view=linked-data",
	                    "@rel": "alternate",
	                    "@title": "HTML",
	                    "@type": "application/html"
	                }
	            ],
	            "author": {
	                "name": "tso"
	            },
	            "updated": "2014-01-30T15:24:00Z",
	            "published": "2014-01-30T07:43:53",
	            "category": {
	                "@term": "Warrants Under the Royal Sign Manual"
	            },
	            "content": "<div><p>The Queen has been pleased by Royal Warrants bearing date 27 January 2014 to appoint the following: Sir Brian Frederick James Langstaff, Knight - as an Umpire Her Honour Judge Jennifer Jane Eady – as ...</p></div>"
	        }
	    ]
	}

## Code samples ##
### Java ###
	
	

### PHP ###


- `$uri` to be a valid feed uri
- `$bearer` set to be the users OAuth token if required
- `$xsl_doc` should be a xslt 1.0 stylesheet to transform returned Atom feed to desired html

*Assumes a php install with both cURL and DOM modules enablede* 

	<?php
	
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL,				$uri);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER,	true);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER,	false);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST,	false);
		curl_setopt($ch, CURLOPT_FOLLOWLOCATION,	false);
		
		$headers = array();
		if($bearer != '')		$headers []= "Authorization: Bearer" . $bearer;
		if(sizeof($headers) > 0)	curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
		
		$response = curl_exec($ch);
		
		curl_close($ch);
		
		$html = transformXML($response, "notice-feed.xsl");
		$xml_doc = new DOMDocument();
		$xml_doc->loadXML($response);
		
		$xslt = new XSLTProcessor();
		
		$xsl_doc = new DOMDocument();
		$xsl_doc->load($xsl);
		
		$xslt->importStylesheet($xsl_doc);
		
		$html = $xslt->transformToXML($xml_doc);
		
		echo $html;
	?>

### Javascript ###

	