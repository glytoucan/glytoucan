---
title: Insert SPARQL for Partner 
author:
- Daisuke Shinmachi
date: 2016-06-22
layout: default
---


# GlycoNAVI 

**Clear GRAPH**

```
log_enable(2,1);
sparql clear graph <http://rdf.glytoucan.org/partner/glyconavi>;
```


**Resource entry (PubChem SID, PubChem CID)**


```
log_enable(2,1);
sparql
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>

INSERT{
    GRAPH <http://rdf.glytoucan.org/partner/glyconavi>{
        ?saccharide glycan:has_resource_entry ?rEntry_iri.
        ?rEntry_iri a glycan:Resource_entry.
        ?rEntry_iri rdfs:label "PubChem SID".
        ?rEntry_iri glycan:in_glycan_database glycan:Database_pubchem.
        ?rEntry_iri dcterms:identifier ?sid.
        ?rEntry_iri rdfs:seeAlso ?sid_url.
        ?rEntry_iri skos:exactMatch ?sid_url.
        glycan:Database_pubchem rdfs:label "PubChem".
        }
}
FROM <http://rdf.glytoucan.org>
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glycoinfo.org/mapping/glytoucan/pubchem>
WHERE{
        #VALUES ?AccessionNumber {"#{acc}"}
        ?saccharide glytoucan:has_primary_id ?AccessionNumber .
        ?saccharide glycan:has_resource_entry ?rEntry_iri .

        ?rEntry_iri skos:exactMatch ?sid_url .
        ?rEntry_iri dcterms:identifier ?sid .
};
checkpoint;
commit WORK;


log_enable(2,1);
sparql
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>

INSERT{
    GRAPH <http://rdf.glytoucan.org/partner/glyconavi>{
        ?saccharide glycan:has_resource_entry ?rEntry_iri.
        ?rEntry_iri a glycan:Resource_entry.
        ?rEntry_iri rdfs:label "PubChem CID".
        ?rEntry_iri glycan:in_glycan_database glycan:Database_pubchem.
        ?rEntry_iri dcterms:identifier ?cid.
        ?rEntry_iri rdfs:seeAlso ?cid_url.
        ?rEntry_iri skos:closeMatch ?cid_url .
    }
}
FROM <http://rdf.glytoucan.org>
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glycoinfo.org/mapping/glytoucan/pubchem>
WHERE{
        #VALUES ?AccessionNumber {"#{acc}"}
        ?saccharide glytoucan:has_primary_id ?AccessionNumber .
        ?saccharide glycan:has_resource_entry ?rEntry_iri .

        ?rEntry_iri skos:closeMatch ?cid_url .
        ?rEntry_iri dcterms:identifier ?cid .
};
checkpoint;
commit WORK;
```