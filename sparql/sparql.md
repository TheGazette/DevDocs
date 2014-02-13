[home](../home.md)
#SPARQL Endpoints#

The data of The Gazette can be queried against by using SPARQL against one of the two endpoints provided.
The main `/sparql` endpoint is populated with data from the modern notices which have been placed in the Gazette (19xx --> current day). The `/longitudinal-dataset/sparql` endpoint contains the information derived from indexes and supplements from the Archive of the Gazette and span a time period from xxxx to xxxx.

Useful resources:

- [sample queries](sample-queries.md)
- [Flint editor on the gazette website](https://www.thegazette.co.uk/flint)
- [Flint SPARQL editor project on github](https://github.com/TSO-Openup/FlintSparqlEditor)



## Resource URL ##

`/sparql`

and

`/longitudinal-dataset/sparql`

## Parameters ##
<table>
<tr>
<td rowspan=2 style="width:12em">query</td>
<td>SPARQL query url encoded</td>
</tr>
<tr>
<td><b>Example Values:</b> </td>
</tr>
<tr>
<td rowspan=2 style="width:12em">output</td>
<td>desired output format for the response</td>
</tr>
<tr>
<td><b>Example Values:</b> </td>
</tr>
</table>