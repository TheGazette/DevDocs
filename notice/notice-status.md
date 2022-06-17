[Home](../home.md)

# The Gazette Notice  - Status #

The users can change the status of their unpublished notices. In order to do this, they must be authenticated. For more info, please refer to [create an account](../authentication/registration.md) and [sign-in](../authentication/sign-in.md).

## Resource URL ##

`/notice/{notice-id}/status`
 
IDs for the user's own unpublished notices can be found using:

- [My Gazette](../mygazette/mygazette.md)

<table>
<tr>
<th>Representation URI</th>
<th>Method</th>
<th>Response type</th>
</tr>
<tr>
<td>​​/notice/{notice-id}/status</td>
<td>PUT</td>
<td>HTML</td>
</tr>
</table>


## Parameters ##
<table>
<tr>
<td rowspan=2 style="width:12em">withdraw</td>
<td>Mark a notice as withdrawn, this is only an allowable action for notices which have been purchased but are yet to be published</td>
</tr>
<tr>
<td><b>Valid value:</b> true</td>
</tr>
<tr>
<td rowspan=2 >exclude</td>
<td>Used to mark a notice as either excluded or to reverse this action. Excluding a notice removes a notice from its containing bundle for the purposes of the notice submission route.
This is only possible when a notice has a status of <i>status</i>
</td>
</tr>
<tr>
<td><b>Valid values:</b> true or false</td>
</tr>
</table>

## Sample Responses ##

