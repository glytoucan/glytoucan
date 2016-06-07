---
title: Partner metadata RDF
authors:
- Daisuke Shinmachi
date: 2016-04-20
layout: default
---


## Partner metadata RDF

**Triple**

```
@prefix rdfs:   <http://www.w3.org/2000/01/rdf-schema#> .
@prefix dcterms: <http://purl.org/dc/terms/>

<http://rdf.glytoucan.org/partner/bcsdb>
    a   glytoucan:Partner ;
    dcterms:description "The Bacterial Carbohydrate Structure DataBase (BCSDB) provides structural, bibliographic, taxonomic, NMR spectroscopic and other information on bacterial carbohydrates."@en ; 
    rdfs:seeAlso  <http://csdb.glycoscience.ru/bacterial/> ;
    rdfs:label "BCSDB".

<http://rdf.glytoucan.org/partner/glycome-db>
    a   glytoucan:Partner ;
    dcterms:description "GlycomeDB is a database of carbohydrates including structural and taxonomic data."@en ;
    rdfs:seeAlso <http://www.glycome-db.org/> ;
    rdfs:label "GlycomeDB".

<http://rdf.glytoucan.org/partner/glycoepitope>
    a   glytoucan:Partner ;
    dcterms:description "GlycoEpitope is a database containing useful information about carbohydrate antigens (glyco-epitopes) and the antibodies (polyclonal or monoclonal) that can be used to analyze their expression."@en ;
    rdfs:seeAlso <http://identifiers.org/glycoepitope/> ;
    rdfs:label "GlycoEpitope".

<http://rdf.glytoucan.org/partner/glyconavi>
    a   glytoucan:Partner ;
    dcterms:description "GlycoNAVI is a gateway to free suite of carbohydrate research tools."@en ;
    rdfs:seeAlso <http://ws.glyconavi.org/> ;
    rdfs:label "GlycoNAVI".
```


**Insert query**

```
log_enable(2,1);
sparql
PREFIX rdfs:    <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX dcterms: <http://purl.org/dc/terms/>
INSERT DATA{
        GRAPH <http://rdf.glytoucan.org/partner> {

        <http://rdf.glytoucan.org/partner/bcsdb>
            a   glytoucan:Partner ;
            dcterms:description "The Bacterial Carbohydrate Structure DataBase (BCSDB) provides structural, bibliographic, taxonomic, NMR spectroscopic and other information on bacterial carbohydrates."@en ; 
            rdfs:seeAlso  <http://csdb.glycoscience.ru/bacterial/> ;
            rdfs:label "BCSDB".

        <http://rdf.glytoucan.org/partner/glycome-db>
            a   glytoucan:Partner ;
            dcterms:description "GlycomeDB is a database of carbohydrates including structural and taxonomic data."@en ;
            rdfs:seeAlso <http://www.glycome-db.org/> ;
            rdfs:label "GlycomeDB".

        <http://rdf.glytoucan.org/partner/glycoepitope>
            a   glytoucan:Partner ;
            dcterms:description "GlycoEpitope is a database containing useful information about carbohydrate antigens (glyco-epitopes) and the antibodies (polyclonal or monoclonal) that can be used to analyze their expression."@en ;
            rdfs:seeAlso <http://identifiers.org/glycoepitope/> ;
            rdfs:label "GlycoEpitope".

        <http://rdf.glytoucan.org/partner/glyconavi>
            a   glytoucan:Partner ;
            dcterms:description "GlycoNAVI is a gateway to free suite of carbohydrate research tools."@en ;
            rdfs:seeAlso <http://ws.glyconavi.org/> ;
            rdfs:label "GlycoNAVI".
        }
};
checkpoint;
commit WORK;
```


**Clear graph**

```
log_enable(2,1);
sparql clear graph <http://rdf.glytoucan.org/partner>;
```
