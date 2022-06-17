[Home](../home.md)

# My Gazette #

These end points are only available to authenticated Users, user needs  to [create an account](../authentication/registration.md) and [sign-in](../authentication/sign-in.md).

## My Notices ##

These endpoints allow the client to retrieve the user's notices, based on the notice status.

Various response formats can be requested via content negotiation, using the "Accept" header:

<table>
<tr>
	<th>Accept header</th>
	<th>Response type</th>
</tr>

<tr>
	<td>text/html</td>
	<td>HTML</td>
</tr>
<tr>
	<td>application/xml</td>
	<td>XML</td>
</tr>
<tr>
	<td>application/json</td>
	<td>JSON</td>
</tr>
</table>

### My draft notices ###

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Accept header​</th>
</tr>

<tr>
	<td>my-gazette/draft</td>
	<td>GET</td>
	<td>See table above</td>
</tr>
</table>

### My pending draft notices ###

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Accept header​</th>
</tr>

<tr>
	<td>my-gazette/pending</td>
	<td>GET</td>
	<td>See table above</td>
</tr>
</table>

### My withdrawn draft notices ###

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Accept header​</th>
</tr>

<tr>
	<td>/my-gazette/withdrawn</td>
	<td>GET</td>
	<td>See table above</td>
</tr>
</table>

### My rejected draft notices ###

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Accept header​</th>
</tr>

<tr>
	<td>/my-gazette/rejected</td>
	<td>GET</td>
	<td>See table above</td>
</tr>
</table>

### My published draft notices ###

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Accept header​</th>
</tr>

<tr>
	<td>/my-gazette/published</td>
	<td>GET</td>
	<td>See table above</td>
</tr>
</table>

## My Account ##

Client can retrieve the user's account details and order details using the following end points.

### My Account settings ###

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>

<tr>
	<td>/my-gazette/account/data.{format}
</td>
	<td>GET</td>
	<td></td>
	<td>200</td>
	<td>None</td>
</tr>

</table>

### My orders ###

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>

<tr>
	<td>/my-gazette/order/history/data.{format}
</td>
	<td>GET</td>
	<td></td>
	<td>200</td>
	<td>None</td>
</tr>

<tr>
	<td>/my-gazette/order/{order-id}/data.{format}
</td>
	<td>GET</td>
	<td></td>
	<td>200</td>
	<td>None</td>
</tr>

</table>


## Saved searches ##

Client can retrieve details of a user's saved searches. A delete endpoint is also available for removing saved searches from a user's account.

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>

<tr>
	<td>/my-gazette/search/data.{format}
</td>
	<td>GET</td>
	<td></td>
	<td>200</td>
	<td>None</td>
</tr>

<tr>
	<td>/my-gazette/search/{id}
</td>
	<td>DELETE</td>
	<td></td>
	<td>200</td>
	<td>None</td>
</tr>
</table>

## Saved notices ##

A signed in user is able to save notices to the My Gazette area for future reference. For more info, please refer to [Save a Notice](save-notice.md).

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>

<tr>
	<td>/my-gazette/notice/data.{format}
</td>
	<td>GET</td>
	<td></td>
	<td>200</td>
	<td>None</td>
</tr>
</table>