[home](../home.md)
#The Gazette Notice #


Notice content can be retrieved using following uris, content will be for a particular notice (notice-id).
 

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>
<tr>
	<td>/notice/{notice-id}</td>
	<td>GET</td>
	<td>HTML</td>
	<td>200</td>
	<td>None</td>
</tr>
<tr>
	<td>/notice/{notice-id}/data.xml</td>
	<td>GET</td>
	<td>XML</td>
	<td>200</td>
	<td>None</td>
</tr>
<tr>
	<td>​​/notice/{noticeid}/data.htm</td>
	<td>GET</td>
	<td>HTML</td>
	<td>200</td>
	<td>None</td>	
</tr>
<tr>
	<td>/notice/{noticeid}/data.ttl</td>
	<td>GET</td>
	<td>TTL</td>
	<td>200</td>
	<td>None</td>
</tr>

<tr>
	<td>​​/notice/{noticeid}/data.rdf</td>
	<td>GET</td>
	<td>RDF</td>
	<td>200</td>
	<td>None</td>
</tr>
<tr>
	<td>/notice/{noticeid}/data.jsonld</td>
	<td>GET</td>
	<td>JSON LD</td>
	<td>200</td>
	<td>None</td>
</tr>
<tr>
	<td>/notice/notice-id/data.pdf</td>
	<td>GET</td>
	<td>PDF</td>
	<td>200</td>
	<td>None</td>
</tr>
<tr>
	<td>/notice/{notice-id}/provenance</td>
	<td>GET</td>
	<td>HTML</td>
	<td>200</td>
	<td>None</td>
</tr>
<tr>
	<td>/notice/{notice-id}/provenance/data.rdf</td>
	<td>GET</td>
	<td>RDF</td>
	<td>200</td>
	<td>None</td>
</tr>
<tr>
	<td>/notice/{notice-id}/provenance/data.ttl
</td>
	<td>GET</td>
	<td>TTL</td>
	<td>200</td>
	<td>None</td>
</tr>
<tr>
	<td>/notice/{notice-id}/provenance/data.jsonld
</td>
	<td>GET</td>
	<td>JSON LD</td>
	<td>200</td>
	<td>None</td>
</tr>
<tr>
	<td>/notice/{notice-id}/provenance/data.xml
</td>
	<td>GET</td>
	<td>XML</td>
	<td>200</td>
	<td>None</td>
</tr>
</table>

**Note:** 
Above tables contain representation URIs, the Gazette API also performs content negotiation if the corresponding generic document URI with appropriate Accept header on the request.

<table>
<tr>
	<th>Generic Document URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>

<tr>
	<td>/notice/{notice-id}</td>
	<td>GET</td>
	<td>JSON LD</td>
	<td>200</td>
	<td>application/ld+json</td>
</tr>
<tr>
	<td>/notice/{notice-id}</td>
	<td>GET</td>
	<td>​RDF</td>
	<td>200</td>
	<td>​application/rdf+xml</td>
</tr>
<tr>
	<td>/notice/{notice-id}</td>
	<td>GET</td>
	<td>XML</td>
	<td>200</td>
	<td>application/xml</td>
</tr>
<tr>
	<td>/notice/{notice-id}</td>
	<td>GET</td>
	<td>​TTL</td>
	<td>200</td>
	<td>text/ttl</td>
</tr>
<tr>
	<td>/notice/{notice-id}/version/{version-id}
</td>
	<td>GET</td>
	<td>XML</td>
	<td>200</td>
	<td>application/xml</td>
</tr>
<tr>
	<td>/notice/{notice-id}/version/{version-id}
</td>
	<td>GET</td>
	<td>JSON</td>
	<td>200</td>
	<td>application/json</td>
</tr>
</table>

## Linked data view of The Gazette notice ##

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response Type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>
<tr>
	<td>/notice/{notice-id}?view=linked-data</td>
	<td>GET</td>
	<td>HTML</td>
	<td>200</td>
	<td>None</td>
