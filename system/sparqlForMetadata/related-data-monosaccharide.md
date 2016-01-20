---
title: SPARQL Query for Motif in Related data
layout: default
---
このSPARQL Queryは、GlyTouCanの糖鎖構造のエントリー画面にあるRelated dataにあるMonosaccharideの情報を取得するクエリです。
Monosaccharide alias nameとは、単糖名のことです。
alias nameという呼び方をするのは、CarbBank, IUPAC, GlycoCT, Glycosciences.de, BCSDB, MonosaccharideDB, CFGといったNotation schemaが存在するからです。
主にこのNotation schemaはMonosaccharideDB(MsDB)のRDFで使われています。  
[MsDB RDF](http://www.monosaccharidedb.org/rdf/monosaccharide.action?name=b-dglc-HEX-1%3A5%7C%7C%282d%3A1%29n-acetyl%7C%283o%3A1%29sulfate)


### Input
Sample Accession number : G00051MO  
`?glycan glytoucan:has_primary_id "Input Accession number"`


### Output
| Variable | Data|
|---------|------|
| ?ComponentName | Monosaccharide alias name by MsDB |
| ?Cardinality | Cardinality of Monosaccharide  |


```
## Monosaccharide
SELECT DISTINCT ?ComponentName ?Cardinality
FROM <http://rdf.glytoucan.org>
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glytoucan.org/ms/carbbank>
WHERE{
	# Accession Number
	?glycan a glycan:saccharide.
	?glycan glytoucan:has_primary_id "G00051MO" .
	OPTIONAL{
		?glycan glycan:has_component ?comp .
		?comp glycan:has_cardinality ?Cardinality .
		?comp glycan:has_monosaccharide ?mono .
		?mono glycan:has_alias ?msdb .
		?msdb glycan:has_alias_name ?ComponentName .
	}
}
```
