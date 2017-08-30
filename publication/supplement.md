[Home](../home.md)
# The Gazette Supplement #
Print versions of the Gazette can be retrieved in pdf format, data about these print editions can also be retrieved in RDF+XML and JSON formats.

Similar resources

- [Complete issue](index.md)
- [Single Page](page.md)

## Resource URL ##

`/{edition}/issue/{issue-number}/supplement`

Supplements exist for the following editions, the correct parameter follows the title:

- The London Gazette: `london`
- The Edinburgh Gazette: `edinburgh`
- The Belfast Gazette: `belfast`



### Alternative Representations ###

<table>
<tr>
<th>Representation URI</th>
<th>Method</th>
<th>Response type</th>
<th>Notes</th>
</tr>
<tr>
<td>/{edition}/issue/{issue-number}<br />/{edition}/issue/{issue-number}/data.pdf</td>
<td rowspan=3>GET</td>
<td>PDF</td>
<td>Complete PDF of the edition.</td>
</tr>
<tr>
<td>/{edition}/issue/{issue-number}/data.rdf</td>
<td>RDF+XML</td>
<td>RDF XML for the issue</td>
</tr>
<tr>
<td>/{edition}/issue/{issue-number}/data.json</td>
<td>JSON</td>
<td>JSON for the issue</td>
</tr>
</table>

## Sample Responses ##

### XML ###
	<?xml version="1.0" encoding="UTF-8"?>
	<doc>
	   <links xmlns="http://www.w3.org/1999/xhtml">
		  <link xmlns="" href="https://www.thegazette.co.uk/London/issue/62035/supplement/16257" rel="self" title="HTML" type="application/xhtml+xml" />
		  <link xmlns="" href="https://www.thegazette.co.uk/London/issue/62035/supplement/16257/data.pdf" rel="alternate" title="PDF" type="application/pdf" />
		  <link xmlns="" href="https://www.thegazette.co.uk/London/issue/62035/supplement/16165" rel="first" title="HTML" type="application/xhtml+xml" />
		  <link xmlns="" href="https://www.thegazette.co.uk/London/issue/62035/supplement/16268" rel="last" title="HTML" type="application/xhtml+xml" />
		  <link xmlns="" href="https://www.thegazette.co.uk/London/issue/62035/supplement/16176" rel="prev" title="HTML" type="application/xhtml+xml" />
		  <link xmlns="" href="https://www.thegazette.co.uk/London/issue/62035/supplement/16258" rel="next" title="HTML" type="application/xhtml+xml" />
	   </links>
	   <links xmlns="http://www.w3.org/1999/xhtml">
		  <link href="https://www.thegazette.co.uk/London/issue/62035/supplement/16257" rel="self" title="HTML" type="application/xhtml+xml" />
		  <link href="https://www.thegazette.co.uk/London/issue/62035/supplement/16257/data.pdf" rel="alternate" title="PDF" type="application/pdf" />
		  <link href="https://www.thegazette.co.uk/London/issue/62035/supplement/16165" rel="first" title="HTML" type="application/xhtml+xml" />
		  <link href="https://www.thegazette.co.uk/London/issue/62035/supplement/16268" rel="last" title="HTML" type="application/xhtml+xml" />
		  <link href="https://www.thegazette.co.uk/London/issue/62035/supplement/16176" rel="prev" title="HTML" type="application/xhtml+xml" />
		  <link href="https://www.thegazette.co.uk/London/issue/62035/supplement/16258" rel="next" title="HTML" type="application/xhtml+xml" />
	   </links>
	</doc>



### JSON ###
	[
	   {
		  "@xmlns": "http://www.w3.org/1999/xhtml",
		  "link": [
			 {
				"@href": "https://www.thegazette.co.uk/London/issue/62035/supplement/16257",
				"@rel": "self",
				"@title": "HTML"
			 },
			 {
				"@href": "https://www.thegazette.co.uk/London/issue/62035/supplement/16257/data.pdf",
				"@rel": "alternate",
				"@title": "PDF"
			 },
			 {
				"@href": "https://www.thegazette.co.uk/London/issue/62035/supplement/16165",
				"@rel": "first",
				"@title": "HTML"
			 },
			 {
				"@href": "https://www.thegazette.co.uk/London/issue/62035/supplement/16268",
				"@rel": "last",
				"@title": "HTML"
			 },
			 {
				"@href": "https://www.thegazette.co.uk/London/issue/62035/supplement/16176",
				"@rel": "prev",
				"@title": "HTML"
			 },
			 {
				"@href": "https://www.thegazette.co.uk/London/issue/62035/supplement/16258",
				"@rel": "next",
				"@title": "HTML"
			 }
		  ]
	   },
	   {
		  "@xmlns": "http://www.w3.org/1999/xhtml",
		  "link": [
			 {
				"@href": "https://www.thegazette.co.uk/London/issue/62035/supplement/16257",
				"@rel": "self",
				"@title": "HTML"
			 },
			 {
				"@href": "https://www.thegazette.co.uk/London/issue/62035/supplement/16257/data.pdf",
				"@rel": "alternate",
				"@title": "PDF"
			 },
			 {
				"@href": "https://www.thegazette.co.uk/London/issue/62035/supplement/16165",
				"@rel": "first",
				"@title": "HTML"
			 },
			 {
				"@href": "https://www.thegazette.co.uk/London/issue/62035/supplement/16268",
				"@rel": "last",
				"@title": "HTML"
			 },
			 {
				"@href": "https://www.thegazette.co.uk/London/issue/62035/supplement/16176",
				"@rel": "prev",
				"@title": "HTML"
			 },
			 {
				"@href": "https://www.thegazette.co.uk/London/issue/62035/supplement/16258",
				"@rel": "next",
				"@title": "HTML"
			 }
		  ]
	   }
	]