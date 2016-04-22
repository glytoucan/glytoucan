---
title: Glycan Entry Development
authors:
- Daisuke Shinmachi
date: 2016-04-22
layout: default
---

## Workflow

1. What's layout of the new entry page?
	1. [Layout](https://docs.google.com/presentation/d/1XKVUXP9NAnoNpALcDc66LCQGWMkW3Wa0_NegOimevT4/edit#slide=id.g1292ea5b4c_0_196)
1. What's contents of the entry?
	1. Structure (image)
	1. Computed Descriptors
		1. WURCS
		1. GlycoCT
	1. Species
	1. Literature
	1. External ID
1. What's the contents that need to preparation of RDF?
	1. Species
		1. using taxonomy data
	1. Literature
		1. using pubmed data
	1. External ID
		1. using database id and URL of entry page
1. What's the data for contents?
	1. **Partner RDF**
		1. this rdf include taxonomy, pubmed, external id data from external database
	1. **GRAPH RDF**
		1. this rdf include GRAPH name to indicate origination of the data
1. Preparation of RDF
	1. [Partner RDF document](/system/rdf/partnerRdf)
	1. [GRAPH RDF documment](/system/rdf/graphRdf)



## How to make the contents data?

1. using insert query
	1. [partner RDF insert query](/system/sparql/partnerRdfInsertQuery)
	1. [graph RDF insert query](/system/rfd/graphRdf)
1. confirm the RDF dataset using sparql query
	1. [sparql query](/system/glycanEntry/sparql)




