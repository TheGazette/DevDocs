[Home](../home.md)
# Order confirmation #
Once an order has been placed and a purchase order number assigned the user will need to confirm the order.

These end points are only available to authenticated users with permission to place notices, user needs  to [register](../authentication/registration.md) as either an individual or an organisation and then [sign-in](../authentication/sign-in.md).

See also

- [Checkout](../../basket/checkout.md)
- [Cancel an Order](cancel.md)

## Confirm an order

Use this request to confirm a user's order.

### Resource URL ###

`/my-gazette/order/{orderId}/confirm`

### Available methods ###

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
</tr>
<tr>
	<td rowspan=2>/my-gazette/order/{orderId}/confirm</td>
	<td>POST</td>
	<td>HTML</td>
</tr>
</table>

### Sample responses ###

#### JSON ####

## Check order confirmation

If the order has been confirmed, this endpoint will return information on that order's confirmation.

### Resource URL ###

`/my-gazette/order/{orderId}/confirmation`

### Available methods ###

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Accept header</th>
	<th>Response type</th>
</tr>
<tr>
	<td rowspan=2>/my-gazette/order/{orderId}/confirmation</td>
	<td>GET</td>
	<td>text/html</td>
	<td>HTML</td>
</tr>
</table>
