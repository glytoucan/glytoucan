---
title: SPARQL Query for  GlycoEpitope
layout: default
---

### Input
Sample Accession number : G00051MO  
`VALUES ?AccessionNumber {"G00051MO"}`


### Output : GlycoEpitope URL  
出力されるデータは、GlycoEpitopeのURLになります。
URLには、GlycoEpitopeのIDが入っています。  
`Sample URL : http://www.glycoepitope.jp/epitopes/EP0011`

| Variable | Data|
|----------|-----|
| ?ep_url | GlycoEpitope URL |

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

SELECT DISTINCT ?ep_url
FROM <http://rdf.glytoucan.org>
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glycoinfo.org/mapping/accnum/ep>
FROM <http://rdf.glycoinfo.org/glycoepitope>
WHERE {
	# Glytoucan
	VALUES ?AccessionNumber {"G00051MO"}
	?glytoucan glytoucan:has_primary_id ?AccessionNumber.

	# GlycoEpitope URL
	?glytoucan glycan:has_epitope ?ep_url .
}
```


### Output : GlycoEpitope ID & Epitope Name  
GlycoEpitope IDは、GlycoEpitopeで利用されているEpitopeのIDです。  
Epitope Nameは、GlycoEpitope IDと一対一です。

| Variable | Data|
|----------|-----|
| ?ep_id | GlycoEpitope ID |
| ?ep_name | Epitope Name |

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

SELECT DISTINCT ?ep_id ?ep_name
FROM <http://rdf.glytoucan.org>
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glycoinfo.org/mapping/accnum/ep>
FROM <http://rdf.glycoinfo.org/glycoepitope>
WHERE {
	# Glytoucan
	VALUES ?AccessionNumber {"G00051MO"}
	?glytoucan glytoucan:has_primary_id ?AccessionNumber.

	# GlycoEpitope URL
	?glytoucan glycan:has_epitope ?ep_url .

	# GlycoEpitope ID
	?ep_url dcterms:identifier ?ep_id .

	# Epitope Name
	?ep rdfs:label ?ep_name .
}
```


### Output : GlycoEpitope Sequence
GlycoEpitope Sequenceは、GlycoEpitopeの独自の表記フォーマットを利用しています。  

| Variable | Data|
|----------|-----|
| ?sequence | GlycoEpitope Sequence |

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

SELECT DISTINCT (str(?seq) AS ?sequence)
FROM <http://rdf.glytoucan.org>
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glycoinfo.org/mapping/accnum/ep>
FROM <http://rdf.glycoinfo.org/glycoepitope>
WHERE {
	# Glytoucan
	VALUES ?AccessionNumber {"G00051MO"}
	?glytoucan glytoucan:has_primary_id ?AccessionNumber.

	# GlycoEpitope URL
	?glytoucan glycan:has_epitope ?ep_url .

	# GlycoEpitope Sequence
	?ep_url glycan:has_glycosequence ?gseq .
	?gseq glycan:in_carbohydrate_format glycan:carbohydrate_format_glycoepitope .
	?gseq glycan:has_sequence ?seq .
}
```


### Output : Glycoprotein
GlycoEpitopeに関係するGlycoproteinです。

| Variable | Data|
|----------|-----|
| ?gp_name | Glycoprotein |

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

SELECT DISTINCT ?gp_name
FROM <http://rdf.glytoucan.org>
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glycoinfo.org/mapping/accnum/ep>
FROM <http://rdf.glycoinfo.org/glycoepitope>
WHERE {
	# Glytoucan
	VALUES ?AccessionNumber {"G00051MO"}
	?glytoucan glytoucan:has_primary_id ?AccessionNumber.

	# GlycoEpitope URL
	?glytoucan glycan:has_epitope ?ep_url .

	# glycoprotein
	?ep_url dcterms:isPartOf ?gp .
	?gp a glycan:glycoprotein .
	?gp rdfs:label ?gp_name .
}
```


### Output : Glycolipid
GlycoEpitopeに関係するGlycolipidです。

| Variable | Data|
|----------|-----|
| ?gl_name | Glycolipid |

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

