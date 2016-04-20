---
title: Insert Query for Partner RDF
layout: default
---

# Insert Query for Partner RDF

## BCSDB

**Source**

BCSDB has two type of taxon IRI.  

* blank node type  
* uniprot iri type  


for blank node

```
log_enable(2,1);
sparql
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX bibo: <http://purl.org/ontology/bibo/>
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 
PREFIX glycodb: <http://purl.jp/bio/12/database/>
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

INSERT{
        GRAPH <http://rdf.glytoucan.org/partner/bcsdb>{
        ?saccharide glycan:is_from_source ?taxon_iri .
        ?taxon_iri a glycan:Source .
        ?taxon_iri rdfs:label ?taxon_name .
        }
}
FROM <http://rdf.glytoucan.org/core>
FROM NAMED <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>
FROM NAMED <http://rdf.glycoinfo.org/glycome-db>
FROM NAMED <http://rdf.glycoinfo.org/bcsdb>
FROM <http://rdf.glycoinfo.org/bcsdb>
WHERE{
        # Glytoucan
        #VALUES ?AccessionNumber {"G00051MO"}
        ?saccharide glytoucan:has_primary_id ?AccessionNumber.

        # From glytoucan to glycome-db 
        GRAPH <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>{
        ?saccharide skos:exactMatch ?glycomedb .
        }

        # GlycomeDB  bcsdb id
        GRAPH <http://rdf.glycoinfo.org/glycome-db>{
        ?glycomedb glycan:has_resource_entry ?res .
        ?res glycan:in_glycan_database glycan:database_bcsdb .
        ?res dcterms:identifier ?b_id.
        BIND(str(?b_id) AS ?bcsdb_id)
        }

        # BCSDB
        GRAPH <http://rdf.glycoinfo.org/bcsdb>{

        # BCSDB URL
        ?url dcterms:identifier ?bcsdb_id .
        ?url glycan:in_glycan_database glycodb:bcsdb .
        ?bcsdb owl:sameAs ?url .
        ?ref glycan:has_glycan ?bcsdb .

        # Taxon
        ?ref glycan:is_from_source ?source .
        ?source a glycan:source_natural .
        ?source glycan:has_taxon  ?taxon .
        ?taxon <http://purl.uniprot.org/core/scientificName> ?taxon_name .

        BIND(STR(?taxon) AS ?strTaxon)
        FILTER CONTAINS(?strTaxon,"taxon_")
        BIND(ENCODE_FOR_URI(?taxon_name) AS ?encTaxon)
        BIND(IRI(CONCAT("http://rdf.glycoinfo.org/source/", ?encTaxon)) AS ?taxon_iri)

        # Article
        ?ref glycan:published_in ?article .
        }
};
checkpoint;
commit WORK;
```


for uniprot iri 

```
log_enable(2,1);
sparql
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX bibo: <http://purl.org/ontology/bibo/>
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 
PREFIX glycodb: <http://purl.jp/bio/12/database/>
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

INSERT{
        GRAPH <http://rdf.glytoucan.org/partner/bcsdb>{
        ?saccharide glycan:is_from_source ?taxon_iri .
        ?taxon_iri a glycan:Source .
        ?taxon_iri rdfs:label ?taxon_name .
        ?taxon_iri dcterms:identifier ?taxon_id .
        ?taxon_iri rdfs:seeAlso ?taxon_url .
        }
}
FROM <http://rdf.glytoucan.org/core>
FROM NAMED <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>
FROM NAMED <http://rdf.glycoinfo.org/glycome-db>
FROM NAMED <http://rdf.glycoinfo.org/bcsdb>
FROM <http://rdf.glycoinfo.org/bcsdb>
WHERE{
        # Glytoucan
        #VALUES ?AccessionNumber {"G00051MO"}
        ?saccharide glytoucan:has_primary_id ?AccessionNumber.

        # From glytoucan to glycome-db 
        GRAPH <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>{
        ?saccharide skos:exactMatch ?glycomedb .
        }

        # GlycomeDB  bcsdb id
        GRAPH <http://rdf.glycoinfo.org/glycome-db>{
        ?glycomedb glycan:has_resource_entry ?res .
        ?res glycan:in_glycan_database glycan:database_bcsdb .
        ?res dcterms:identifier ?b_id.
        BIND(str(?b_id) AS ?bcsdb_id)
        }

        # BCSDB
        GRAPH <http://rdf.glycoinfo.org/bcsdb>{

        # BCSDB URL
        ?url dcterms:identifier ?bcsdb_id .
        ?url glycan:in_glycan_database glycodb:bcsdb .
        ?bcsdb owl:sameAs ?url .
        ?ref glycan:has_glycan ?bcsdb .

        # Taxon
        ?ref glycan:is_from_source ?source .
        ?source a glycan:source_natural .
        ?source glycan:has_taxon  ?taxon .
        ?taxon <http://purl.uniprot.org/core/scientificName> ?taxon_name .

        BIND(STR(?taxon) AS ?strTaxon)
        FILTER CONTAINS(?strTaxon, "uniprot")
        BIND(STRAFTER(?strTaxon, "http://purl.uniprot.org/taxonomy/") AS ?taxon_id)
        BIND(IRI(CONCAT("http://rdf.glycoinfo.org/source/", ?taxon_id)) AS ?taxon_iri)
        BIND(IRI(CONCAT("http://identifiers.org/taxonomy/", ?taxon_id)) AS ?taxon_url)

        # Article
        ?ref glycan:published_in ?article .

        }
};
checkpoint;
commit WORK;
```

