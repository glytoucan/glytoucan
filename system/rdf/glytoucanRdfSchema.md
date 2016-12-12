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

This graph is included WURCS RDF.
 

```
@prefix rdf:	<http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs:	<http://www.w3.org/2000/01/rdf-schema#> .
@prefix xsd:	<http://www.w3.org/2001/XMLSchema#> .
@prefix owl:	<http://www.w3.org/2002/07/owl#> .
@prefix glycan:	<http://purl.jp/bio/12/glyco/glycan#> .
@prefix wurcs:	<http://www.glycoinfo.org/glyco/owl/wurcs#> .


<http://rdf.glycoinfo.org/glycan/G21664CH>
	rdf:type	glycan:saccharide ;
	glycan:has_glycosequence	<http://rdf.glycoinfo.org/glycan/G21664CH/wurcs/2.0> .

<http://rdf.glycoinfo.org/glycan/G21664CH/wurcs/2.0>
	rdf:type	glycan:glycosequence ;
	rdfs:label	"WURCS=2.0/5,5,5/[h444h][a2112h-1b_1-5_6*OPO/3O/3=O][a2112h-1a_1-5_2*N][a2112m-1a_1-5_2*NCC/3=O_4*N][a2122h-1b_1-5]/1-2-3-4-5/a1-b1_b3-c1_c4-d1_d3-e1_a5-e6*OPO*/3O/3=O~n"^^xsd:string ;
	owl:sameAs	<http://rdf.glycoinfo.org/glycan/wurcs/2.0/WURCS%3D2.0%2F5%2C5%2C5%2F%5Bh444h%5D%5Ba2112h-1b_1-5_6%2AOPO%2F3O%2F3%3DO%5D%5Ba2112h-1a_1-5_2%2AN%5D%5Ba2112m-1a_1-5_2%2ANCC%2F3%3DO_4%2AN%5D%5Ba2122h-1b_1-5%5D%2F1-2-3-4-5%2Fa1-b1_b3-c1_c4-d1_d3-e1_a5-e6%2AOPO%2A%2F3O%2F3%3DO%7En> ;
	glycan:has_sequence	"WURCS=2.0/5,5,5/[h444h][a2112h-1b_1-5_6*OPO/3O/3=O][a2112h-1a_1-5_2*N][a2112m-1a_1-5_2*NCC/3=O_4*N][a2122h-1b_1-5]/1-2-3-4-5/a1-b1_b3-c1_c4-d1_d3-e1_a5-e6*OPO*/3O/3=O~n"^^xsd:string ;
	glycan:in_carbohydrate_format	glycan:carbohydrate_format_wurcs ;
	wurcs:LIN_count	5 ;
	wurcs:RES_count	5 ;
	wurcs:has_LIN	<http://rdf.glycoinfo.org/glycan/G21664CH/wurcs/2.0/LIN/a5-e6%2AOPO%2A%2F3O%2F3%3DO%7En> ;
	wurcs:has_basetype	<http://rdf.glycoinfo.org/glycan/wurcs/2.0/Basetype/u2112h_2%2AN> ;
	wurcs:has_monosaccharide	<http://rdf.glycoinfo.org/glycan/wurcs/2.0/Monosaccharide/a2122h-1b_1-5> ;
	wurcs:has_root_RES	<http://rdf.glycoinfo.org/glycan/G21664CH/wurcs/2.0/RES/a> ;
	wurcs:has_uniqueRES	<http://rdf.glycoinfo.org/glycan/G21664CH/wurcs/2.0/UniqueRES/1> ;
	wurcs:uniqueRES_count	5 ;
	wurcs:has_root_GRES	<http://rdf.glycoinfo.org/glycan/G21664CH/wurcs/2.0/GRES/1> ;
	wurcs:has_GRES	<http://rdf.glycoinfo.org/glycan/G21664CH/wurcs/2.0/GRES/1> ;
	wurcs:count_RES	5 ;
	wurcs:count_uniqueRES	5 ;
	wurcs:count_LIN	5 .

<http://rdf.glycoinfo.org/glycan/G21664CH/wurcs/2.0/LIN/a5-e6%2AOPO%2A%2F3O%2F3%3DO%7En>
	rdf:type	wurcs:LIN ;
	wurcs:has_GLIPS	<http://rdf.glycoinfo.org/glycan/wurcs/2.0/GLIPS/a5> ;
	wurcs:has_rep_max	-1 ;
	wurcs:has_rep_min	-1 ;
	wurcs:is_repeat	"true"^^xsd:boolean ;
	wurcs:has_MAP	"*OPO*/3O/3=O"^^xsd:string .

<http://rdf.glycoinfo.org/glycan/G21664CH/wurcs/2.0/UniqueRES/1>
	rdf:type	wurcs:UniqueRES ;
	wurcs:is_monosaccharide	<http://rdf.glycoinfo.org/glycan/wurcs/2.0/Monosaccharide/h444h> .

<http://rdf.glycoinfo.org/glycan/G21664CH/wurcs/2.0/RES/a>
	rdf:type	wurcs:RES ;
	wurcs:has_LIN	<http://rdf.glycoinfo.org/glycan/G21664CH/wurcs/2.0/LIN/a5-e6%2AOPO%2A%2F3O%2F3%3DO%7En> ;
	wurcs:is_uniqueRES	<http://rdf.glycoinfo.org/glycan/G21664CH/wurcs/2.0/UniqueRES/1> .

<http://rdf.glycoinfo.org/glycan/G21664CH/wurcs/2.0/GRES/1>
	wurcs:is_monosaccharide	<http://rdf.glycoinfo.org/glycan/wurcs/2.0/Monosaccharide/h444h> ;
	wurcs:is_acceptor_of	<http://rdf.glycoinfo.org/glycan/G21664CH/wurcs/2.0/GLIN/1> ;
	wurcs:is_donor_of	<http://rdf.glycoinfo.org/glycan/G21664CH/wurcs/2.0/GLIN/5> .

<http://rdf.glycoinfo.org/glycan/G21664CH/wurcs/2.0/GLIN/1>
	wurcs:has_MAP	""^^xsd:string .

<http://rdf.glycoinfo.org/glycan/G21664CH/wurcs/2.0/GLIN/5>
	wurcs:has_MAP	"*OPO*/3O/3=O"^^xsd:string .

```

### GRAPH `<http://rdf.glytoucan.org/sequence/glycoct>`  
### GRAPH `<http://rdf.glytoucan.org/sequence/iupac_condensed>`
### GRAPH `<http://rdf.glytoucan.org/sequence/iupac_extended>`
### GRAPH `<http://rdf.glytoucan.org/mass>`	
### GRAPH `<http://rdf.glytoucan.org/motif>`	
### GRAPH `<http://rdf.glytoucan.org/ms/carbbank>`	

### GRAPH `<http://rdf.glytoucan.org/topology>`








