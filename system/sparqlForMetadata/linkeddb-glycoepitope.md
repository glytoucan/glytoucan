---
title: SPARQL Query for  GlycoEpitope
layout: default
---

### Input
`VALUES ?AccessionNumber {"Input Accession number"}`


### Output
epitope url = ?ep  
epitope id = ?ep\_id  
epitope name = ?ep_name   
glycoprotein = ?gp_name   
glycolipid = ?gl_name   
cell line = ?cell_name   
Tissue and Cellular distribution = ?tissue_name  
pubmed url = ?pubmed   
pubmed id = ?pubmed_id  
antibody id = ?anti_id   
antibody url = ?antibody   
antibody name = ?anti_name  

### PREFIX  
```
DEFINE sql:select-option "order"
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX bibo: <http://purl.org/ontology/bibo/>
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 
PREFIX glycodb: <http://purl.jp/bio/12/database/>
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX glycoepitope: <http://www.glycoepitope.ac.jp/epitopes/glycoepitope.owl#>
PREFIX glycoprot: <http://www.glycoprot.jp/>
PREFIX uniprot: <http://www.uniprot.org/core/>
```

### SPARQL Query  
```
SELECT DISTINCT ?ep
FROM <http://rdf.glytoucan.org>
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glycoinfo.org/mapping/accnum/ep>
FROM <http://rdf.glycoinfo.org/glycoepitope>
WHERE {
	# Glytoucan
	VALUES ?AccessionNumber {"Input Accession number"}
	?glytoucan glytoucan:has_primary_id ?AccessionNumber.
	# epitope id
	?glytoucan glycan:has_epitope ?ep .
}

```

### Epiltope id & Epitope name  
Output  
epitope id = ?ep_id  
epitope name = ?ep_name  

```
SELECT distinct ?ep_id ?ep_name 
FROM <http://rdf.glycoinfo.org/glycoepitope>
WHERE{
	# epitope id
	?glytoucan glycan:has_epitope ?ep .
	?ep dcterms:identifier ?ep_id .
	# epitope name
	?ep rdfs:label ?ep_name .
}
```

### GlycoEpitope Sequence
```
SELECT DISTINCT (str(?seq) AS ?sequence)
FROM <http://rdf.glycoinfo.org/glycoepitope>
WHERE{
	# glycoepitope sequence
	?ep glycan:has_glycosequence ?gseq .
	?gseq glycan:in_carbohydrate_format glycan:carbohydrate_format_glycoepitope .
	?gseq glycan:has_sequence ?seq .
}
```

### Glycoprotein & Glycolipid
```
SELECT distinct ?gp_name ?gl_name
FROM <http://rdf.glycoinfo.org/glycoepitope>
WHERE{
	# glycoprotein
	OPTIONAL{
	?ep dcterms:isPartOf ?gp .
	?gp a glycan:glycoprotein .
	?gp rdfs:label ?gp_name .
	}

	# glycolipid
	OPTIONAL{ 
	?ep dcterms:isPartOf ?gl .
	?gl a glycan:glycolipid .
    ?gl rdfs:label ?gl_name .
	}
}
```

### Cell Line & Tissue and Cellular Distribution
```
SELECT distinct ?cell_name ?tissue_name
FROM <http://rdf.glycoinfo.org/glycoepitope>
WHERE{
	# cell line
	OPTIONAL{
	?ep glycoepitope:found_in ?cell_line .
	?cell_line rdfs:label ?cell_name .
	}

	# Tissue and Cellular distribution 
	OPTIONAL{
	?ep glycoepitope:tissue ?tissue .
	?tissue rdfs:label ?tissue_name .
	}
}
```

### PubMed URL and PubMed ID
```
SELECT distinct ?pubmed ?pubmed_id
FROM <http://rdf.glycoinfo.org/glycoepitope>
WHERE{
	# pubmed
	OPTIONAL{
	?ep dcterms:isReferencedBy ?citation .
	?citation rdfs:seeAlso ?pubmed .
	?pubmed dcterms:identifier ?pubmed_id .
	}
}
```

### Antibody ID & Antibody Name
```
SELECT distinct ?nati_id ?anti_name
FROM <http://rdf.glycoinfo.org/glycoepitope>
WHERE{
	OPTIONAL{
	# antibody id
	?ep glycoepitope:has_antibody ?antibody .
	?antibody dcterms:identifier ?anti_id .
	}

	OPTIONAL{
	# antibody name
	?ep glycoepitope:has_antibody ?antibody .
	?antibody rdfs:label ?anti_name .
	}
}
```
