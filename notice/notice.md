[home](../home.md)
#The Gazette Notice #
Notice content can be retrieved using following URIs, content will be for a particular notice (notice-id).
The user can optionally be registered for this endpoint, being authenticated will allow users to retrieve their unpublished notices. To be authenticated users must [register](../authentication/registration.md) and then [sign-in](../authentication/sign-in.md).

Other related endpoints which give further information about the notice:

- [Provenance of the notice](notice-provenance.md)
- [Previous versions of the notice](notice-version.md)

## Resource URL ##

`/notice/{notice-id}`
 
Valid notice Ids for published notices can be found using:

- [Notice feed](notice-feed.md)
- [Saved notices](../mygazette/mygazette.md) (Authentication Required)

Ids for the user's own unpublished notices can be found using:

- [My Gazette](../mygazette/mygazette.md)

### Alternative Representations ###
Due to the large number of alternative representations available there is a notes column to help guide the user to the appropriate representation.

<table>
<tr>
<th>Representation URI</th>
<th>Method</th>
<th>Response type</th>
<th>Notes</th>
</tr>
<tr>
<td>​​/notice/{notice-id}<br />/notice/{notice-id}/data.htm</td>
<td rowspan=14>GET</td>
<td>(X)HTML5+RDFa</td>
<td>Website view of the notice with all of the page chrome included.</td>
</tr>

<tr>
<td>/notice/{notice-id}/data.xml</td>

<td>(X)HTML5+RDFa</td>
<td>Contains only the notice of the content</td>
</tr>
<tr>
<td>/notice/{notice-id}/data.pdf</td>
<td>PDF</td>
<td>PDF of the notice specified, compare to <a href="../publication/pdf-publication.md">page</a> and <a href="../publication/pdf-publication.md">issue</a></td>
</tr>
<tr>
<td>/notice/{notice-id}/data.ttl</td>
<td>TTL</td>
<td></td>
</tr>

<tr>
<td>​​/notice/{notice-id}/data.rdf</td>
<td>RDF</td>
<td></td>
</tr>
<tr>
<td>/notice/{notice-id}/data.jsonld</td>
<td>JSON LD</td>
<td></td>
</tr>
<tr>
<td>/notice/{notice-id}?view=linked-data</td>
<td>HTML</td>
<td></td>
</tr>
<tr>
<td>​​​​/notice/{notice-id}data.ttl?view=linked-data</td>
<td>TTL</td>
<td></td>
</tr>
<tr>
<td>​​​​/notice/{notice-id}data.rdf?view=linked-data</td>
<td>RDF/XML</td>
<td></td>
</tr>
<tr>
<td>​​/notice/{notice-id}data.rdfjson?view=linked-data</td>
<td>RDF/JSON</td>
<td></td>
</tr>

<tr>
<td>/notice/{notice-id}data.json?view=linked-data</td>
<td>JSON LD</td>
<td></td>
</tr>
<tr>
<td>​​/notice/{notice-id}data.xml?view=linked-data</td>
<td>XML</td>
<td>Linked data xml view containing the only data elements of the notice</td>
</tr>
</table>

### Content Negotiation ###

<table>
<tr>
<th>Generic Document URI</th>
<th>Method</th>
<th>Accept header​</th>
<th>Response type</th>
<th>Matching Representation*</th>
</tr>
<tr>
<td rowspan=6>/notice/{notice-id}</td>
<td rowspan=13>GET</td>
<td>application/ld+json</td>
<td>JSON LD</td>
<td></td>
</tr>
<tr>
<td>​application/rdf+xml</td>
<td>​RDF</td>
<td></td>
</tr>
<tr>
<td>text/turtle</td>
<td>​TTL</td>
<td></td>
</tr>
<tr>
<td>application/xml</td>
<td>(X)HTML5+RDFa</td>
<td>/notice/{notice-id}/data.xml</td>
</tr>
<tr>
<td>text/html</td>
<td rowspan=2>(X)HTML5+RDFa</td>
<td rowspan=2>/notice/{notice-id}<br/>/notice/{notice-id}/data.htm</td>
</tr>
<tr>
<td>*/*</td>
</tr>

<tr>
<td rowspan=7>/notice/{notice-id}?view=linked-data</td>
<td>​application/rdf+xml</td>
<td>RDF/XML</td>
<td></td>
</tr>
<tr>
<td>​application/rdf+json</td>
<td>RDF/JSON</td>
<td></td>
</tr>
<tr>
<td>text/turtle</td>
<td>TTL</td>
<td></td>
</tr>
<tr>
<td>application/json</td>
<td>JSON</td>
<td></td>
</tr>
<tr>
<td>​application/xml</td>
<td>XML</td>
<td></td>
</tr>
<tr>
<td>​text/html</td>
<td rowspan=2>HTML</td>
<td rowspan=2></td>
</tr>
<tr>
<td>*/*</td>
</tr>
</table>
*\*Only included where the response type is otherwise ambiguous*
## Parameters ##
<table>
<tr>
<td rowspan=2 style="width:12em">view</td>
<td>Only one value is allowable <code>linked-data</code> this switches the responses to be a Linked-Data API view</a>, this will contain the data elements of the notice.</td>
</tr>
<tr>
<td><b>Example Values:</b> linked-data</td>
</tr>
</table>

## Code Samples ##

###	java ###
	// with accept header
	import com.jayway.restassured.RestAssured;
	import com.jayway.restassured.response.Response;
	public class RestClient {
		public static void main(String args[])
		{
			// get the access token via POST explained in Sign-in document.
		   	RestAssured.baseURI = "https://www.thegazette.co.uk";
		   	
		   	Response response = given().header("Authorization", "Bearer " + accessToken).header("Accept", "application/rdf+xml").expect().statusCode(200).get("/notice/{notice-id}");
			String asString = response.getBody().asString();
	    }
	
	}
	
	// without accept header
	import com.jayway.restassured.RestAssured;
	import com.jayway.restassured.response.Response;
	public class RestClient {
		public static void main(String args[])
		{
			// get the access token via POST explained in Sign-in document.
		   	RestAssured.baseURI = "https://www.thegazette.co.uk";
	
	    	Response response = given().expect().statusCode(200).get("/notice/{notice-id}");
			String asString = response.getBody().asString();
	    }

	}



### php ###
	<?php
		//$noticeId should be set to the notice Id to be retrieved
		$noticeURI = "https://www.thegazette.co.uk/notice/" + $noticeId;

		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL,				$noticeURI);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER,	true);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER,	false);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST,	false);
		curl_setopt($ch, CURLOPT_FOLLOWLOCATION,	false);
		$noticeContent = curl_exec($ch);
		
		curl_close($ch);
		if($noticeContent){
			print $noticeContent;
		}
	?>

### javascript ###
*without external libraries*

	//noticeId should be set to the notice Id to be retrieved	    
	var xmlhttp, noticeId;
		
	xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
	   if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            document.getElementById("bodyID").innerHTML = xmlhttp.responseText;
        }
    }

    xmlhttp.open("GET", "https://www.thegazette.co.uk/notice/" + noticeId, true);
    xmlhttp.send();

*with jQuery* 

	$.ajax({
	    url: "https://www.thegazette.co.uk/notice/" + noticeId,
	    context: document.body
	});