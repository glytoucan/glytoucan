---
title: Glyca Motif RDF
authors:
- Daisuke Shinmachi
date: 2016-05-10
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
`<http://rdf.glycoinfo.org/motif/WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1>`

IRIが長いので、PREFIXを使って省略して表現する。

```
@prefix motif: <http://rdf.glycoinfo.org/motif/> .

motif:WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1
	a	glycan:Glycan_motif.
```



## 問題点 3

各Glycan MotifがどのMotif typeであるかをどうやって判断するか？  
例えば：G00051MOは３つのMotif typeのうち、どのタイプか？  

## 解決策

=>



## 問題点４

`<Glycosequence>`はどうやって作るか？
これまでは、  
`<http://rdf.glycoinfo.org/glycan/G00054MO/glycoct>`  
`<http://rdf.glycoinfo.org/glycan/G00054MO/wurcs/2.0>`  

表記形式が違うごとに分けてIRIを作っていた。  
IRIには、Accession numberを入れないので、別の記述方法を考えなければならない

## 解決策

GlyTouCanで扱うGlycan Motifは、登録されるSaccharideと違い、複数の表示形式を持たないことにする。
つまり、Glycan Motifの糖鎖構造の表示形式は、WURCSのみとして扱う。

これまでは、以下のようなSaccharideのGlycosequence IRIが使われている  
`<http://rdf.glycoinfo.org/glycan/G00051MO/wurcs/2.0>`

Motif sequeceであることと、WURCSの文字列を使ったIRI  
=> `<http://rdf.glycoinfo.org/motif/sequence/WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1>`

```
@prefix mseq: <http://rdf.glycoinfo.org/motif/sequence/> .

mseq:WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1
```

**課題**  
新しいMotifのGlycosequence IRIは、WURCS-RDFで対応が必要  




### 問題点５

モチーフ名が今後、複数存在する可能性がある。  
人によっては、違うモチーフ名が使われている可能性がある。  
そのため、複数のモチーフ名が記述できるような書き方を考える。  

## 解決策

これまでは、モチーフ名の記述にrdfs:labelを使ってきたが、これはモチーフ名が一つの時に限る。  
そのため、複数を記述するための述語を用意する。

```
<glycan:Glycan_motif> 
	a glycan:Glycan_motif ;
	rdfs:subClassOf glycan:Motif ;
	glycan:has_alias <glycan:Glycan_motif_alias> .

<glycan:Glycan_motif_alias> 
	a glycan:Glycan_motif_alias ;
	glycan:has_alias_name "alias name"^^xsd:string .
```

糖鎖構造に名前をつけるためのタームを用意する。  
glycan:has_alias  
glycan:has_alias_name  




## 変更後のRDF(修正)

* IRIが長くなるので、PREFIXを活用して、IRIを短縮した。
* Glycan MotifのインスタンスのIRIを追記した。
* Glycan Motif SequenceのインスタンスのIRIを追記した。
* モチーフ名は、Glycan Motf aliasに記述した。


```
@prefix glycan: <http://purl.jp/bio/12/glyco/glycan#> .
@prefix glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#> .
@prefix saccharide:	<http://rdf.glycoinfo.org/glycan/> .
@prefix motif: <http://rdf.glycoinfo.org/motif/> .
@prefix mseq: <http://rdf.glycoinfo.org/motif/sequence/> .
@prefix malias: <http://rdf.glycoinfo.org/motif/alias> .

# Lewis X
saccharide:G00051MO
	a	glycan:Saccharide;
	glycan:has_motif	motif:WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1.


motif:WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1
	a	glycan:Glycan_motif;
	glycan:has_glycosequence mseq:WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1;
	glytoucan:has_type	glytoucan:Non_reducing_end;
	glycan:has_alias	malias:WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1.


mseq:WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1
	a	glycan:Glycosequence;
	rdfs:label "WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1"^^xsd:string;
	glycan:has_sequence "WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1"^^xsd:string;
	glycan:in_carbohydrate_format	glycan:carbohydrate_format_wurcs.


malias:WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1
	a	glycan:Glycan_motif_alias;
	glycan:has_alias_name	"Lewis X"@en.
```

















