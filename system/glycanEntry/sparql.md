---
title: SPARQL query for the Glycan Entry ver2.0 
authors:
- Daisuke Shinmachi
date: 2016-06-06
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
		* IUPAC
	* Glycan Motif
	* Species
	* Literature
	* External ID

# Summary

**Input**

* Accession number

**Output**

* Accession number
* Calculated Monoisotopic Mass
* WURCS sequence
* Created Date


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

### Computed Descriptors


#####  WURCS


**Input**

* Accession number

**Output**

* WURCS sequence


```
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

SELECT DISTINCT ?WURCS_label
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
}
```


#####  GlycoCT

**Input**

* Accession number

**Output**

* GlycoCT sequence

```
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

SELECT DISTINCT ?GlycoCT
WHERE {
  # Accession Number
  VALUES ?accNum {"G00051MO"}
  ?saccharide glytoucan:has_primary_id ?accNum .

  # GlycoCT
  OPTIONAL{
  ?saccharide glycan:has_glycosequence ?gctSeq .
  ?gctSeq glycan:has_sequence ?seq .
  BIND(STR(?seq) AS ?GlycoCT)
  ?gctSeq glycan:in_carbohydrate_format glycan:carbohydrate_format_glycoct .
  }
}
```


#####  IUPAC 

**Input**

* Accession number

**Output**

* IUPAC sequence

```
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

SELECT DISTINCT ?IUPAC
WHERE {
  # Accession Number
  VALUES ?accNum {"G00051MO"}
  ?saccharide glytoucan:has_primary_id ?accNum .

  # IUPAC 
  OPTIONAL{
  ?saccharide glycan:has_glycosequence ?iupSeq .
  ?iupSeq glycan:has_sequence ?seq .
  BIND(STR(?seq) AS ?IUPAC)
  ?iupSeq glycan:in_carbohydrate_format glycan:carbohydrate_format_iupac .
  }
}
```





### Glycan Motif

* Using accession number in motif instance IRI 
* it IRI will be change to wurcs key and motif position insted of accession number. 

**Input**

* Accession number

**Output**

* Motif name
* Motif accession number : for get glycan image 

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

##### Target partners : BCSDB, GlycomeDB, GlycoEpitope 

**Input**

* Accession number

**Output**

* Partner name : ?from
* Taxonomy name
* NCBI Taxonomy URL

```
# Species
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

SELECT DISTINCT ?from ?taxon_name ?taxon_id ?taxon_url 
WHERE{
	VALUES ?accNum {"G00051MO"}
	?saccharide  glytoucan:has_primary_id ?accNum .
	{
		# for does exists taxon id
		GRAPH ?graph {
			?saccharide glycan:is_from_source ?source.
			?source a glycan:Source .
			?source dcterms:identifier ?taxon_id .
			?source rdfs:seeAlso ?taxon_url .
		}
		?taxon_url rdfs:label ?taxon_name .
		?graph rdfs:label ?from .
	}
	UNION
	{
		# for doesn't exists taxon id
		GRAPH ?graph {
			?saccharide glycan:is_from_source ?source.
			?source a glycan:Source .
			?source rdfs:label ?taxon_name .
		}
		?graph rdfs:label ?from .
	}
} ORDER BY ?from
```


### Literature

##### Target partners : BCSDB, GlycoEpitope 

**Input**

* Accession number

**Output**

* Partner name : ?from
* PubMed ID
* PubMed URL

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

##### Target partners : BCSDB, GlycomeDB, GlycoEpitope, PubChem 

**Input**

* Accession number

**Output**

* Partner name : ?from
* Database name : ?db_label
* External ID : ?external_id
* Databae entyr URL : ?url

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

