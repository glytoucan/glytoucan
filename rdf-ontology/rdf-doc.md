---
title: GlyTouCan RDF
authors:
- Akihiro Fujita
- Daisuke Shinmachi
- Kiyoko Aoki-Kinoshita
- Issaku Yamada
date: 2018-01-25
layout: rdf-docs
last_modified_at: 2021-12-24
---


<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Ontology](#ontology)
- [GRAPHs](#graphs)
  - [Graph list](#graph-list)
  - [Core graph](#core-graph)
  - [Archive graph](#archive-graph)
  - [WURCS graph](#wurcs-graph)
  - [GlycoCT graph](#glycoct-graph)

<!-- /TOC -->



# Ontology 

Prefix     |  Namespace 
--|---
rdf        | `http://www.w3.org/1999/02/22-rdf-syntax-ns#`
rdfs       | `http://www.w3.org/2000/01/rdf-schema#`  
owl        | `http://www.w3.org/2002/07/owl#`  
xsd        | `http://www.w3.org/2001/XMLSchema#`  
foaf       | `http://xmlns.com/foaf/0.1/`  
bibo       | `http://purl.org/ontology/bibo/`  
glycan     | `http://purl.jp/bio/12/glyco/glycan#`  
glytoucan  | `http://www.glytoucan.org/glyco/owl/glytoucan#`  
wurcs      | `http://www.glycoinfo.org/glyco/owl/wurcs#`  


# GRAPHs

The GlyTouCan RDF consists of multiple Named GRAPHs.

## Graph list 

Graph Name             | URI                                       | description
--|---|--
Core graph             | http://rdf.glytoucan.org/core             | GlyTouCan accession number and a submitted date
WURCS sequence graph   | http://rdf.glytoucan.org/sequence/wurcs   | WURCS sequence data
GlycoCT sequence graph | http://rdf.glytoucan.org/sequence/glycoct | GlycoCT sequence data
Archive graph          | http://rdf.glytoucan.org/archive          | Archived glyTouCan accession number  

## Core graph
### URI : `http://rdf.glytoucan.org/core`
### Scheme diagram
![](/images/rdf_doc/core-w.png)
### Triple

```turtle
@prefix rdf:          <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs:         <http://www.w3.org/2000/01/rdf-schema#> .
@prefix glycan:       <http://purl.jp/bio/12/glyco/glycan#> .
@prefix glytoucan:    <http://www.glytoucan.org/glyco/owl/glytoucan#> .

<http://rdf.glycoinfo.org/glycan/G19529BG>
    rdf:type                   glycan:saccharide;
    glycan:has_resource_entry  <http://rdf.glycoinfo.org/resource-entry/G19529BG>;
    glytoucan:has_primary_id   G19529BG.

<http://rdf.glycoinfo.org/resource-entry/G19529BG>
    rdf:type                   glycan:resource_entry;
    rdfs:seeAlso               <http://glytoucan.org/Structures/Glycans/G19529BG>;
    glytoucan:date_registered  2014-10-31 16:00:57.41;
```
## Archive Graph
Archived entries are included in the archive graph.  
### URI : `http://rdf.glytoucan.org/archive`
### Scheme diagram
![](/images/rdf_doc/archive.png)
### Triple

```turtle
@prefix rdf:          <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs:         <http://www.w3.org/2000/01/rdf-schema#> .
@prefix glycan:       <http://purl.jp/bio/12/glyco/glycan#> .
@prefix glytoucan:    <http://www.glytoucan.org/glyco/owl/glytoucan#> .

<http://rdf.glycoinfo.org/glycan/G68622UR>
    rdf:type      glycan:saccharide;
    rdfs:comment	"Duplication of WURCSs"
    rdfs:seeAlso	<https://glytoucan.org/Structures/Glycans/G88485AW>
    glytoucan:has_primary_id	G68622UR
```

## WURCS graph
### URI : `http://rdf.glytoucan.org/sequence/wurcs`
### RDF Schema
![](/images/rdf_doc/core-w.png)
### RDF (turtle format)
```turtle
@prefix rdf:	<http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix glycan:	<http://purl.jp/bio/12/glyco/glycan#> .

<http://rdf.glycoinfo.org/glycan/G17266GE>
    glycan:has_glycosequence <http://rdf.glycoinfo.org/glycan/G17266GE/wurcs/2.0> .

<http://rdf.glycoinfo.org/glycan/G17266GE/wurcs/2.0>
    rdf:type	glycan:glycosequence ;
    glycan:has_sequence	"WURCS=2.0/4,7,6/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a1122h-1b_1-5][a1122h-1a_1-5]/1-2-1-2-3-4-2/a3-b1_a4-c1_a6-g1_c3-d1_c4-e1_e3-f1"^^xsd:string ;
    glycan:in_carbohydrate_format	glycan:carbohydrate_format_wurcs ;
```

## GlycoCT graph
### URI : `http://rdf.glytoucan.org/sequence/glycoct`
### RDF Schema
![](/images/rdf_doc/core-ct.png)
### RDF (turtle format)

```turtle
@prefix rdf:	<http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix glycan:	<http://purl.jp/bio/12/glyco/glycan#> .

<http://rdf.glycoinfo.org/glycan/G35898DT>
  glycan:has_glycosequence  <http://rdf.glycoinfo.org/glycan/G35898DT/glycoct> .

<http://rdf.glycoinfo.org/glycan/G35898DT/glycoct>
		glycan:has_sequence  "RES\n1b:a-dgal-HEX-1:5\n2s:n-acetyl\n3b:b-dgal-HEX-1:5\n4b:b-dglc-HEX-1:5\n5s:n-acetyl\n6b:b-dgal-HEX-1:5\n7b:a-lgal-HEX-1:5|6:d\n8b:b-dglc-HEX-1:5\n9s:n-acetyl\n10b:b-dglc-HEX-1:5\n11s:n-acetyl\n12b:b-dgal-HEX-1:5\n13b:a-lgal-HEX-1:5|6:d\nLIN\n1:1d(2+1)2n\n2:1o(3+1)3d\n3:3o(3+1)4d\n4:4d(2+1)5n\n5:4o(4+1)6d\n6:6o(2+1)7d\n7:3o(6+1)8d\n8:8d(2+1)9n\n9:1o(6+1)10d\n10:10d(2+1)11n\n11:10o(4+1)12d\n12:12o(2+1)13d"^^xsd:string ;
		glycan:carbohydrate_format_glycoct .
```

## Example of SPARQL query for listing valid data in GlyTouCan

```Sparql
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>

SELECT DISTINCT *
WHERE {
  GRAPH <http://rdf.glytoucan.org/core> {
    ?Saccharide a ?SaClass .
    ?Saccharide glytoucan:has_primary_id ?AccNum .
    ?Saccharide glycan:has_resource_entry ?ResEntry .

    ?ResEntry a ?ResEntryClass .
    ?ResEntry glytoucan:date_registered ?Date .
    ?ResEntry glycan:in_glycan_database ?DB .
    ?ResEntry rdfs:seeAlso ?GlyTouCanURL .
  }
  GRAPH <http://rdf.glytoucan.org/sequence/wurcs> {
    optional {
      ?Saccharide glycan:has_glycosequence ?GSeq .
      ?GSeq a ?GSClass.
      ?GSeq glycan:has_sequence ?WurcsSeq.
      ?GSeq glycan:in_carbohydrate_format ?formatW .
    }
  }
  GRAPH <http://rdf.glytoucan.org/sequence/glycoct> {
    optional {
      ?Saccharide glycan:has_glycosequence ?GSeqCt .
      ?GSeqCt glycan:has_sequence ?CtSeq .
      ?GSeqCt glycan:in_carbohydrate_format ?FormatCT .
    }
  }
  FILTER NOT EXISTS {
   GRAPH <http://rdf.glytoucan.org/archive> {
     ?Saccharide rdf:type ?ArchiveSaccharide
   }
 }
}
```
[=> Run query](https://ts.glytoucan.org/sparql?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+dcterms%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0APREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A++%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0A%0D%0ASELECT+DISTINCT+*%0D%0AWHERE+%7B%0D%0A++GRAPH+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fcore%3E+%7B%0D%0A++++%3FSaccharide+a+%3FSaClass+.%0D%0A++++%3FSaccharide+glytoucan%3Ahas_primary_id+%3FAccNum+.%0D%0A++++%3FSaccharide+glycan%3Ahas_resource_entry+%3FResEntry+.%0D%0A%0D%0A++++%3FResEntry+a+%3FResEntryClass+.%0D%0A++++%3FResEntry+glytoucan%3Adate_registered+%3FDate+.%0D%0A++++%3FResEntry+glycan%3Ain_glycan_database+%3FDB+.%0D%0A++++%3FResEntry+rdfs%3AseeAlso+%3FGlyTouCanURL+.%0D%0A++%7D%0D%0A++GRAPH+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fsequence%2Fwurcs%3E+%7B%0D%0A++++optional+%7B%0D%0A++++++%3FSaccharide+glycan%3Ahas_glycosequence+%3FGSeq+.%0D%0A++++++%3FGSeq+a+%3FGSClass.%0D%0A++++++%3FGSeq+glycan%3Ahas_sequence+%3FWurcsSeq.%0D%0A++++++%3FGSeq+glycan%3Ain_carbohydrate_format+%3FformatW+.%0D%0A++++%7D%0D%0A++%7D%0D%0A++GRAPH+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fsequence%2Fglycoct%3E+%7B%0D%0A++++optional+%7B%0D%0A++++++%3FSaccharide+glycan%3Ahas_glycosequence+%3FGSeqCt+.%0D%0A++++++%3FGSeqCt+glycan%3Ahas_sequence+%3FCtSeq+.%0D%0A++++++%3FGSeqCt+glycan%3Ain_carbohydrate_format+%3FFormatCT+.%0D%0A++++%7D%0D%0A++%7D%0D%0A++FILTER+NOT+EXISTS+%7B%0D%0A+++GRAPH+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Farchive%3E+%7B%0D%0A+++++%3FSaccharide+rdf%3Atype+%3FArchiveSaccharide%0D%0A+++%7D%0D%0A+%7D%0D%0A%7D%0D%0A&render=HTML&limit=25&offset=0#loadstar-results-section)

## Partner Graph
SPARQL query for listing all the GlyTouCan Partner graphs.

```Sparql
SELECT DISTINCT(?g) 
WHERE {
    GRAPH ?g {
        ?s ?p ?o
    }
    FILTER regex(str(?g), "^http://rdf.glytoucan.org/partner/") 
}
ORDER BY ?g
```
[=> Run query](https://ts.glytoucan.org/sparql?query=SELECT+DISTINCT%28%3Fg%29+%0D%0AWHERE+%7B%0D%0A++++GRAPH+%3Fg+%7B%0D%0A++++++++%3Fs+%3Fp+%3Fo%0D%0A++++%7D%0D%0A++++FILTER+regex%28str%28%3Fg%29%2C+%22%5Ehttp%3A%2F%2Frdf.glytoucan.org%2Fpartner%2F%22%29+%0D%0A%7D%0D%0AORDER+BY+%3Fg&render=HTML&limit=25&offset=0#loadstar-results-section)
