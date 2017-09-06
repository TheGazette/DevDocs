[Home](../home.md)
# The Gazette Add To Basket #

These end points are only available to authenticated Users, user needs  to [register](../authentication/registration.md) and [sign-in](../authentication/sign-in.md).

User must have the appropriate access to see the basket details. See also [Checkout](checkout.md).

## Resource URL ##

### Get basic basket details

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Success response code</th>
	<th>Accept header​</th>
</tr>
<tr>
	<td>/my-gazette/basket/data.{format}</td>
	<td>GET</td>
	<td>as per format</td>
	<td>200</td>
	<td>None</td>
</tr>
</table>

### Adding notices to basket

Single or multiple notices can be posted to basket.

To add a single item to the basket , `{noticeId}` must be part of request, the URI is: 

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Success response code</th>
	<th>Accept header​</th>
</tr>
<tr>
	<td>/my-gazette/basket/item?itemId={noticeId}&itemType=Notice</td>
	<td>POST</td>
	<td>HTML</td>
	<td>200</td>
	<td>None</td>
</tr>
</table>

To add multiple items to basket , `{bundleId}` must be part of request , the URI is :

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Success response code</th>
	<th>Accept header​</th>
</tr>
<tr>
	<td>/my-gazette/basket/multiple-items/bundle?bundleId={bundleId}</td>
	<td>POST</td>
	<td>HTML</td>
	<td>201</td>
	<td>None</td>
</tr>
</table>

### Deleting from the basket

In order to clear the user's basket, URI is:

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Success response code</th>
	<th>Accept header​</th>
</tr>
<tr>
	<td>/my-gazette/basket</td>
	<td>DELETE</td>
	<td>XML</td>
	<td>201</td>
	<td>None</td>
</tr>
</table>

It is also possible to delete an individual item from the basket:

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Success response code</th>
	<th>Accept header​</th>
</tr>
<tr>
	<td>/my-gazette/basket/item/{itemId}</td>
	<td>DELETE</td>
	<td>HTML</td>
	<td>201</td>
	<td>None</td>
</tr>
</table>

### Increasing the quantity of an item

To increase the quantity of an item, URI is

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Success response code</th>
	<th>Accept header​</th>
</tr>
<tr>
	<td>/my-gazette/basket/item/{itemId}/quantity</td>
	<td>PUT</td>
	<td>HTML</td>
	<td>201</td>
	<td>None</td>
</tr>
</table>
