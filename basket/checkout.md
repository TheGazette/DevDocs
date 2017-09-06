[Home](../home.md)
# The Gazette Checkout #

These end points are only available to authenticated Users, user needs  to [register](../authentication/registration.html) and [sign-in](../authentication/sign-in.html).

## Resource URL ##

`/my-gazette/basket/checkout`

See also

- [Add to Basket](add-to-basket.md)
- [Assign Purchase Order](../mygazette/order/assign-po-number.md)
- [Order Confirmation](../mygazette/order/confirm.md)

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>
<tr>
	<td>/my-gazette/basket/checkout</td>
	<td>POST</td>
	<td>as per format</td>
	<td>200</td>
	<td>None</td>
</tr>

</table>

## Parameters ##
<table width=100%>
<tr>
<td rowspan=2 style="width:12em">paymentType</td>
<td>method of purchasing<br /><em>Only purchasing on account by means of a Purchase order is accepted via the API</em></td>
</tr>
<tr>
<td><b>Allowable Values:</b> PurchaseOrder</td>
</tr>
</table>

## Response ##

A successful call will receive a `302 Found` response code. The URI for the [subsequent endpoint](../mygazette/order/assign-po-number.md) (including the order number) is returned in the `Location` response header.