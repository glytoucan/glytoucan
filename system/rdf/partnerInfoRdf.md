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
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .
@prefix dcterms: <http://purl.org/dc/terms/> .
@prefix glycan:	<http://purl.jp/bio/12/glyco/glycan#> .
@prefix glytoucan:	<http://www.glytoucan.org/glyco/owl/glytoucan#> .

<Partner>
	a glytoucan:Partner
	rdfs:label “Partner name”
	rdfs:seeAlso <Partner web URL>
	dcterms:description “partner’s description”@en
	glycan:has_url_template "URL template string"^^xsd:string
	dcterms:identifier "lowercase of label"

```


**Triple**

GRAPH name : `<http://rdf.glytoucan.org/partner>`

[PartnerInfo TTL](https://raw.githubusercontent.com/glytoucan/partner-info-rdf-data/master/PartnerInfo.ttl)


**Clear graph**

```
log_enable(2,1);
sparql clear graph <http://rdf.glytoucan.org/partner>;
```





-------

>> following My old plan

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