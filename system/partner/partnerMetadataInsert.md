---
title: Partner metadata insert
authors:
- Daisuke Shinmachi
date: 2016-07-07
layout: default
---


## Partner metadata insert

**Input data**

* Partner name
* Description (explain the partner)
* URL (accessable web page of the partner)
* URL template (a URL that remove the id from entry page URL)

```
@prefix rdfs:   <http://www.w3.org/2000/01/rdf-schema#> .
@prefix dcterms: <http://purl.org/dc/terms/> .
@prefix glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#> .

<http://rdf.glytoucan.org/partner/{partner_name}>
    a   glytoucan:Partner ;
    rdfs:label  "{partner_name}"@en;
    dcterms:description "{description}"@en ; 
    glytoucan:has_url_template "url_template"^^xsd:string;
    rdfs:seeAlso <{partner_url}>.

```


**Output insert query**


```
log_enable(2,1);
sparql
PREFIX rdfs:    <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIC glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#> 
INSERT DATA{
        GRAPH <http://rdf.glytoucan.org/partner> {
        <http://rdf.glytoucan.org/partner/{partner_name}>
            a   glytoucan:Partner ;
            rdfs:label  "{partner_name}"@en;
            dcterms:description "{description}"@en ; 
            glytoucan:has_url_template "url_template"^^xsd:string;
            rdfs:seeAlso <{partner_url}>.
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

**Sample RDF**

* e.g. UniCarbKB

```
@prefix rdfs:   <http://www.w3.org/2000/01/rdf-schema#> .
@prefix dcterms: <http://purl.org/dc/terms/> .
@prefix glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#> .

<http://rdf.glytoucan.org/partner/unicarbkb>
    a   glytoucan:Partner ;
    dcterms:description "The UniCarb KnowledgeBase (UniCarbKB) offers public access to a growing, curated database of information on the glycan structures of glycoproteins."@en ; 
    rdfs:seeAlso  http://www.unicarbkb.org/> ;
    glytoucan:has_url_template  "http://www.unicarbkb.org/structure/"^^xsd:string ;
    rdfs:label "UniCarbKB".
```
