[home](../home.md)
#The Gazette Notice Taxonomy#




These end points are only available to authenticated Users, user needs  to [register](../authentication/registration.md) and [sign-in](../authentication/sign-in.md).


**TODO: Need endpoints and description for following use cases.**

- Notice taxonomy
  - Get list of notice types, codes, etc., and filter by submission methods and editions
  - /notice-taxonomy/data.json
  - /notice-taxonomy/data.json?online-form-edition=edinburgh
  - /notice-taxonomy/{notice-type-code}/data.json?online-form-edition=london
  - (above exists currerntly but parameter is named different)
  - GET /data.xml OR /data.json

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>

<tr>
	<td>/notice-taxonomy/data.json
</td>
	<td>GET</td>
	<td>JSON</td>
	<td>200</td>
	<td>None</td>
</tr>

<tr>
	<td>/notice-taxonomy/data.xml
</td>
	<td>GET</td>
	<td>XML</td>
	<td>200</td>
	<td>None</td>
</tr>

<tr>
	<td>/notice-taxonomy/{notice-type-code}/data.xml
</td>
	<td>GET</td>
	<td>XML</td>
	<td>200</td>
	<td>None</td>
</tr>

<tr>
	<td>/notice-taxonomy/{notice-type-code}/data.json
</td>
	<td>GET</td>
	<td>JSON</td>
	<td>200</td>
	<td>None</td>
</tr>

<tr>
	<td>/notice-taxonomy/data.json?online-form-edition={edition}
</td>
	<td>GET</td>
	<td>JSON</td>
	<td>200</td>
	<td>None</td>
</tr>

</table>