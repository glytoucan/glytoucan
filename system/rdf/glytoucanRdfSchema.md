---
title: GlyTouCan RDF schema
authors:
- Daisuke Shinmachi
date: 2016-09-22
layout: default
---

# GlyTouCan RDF schema

Edited: 9/27/2016

GlyTouCan RDF using several classes which in GlycoRDF ontology.

PREFIX glycan:	http://purl.jp/bio/12/glyco/glycan# 

1. glycan:saccharide
1. glycan:resouece_entry
1. glycan:glycosequence
1. glycan:glycan_motif
1. glycan:component
1. glycan:monosaccharide


### GRAPH: `<http://rdf.glytoucan.org/core>`  

* glycan:saccharide
* glycan:resouece_entry

```
@prefix rdf:	<http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix glycan:	<http://purl.jp/bio/12/glyco/glycan#> .
@prefix rdfs:	<http://www.w3.org/2000/01/rdf-schema#> .
@prefix dcterms:	<http://purl.org/dc/terms/> .
@prefix glytoucan:	<http://www.glytoucan.org/glyco/owl/glytoucan#> .
@prefix xsd:	<http://www.w3.org/2001/XMLSchema#> .

<http://rdf.glycoinfo.org/glycan/G04563PI>
	rdf:type	glycan:saccharide ;
	glycan:has_resource_entry	<http://rdf.glycoinfo.org/resource-entry/G04563PI> ;
	glytoucan:has_primary_id	"G04563PI" .
	
<http://rdf.glycoinfo.org/resource-entry/G04563PI>
	rdf:type	glycan:resource_entry .

<http://rdf.glycoinfo.org/resource-entry/G04563PI>
	rdfs:seeAlso	<https://glytoucan.org/Structures/Glycans/G04563PI> .

<http://rdf.glycoinfo.org/resource-entry/G04563PI>
	dcterms:identifier	"G04563PI" .

<http://rdf.glycoinfo.org/resource-entry/G04563PI>
	glycan:in_glycan_database	glytoucan:database_glytoucan .

<http://rdf.glycoinfo.org/resource-entry/G04563PI>
	glytoucan:date_registered	"2015-10-08 16:23:49.714"^^xsd:dateTimeStamp ;
	glytoucan:contributor	<http://rdf.glycoinfo.org/glytoucan/contributor/userId/5854> .


```

### GRAPH `<http://rdf.glytoucan.org/sequence/wurcs>`
### GRAPH `<http://rdf.glytoucan.org/sequence/glycoct>`  
### GRAPH `<http://rdf.glytoucan.org/sequence/iupac_condensed>`
### GRAPH `<http://rdf.glytoucan.org/sequence/iupac_extended>`
### GRAPH `<http://rdf.glytoucan.org/topology>`

### GRAPH `<http://rdf.glytoucan.org/mass>`	
### GRAPH `<http://rdf.glytoucan.org/motif>`	
### GRAPH `<http://rdf.glytoucan.org/ms/carbbank>`	








