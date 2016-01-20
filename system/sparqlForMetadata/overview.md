---
title: SPARQL Query for Overview
layout: default
---
### Input
Sample Accession number : G00051MO  
`?glycan glytoucan:has_primary_id "Input Accession number"` 


### Output
Variable | Data
---------|------
?WURCS | WURCS 
?GlycoCT | GlycoCT
?Mass | Mass
?Contributor | Contributor
?ContributionTime | Contribution time

```
    PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
    PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

    SELECT DISTINCT (STR(?WURCS_label) AS ?WURCS) (STR(?GlycoCT) AS ?GlycoCT) (STR(?Mass_label) AS ?Mass) (STR(?cName) AS ?Contributor) (STR(?cTime) AS ?ContributionTime)
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
    ?glycan glytoucan:has_primary_id "G00051MO" .

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
    glytoucan:date_registered ?cTime ;
    glytoucan:contributor ?c .
    ?c foaf:name ?cName .
        }
    } LIMIT 1

```
