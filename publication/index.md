[Home](../home.md)
# The Gazette Issue #
Print versions of the Gazette can be retrieved in pdf format, data about these print editions can also be retrieved in RDF+XML and JSON formats.

Similar resources

- [Single Page](page.md)
- [Supplements](supplement.md)

## Resource URL ##

`/{edition}/issue/{issue-number}`

The following editions exist, the correct parameter follows the title:

- The London Gazette: `london`
- The Edinburgh Gazette: `edinburgh`
- The Belfast Gazette: `belfast`
- The Insolvency Gazette*: `insolvency`
- The Daily Edition*: `all-notices`
- The Wills and Probate Gazette*: `wills-and-probate`

*\* Please note: For the new editions (The Insolvency Gazette, The Daily Edition,The Wills and Probate Gazette) the issue number is the ISO 8601 date of publication in (YYYY-MM-DD).*

<table>
<tr>
<th>Representation URI</th>
<th>Method</th>
<th>Response type</th>
<th>Notes</th>
</tr>
<tr>
<td>/{edition}/issue/{issue-number}<br />/{edition}/issue/{issue-number}/data.pdf</td>
<td>GET</td>
<td>PDF</td>
<td>Complete PDF of the edition.</td>
</tr>
</table>
