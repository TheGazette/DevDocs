[home](../home.md)
#The Gazette Supplement #
Print versions of the Gazette can be retrieved in pdf format, data about these print editions can also be retrieved in RDF+XML and JSON formats.

Similar resources

- [Single Page](page.md)
- [Supplements](supplement.md)
- [Indexes](index.md)


## Resource URL ##

`/{edition}/issue/{issue-number}/supplement`

Suppplements exist for the following editions, the correct parameter follows the title:

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

### RDF XML ###

### JSON ###