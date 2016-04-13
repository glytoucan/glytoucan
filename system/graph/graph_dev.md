---
title: Development of GRAPH
layout: default
---

# [仕様] GRAPH Rule


Domain rule  

| GlyTouCanのRDF  | 外部のDBのRDF |  
|-------------------|---------------|
| rdf.glytoucan.org | rdf.glycoinfo.org |

* __http://rdf.glycoinfo.org/[database-name]__
	* 例：http://rdf.glycoinfo.org/glycome-db

* __http://rdf.[domainname]/[機能・テーマ]/[対象]__
	* 例：http://rdf.glytoucan.org/linked-db/bcsdb




__機能・テーマ:__ 

* /linked-db : 外部のDB（RDFとしてファイルがあるもの）とGlyTouCanとが関係がある(mappingしたトリプル)
	* /bcsdb  
		* ver1.0では、GlyTouCan → GlycomeDB → BCSDBとう順番でJoinするSPARQLクエリを利用している。
		* GlyTouCanとBCSDBとのIDマッピングデータセットとする
	* /glycome-db
	* /glycoepitope






### [仕様] /linked-db GRAPH   



### /linked-db/bcsdb

##### GRAPH Name: `http://rdf.glytoucan.org/linked-db/bcsdb`

##### Sample triple

```
<http://rdf.glycoinfo.org/glycan/G00054MO>
  a glycan:Saccharide ;
  glycan:has_resource_entry <http://rdf.glycoinfo.org/bcsdb/6922> .

<http://rdf.glycoinfo.org/bcsdb/6922> 
  a glycan:Resource_entry ;
  glycan:in_glycan_database glycan:Database_bcsdb ;
  dcterms:identifier "6922" ;
  rdfs:seeAlso  <http://csdb.glycoscience.ru/bacterial/core/search_id.php?mode=record&id_list=6922> .
```


##### Note

```
<http://csdb.glycoscience.ru/bacterial/core/search_id.php?mode=record&id_list=6922>
このURIは、BCSDB RDFで使われている。
glycan:resource_entryのタイプ付けがされている
```


BCSDB RDFのどことリンクするか？  
BCSDB RDFでは、glycan:saccharideのインスタンスとowl:sameAsで記述されている

```
<http://csdb.glycoscience.ru/integration/make_rdf.php?db=database&mode=structure&id_list=747>
  a glyco:saccharide ;
  a glyco:glycoconjugate ;
  a glyco:glycoside ;
  owl:sameAs <http://csdb.glycoscience.ru/bacterial/core/search_id.php?mode=record&id_list=6922> 
```





### /linked-db/glycome-db

##### GRAPH Name: `http://rdf.glytoucan.org/linked-db/glycome-db`

##### Sample triple

```
<http://rdf.glycoinfo.org/glycan/G00054MO>
    a   glycan:Saccharide ;
    glycan:has_resource_entry   <http://rdf.glycoinfo.org/glycome-db/129> .

<http://rdf.glycoinfo.org/glycome-db/129> 
    a   glycan:Resource_entry ;
    glycan:in_glycan_database   glycan:Database_glycomedb ;
    dcterms:identifier "129" ;
    rdfs:seeAlso    <http://www.glycome-db.org/database/showStructure.action?glycomeId=129> .
```


##### Note

```
<http://www.glycome-db.org/database/showStructure.action?glycomeId=129>
このURIは、GlycomeDB RDFで使われていない。
そもそも、GlycomeDB RDFでは、GlycomeDB自体のURLが無い
```

* どうやってglycomedb rdfにresource entryをもたせるか？
	* 新しいGRAPHを用意する
	* `http://rdf.glytoucan.org/linked-db/glycome-db/resource_entry`
		* glycomedbのresource entryだけをあつかったGRAPH
		* glycomedb rdfをベースにして、constructで作ったresource entryのトリプル

##### 例 GRAPH `http://rdf.glytoucan.org/linked-db/glycome-db/resource_entry`

```
<http://rdf.glycome-db.org/glycan/129> 
    a   glycan:saccharide ;
    glycan:has_resource_entry   <http://www.glycome-db.org/database/showStructure.action?glycomeId=129> .
<http://www.glycome-db.org/database/showStructure.action?glycomeId=129> 
    a   glycan:resource_entry .
```


GlycomeDB RDFのどことリンクするか？

```
<http://rdf.glycome-db.org/glycan/129> 
    a   glycan:saccharide ;
```




### /linked-db/glycoepitope

##### GRAPH Name: `http://rdf.glytoucan.org/linked-db/glycoepitope`

##### Sample triple

```
<http://rdf.glycoinfo.org/glycan/G00054MO>
    a   glycan:Saccharide ;
    glycan:has_resource_entry   <http://rdf.glycoinfo.org/glycoepitope/EP0012> .

<http://rdf.glycoinfo.org/glycoepitope/EP0012> .
    a   glycan:Resource_entry ;
    glycan:in_glycan_database   glycan:Database_glycoepitope ;
    dcterms:identifier "EP0012" ;
    rdfs:seeAlso    <http://www.glycoepitope.jp/epitopes/EP0012> .
```


##### Note

```
<http://www.glycoepitope.jp/epitopes/EP0012>
このURIは、GlycoEpitope RDFで使われている。
glycan:Glycan_epitopeのタイプ付けがされている
```

GlycoEpitope RDFのどことリンクするか？

```
<http://www.glycoepitope.jp/epitopes/EP0012>
    a   glycan:Glycan_epitope ;
    dcterms:identifier "EP0012" .
```


