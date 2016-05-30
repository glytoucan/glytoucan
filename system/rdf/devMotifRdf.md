---
title: Glycan motif RDF
author:
- Daisuke Shinmachi
date: 2016-05-10
layout: default
---

# Development of Glycan Motif RDF

**問題点 1**

Glycan motifは構造のパターンである。  
例えば、Motif Listから一つのMotifを選択した場合、エントリーページを表示するが、その糖鎖は、モチーフ構造を持っている糖鎖である。  
つまり、Glycan motifは、糖鎖の実体ではない。  
そのため、Glycan Motifに、Accession numberを付けることが問題となった。


**解決策**

Glycan motifのインスタンスIRIを作り、SaccharideとGlycan motifとを分ける。


**Motif triple**

現在のGlycan motifのRDF

```
@prefix rdf:	<http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs:	<http://www.w3.org/2000/01/rdf-schema#> .
@prefix glycan:	<http://purl.jp/bio/12/glyco/glycan#> .
@prefix glytoucan:	<http://www.glytoucan.org/glyco/owl/glytoucan#> .

<http://rdf.glycoinfo.org/glycan/G00051MO>
	glycan:has_motif	<http://rdf.glycoinfo.org/glycan/G00051MO>.

<http://rdf.glycoinfo.org/glycan/G00051MO>
	rdf:type	glycan:glycan_motif .
	rdfs:label	"Lewis X"@en .
	glycan:has_glycosequence	<http://rdf.glycoinfo.org/glycan/G00051MO/glycoct> ;
	glycan:has_glycosequence	<http://rdf.glycoinfo.org/glycan/G00051MO/wurcs/2.0> ;
	glytoucan:is_reducing_end	false .
```


変更後のRDF

```
@prefix glycan: <http://purl.jp/bio/12/glyco/glycan#> .
@prefix glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#> .

<http://rdf.glycoinfo.org/glycan/G00051MO>	
	a	glycan:Saccharide;
	glycan:has_motif	<GlycanMotif/WURCS>;

<GlycanMotif/WURCS> 
	a	glycan:Glycan_motif;
	rdfs:label	"Lewis X"@en;
	glycan:has_glycosequence <Glycosequnece>;
	glytoucan:has_type	glytoucan:Motif_type_non_reducing_end.
```



**オントロジーで定義するターム**

```
# GlyTouCan OWL
@prefix rdf:	<http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs:	<http://www.w3.org/2000/01/rdf-schema#> .
@prefix glycan: <http://purl.jp/bio/12/glyco/glycan#> .
@prefix glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#> .
@prefix sio: <http://semanticscience.org/resource/> . 

## Class
glytoucan:Motif_type
	rdf:type	owl:Class;
	rdfs:label	"Motif type"@en;
	rdfs:comment	"Motif type means position type that appear in glycan structure."@en.


## Property
glytoucan:has_type
	rdf:type	owl:ObjectProperty;
	rdfs:domain	glycan:Gycan_motif;
	rdfs:range	glytoucan:Motif_type;
	rdfs:label	"has type"@en.
	rdfs:comment	"A glycan motif has type such as internal, reducing end and non-reducing end."@en.


## Individual
glytoucan:Motif_type_internal 
	rdf:type	glytoucan:Motif_type, owl:NamedIndividual;
	rdfs:label	“Internal”@en;
	rdfs:comment	“A glycan motif  internal apper in the glycan structure. “@en.

glytoucan:Motif_type_reducing_end
	rdf:type	glytoucan:Motif_type, owl:NamedIndividual;
	rdfs:label	“Reducing end”@en;
	rdfs:comment	“A glycan motif reducing end apper in the glycan structure. “@en.

glytoucan:Motif_type_non_reducing_end
	rdf:type	glytoucan:Motif_type, owl:NamedIndividual;
	rdfs:label	“Non-reducing end”@en;
	sio:hasSynonym	“Non-reducing terminal”@en;
	rdfs:comment	“A glycan motif non-reducing end apper in the glycan structure. “@en.
```



**問題点 2**

Glycan MotifのインスタンスのIRIの中身はどんな文字列か?


**解決策**

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
`<http://rdf.glycoinfo.org/glycan/G00051MO/glycoct>`  
`<http://rdf.glycoinfo.org/glycan/G00051MO/wurcs/2.0>`  

GlycoCT形式、WURCS形式と分けてIRIを作っていた。  
IRIには、Accession numberを含めないので、別の記述方法を考えなければならない

## 解決策

GlyTouCanで扱うGlycan motifは、登録されるSaccharideと違い、複数の表示形式を持たないこととする。  
つまり、Glycan Motifの糖鎖構造の表示形式は、WURCSのみ扱う。


Saccharideの場合、以下のようなGlycosequenceのインスタンスIRIが使われている  
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

これまでは、Motif nameの記述にrdfs:labelを使ってきたが、これはMotif nameが一つしかないと仮定して作ってきた。  
そのため、複数を記述するための述語を利用する。

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

* Glycan MotifのインスタンスIRIを追記した。
* Glycan Motif SequenceのインスタンスIRIを追記した。
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
	glytoucan:has_type	glytoucan:Motif_type_non_reducing_end;
	glycan:has_alias	<http://rdf.glycoinfo.org/motif/aliasWURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1>.


<http://rdf.glycoinfo.org/motif/sequence/WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1>
	a	glycan:Glycosequence;
	rdfs:label "WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1"^^xsd:string;
	glycan:has_sequence "WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1"^^xsd:string;
	glycan:in_carbohydrate_format	glycan:carbohydrate_format_wurcs.


<http://rdf.glycoinfo.org/motif/alias/WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1>
	a	glycan:Glycan_motif_alias;
	glycan:has_alias_name	"Lewis X"@en.
```

















