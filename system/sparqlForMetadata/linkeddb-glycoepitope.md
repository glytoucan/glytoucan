---
title: SPARQL Query for  GlycoEpitope
layout: default
---

### Input
`VALUES ?AccessionNumber {"Input Accession number"}`


### Output
epitope url = ?ep  
epitope id = ?ep\_id  
epitope name = ?ep\_name   
glycoprotein = ?gp\_name   
glycolipid = ?gl\_name   
cell line = ?cell\_name   
Tissue and Cellular distribution = ?tissue\_name  
pubmed url = ?pubmed   
pubmed id = ?pubmed\_id  
antibody id = ?anti\_id   
antibody url = ?antibody   
antibody name = ?anti\_name  


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
Output  
epitope url = ?ep  

```
SELECT DISTINCT ?ep
FROM <http://rdf.glytoucan.org>
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glycoinfo.org/mapping/accnum/ep>
FROM <http://rdf.glycoinfo.org/glycoepitope>
WHERE {
	# Glytoucan
	VALUES ?AccessionNumber {"Input Accession number"}
	?glytoucan glytoucan:has\_primary\_id ?AccessionNumber.
	# epitope id
	?glytoucan glycan:has\_epitope ?ep .
}

```


### Epiltope id & Epitope name  
Output  
epitope id = ?ep\_id  
epitope name = ?ep\_name  

```
SELECT distinct ?ep\_id ?ep\_name 
FROM <http://rdf.glycoinfo.org/glycoepitope>
WHERE{
	# epitope id
	?glytoucan glycan:has\_epitope ?ep .
	?ep dcterms:identifier ?ep\_id .
	# epitope name
	?ep rdfs:label ?ep\_name .
}
```


### GlycoEpitope Sequence

```
SELECT DISTINCT (str(?seq) AS ?sequence)
FROM <http://rdf.glycoinfo.org/glycoepitope>
WHERE{
	# glycoepitope sequence
	?ep glycan:has\_glycosequence ?gseq .
	?gseq glycan:in\_carbohydrate\_format glycan:carbohydrate\_format\_glycoepitope .
	?gseq glycan:has\_sequence ?seq .
}
```


### Glycoprotein & Glycolipid
Output  
glycoprotein = ?gp\_name   
glycolipid = ?gl\_name   

```
SELECT distinct ?gp\_name ?gl\_name
FROM <http://rdf.glycoinfo.org/glycoepitope>
WHERE{
	# glycoprotein
	OPTIONAL{
	?ep dcterms:isPartOf ?gp .
	?gp a glycan:glycoprotein .
	?gp rdfs:label ?gp\_name .
	}

	# glycolipid
	OPTIONAL{ 
	?ep dcterms:isPartOf ?gl .
	?gl a glycan:glycolipid .
    ?gl rdfs:label ?gl\_name .
	}
}
```


### Cell Line & Tissue and Cellular Distribution
Output  
cell line = ?cell\_name   
Tissue and Cellular distribution = ?tissue\_name  

```
SELECT distinct ?cell\_name ?tissue\_name
FROM <http://rdf.glycoinfo.org/glycoepitope>
WHERE{
	# cell line
	OPTIONAL{
	?ep glycoepitope:found\_in ?cell\_line .
	?cell\_line rdfs:label ?cell\_name .
	}

	# Tissue and Cellular distribution 
	OPTIONAL{
	?ep glycoepitope:tissue ?tissue .
	?tissue rdfs:label ?tissue\_name .
	}
}
```


### PubMed URL and PubMed ID
Output  
pubmed url = ?pubmed   
pubmed id = ?pubmed\_id  

```
SELECT distinct ?pubmed ?pubmed\_id
FROM <http://rdf.glycoinfo.org/glycoepitope>
WHERE{
	# pubmed
	OPTIONAL{
	?ep dcterms:isReferencedBy ?citation .
	?citation rdfs:seeAlso ?pubmed .
	?pubmed dcterms:identifier ?pubmed\_id .
	}
}
```


### Antibody ID & Antibody Name
Output  
antibody id = ?anti\_id   
antibody url = ?antibody   
antibody name = ?anti\_name  

```
SELECT distinct ?antibody ?anti\_id ?anti\_name
FROM <http://rdf.glycoinfo.org/glycoepitope>
WHERE{
	OPTIONAL{
	# antibody id
	?ep glycoepitope:has\_antibody ?antibody .
	?antibody dcterms:identifier ?anti\_id .
	}

	OPTIONAL{
	# antibody name
	?ep glycoepitope:has\_antibody ?antibody .
	?antibody rdfs:label ?anti\_name .
	}
}
```
