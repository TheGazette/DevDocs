[home](../home.md)
# The Gazette Place Options#

These end points are only available to authenticated Users, user needs  to [register](../authentication/registration.md) and [sign-in](../authentication/sign-in.md).


## Options to place notices##

This is for html clients only , returns back a list of options to place a notice based on user access level.
<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>
<tr>
	<td>/my-gazette/place-notice</td>
	<td>GET</td>
	<td>html</td>
	<td>200</td>
	<td>None</td>
</tr>
</table>

{accept-header} is text/html

<table>
<tr>
	<th>Generic Document URI</th>
	<th>Method</th>
	<th>Response Type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>
<tr>
	<td>/my-gazette/place-notice</td>
	<td>GET</td>
	<td>HTML</td>
	<td>200</td>
	<td>{accept-header}</td>
</tr>
</table>

**NOTE:** The following URIs are for submission and once bundle/notice has been posted , user can   [check the status of submission](notice-submissions.md)

##Legacy submission##
The uri for legacy bundle submission is **/my-gazette/bundle?legacy=true**.
The legacy XML bundle can be posted as request body or multipart file upload

##XML submission##

XMLas request body or multipart file upload.
<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>
<tr>
	<td>/my-gazette/bundle</td>
	<td>POST</td>
	<td></td>
	<td>200</td>
	<td>None</td>
</tr>
</table>



##Plain text submission##

User needs to post the text bundle to the following end 
{noticeType} could be 2903 etc.
<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>
<tr>
	<td>/my-gazette/place-notice/{noticeType}/plain-text</td>
	<td>POST</td>
	<td></td>
	<td>200</td>
	<td>None</td>
</tr>
</table>

##‘Microsoft’ Word Template submission##

Mainly it will be used by TSO users.


##JSON submission##


##CSV and pre-defined ‘Microsoft’ Excel spreadsheets submission##


##HTML5 and RDFa submission##

##RDF submission##

##Web form submission##