[home](../home.md)

#The Gazette Notice - Provenance#

The provenance of a notice can be retrieved using following URIs, content will be for a particular notice (notice-id).
The user can optionally be registered for this endpoint, being authenticated will allow users to retrieve their unpublished notices. [register](../authentication/registration.md) and [sign-in](../authentication/sign-in.md).

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