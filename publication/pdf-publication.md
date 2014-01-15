[home](../home.md)
#The Gazette PDF Publications #
##Issue and supplement PDFs##
###Standard editions###
 
Standard editions are like The London Gazette, The Edinburgh Gazette and The Belfast Gazette publications can be accessed as below:

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>
<tr>
	<td>/{edition}/issue/{issue-number}/data.pdf</td>
	<td>GET</td>
	<td>application/pdf</td>
	<td>200</td>
	<td>None</td>
</tr>
</table>

###Non standard editions###

Non standard editions are like insolvency, all-notices, wills-and-probate and city-of-westminster

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>
<tr>
	<td>/{non-standard-edition}/issue/{publication-date}/data.pdf</td>
	<td>GET</td>
	<td>application/pdf</td>
	<td>200</td>
	<td>None</td>
</tr>
</table>

  

##Individual pages of The Gazette issue##

The edition can be standard and non standard as mentioned above.

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>
<tr>
	<td>{edition}/issue/{issue-number}/page/{page-number}/data.pdf</td>
	<td>GET</td>
	<td>application/pdf</td>
	<td>200</td>
	<td>None</td>
</tr>
</table>