</tr>
<tr>
	<td>​​​​/notice/{notice-id}.rdf?view=linked-data</td>
	<td>GET</td>
	<td>RDF/XML</td>
	<td>200</td>
	<td>None</td>	
</tr>
<tr>
	<td>​​/notice/{notice-id}.rdfjson?view=linked-data</td>
	<td>GET</td>
	<td>RDF/JSON</td>
	<td>200</td>
	<td>None</td>
</tr>
<tr>
	<td>​​​​/notice/{notice-id}.ttl?view=linked-data</td>
	<td>GET</td>
	<td>TTL</td>
	<td>200</td>
	<td>None</td>
</tr>
<tr>
	<td>/notice/{notice-id}.json?view=linked-data</td>
	<td>GET</td>
	<td>JSON LD</td>
	<td>200</td>
	<td>None</td>
</tr>
<tr>
	<td>​​/notice/{notice-id}.xml?view=linked-data</td>
	<td>GET</td>
	<td>XML</td>
	<td>200</td>
	<td>None</td>
</tr>
<tr>
	<td>​​/notice/{notice-id}.htm?view=linked-data</td>
	<td>GET</td>
	<td>HTML</td>
	<td>200</td>
	<td>None</td>
</tr>
</table>


**Note:** 
Above tables contain representation URIs, the Gazette API also performs content negotiation if the corresponding generic document URI with appropriate Accept header on the request.

<table>
<tr>
	<th>Generic Document URI</th>
	<th>Method</th>
	<th>Response Type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>
<tr>
	<td>/notice/{notice-id}?view=linked-data</td>
	<td>GET</td>
	<td>RDF/XML</td>
	<td>200</td>
	<td>​application/rdf+xml</td>
</tr>
<tr>
	<td>/notice/{notice-id}?view=linked-data</td>
	<td>GET</td>
	<td>RDF/JSON</td>
	<td>200</td>
	<td>​application/rdf+json</td>
</tr>
<tr>
	<td>/notice/{notice-id}?view=linked-data</td>
	<td>GET</td>
	<td>TTL</td>
	<td>200</td>
	<td>text/turtle</td>
</tr>
<tr>
	<td>/notice/{notice-id}?view=linked-data</td>
	<td>GET</td>
	<td>JSON</td>
	<td>200</td>
	<td>application/json</td>
</tr>
<tr>
	<td>/notice/{notice-id}?view=linked-data</td>
	<td>GET</td>
	<td>XML</td>
	<td>200 </td>
	<td>​application/xml</td>
</tr>
<tr>
	<td>/notice/{notice-id}?view=linked-data</td>
	<td>GET</td>
	<td>HTML</td>
	<td>200</td>
	<td>​text/html</td>
</tr>
</table>

##Example##

###	java ###
	package uk.co.gazettes.dao.rest;
	
	import org.springframework.http.HttpEntity;
	import org.springframework.http.HttpHeaders;
	import org.springframework.http.HttpMethod;
	import org.springframework.http.MediaType;
	import org.springframework.web.client.RestTemplate;
	
	import uk.co.gazettes.dao.exceptions.DataNotFoundException;
	import uk.co.gazettes.dao.utils.RestCookiesHelper;
	
	public class RestClient {
	
	    private static RestTemplate restTemplate;
	
	    public static void main(String args[]) {
		HttpHeaders httpHeaders = RestCookiesHelper.setTxCookie(null);
		httpHeaders.setContentType(MediaType.TEXT_HTML);
		HttpEntity<String> httpEntity = new HttpEntity<String>(httpHeaders);
		String uri = String.format("%s%s", "end-point", "context uri");
	
		try {
		    restTemplate.exchange(uri, HttpMethod.GET, httpEntity, String.class).getBody();
		} catch (IllegalArgumentException e) {
		    // This is thrown when there is no data. ML should fix this and
		    // throw correct exception. In the meantime catch this exception and
		    // throw DataNotFoundException
		    throw new DataNotFoundException("No data found for " + "context uri");
		}
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