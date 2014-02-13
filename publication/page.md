[home](../home.md)
#The Gazette Page #
Single pages of the print versions of the Gazette can be retrieved in pdf format, data about these print editions can also be retrieved in issues and supplements RDF+XML and JSON formats.

Similar resources

- [Complete Issue](issue.md)
- [Supplements](supplement.md)
- [Indexes](index.md)


## Resource URL ##

`/{edition}/issue/{issue-number}/page/{page-number}`

or

`/{edition}/issue/{issue-number}/supplement/{page-number}`

or

`/{edition}/year/{year}/page/{page-number}`


The following editions exist, the correct parameter follows the title:

- The London Gazette: `london`
- The Edinburgh Gazette: `edinburgh`
- The Belfast Gazette: `belfast`


### Alternative Representations ###
Resource URL has been shortened to {resourceURL} for clarity.
<table>
<tr>
<th>Representation URI</th>
<th>Method</th>
<th>Response type</th>
<th>Notes</th>
</tr>
<tr>
<td>{resourceURL}<br />{resourceURL}/data.htm</td>
<td rowspan=4>GET</td>
<td>XHTML5+RDFa</td>
<td>HTML page containing the embedded pdf.</td>
</tr>
<tr>
<td>{resourceURL}/data.pdf</td>
<td>RDF+XML</td>
<td>RDF XML for the issue</td>
</tr>
<tr>
<td>{resourceURL}/data.rdf</td>
<td>RDF+XML</td>
<td>RDF XML for the issue</td>
</tr>
<tr>
<td>{resourceURL}/data.json</td>
<td>JSON</td>
<td>JSON for the issue</td>
</tr>
</table>

### Content Negotiation ###
<table>
<tr>
<th>Representation URI</th>
<th>Method</th>
<th>Accept header</th>
<th>Response type</th>
</tr>
<tr>
<td rowspan=5>{resourceURL}</td>
<td rowspan=5>GET</td>
<td>application/pdf</td>
<td>PDF</td>
</tr>
<tr>
<td>application/rdf+xml</td>
<td>RDF+XML</td>
</tr>
<tr>
<td>application/json</td>
<td>JSON</td>
</tr>
<tr>
<td>text/html</td>
<td rowspan=2>HTML</td>
</tr>
<tr>
<td>*/*</td>
</tr>
</table>

## Sample Responses ##

### RDF XML ###

### JSON ###