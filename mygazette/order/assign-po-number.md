[Home](../home.md)
# Assign Purchase Order Number #
Once an order has been placed, a purchase order number can be assigned.

These end points are only available to authenticated users with permission to place notices, user needs  to [register](../authentication/registration.md) as either an individual or an organisation and then [sign-in](../authentication/sign-in.md).

## Resource URL ##

`/my-gazette/order/{orderId}/assign-po-number`

See also

- [Checkout](../../basket/checkout.md)
- [Order Confirmation](confirm.md)
- [Cancel an Order](cancel.md)

### Available methods ###

<table width=100%>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
</tr>
<tr>
	<td>/my-gazette/order/{orderId}/assign-po-number</td>
	<td>PUT</td>
	<td>HTML</td>
</tr>
</table>

## Parameters ##
<table width=100%>
<tr>
<td rowspan=2 style="width:12em">poNumber</td>
<td>A User's Purchase Order Number</td>
</tr>
<tr>
<td><b>Example Value:</b> 931009297</td>
</tr>
</table>

## Response

A successful call will receive a `302 Found` response code. The URI for the [confirmation endpoint](confirm.md) (including the order number) is returned in the `Location` response header.