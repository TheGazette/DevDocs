[home](../home.md)
# My Gazette#


These end points are only available to authenticated Users, user needs  to [register](../authentication/registration.md) and [sign-in](../authentication/sign-in.md).

**TODO: Need endpoints and description for following use cases.**

##My Notices ##
###My draft####
<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>

<tr>
	<td>my-gazette/draft/data.{format}
</td>
	<td>GET</td>
	<td></td>
	<td>200</td>
	<td>None</td>
</tr>
</table>

###My pending draft###

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>

<tr>
	<td>my-gazette/pending/data.{format}
</td>
	<td>GET</td>
	<td></td>
	<td>200</td>
	<td>None</td>
</tr>
</table>
###My withdrawn draft###

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>

<tr>
	<td>/my-gazette/withdrawn/data.{format}
</td>
	<td>GET</td>
	<td></td>
	<td>200</td>
	<td>None</td>
</tr>
</table>

###My rejected draft###
<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>

<tr>
	<td>/my-gazette/rejected/data.{format}
</td>
	<td>GET</td>
	<td></td>
	<td>200</td>
	<td>None</td>
</tr>
</table>
###My published draft###

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>

<tr>
	<td>/my-gazette/published/data.{format}
</td>
	<td>GET</td>
	<td></td>
	<td>200</td>
	<td>None</td>
</tr>
</table>

##My Account##

###My Account settings###
User can retrieve account details using the following end points

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

<tr>
	<td>/my-gazette/order/{order-id}/data.{format}
</td>
	<td>GET</td>
	<td></td>
	<td>200</td>
	<td>None</td>
</tr>
</table>

###My orders###
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

</table>


##Saved searches##
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

##Saved notics##

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


TODO:
- is there anything on the lineitem level?
- Bookmarks - saved searches, notices
