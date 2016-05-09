---
title: Partner RDF
authors:
- Daisuke Shinmachi
date: 2016-05-9
layout: default
---

# Development of Glycan Motif RDF

## 問題点 1

モチーフは構造のパターンであるため、糖鎖構造の実体ではないMotifに、Accession numberがついていることがおかしい。
例えば、Motif Listから一つのMotifを選択した場合、エントリーへジャンプするが、その糖鎖は、モチーフ構造を持っている糖鎖である。


## 解決策

SaccharideのインスタンスとGlycan motifのインスタンスを作り、SaccharideとGlycan motifとを分ける


**Motif triple**

現在のRDF

```
@prefix rdf:	<http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix saccharide:	<http://rdf.glycoinfo.org/glycan/> .
@prefix glycan:	<http://purl.jp/bio/12/glyco/glycan#> .
@prefix rdfs:	<http://www.w3.org/2000/01/rdf-schema#> .
@prefix glytoucan:	<http://www.glytoucan.org/glyco/owl/glytoucan#> .
@prefix ns4:	<http://rdf.glycoinfo.org/glycan/G00054MO/> .

saccharide:G00054MO	
	glycan:has_motif	saccharide:G00054MO .

saccharide:G00054MO	
	rdf:type	glycan:glycan_motif .
	rdfs:label	"Sialyl Lewis X"@en .
	glycan:has_glycosequence	ns4:glycoct ;
	glytoucan:is_reducing_end	false .
```


変更後のRDF

```
@prefix glycan: <http://purl.jp/bio/12/glyco/glycan#> .
@prefix glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#> .

saccharide:G00054MO	
	a	glycan:Saccharide;
	glycan:has_motif	<GlycanMotif/WURCS>;

<GlycanMotif/WURCS> 
	a	glycan:Glycan_Motif;
	rdfs:label	"Sialyl Lewis X"@en;
	glycan:has_glycosequence <Glycosequnece>;
	glytoucan:has_type	glytoucan:Non_reducing_end.
```



オントロジーで定義するターム

```
# GlyTouCan OWL
@prefix glycan: <http://purl.jp/bio/12/glyco/glycan#> .
@prefix glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#> .
@prefix sio: <http://semanticscience.org/resource/> . 

## Class
glytoucan:Motif_type
	rdf:type	owl:Class;
	rdfs:label	"Motif type"^^xsd:string;
	rdfs:comment	"Motif type means position type that appear in glycan structure."^^xsd:string.


## Property
glytoucan:has_type
	rdf:type	owl:ObjectProperty;
	rdfs:domain	glycan:Gycan_Motif;
	rdfs:range	glytoucan:Motif_type;
	rdfs:label	"has type"^^xsd:string.


## Individual
glytoucan:Internal 
	rdf:type	glytoucan:Motif_type, owl:NamedIndividual;
	rdfs:label	“Internal”^^xsd:string;
	rdfs:comment	“A glycan motif  internal apper in the glycan structure. “^^xsd:string.

glytoucan:Reducing_end
	rdf:type	glytoucan:Motif_type, owl:NamedIndividual;
	rdfs:label	“Reducing end”^^xsd:string.

glytoucan:Non_reducing_end
	rdf:type	glytoucan:Motif_type, owl:NamedIndividual;
	rdfs:label	“Non-reducing end”^^xsd:string;
	sio:hasSynonym	“Non-reducing terminal”^^xsd:string.
```



## 問題点 2

Glycan MotifのIRIの形は?


## 解決策

IRIには、MotifのWURCSが含まれる

`<http://rdf.glycoinfo.org/motif/{WURCS}>`

=> より具体的なIRIが欲しいところ。




## 問題点 3

各Glycan MotifがどのMotif typeであるかをどうやって判断するか？






















