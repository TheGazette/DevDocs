[Home](../home.md)
# Saved notice #

Authenticated users can save notices to the My Gazette area for future reference. For more info, please refer to [registration](../authentication/registration.md) and [signing-in](../authentication/sign-in.md).

## Related Resources ##

- [Delete a saved a notice](delete-saved-notice.md)

## Resource URL ##

`/my-gazette/notice`

Valid notice Ids for published notices can be found using:

- [Notice feed](notice-feed.md)
- Saved notices via [My Gazette](../mygazette/mygazette.md) (Authentication Required)

<table>
<tr>
<th>URI</th>
<th>Method</th>
<th>Response Type</th>
</tr>
<tr>
<td>/my-gazette/notice</td>
<td>POST</td>
<td>HTTP status code only</td>
</tr>
</table>

## Parameters ##
<table>
<tr>
<th>Parameter</th>
<th></th>
</tr>
<tr>
<td rowspan=2>noticeId</td>
<td>valid notice id</td>
</tr>
<tr>
<td><b>Example value:</b> L-60577-1869085</td>
</tr>
</table>
	
## Response

A successful request will receive an HTTP 200 OK response.