[home](../home.md)


# REST API: Notice Feed #
## Notice feed for Gazette services ##
Following URIs will return the complete notice feed for all editions in a service. 

The 'service' has to be part in following uris and it could be : all-notices, wills-and-probate, insolvency

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>
<tr>
	<td>/{service}/notice/data.feed</td>
	<td>GET</td>
	<td>XML</td>
	<td>200</td>
	<td>None</td>
</tr>
<tr>
	<td>/{service}/notice/data.htm</td>
	<td>GET</td>
	<td>HTML</td>
	<td>200</td>
	<td>None</td>	
</tr>
<tr>
	<td>/{service}/notice/data.json</td>
	<td>GET</td>
	<td>JSON</td>
	<td>200</td>
	<td>None</td>
</tr>
</table>

## Notice feed for Gazette editions ##

Following URIs will return the  notice feed for an specific  edition and service.

The 'edition' has to be part of uri and it could be london, edingburg, belfast


<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>

<tr>

	<td>/{service}/{edition}/data.feed</td>
	<td>GET</td>
	<td>XML</td>
	<td>200</td>
	<td>None</td>
</tr>

<tr>

	<td>/{service}/{edition}/htm.feed</td>
	<td>GET</td>
	<td>HTML</td>
	<td>200</td>
	<td>None</td>
</tr>

<tr>

	<td>/{service}/{edition}/data.json</td>
	<td>GET</td>
	<td>JSON</td>
	<td>200</td>
	<td>None</td>
</tr>

</table>


**Note:** 
Above tables contain representation URIs, the Gazette API also performs content negotiation if the corresponding generic document URI with appropriate Accept header on the request.


The uris below are for a service and service with edtion.

<table>
<tr>
	<th>Generic Document URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>


<tr>
	<td>/{service}/notice</td>
	<td>GET</td>
	<td>XML</td>
	<td>200</td>
	<td>application/xml</td>
</tr>
<tr>
	<td>/{service}/notice</td>
	<td>GET</td>
	<td>XML</td>
	<td>200</td>
	<td>​application/atom+xml</td>
</tr>
<tr>
	<td>/{service}/notice</td>
	<td>GET</td>
	<td>JSON</td>
	<td>200</td>
	<td>​​application/json</td>
</tr>
<tr>
	<td>/{service}/notice</td>
	<td>GET</td>
	<td>HTML</td>
	<td>200</td>
	<td>​​None</td>
</tr>	<tr>
	<td>/{service}/{edition}/notice</td>
	<td>GET</td>
	<td>XML</td>
	<td>200</td>
	<td>application/xml</td>
</tr>
<tr>
	<td>/{service}/{edition}/notice</td>
	<td>GET</td>
	<td>XML</td>
	<td>200</td>
	<td>​application/atom+xml</td>
</tr>
<tr>
	<td>/{service}/{edition}//notice</td>
	<td>GET</td>
	<td>JSON</td>
	<td>200</td>
	<td>​​application/json</td>
</tr>
<tr>
	<td>/{service}/{edition}/notice</td>
	<td>GET</td>
	<td>HTML</td>
	<td>200</td>
	<td>​​None</td>
</tr>	
</table>
