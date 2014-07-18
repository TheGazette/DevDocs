[home](../home.md)
# The Gazette Add To Basket#


These end points are only available to authenticated Users, user needs  to [register](../authentication/registration.md) and [sign-in](../authentication/sign-in.md).

User must have required access to see the basket details.
The end point to see the basket details of a user

{format} could be html, json etc

See also

- [Checkout](checkout.md)

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>
<tr>
	<td>/my-gazette/basket/data.{format}</td>
	<td>GET</td>
	<td>as per format</td>
	<td>200</td>
	<td>None</td>
</tr>
<tr>
	<td>/my-gazette/basket/data.{format}</td>
	<td>GET</td>
	<td>as per format</td>
	<td>400</td>
	<td>None</td>
</tr>
</table>


single or multiple notices can be posted to basket. To add a single item to the basket , **noticeId** must be part of request, the URI is: 

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>
<tr>
	<td>/my-gazette/basket/item</td>
	<td>POST</td>
	<td>HTML</td>
	<td>200</td>
	<td>None</td>
</tr>
<tr>
	<td>/my-gazette/basket/item</td>
	<td>POST</td>
	<td>HTML</td>
	<td>400</td>
	<td>None</td>
</tr>
</table>

To add multiple items to basket , **bundleId** must be part of request , the URI is :

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>
<tr>
	<td>/my-gazette/basket/multiple-items</td>
	<td>POST</td>
	<td>HTML</td>
	<td>201</td>
	<td>None</td>
</tr>
<tr>
	<td>/my-gazette/basket/multiple-items</td>
	<td>POST</td>
	<td>HTML</td>
	<td>400</td>
	<td>None</td>
</tr>
</table>

To delete an item from basket, URI is 

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>
<tr>
	<td>/my-gazette/basket/multiple-items</td>
	<td>POST</td>
	<td>HTML</td>
	<td>201</td>
	<td>None</td>
</tr>
<tr>
	<td>/my-gazette/basket/multiple-items</td>
	<td>POST</td>
	<td>HTML</td>
	<td>400</td>
	<td>None</td>
</tr>
</table>




To delete an item from basket, URI is 
<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>
<tr>
	<td>/my-gazette/basket/item/{itemId}</td>
	<td>DELETE</td>
	<td>HTML</td>
	<td>201</td>
	<td>None</td>
</tr>
<tr>
	<td>/my-gazette/basket/item/{itemId}</td>
	<td>DELETE</td>
	<td>HTML</td>
	<td>400</td>
	<td>None</td>
</tr>
</table>

To increase the quantity of an item, URI is


<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>
<tr>
	<td>/my-gazette/basket/multiple-items</td>
	<td>POST</td>
	<td>HTML</td>
	<td>201</td>
	<td>None</td>
</tr>
<tr>
	<td>/my-gazette/basket/multiple-items</td>
	<td>POST</td>
	<td>HTML</td>
	<td>400</td>
	<td>None</td>
</tr>
</table>

**TODO: Need endpoints and description for following use cases.**






  - from individual notice
- Basket contents
  - HTML
  - XML
  - JSON