**Article**

```
log_enable(2,1);
sparql
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX bibo: <http://purl.org/ontology/bibo/>
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 
PREFIX glycodb: <http://purl.jp/bio/12/database/>
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

INSERT{
        GRAPH <http://rdf.glytoucan.org/partner/bcsdb>{
        ?saccharide dcterms:references ?article_iri.
        ?article_iri a bibo:Article .
        ?article_iri dcterms:identifier ?pubmed_id .
        ?article_iri rdfs:seeAlso ?pubmed_url .
        }
}
FROM <http://rdf.glytoucan.org/core>
FROM NAMED <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>
FROM NAMED <http://rdf.glycoinfo.org/glycome-db>
FROM NAMED <http://rdf.glycoinfo.org/bcsdb>
FROM <http://rdf.glycoinfo.org/bcsdb>
WHERE{
        # Glytoucan
        #VALUES ?AccessionNumber {"G00051MO"}
        ?saccharide glytoucan:has_primary_id ?AccessionNumber.

        # From glytoucan to glycome-db 
        GRAPH <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>{
        ?saccharide skos:exactMatch ?glycomedb .
        }

        # GlycomeDB  bcsdb id
        GRAPH <http://rdf.glycoinfo.org/glycome-db>{
        ?glycomedb glycan:has_resource_entry ?res .
        ?res glycan:in_glycan_database glycan:database_bcsdb .
        ?res dcterms:identifier ?b_id.
        BIND(str(?b_id) AS ?bcsdb_id)
        }

        # BCSDB
        GRAPH <http://rdf.glycoinfo.org/bcsdb>{
        # BCSDB URL
        ?url dcterms:identifier ?bcsdb_id .
        ?url glycan:in_glycan_database glycodb:bcsdb .
        ?bcsdb owl:sameAs ?url .

        ?ref glycan:has_glycan ?bcsdb .
        ?ref glycan:is_from_source ?source .
        ?ref glycan:published_in ?article .

        # Article
        ?article a bibo:Article .
        ?article glycan:has_pmid ?pubmed_id .
        ?article owl:sameAs ?pubmed .
        BIND(STR(?pubmed) AS ?strPubmed)
        FILTER CONTAINS(?strPubmed, "pubmed")
        BIND(IRI(CONCAT("http://rdf.glycoinfo.org/references/", ?pubmed_id)) AS ?article_iri)
        BIND(IRI(CONCAT("http://identifiers.org/pubmed/", ?pubmed_id)) AS ?pubmed_url)

        # Taxon
        ?source a glycan:source_natural .
        }
};
checkpoint;
commit WORK;
```

**Resource Entry**

