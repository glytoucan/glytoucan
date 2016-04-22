---
title: SPARQL query for the Glycan Entry ver2.0 
authors:
- Daisuke Shinmachi
date: 2016-04-08
layout: default
---

# Items of the Glycan Entry

* **Summary**
	* Accession number
	* Calculated Monoisotopic Mass
	* WURCS
	* Created Date

* **Contents**
	* Structure
	* Computed Descriptors
		* WURCS
		* GlycoCT
	* Glycan Motif
	* Species
	* Literature
	* External ID

# Summary

* **Accession number**
* **Calculated Monoisotopic Mass**
* **WURCS**
* **Created Date**


```
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

SELECT DISTINCT ?AccNum ?Mass_label ?WURCS_label ?CreateDate
WHERE {
  # Accession Number
  VALUES ?AccNum {"G00051MO"}
  ?saccharide glytoucan:has_primary_id ?AccNum .

  # Mass
  OPTIONAL{
  ?saccharide glytoucan:has_derivatized_mass ?dmass .
  ?dmass rdfs:label ?msLabel .
  BIND(STR(?msLabel) AS ?Mass_label) .
  }

  # Sequence
   # WURCS
  OPTIONAL{
  ?saccharide glycan:has_glycosequence ?wcsSeq .
  ?wcsSeq rdfs:label ?wcsLabel .
  BIND(STR(?wcsLabel) AS ?WURCS_label)
  ?wcsSeq glycan:in_carbohydrate_format glycan:carbohydrate_format_wurcs .
  }

  # Contributor
  OPTIONAL{
  ?saccharide glycan:has_resource_entry ?res .
  ?res a glycan:resource_entry .
  ?res glytoucan:date_registered ?date .
  BIND(STR(?date) AS ?CreateDate) 
  }
} 
```



# Contents 

### Structure

* A structure is not produced by SPARQL query.
* This item is displayed by using javascript.

### Computed Descriptors


#####  WURCS and GlycoCT

```
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

SELECT DISTINCT ?WURCS_label ?GlycoCT 
WHERE {
  # Accession Number
  VALUES ?accNum {"G00051MO"}
  ?saccharide glytoucan:has_primary_id ?accNum .

  # WURCS
  OPTIONAL{
  ?saccharide glycan:has_glycosequence ?wcsSeq .
  ?wcsSeq rdfs:label ?wcsLabel .
  BIND(STR(?wcsLabel) AS ?WURCS_label)
  ?wcsSeq glycan:in_carbohydrate_format glycan:carbohydrate_format_wurcs .
  }

  # GlycoCT
  OPTIONAL{
  ?saccharide glycan:has_glycosequence ?gctSeq .
  ?gctSeq glycan:has_sequence ?seq .
  BIND(STR(?seq) AS ?GlycoCT)
  ?gctSeq glycan:in_carbohydrate_format glycan:carbohydrate_format_glycoct .
  }
} 
```


### Glycan Motif

```
# Motif 
PREFIX glycan:  <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>

SELECT DISTINCT ?MotifName ?moAccNum
WHERE{
	# Accession Number
	VALUES ?accNum {"G00051MO"}
	?saccharide glytoucan:has_primary_id ?accNum .
	?saccharide glycan:has_motif ?motif .
	?motif rdfs:label ?motifLabel .
	BIND((str(?motifLabel) AS ?MotifName))
	BIND(STRAFTER(STR(?motif), "http://rdf.glycoinfo.org/glycan/") AS ?moAccNum)
} 
```


### Species

##### Target database : BCSDB, GlycomeDB, GlycoEpitope 

##### SPARQL query

```
# Species
# There are only same id and url in BCSDB RDF
PREFIX dcterms: <http://purl.org/dc/terms/>

SELECT DISTINCT ?from ?taxon_name ?taxon_id ?taxon_url 
WHERE{
	VALUES ?accNum {"G00051MO"}
	?saccharide  glytoucan:has_primary_id ?accNum .

	GRAPH ?graph {
		?saccharide glycan:is_from_source ?source.
		?source a glycan:Source .
		OPTIONAL{
		 ?source dcterms:identifier ?taxon_id .
		 ?source rdfs:seeAlso ?taxon_url .
		}
		OPTIONAL{
		 ?source rdfs:label ?taxon_name .
		}
	}
	?graph rdfs:label ?from .
}
```


### Literature

##### Target database : BCSDB, GlycoEpitope 

##### SPARQL query

```
# Literature
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX bibo: <http://purl.org/ontology/bibo/>

SELECT DISTINCT ?from ?pubmed_id ?pubmed_url
WHERE{
	VALUES ?accNum {"G00051MO"}
	?saccharide  glytoucan:has_primary_id ?accNum .
	
	GRAPH ?graph {
		?saccharide dcterms:references ?article .	
		OPTIONAL{
		 ?article a bibo:Article .
		 ?article dcterms:identifier ?pubmed_id .
		 ?article rdfs:seeAlso ?pubmed_url .
		}
	}
	?graph rdfs:label ?from .
}
```


### External ID

##### Target database : BCSDB, GlycomeDB, GlycoEpitope, PubChem 

##### SPARQL query

```
# External ID
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 

SELECT DISTINCT ?from ?db_label ?external_id ?url
WHERE{
	VALUES ?accNum {"G00051MO"}
	?saccharide  glytoucan:has_primary_id ?accNum .
	
	GRAPH ?graph {
		?saccharide glycan:has_resource_entry ?entry .
		?entry a glycan:Resource_entry .
		?entry glycan:in_glycan_database ?db .
		?entry dcterms:identifier ?external_id .
		?entry rdfs:seeAlso ?url .
		?db rdfs:label ?db_label .
	}
	?graph rdfs:label ?from.	
}
```

