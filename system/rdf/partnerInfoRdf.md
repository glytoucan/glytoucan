---
title: Partner info RDF
authors:
- Daisuke Shinmachi
date: 2016-07-26
layout: default
---

## Partner Info RDF

**Data model**

```
@prefix rdfs:   <http://www.w3.org/2000/01/rdf-schema#> .
@prefix dcterms: <http://purl.org/dc/terms/> .

<Partner>
	a glytoucan:Partner
	rdfs:label “Partner name”
	rdfs:seeAlso <Partner web URL>
	dcterms:description “partner’s description”@en
	glycan:has_url_template "URL template string"^^xsd:string
	dcterms:identifier "lowercase of label"

```


**Triple**

GRAPH name : <http://rdf.glytoucan.org/partner>

```
@prefix rdfs:   <http://www.w3.org/2000/01/rdf-schema#> .
@prefix dcterms: <http://purl.org/dc/terms/> .

<http://rdf.glytoucan.org/partner/bcsdb>
    a   glytoucan:Partner ;
    dcterms:description "The Bacterial Carbohydrate Structure DataBase (BCSDB) provides structural, bibliographic, taxonomic, NMR spectroscopic and other information on bacterial carbohydrates."@en ; 
    rdfs:seeAlso  <http://csdb.glycoscience.ru/bacterial/> ;
    glycan:has_url_template "http://csdb.glycoscience.ru/bacterial/core/search_id.php?mode=record&id_list=[?id?]"^^xsd:string ;
    dcterms:identifier "bcsdb" ;
    rdfs:label "BCSDB".

<http://rdf.glytoucan.org/partner/glycome-db>
    a   glytoucan:Partner ;
    dcterms:description "GlycomeDB is a database of carbohydrates including structural and taxonomic data."@en ;
    rdfs:seeAlso <http://www.glycome-db.org/> ;
    glycan:has_url_template "http://www.glycome-db.org/database/showStructure.action?glycomeId=[?id?]"^^xsd:string ;
    dcterms:identifier "glycome-db" ;
    rdfs:label "GlycomeDB".

<http://rdf.glytoucan.org/partner/glycoepitope>
    a   glytoucan:Partner ;
    dcterms:description "GlycoEpitope is a database containing useful information about carbohydrate antigens (glyco-epitopes) and the antibodies (polyclonal or monoclonal) that can be used to analyze their expression."@en ;
    rdfs:seeAlso <http://identifiers.org/glycoepitope/> ;
    glycan:has_url_template "http://identifiers.org/glycoepitope/[?id?]"^^xsd:string ;
    dcterms:identifier "glycoepitope" ;
    rdfs:label "GlycoEpitope".

<http://rdf.glytoucan.org/partner/glyconavi>
    a   glytoucan:Partner ;
    dcterms:description "GlycoNAVI is a gateway to free suite of carbohydrate research tools."@en ;
    rdfs:seeAlso <http://ws.glyconavi.org/> ;
    glycan:has_url_template "http://ws.glyconavi.org/DbDetail/moldetail.aspx?moleculeID=[?id?]"^^xsd:string ;
    dcterms:identifier "glyconavi" ;
    rdfs:label "GlycoNAVI".

<http://rdf.glytoucan.org/partner/unicarbkb>
    a   glytoucan:Partner ;
    dcterms:description "The UniCarb KnowledgeBase (UniCarbKB) offers public access to a growing, curated database of information on the glycan structures of glycoproteins."@en ; 
    rdfs:seeAlso  <http://www.unicarbkb.org/> ;
    glycan:has_url_template "http://www.unicarbkb.org/structure/[?id?]"^^xsd:string ;
    dcterms:identifier "unicarbkb" ;
    rdfs:label "UniCarbKB".

<http://rdf.glytoucan.org/partner/unicarb-db>
    a   glytoucan:Partner ;
    dcterms:description " UniCarb-DB is a platform for presenting glycan structures and fragment data characterised by LC-MS/MS strategies."@en ; 
    rdfs:seeAlso  <http://unicarb-db.biomedicine.gu.se/> ;
    glycan:has_url_template "http://unicarb-db.biomedicine.gu.se/msData/[?id?]"^^xsd:string ;
    dcterms:identifier "unicarb-db" ;
    rdfs:label "UniCarb-DB".
```



-------

>> following old plan

* a partner name
* a partner web url
* description of a partner
* stanza name that is developed by a partner
* stanza type what kinds of stanza
* stanza url that is imported to entry page


**Data model**

```
<Partner>
	a glytoucan:Partner
	rdfs:label “Partner name”
	rdfs:seeAlso <Partner web URL>
	dcterms:description “partner’s description”
	glytoucan:has_stanza <Partner stanza>

<Partner stanza>
	a glytoucan:Stanza
	glytoucan:has_type “type of the stanza”
	rdfs:seeAlso </stana/{stanza-name}/help.html>
	glytoucan:has_import_url </stanza/{stanza-name}/>
```