```
log_enable(2,1);
sparql
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX bibo: <http://purl.org/ontology/bibo/>
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 
PREFIX glycodb: <http://purl.jp/bio/12/database/>
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

INSERT{
        GRAPH <http://rdf.glytoucan.org/partner/bcsdb>{
        ?saccharide glycan:has_resource_entry ?rEntry_iri.
        ?rEntry_iri a glycan:Resource_entry.
        ?rEntry_iri glycan:in_glycan_database glycan:Database_bcsdb.
        ?rEntry_iri dcterms:identifier ?bcsdb_id.
        ?rEntry_iri rdfs:seeAlso ?bcsdb_url.
        glycan:Database_bcsdb rdfs:label "BCSDB".
        }
}
FROM <http://rdf.glytoucan.org/core>
FROM NAMED <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>
FROM NAMED <http://rdf.glycoinfo.org/glycome-db>
FROM NAMED <http://rdf.glycoinfo.org/bcsdb>
FROM <http://rdf.glycoinfo.org/bcsdb>
WHERE{
        # Glytoucan
        #VALUES ?AccessionNumber {"G00051MO"}
        ?saccharide glytoucan:has_primary_id ?AccessionNumber.

        # From glytoucan to glycome-db 
        GRAPH <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>{
        ?saccharide skos:exactMatch ?glycomedb .
        }

        # GlycomeDB  bcsdb id
        GRAPH <http://rdf.glycoinfo.org/glycome-db>{
        ?glycomedb glycan:has_resource_entry ?res .
        ?res glycan:in_glycan_database glycan:database_bcsdb .
        ?res dcterms:identifier ?b_id.
        BIND(str(?b_id) AS ?bcsdb_id)
        }

        # BCSDB
        GRAPH <http://rdf.glycoinfo.org/bcsdb>{

        # BCSDB URL
        ?bcsdb_url dcterms:identifier ?bcsdb_id .
        BIND(IRI(CONCAT("http://rdf.glycoinfo.org/bcsdb/", ?bcsdb_id)) AS ?rEntry_iri)

        ?bcsdb_url glycan:in_glycan_database glycodb:bcsdb .
        ?bcsdb owl:sameAs ?bcsdb_url .
        ?ref glycan:has_glycan ?bcsdb .

        # Taxon
        ?ref glycan:is_from_source ?source .
        ?source a glycan:source_natural .

        # Article
        ?ref glycan:published_in ?article .

        }
};
checkpoint;
commit WORK;
```


## GlycomeDB

**Source**

```
log_enable(2,1);
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
```

**Resource Entry**

```
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
        ?rEntry_iri glycan:in_glycan_database glycan:Database_glycomedb.
        ?rEntry_iri dcterms:identifier ?glycomedb_id.
        ?rEntry_iri rdfs:seeAlso ?glycomedb_url.
        glycan:Database_glycomedb rdfs:label "GlycomeDB".
        }
}
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
```


## GlycoEpitope

**Source**

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
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glycoinfo.org/mapping/accnum/ep>
FROM <http://rdf.glycoinfo.org/glycoepitope>
WHERE {
    # Glytoucan
    ?saccharide glytoucan:has_primary_id ?AccessionNumber.
    ?saccharide glycan:has_epitope ?ep .
    # Taxon
    ?ep glycoepitope:organism ?taxon_iri.
    BIND(STRAFTER(STR(?taxon_iri), "http://purl.org/obo/owl/NCBITaxon#NCBITaxon_") AS ?taxon_id)
    BIND(IRI(CONCAT("http://rdf.glycoinfo.org/source/", ?taxon_id)) AS ?taxon_iri)
    BIND(IRI(CONCAT("http://identifiers.org/taxonomy/", ?taxon_id)) AS ?taxon_url)
};
checkpoint;
commit WORK;
```

**Article**

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
        ?saccharide dcterms:references ?article_iri.
        ?article_iri a bibo:Article.
        ?article_iri dcterms:identifier ?pubmed_id.
        ?article_iri rdfs:seeAlso ?pubmed_url.
        }
}
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
```

**Resource Entry**

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
        ?saccharide glycan:has_resource_entry ?rEntry_iri.
        ?rEntry_iri a glycan:Resource_entry.
        ?rEntry_iri glycan:in_glycan_database glycan:Database_glycoepitope.
        ?rEntry_iri dcterms:identifier ?epitope_id.
        ?rEntry_iri rdfs:seeAlso ?glycoepitope_url.
        glycan:Database_glycoepitope rdfs:label "GlycoEpitope".
        }
}
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


## GlycoNAVI

**Resource Entry**

for SID

```
log_enable(2,1);
sparql
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>

INSERT{
    GRAPH <http://rdf.glytoucan.org/partner/wurcs-working-group>{
        ?saccharide glycan:has_resource_entry ?rEntry_iri.
        ?rEntry_iri a glycan:Resource_entry.
        ?rEntry_iri glycan:in_glycan_database glycan:Database_pubchem.
        ?rEntry_iri dcterms:identifier ?sid.
        ?rEntry_iri rdfs:seeAlso ?sid_url.
        glycan:Database_pubchem rdfs:label "PubChem".
        }
}
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
```

for CID

```
log_enable(2,1);
sparql
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>

INSERT{
    GRAPH <http://rdf.glytoucan.org/partner/wurcs-working-group>{
        ?saccharide glycan:has_resource_entry ?rEntry_iri.
        ?rEntry_iri a glycan:Resource_entry.
        ?rEntry_iri glycan:in_glycan_database glycan:Database_pubchem.
        ?rEntry_iri dcterms:identifier ?sid.
        ?rEntry_iri rdfs:seeAlso ?sid_url.
        }
}
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
```
