---
title: Insert SPARQL for Partner 
author:
- Daisuke Shinmachi
date: 2016-06-22
layout: default
---

# GlycoEpitope 

**Clear GRAPH**

```
log_enable(2,1);
sparql clear graph <http://rdf.glytoucan.org/partner/glycoepitope>;
```

**Source, Article & Resource entry**

```
log_enable(2,1);
sparql
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX bibo: <http://purl.org/ontology/bibo/>
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX glycoepitope: <http://www.glycoepitope.ac.jp/epitopes/glycoepitope.owl#>
PREFIX uniprot: <http://www.uniprot.org/core/>

INSERT{
    GRAPH <http://rdf.glytoucan.org/partner/glycoepitope>{
        ?saccharide glycan:is_from_source ?taxon_iri.
        ?taxon_iri a glycan:Source.
        ?taxon_iri dcterms:identifier ?taxon_id.
        ?taxon_iri rdfs:seeAlso ?taxon_url .
        }
}
FROM <http://rdf.glytoucan.org>
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glycoinfo.org/mapping/accnum/ep>
FROM <http://rdf.glycoinfo.org/glycoepitope>
WHERE {
    # Glytoucan
    ?saccharide glytoucan:has_primary_id ?AccessionNumber.
    ?saccharide glycan:has_epitope ?ep .
    # Taxon
    ?ep glycoepitope:organism ?taxon.
    BIND(STRAFTER(STR(?taxon), "http://purl.org/obo/owl/NCBITaxon#NCBITaxon_") AS ?taxon_id)
    BIND(IRI(CONCAT("http://rdf.glycoinfo.org/source/", ?taxon_id)) AS ?taxon_iri)
    BIND(IRI(CONCAT("http://identifiers.org/taxonomy/", ?taxon_id)) AS ?taxon_url)
};
checkpoint;
commit WORK;


log_enable(2,1);
sparql
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX bibo: <http://purl.org/ontology/bibo/>
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX glycoepitope: <http://www.glycoepitope.ac.jp/epitopes/glycoepitope.owl#>
PREFIX uniprot: <http://www.uniprot.org/core/>

INSERT{
    GRAPH <http://rdf.glytoucan.org/partner/glycoepitope>{
        ?saccharide dcterms:references ?article_iri.
        ?article_iri a bibo:Article.
        ?article_iri dcterms:identifier ?pubmed_id.
        ?article_iri rdfs:seeAlso ?pubmed_url.
        }
}
FROM <http://rdf.glytoucan.org>
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glycoinfo.org/mapping/accnum/ep>
FROM <http://rdf.glycoinfo.org/glycoepitope>
WHERE {
    # Glytoucan
    ?saccharide glytoucan:has_primary_id ?AccessionNumber.
    ?saccharide glycan:has_epitope ?ep .
    # Pubmed
    ?ep dcterms:isReferencedBy ?citation .
    ?citation rdfs:seeAlso ?pubmed .
    ?pubmed dcterms:identifier ?pubmed_id .
    BIND(IRI(CONCAT("http://rdf.glycoinfo.org/references/", ?pubmed_id)) AS ?article_iri)
    BIND(IRI(CONCAT("http://identifiers.org/pubmed/", ?pubmed_id)) AS ?pubmed_url)
};
checkpoint;
commit WORK;



log_enable(2,1);
sparql
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX bibo: <http://purl.org/ontology/bibo/>
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX glycoepitope: <http://www.glycoepitope.ac.jp/epitopes/glycoepitope.owl#>
PREFIX uniprot: <http://www.uniprot.org/core/>

INSERT{
    GRAPH <http://rdf.glytoucan.org/partner/glycoepitope>{
        ?saccharide glycan:has_resource_entry ?rEntry_iri.
        ?rEntry_iri a glycan:Resource_entry.
        ?rEntry_iri rdfs:label "GlycoEpitope".
        ?rEntry_iri glycan:in_glycan_database glycan:Database_glycoepitope.
        ?rEntry_iri dcterms:identifier ?epitope_id.
        ?rEntry_iri rdfs:seeAlso ?glycoepitope_url.
        glycan:Database_glycoepitope rdfs:label "GlycoEpitope".
        }
}
FROM <http://rdf.glytoucan.org>
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glycoinfo.org/mapping/accnum/ep>
FROM <http://rdf.glycoinfo.org/glycoepitope>
WHERE {
    # Glytoucan
    ?saccharide glytoucan:has_primary_id ?AccessionNumber.
    ?saccharide glycan:has_epitope ?epitope .
    ?epitope dcterms:identifier ?epitope_id .
    BIND(IRI(CONCAT("http://rdf.glycoinfo.org/glycoepitope/", ?epitope_id)) AS ?rEntry_iri)
    BIND(IRI(CONCAT("http://identifiers.org/glycoepitope/", ?epitope_id)) AS ?glycoepitope_url)
};
checkpoint;
commit WORK;
```

