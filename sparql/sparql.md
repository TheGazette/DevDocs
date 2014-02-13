[home](../home.md)
#SPARQL Endpoints#

The data of The Gazette can be queried against by using SPARQL against one of the two endpoints provided.
The main `/sparql` endpoint is populated with data from the modern notices which have been placed in the Gazette (starting from 1998). The `/longitudinal-dataset/sparql` endpoint contains the information derived from indexes of Archive of the Gazette and span a time period from 1900 to 1999.

Useful resources:

- [Sample queries](sample-queries.md)
- [Flint editor on the gazette website](https://www.thegazette.co.uk/flint)
- [Flint SPARQL editor project on github](https://github.com/TSO-Openup/FlintSparqlEditor)


## Resource URL ##

`/sparql`

and

`/longitudinal-dataset/sparql`
### Alternative representations ###
<table>
<tr>
<th>Generic Document URI</th>
<th>Method</th>
<th>Response type</th>
</tr>
<tr>
<td>/sparql<br />/longitudinal-dataset/sparql</td>
<td>GET<br/>or<br/>POST</td>
<td>Various</td>
</tr>

</table>	 


### Content Negotiation ###

The system utilises content negotiation by default. Content negotiation allows an application to request the format of the results it needs as part of the HTTP request.

The available formats are given in the table below:

<table>
<tr>
<th>Generic Document URI</th>
<th>Method</th>
<th>Accept header​</th>
<th>Response type</th>
</tr>
<tr>
<td rowspan=4>/sparql<br />/longitudinal-dataset/sparql</td>
<td rowspan=4>GET<br/>or<br/>POST</td>
<td>application/sparql-results+xml</td>
<td>SPARQL/XML</td>
</tr>
<tr>
<td>application/rdf+xml</td>
<td>RDF/XML</td>
</tr>
<tr>
<td>application/sparql-results+json</td>
<td>JSON</td>
</tr>
<tr>
<td>application/turtle</td>
<td>Turtle</td>
</tr>
</table>	 

- [Details on SPARQL/XML](http://www.w3.org/TR/2007/CR-rdf-sparql-XMLres-20070925/)
- [Details on JSON results](http://www.w3.org/TR/rdf-sparql-json-res/)

## Parameters ##
<table>
<tr>
<td rowspan=2 style="width:12em">query</td>
<td>Contains the text of the SPARQL query<br/>The text needs to be encoded using application/x-www-form-urlencoded format</td>
</tr>
<tr>
<td><b>Example Values:</b> </td>
</tr>
<tr>
<td rowspan=2 style="width:12em">output</td>
<td>desired output format for the response</td>
</tr>
<tr>
<td><b>Valid Values:</b> text, sparql, json, rdfxml, turtle</td>
</tr>
</table>

