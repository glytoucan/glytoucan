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

* <a name="contents"> **Contents**
	* [Structure](#structure)
	* Computed Descriptors
		* [WURCS](#wurcs)
		* [GlycoCT](#glycoct)
		* [IUPAC Condensed & Extended](#iupac)
	* [Glycan Motif](#motif)
	* [Species](#species)
	* [Literature](#literature)
	* [External ID](#external)

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

### <a name="structure"> Structure  
[return to contents](#contents)


* A structure is not produced by SPARQL query.

### Computed Descriptors


#####  <a name="wurcs"> WURCS  
[return to contents](#contents)


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


##### <a name="glycoct"> GlycoCT  
[return to contents](#contents)

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


##### <a name="iupac"> IUPAC Condensed & Extended
[return to contents](#contents)

**Input**

* Accession number

**Output**

* IUPAC sequence


*IUPAC Condensed*  

```
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

SELECT DISTINCT ?IUPAC_Condensed
WHERE {
  # Accession Number
  VALUES ?accNum {"G00051MO"}
  ?saccharide glytoucan:has_primary_id ?accNum .

  # IUPAC_Condensed 
  OPTIONAL{
  ?saccharide glycan:has_glycosequence ?iupSeq .
  ?iupSeq glycan:has_sequence ?seq .
  BIND(STR(?seq) AS ?IUPAC_Condensed)
  ?iupSeq glycan:in_carbohydrate_format glycan:carbohydrate_format_iupac_condensed .
  }
}
```


*IUPAC Extended sequence*

```
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

SELECT DISTINCT ?IUPAC_Extended
WHERE {
  # Accession Number
  VALUES ?accNum {"G00051MO"}
  ?saccharide glytoucan:has_primary_id ?accNum .

  # IUPAC_Extended 
  OPTIONAL{
  ?saccharide glycan:has_glycosequence ?iupSeq .
  ?iupSeq glycan:has_sequence ?seq .
  BIND(STR(?seq) AS ?IUPAC_Extended)
  ?iupSeq glycan:in_carbohydrate_format glycan:carbohydrate_format_iupac_extended .
  }
}
```




### <a name="motif"> Glycan Motif   
[return to contents](#contents)

* Using accession number in motif instance IRI 
* it IRI will be change to wurcs key and motif position insted of accession number. 

**Input**

* Accession number

**Output**

* Motif name : ?MotifName
* Accession number : ?moAccNum (for get glycan image) 

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


### <a name="species"> Species  
[return to contents](#contents)


##### Target partners :  

* BCSDB 
* GlycomeDB
* GlycoEpitope


**Input**

* Accession number

**Output**

* Taxonomy name : ?taxon_name
* Taxonomy ID : ?taxon_id
* NCBI Taxonomy URL : ?taxon_url
* Partner name : ?from

```
# Species
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

SELECT DISTINCT ?taxon_name ?taxon_id ?taxon_url ?from
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

*BCSDB has two case of txonomy data*  
1) does exists taxnon name & id  
2) does not exists taxon id  





### <a name="literature"> Literature  
[return to contents](#contents)


##### Target partners :  

* BCSDB 
* GlycoEpitope


**Input**

* Accession number

**Output**

* PubMed ID : ?pubmed_id
* PubMed URL : ?pubmed_url
* Partner name : ?from

```
# Literature
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX bibo: <http://purl.org/ontology/bibo/>

SELECT DISTINCT ?pubmed_id ?pubmed_url ?from 
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


### <a name="external"> External ID  
[return to contents](#contents)

##### Target partners :  

* BCSDB 
* GlycomeDB
* GlycoEpitope
* GlycoNAVI
* UniCarbKB


**Input**

* Accession number

**Output**

* Database name : ?entry_label
* External ID : ?external_id
* Databae entyr URL : ?url
* Partner name : ?from

```
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

SELECT DISTINCT ?entry_label ?external_id ?url ?from ?partner_url ?description
WHERE{
  VALUES ?accNum {"G48059CD"}
  #VALUES ?accNum {"G61846BY"}
  ?saccharide glytoucan:has_primary_id ?accNum .

  GRAPH ?graph {
    ?saccharide glycan:has_resource_entry ?entry .
    ?entry a glycan:Resource_entry .
        ?entry rdfs:label ?entry_label .
    ?entry dcterms:identifier ?external_id .
    ?entry rdfs:seeAlso ?url .
  }
  ?graph rdfs:label ?from.
  ?graph dcterms:description ?description .
  ?graph rdfs:seeAlso ?partner_url .
} ORDER by ?from

```

