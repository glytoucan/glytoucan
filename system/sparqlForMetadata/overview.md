---
title: SPARQL Query for Overview
layout: default
---
### Input
?glycan glytoucan:has_primary_id "Input Accession number" 

### Output
WURCSのラベル
GlycoCT
Massのラベル
投稿者名
投稿日

    PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
    PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

    SELECT DISTINCT ?WURCS_label ?GlycoCT ?Mass_label ?Contributor ?ContributionTime
    FROM <http://rdf.glytoucan.org>
    FROM <http://rdf.glytoucan.org/core>
    FROM NAMED <http://rdf.glytoucan.org/mass>
    FROM <http://rdf.glytoucan.org/sequence/wurcs>
    FROM <http://rdf.glytoucan.org/sequence/glycoct>
    FROM <http://rdf.glytoucan.org/users>
    WHERE {
        # repository RDF
        # Accession Number
        ?glycan a glycan:saccharide.
        ?glycan glytoucan:has_primary_id "Input Accession number" .

        # Sequence
         # WURCS
        OPTIONAL{
        ?glycan glycan:has_glycosequence ?wcsSeq .
        ?wcsSeq rdfs:label ?WURCS_label .
        ?wcsSeq glycan:in_carbohydrate_format glycan:carbohydrate_format_wurcs .
        }
         # GlycoCT
        OPTIONAL{
        ?glycan glycan:has_glycosequence ?gctSeq .
        ?gctSeq glycan:has_sequence ?GlycoCT .
        ?gctSeq glycan:in_carbohydrate_format glycan:carbohydrate_format_glycoct .
        }

        # Mass
        OPTIONAL{
        GRAPH <http://rdf.glytoucan.org/mass>{
          ?glycan glytoucan:has_derivatized_mass ?dmass .
          ?dmass rdfs:label ?Mass_label .
        }}

        # Contributor
        OPTIONAL{
        ?glycan glycan:has_resource_entry ?res .
        ?res a glycan:resource_entry ;
             glytoucan:date_registered ?ContributionTime ;
             glytoucan:contributor ?c .
        ?c foaf:name ?Contributor .
        }
    } LIMIT 1