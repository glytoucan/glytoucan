---
title: SPARQL Query for Motif in Related data
layout: default
---
このSPARQL Queryは、GlyTouCanの糖鎖構造のエントリー画面にあるRelated dataにあるMonosaccharideの情報を取得するクエリです。  

### Input
Sample Accession number : G00051MO  
`?glycan glytoucan:has_primary_id "Input Accession number"` 


### Output
| Variable | Data|
|---------|------|
| ?ComponentName | Monosaccharide alias name by MsDB |
| ?cardinality | Cardinality of Monosaccharide  |


```
## Monosaccharide
SELECT DISTINCT ?ComponentName ?cardinality
FROM <http://rdf.glytoucan.org>
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glytoucan.org/ms/carbbank>
WHERE{
	# Accession Number
	?glycan a glycan:saccharide.
	?glycan glytoucan:has_primary_id "G00051MO" .
	OPTIONAL{
		?glycan glycan:has_component ?comp .
		?comp glycan:has_cardinality ?cardinality .
		?comp glycan:has_monosaccharide ?mono .
		?mono glycan:has_alias ?msdb .
		?msdb glycan:has_alias_name ?ComponentName .
	}
} 
```