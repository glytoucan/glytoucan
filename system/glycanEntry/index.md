---
title: Glycan Entry Development
authors:
- Daisuke Shinmachi
date: 2016-05-31
layout: default
---

## Specifications


**What's layout of the new entry page?**

* [Layout](https://docs.google.com/presentation/d/1XKVUXP9NAnoNpALcDc66LCQGWMkW3Wa0_NegOimevT4/edit#slide=id.g1292ea5b4c_0_196)


**What's contents of the entry?**

1. Structure (image)
1. Computed Descriptors
	1. WURCS
	1. GlycoCT
	1. IUPAC
1. Species
1. Literature
1. External ID



**Species**

* using taxonomy data  
	* BCSDB, GlycoEpitope, GlycomeDB
* add NCBI taxon link to taxon name
* using taxonomy ontology from DDBJ
	* this ontology including taxon name
* indicate partner name
	* click a partner name, display a partner info

**Literature**

* using pubmed data
	* BCSDB, GlycoEpitope
* using pubmed RESTfull service
	* this service be used for get title of article
* indicate partner name
	* click a partner name, display a partner info


**External ID**

* using database id and URL of entry page
* Kinds of database 
	* first step
		* BCSDB, GlycoEpitope, PubChem(from GlycoNAVI), GlycomeDB
	* second step
		* JCGGDB(from GlycomeDB), PDBj(from GlycomeDB) 
* indicate partner name
	* click a partner name, display a partner info





**What's the data for contents?**

**Partner RDF**

* This rdf include taxonomy, pubmed, external id data from external database
* [Partner RDF document](/system/rdf/partnerRdf)


**Partner Metadata RDF**

* This rdf include partner GRAPH name to indicate origination of the data
* [Partner Metadata RDF documment](/system/rdf/partnerMetadataRdf)







## How to make the contents data?

1. using insert query
	1. [partner RDF insert query](/system/sparql/partnerRdfInsertQuery)
	1. [partner metadata RDF insert query](/system/rfd/partnerMetadataRdf)
1. confirm the RDF dataset using sparql query
	1. [confirm query](/system/glycanEntry/sparql)




