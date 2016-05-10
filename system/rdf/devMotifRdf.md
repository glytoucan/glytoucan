---
title: Glycan motif RDF
author:
- Daisuke Shinmachi
date: 2016-05-10
layout: default
---

# Development of Glycan Motif RDF

## 問題点 1

Glycan motifは構造のパターンである。  
例えば、Motif Listから一つのMotifを選択した場合、エントリーページを表示するが、その糖鎖は、モチーフ構造を持っている糖鎖である。

Glycan Motifは、糖鎖構造の実体ではないため、Accession numberを付けることに問題がある。


## 解決策

SaccharideのインスタンスとGlycan motifのインスタンスを作り、SaccharideとGlycan motifとを分ける。


**Motif triple**

現在のRDF

```
@prefix rdf:	<http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix glycan:	<http://purl.jp/bio/12/glyco/glycan#> .
@prefix rdfs:	<http://www.w3.org/2000/01/rdf-schema#> .
@prefix glytoucan:	<http://www.glytoucan.org/glyco/owl/glytoucan#> .

<http://rdf.glycoinfo.org/glycan/G00054MO>
	glycan:has_motif	<http://rdf.glycoinfo.org/glycan/G00054MO>.

<http://rdf.glycoinfo.org/glycan/G00054MO>
	rdf:type	glycan:glycan_motif .
	rdfs:label	"Sialyl Lewis X"@en .
	glycan:has_glycosequence	<http://rdf.glycoinfo.org/glycan/G00054MO/glycoct> ;
	glycan:has_glycosequence	<http://rdf.glycoinfo.org/glycan/G00054MO/wurcs/2.0> ;
	glytoucan:is_reducing_end	false .
```


変更後のRDF

```
@prefix glycan: <http://purl.jp/bio/12/glyco/glycan#> .
@prefix glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#> .

<http://rdf.glycoinfo.org/glycan/G00054MO>	
	a	glycan:Saccharide;
	glycan:has_motif	<GlycanMotif/WURCS>;

<GlycanMotif/WURCS> 
	a	glycan:Glycan_motif;
	rdfs:label	"Sialyl Lewis X"@en;
	glycan:has_glycosequence <Glycosequnece>;
	glytoucan:has_type	glytoucan:Non_reducing_end.
```



**オントロジーで定義するターム**

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
	rdfs:domain	glycan:Gycan_motif;
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

Glycan MotifのインスタンスのIRIの中身はどんな文字列か?


## 解決策

Glycan motifのIRIに、WURCSを含ませる

`<http://rdf.glycoinfo.org/motif/{WURCS}>`

例：  
`<http://rdf.glycoinfo.org/motif/WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1>`



## 問題点 3

各Glycan Motifが、どのMotif typeであるかをどうやって判断するか？  
例えば：G00051MOは３つのMotif typeのうち、どのタイプか？  

## 解決策

未検討



## 問題点４

GlycosequenceのインスタンスIRIはどうやって作るか？

これまでは、  
`<http://rdf.glycoinfo.org/glycan/G00054MO/glycoct>`  
`<http://rdf.glycoinfo.org/glycan/G00054MO/wurcs/2.0>`  

GlycoCT形式、WURCS形式と分けてIRIを作っていた。  
IRIには、Accession numberを含めないので、別の記述方法を考えなければならない

## 解決策

GlyTouCanで扱うGlycan motifは、登録されるSaccharideと違い、複数の表示形式を持たないこととする。
つまり、Glycan Motifの糖鎖構造の表示形式は、WURCSのみ扱う。


Saccharideの場合、以下のようなGlycosequence IRIが使われている  
`<http://rdf.glycoinfo.org/glycan/G00051MO/wurcs/2.0>`

Glycan motifのGlycosequenceを、WURCSの文字列を使って表現した場合  
=> `<http://rdf.glycoinfo.org/motif/sequence/WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1>`


**課題**  
~~新しいMotifのGlycosequence IRIは、WURCS-RDFで対応が必要~~  




## 問題点５

Motif nameは、複数存在する可能性がある。  
人によっては、違うMotif nameが使われている可能性がある。  
そのため、複数のMotif nameが記述できる方法が必要である。  

## 解決策

これまでは、Motif nameの記述にrdfs:labelを使ってきたが、これはMotif nameが一つの時に限る。  
そのため、複数を記述するための述語を用意する。

* glycan:has_alias  
* glycan:has_alias_name  

述語を使った場合、以下のRDFが記述できる

```
<glycan:Glycan_motif> 
	a glycan:Glycan_motif ;
	rdfs:subClassOf glycan:Motif ;
	glycan:has_alias <glycan:Glycan_motif_alias> .

<glycan:Glycan_motif_alias> 
	a glycan:Glycan_motif_alias ;
	glycan:has_alias_name "alias name"^^xsd:string .
```





## 変更後のRDF(修正)

* Glycan MotifのインスタンスのIRIを追記した。
* Glycan Motif SequenceのインスタンスのIRIを追記した。
* Motif nameは、Glycan Motf aliasに記述した。


```
@prefix glycan: <http://purl.jp/bio/12/glyco/glycan#> .
@prefix glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#> .

# Lewis X
<http://rdf.glycoinfo.org/glycan/G00051MO>
	a	glycan:Saccharide;
	glycan:has_motif	<http://rdf.glycoinfo.org/motif/WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1>.


<http://rdf.glycoinfo.org/motif/WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1>
	a	glycan:Glycan_motif;
	glycan:has_glycosequence <http://rdf.glycoinfo.org/motif/sequence/WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1>;
	glytoucan:has_type	glytoucan:Non_reducing_end;
	glycan:has_alias	<http://rdf.glycoinfo.org/motif/aliasWURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1>.


<http://rdf.glycoinfo.org/motif/sequence/WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1>
	a	glycan:Glycosequence;
	rdfs:label "WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1"^^xsd:string;
	glycan:has_sequence "WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1"^^xsd:string;
	glycan:in_carbohydrate_format	glycan:carbohydrate_format_wurcs.


<http://rdf.glycoinfo.org/motif/aliasWURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1>
	a	glycan:Glycan_motif_alias;
	glycan:has_alias_name	"Lewis X"@en.
```

















