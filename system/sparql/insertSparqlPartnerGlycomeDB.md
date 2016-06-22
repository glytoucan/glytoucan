---
title: Insert SPARQL for Partner 
author:
- Daisuke Shinmachi
date: 2016-06-22
layout: default
---


# GlycomeDB

**Clear GRAPH**

```
log_enable(2,1);
sparql clear graph <http://rdf.glytoucan.org/partner/glycome-db>;
```

**Source & Resource entry (GlycomeDB, JCGGDB)**

```
sparql
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX bibo: <http://purl.org/ontology/bibo/>
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 
PREFIX glycodb: <http://purl.jp/bio/12/database/>
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

INSERT{
        GRAPH <http://rdf.glytoucan.org/partner/glycome-db>{
        ?saccharide glycan:is_from_source ?taxon_iri .
        ?taxon_iri a glycan:Source .
        ?taxon_iri dcterms:identifier ?taxon_id .
        ?taxon_iri rdfs:seeAlso ?taxon_url .
        }
}

FROM <http://rdf.glytoucan.org>
FROM <http://rdf.glytoucan.org/core>
FROM NAMED <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>
FROM NAMED <http://rdf.glycoinfo.org/glycome-db>
WHERE{
        # Glytoucan
        ?saccharide glytoucan:has_primary_id ?AccessionNumber.

        # From glytoucan to glycome-db 
        GRAPH <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>{
        ?saccharide skos:exactMatch ?glycomedb .
        }

        # GlycomeDB  
        GRAPH <http://rdf.glycoinfo.org/glycome-db>{
        ?glycomedb glycan:has_reference ?ref .

        # Taxon
        ?ref glycan:is_from_source ?source .
        ?source a glycan:source_natural .
        ?source glycan:has_taxon  ?taxon .
        BIND(IRI(STRBEFORE(?taxon, ".rdf")) AS ?taxon_up)
        BIND(STRAFTER(STR(?taxon_up), "http://www.uniprot.org/taxonomy/") AS ?taxon_id)
        BIND(IRI(CONCAT("http://rdf.glycoinfo.org/source/", ?taxon_id)) AS ?taxon_iri)
        BIND(IRI(CONCAT("http://identifiers.org/taxonomy/", ?taxon_id)) AS ?taxon_url)
        
        }
};
checkpoint;
commit WORK;


log_enable(2,1);
sparql
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX bibo: <http://purl.org/ontology/bibo/>
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 
PREFIX glycodb: <http://purl.jp/bio/12/database/>
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

INSERT{
        GRAPH <http://rdf.glytoucan.org/partner/glycome-db>{
        ?saccharide glycan:has_resource_entry ?rEntry_iri.
        ?rEntry_iri a glycan:Resource_entry.
        ?rEntry_iri rdfs:label "GlycomeDB".
        ?rEntry_iri glycan:in_glycan_database glycan:Database_glycomedb.
        ?rEntry_iri dcterms:identifier ?glycomedb_id.
        ?rEntry_iri rdfs:seeAlso ?glycomedb_url.
        glycan:Database_glycomedb rdfs:label "GlycomeDB".
        }
}
FROM <http://rdf.glytoucan.org>
FROM <http://rdf.glytoucan.org/core>
FROM NAMED <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>
WHERE{
        # Glytoucan
        ?saccharide glytoucan:has_primary_id ?AccessionNumber.

        # From glytoucan to glycome-db 
        GRAPH <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>{
        ?saccharide skos:exactMatch ?glycomedb .
        ?glycomedb glycan:has_resource_entry ?glycomedb_url .
        ?glycomedb_url dcterms:identifier ?glycomedb_id .
        BIND(IRI(CONCAT("http://rdf.glycoinfo.org/glycome-db/", ?glycomedb_id)) AS ?rEntry_iri)
        }
};
checkpoint;
commit WORK;


log_enable(2,1);
sparql
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX bibo: <http://purl.org/ontology/bibo/>
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 
PREFIX glycodb: <http://purl.jp/bio/12/database/>
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

INSERT{
        GRAPH <http://rdf.glytoucan.org/partner/glycome-db>{
        ?saccharide glycan:has_resource_entry ?rEntry_iri.
        ?rEntry_iri a glycan:Resource_entry.
        ?rEntry_iri rdfs:label "JCGGDB".
        ?rEntry_iri glycan:in_glycan_database glycan:Database_jcggdb.
        ?rEntry_iri dcterms:identifier ?jcggdb_id.
        ?rEntry_iri rdfs:seeAlso ?jcggdb_url.
        glycan:Database_jcggdb rdfs:label "JCGGDB".
        }
}
FROM <http://rdf.glytoucan.org>
FROM <http://rdf.glytoucan.org/core>
FROM NAMED <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>
FROM NAMED <http://rdf.glycoinfo.org/glycome-db>
WHERE{
        # Glytoucan
        ?saccharide glytoucan:has_primary_id ?AccessionNumber.

        # From glytoucan to glycome-db 
        GRAPH <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>{
        ?saccharide skos:exactMatch ?glycomedb .
        }
        # from glycome-db to JCGGDB
        GRAPH <http://rdf.glycoinfo.org/glycome-db>{
        ?glycomedb glycan:has_resource_entry ?jcggdb_url .
        ?jcggdb_url glycan:in_glycan_database glycan:database_jcggdb .
        ?jcggdb_url dcterms:identifier ?id.
        BIND(STR(?id) AS ?jcggdb_id)
        BIND(IRI(CONCAT("http://rdf.glycoinfo.org/jcggdb/", ?jcggdb_id)) AS ?rEntry_iri)

        }
};
checkpoint;
commit WORK;
```
