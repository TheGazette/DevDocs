[home](../home.md)
#The Gazette Notice - Previous versions#
Previous versions of the Notice content can be retrieved using following URIs, content will be for a particular notice (notice-id). 
The user can optionally be registered for this endpoint, being authenticated will allow users to retrieve their unpublished notices. [register](../authentication/registration.md) and [sign-in](../authentication/sign-in.md).

Initial version (1) will contain the submitted version of the notice and are available in the format which was submitted for more information on these formats see the [notice placement](../mygazette/mygazette.md) documentation. Subsequent versions are available as (X)HTML5+RDFa similar to the data.xml available for the current version of a [notice](notice.md).

Other related endpoints which give further information about the notice:

- [Current version of the notice](notice.md)
- [Provenance of the notice](notice-provenance.md)


## Resource URL ##

`/notice/{notice-id}/version/{version-id}`

Notice content can be retrieved using following uris, content will be for a particular notice (notice-id).
 
<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Notes</th>
</tr>
<tr>
	<td>/notice/{notice-id}/version/1</td>
	<td>GET</td>
	<td>Various</td>
	<td>Response type varies according to the original uploaded</td>
</tr>
<tr>
	<td>/notice/{notice-id}/version/{version-id}</td>
	<td>GET</td>
	<td>(X)HTML5+RDFa</td>
	<td></td>
</tr>
</table>