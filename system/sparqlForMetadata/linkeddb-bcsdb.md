---
title: SPARQL Query for Overview
layout: default
---
### Input
VALUES ?AccessionNumber {"Input Accession number"}

### Output
Accession number = ?AccessionNumber  
Scientific name of Taxon = ?name  
Host name = ?hostName  
Disease name = ?dise  
PubMed ID = ?pmid  
BCSDB URL = ?url  
BCSDB ID = ?id  

```
    PREFIX dcterms: <http://purl.org/dc/terms/>
    PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
    PREFIX bibo: <http://purl.org/ontology/bibo/>
    PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 
    PREFIX glycodb: <http://purl.jp/bio/12/database/>
    PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

    SELECT DISTINCT ?AccessionNumber ?name ?hostName ?dise ?pmid ?url ?bcsdb_id
    FROM <http://rdf.glytoucan.org>
    FROM <http://rdf.glytoucan.org/core>
    FROM NAMED <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>
    FROM NAMED <http://rdf.glycoinfo.org/glycome-db>
    FROM NAMED <http://rdf.glycoinfo.org/bcsdb>
    WHERE{
      
      # Glytoucan
      VALUES ?AccessionNumber {"Input Accession number"}
      ?glytoucan glytoucan:has_primary_id ?AccessionNumber.

      # From glytoucan to glycome-db 
      GRAPH <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>{
        ?glytoucan skos:exactMatch ?glycomedb .
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
        ?ref glycan:has_glycan ?bcsdb .
        ?ref glycan:is_from_source ?source .
        ?ref glycan:published_in ?art .

        # BCSDB URL
        ?bcsdb owl:sameAs ?url .
        ?url glycan:in_glycan_database glycodb:bcsdb .
        ?url dcterms:identifier ?bcsdb_id .

        # Taxon
        OPTIONAL{
        ?source a glycan:source_natural.
        ?source glycan:has_taxon ?taxon .
        ?taxon <http://purl.uniprot.org/core/scientificName> ?name .
        }

        OPTIONAL{
          ?source glycan:hosted_by ?host.
          ?host glycan:has_taxon ?hTaxon .
          ?hTaxon <http://purl.uniprot.org/core/scientificName> ?hostName .
          ?host glycan:has_disease ?dise .
        }
        
        OPTIONAL{
          # Article
          ?art a bibo:Article .
          ?art glycan:has_pmid ?pmid .
        }
        
      }
    } ORDER BY ?name
```
