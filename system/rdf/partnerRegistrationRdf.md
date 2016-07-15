---
title: Partner registration RDF
authors:
- Daisuke Shinmachi
date: 2016-06-30s
layout: default
---


## Partner Registration RDF

**Input data**

* Partner name
* Contributor ID (contributor is member of partner)
* Description (explain the partner)
* URL (accessable page of the partner)


```
<http://rdf.glytoucan.org/partner/{partner_name}>
    a   glytoucan:Partner ;
    rdfs:label	"{partner_name}"@en;
    dcterms:description "{explain partner}"@en;
    foaf:member <http://rdf.glycoinfo.org/glytoucan/contributor/userId/{contributor_id}>
    rdfs:seeAlso <{partner_url}>.

# /user
<http://rdf.glycoinfo.org/glytoucan/contributor/userId/{contributor_id}> 	
	foaf:Person;
	foaf:name 	"{contributor_name}"^^xsd:string;
	dcterms:identifier	"{contributro_id}"^^xsd:int.

```