SELECT DISTINCT ?gl_name
FROM <http://rdf.glytoucan.org>
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glycoinfo.org/mapping/accnum/ep>
FROM <http://rdf.glycoinfo.org/glycoepitope>
WHERE {
	# Glytoucan
	VALUES ?AccessionNumber {"G00051MO"}
	?glytoucan glytoucan:has_primary_id ?AccessionNumber.

	# GlycoEpitope URL
	?glytoucan glycan:has_epitope ?ep_url .

	# glycolipid
	?ep_url dcterms:isPartOf ?gl .
	?gl a glycan:glycolipid .
  ?gl rdfs:label ?gl_name .
}
```

### Output : Cell Line
GlycoEpitopeに関係のある細胞株です。

| Variable | Data|
|----------|-----|
| ?cell_name | Cell line |

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

SELECT DISTINCT ?cell_name
FROM <http://rdf.glytoucan.org>
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glycoinfo.org/mapping/accnum/ep>
FROM <http://rdf.glycoinfo.org/glycoepitope>
WHERE{
	# Glytoucan
	VALUES ?AccessionNumber {"G00051MO"}
	?glytoucan glytoucan:has_primary_id ?AccessionNumber.

	# GlycoEpitope URL
	?glytoucan glycan:has_epitope ?ep_url .

	# cell line
	?ep_url glycoepitope:found_in ?cell_line .
	?cell_line rdfs:label ?cell_name .
}
```


### Output : Tissue and Cellular Distribution
GlycoEpitopeに関係のある組織と細胞分布です。

| Variable | Data|
|----------|-----|
| ?tissue_name | Tissue and Cellular distribution |

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

SELECT DISTINCT ?tissue_name
FROM <http://rdf.glytoucan.org>
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glycoinfo.org/mapping/accnum/ep>
FROM <http://rdf.glycoinfo.org/glycoepitope>
WHERE{
	# Glytoucan
	VALUES ?AccessionNumber {"G00051MO"}
	?glytoucan glytoucan:has_primary_id ?AccessionNumber.

	# GlycoEpitope URL
	?glytoucan glycan:has_epitope ?ep_url .

	# Tissue and Cellular distribution
	?ep_url glycoepitope:tissue ?tissue .
	?tissue rdfs:label ?tissue_name .
}
```


### PubMed URL and PubMed ID
Epitope情報のソースであるPubMed URLとIDです。

| Variable | Data|
|----------|-----|
| ?pubmed | PuMed URL |
| ?pubmed_id | PubMed ID |

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

SELECT DISTINCT ?pubmed ?pubmed_id
FROM <http://rdf.glytoucan.org>
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glycoinfo.org/mapping/accnum/ep>
FROM <http://rdf.glycoinfo.org/glycoepitope>
WHERE{
	# Glytoucan
	VALUES ?AccessionNumber {"G00051MO"}
	?glytoucan glytoucan:has_primary_id ?AccessionNumber.

	# GlycoEpitope URL
	?glytoucan glycan:has_epitope ?ep_url .

	# PubMed URL and ID
	?ep_url dcterms:isReferencedBy ?citation .
	?citation rdfs:seeAlso ?pubmed .
	?pubmed dcterms:identifier ?pubmed_id .
}
```


### Output : Antibody ID & Antibody Name
Epitopeに関係のある抗体名とIDです。

| Variable | Data|
|----------|-----|
| ?antibody | Antibody URL |
| ?anti_id | Antibody ID |
| ?anti_name | Antibody Name |

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

SELECT DISTINCT ?antibody ?anti_id ?anti_name
FROM <http://rdf.glytoucan.org>
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glycoinfo.org/mapping/accnum/ep>
FROM <http://rdf.glycoinfo.org/glycoepitope>
WHERE{
	# Glytoucan
	VALUES ?AccessionNumber {"G00051MO"}
	?glytoucan glytoucan:has_primary_id ?AccessionNumber.

	# GlycoEpitope URL
	?glytoucan glycan:has_epitope ?ep_url .

	# antibody id
	?ep_url glycoepitope:has_antibody ?antibody .
	?antibody dcterms:identifier ?anti_id .

	# antibody name
	?ep_url glycoepitope:has_antibody ?antibody .
	?antibody rdfs:label ?anti_name .
}
```
