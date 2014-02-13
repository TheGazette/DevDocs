[home](../home.md)
# Sample SPARQL queries#

Useful resources:

- [SPARQL endpoint documentation](sparql.md)
- [Flint editor on the gazette website](https://www.thegazette.co.uk/flint)
- [Flint SPARQL editor project on github](https://github.com/TSO-Openup/FlintSparqlEditor)


## Main Dataset##
	
	PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
	PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
	PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
	PREFIX gaz: <https://www.thegazette.co.uk/def/publication#>
	
	SELECT ?n WHERE {
		?n a gaz:Notice ;
		gaz:hasPublicationDate "2009-09-01"^^xsd:date ;
		gaz:hasNoticeCode "2450"^^xsd:integer
	}
	LIMIT 100

### Provenance ###
	PREFIX gaz: <https://www.thegazette.co.uk/def/publication#>
	PREFIX prov: <http://www.w3.org/ns/prov#>
	PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
	
	SELECT ?act ?act_label ?start ?end ?agent1 ?agent1Label ?agent2 ?agent2Label ?agent3 ?agent3Label ?entity ?entityLabel
	FROM <https://www.thegazette.co.uk/id/notice/17880/provenance>
	WHERE {
		?act a prov:Activity ;
		rdfs:label ?act_label .
		optional { ?act prov:startedAtTime ?start }
		optional { ?act prov:endedAtTime ?end }
		optional {
			?act prov:wasAssociatedWith ?agent1 .
			optional { ?agent1 rdfs:label ?agent1Label }
			optional {
				?agent1 prov:actedOnBehalfOf ?agent2 .
					optional { ?agent2 rdfs:label ?agent2Label }
					optional { ?agent2 prov:actedOnBehalfOf ?agent3 .
						optional{ ?agent3 rdfs:label ?agent3Label }
					}
	     		}
			}
		optional { ?entity prov:wasGeneratedBy ?act .
			optional { ?entity rdfs:label ?entityLabel }
		}
	}

## Logitudinal Dataset (Archive)##

	PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
	PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
	PREFIX index: <https://www.thegazette.co.uk/def/index#>
	PREFIX surname: <https://www.thegazette.co.uk/id/surname/>
	
	SELECT ?year ?category ?forenames ?text ?title WHERE {
	   	?entry 
      	index:hasSurname surname:wilton ;
      	index:isInIndex ?index ;
      	index:grouping1 [ rdfs:label ?category ] ;
      	index:hasForenames ?forenames .
		optional { ?entry index:entryText ?text } 
	   	optional { ?entry index:title ?title }
		?index index:year ?year .
	  	 FILTER (?year >= "1900" && ?year <= "1930")
	}
	ORDER BY ?forenames
	LIMIT 100
