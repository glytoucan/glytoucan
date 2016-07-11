---
title: Split GlyTouCan RDF GRAPH
authors:
- Daisuke Shinmachi
date: 2016-04-19
layout: default
---

# rdf.glytoucan.org(from gs2virt)をバラす


## Target GRAPH

**From**   
`http://rdf.glytoucan.org` (made by gs2virt)

**To**  
`http://rdf.glytoucan.org/core`  
`http://rdf.glytoucan.org/sequence/glycoct`  
`http://rdf.glytoucan.org/motif`  
`http://rdf.glytoucan.org/ms/carbbank`

\#`http://rdf.glytoucan.org/image` は作っていない  
\# massは、gs2virtでは扱っていない。`http://rdf.glytoucan.org/mass`で記述されている。  
\# クラス名を大文字から始めることは、この時点では行わない。登録システムの変更も行わなければならないため。  
\# 現在本番環境で利用されているRDFモデルに準じて、gs2virtを各graphに分割する。





#### Saccharide & Resource entry

`<http://rdf.glytoucan.org/core>`  

* Saccharide class  
* Resource entry class  

* glycan:has_componentは、/ms/carbankの方に移す
* Accession numberは、has_primary_idを利用してる
* `</core>`に、has_componentが元々入っている糖鎖もある



**INSERT SPARQL**

**Saccharide**

```
log_enable(2,1);
sparql
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
INSERT
{ GRAPH <http://rdf.glytoucan.org/core> {
    ?Saccharide
        a glycan:saccharide ;
        glytoucan:has_primary_id ?AccessionNumber ;
        glycan:has_resource_entry ?ResourceEntry .
  }
}
USING <http://rdf.glytoucan.org>
WHERE {
    # Saccharide
    ?Saccharide a glycan:saccharide .
    ?Saccharide glytoucan:has_primary_id ?AccessionNumber .
    ?Saccharide glycan:has_resource_entry ?Entry .
    BIND(STR(?Entry) AS ?strEntry)
    BIND(STRAFTER(?strEntry, "http://glytoucan.org/Structures/Glycans/") AS ?AccNum)
    BIND(IRI(CONCAT("http://rdf.glycoinfo.org/resource-entry/", ?AccNum)) AS ?ResourceEntry)
};
checkpoint;
commit WORK;
```



**Resource Entry**

```
log_enable(2,1);
sparql
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX dcterms: <http://purl.org/dc/terms/>

INSERT
{ GRAPH <http://rdf.glytoucan.org/core> {
    ?ResourceEntry
        a glycan:resource_entry ;
        glytoucan:contributor ?Contributor ;
        glytoucan:date_registered ?Date ;
        glycan:in_glycan_database ?DB ;
        dcterms:identifier ?AccessionNumber ;
        rdfs:seeAlso ?Entry .
  }
}
USING <http://rdf.glytoucan.org>
WHERE {
    # Resource entry
    ?Saccharide glytoucan:has_primary_id ?AccessionNumber .
    ?Saccharide glycan:has_resource_entry ?Entry .
    ?Entry a glycan:resource_entry .
    ?Entry glytoucan:contributor ?Contributor .
    ?Entry glytoucan:date_registered ?Date .
    ?Entry glycan:in_glycan_database ?DB .
    BIND(STR(?Entry) AS ?strEntry)
    BIND(STRAFTER(?strEntry, "http://glytoucan.org/Structures/Glycans/") AS ?AccNum)
    BIND(IRI(CONCAT("http://rdf.glycoinfo.org/resource-entry/", ?AccNum)) AS ?ResourceEntry)
};
checkpoint;
commit WORK;
```


**confirm query**

**Saccharide class**    

```
# Saccharide 
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>

SELECT ?ResourceEntry
#SELECT count(?ResourceEntry)
#SELECT count(?Saccharide)
#FROM <http://rdf.glytoucan.org>
FROM <http://rdf.glytoucan.org/core>
WHERE {
    # Saccharide
    #?Saccharide a ?Class .
    #?Saccharide glytoucan:has_primary_id ?AccessionNumber .
    #?Saccharide glycan:has_resource_entry ?ResourceEntry .
    #?Saccharide glycan:has_resource_entry ?ResourceEntry .
}
limit 200
```


**Resource Entry class**    

```
# Resource entry 
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX dcterms: <http://purl.org/dc/terms/>

SELECT *
#SELECT COUNT(?AccessionNumber)
#SELECT COUNT(?DB)
#SELECT COUNT(?Date)
#SELECT COUNT(?Contributor)
#SELECT COUNT(?ResourceEntry)
#FROM <http://rdf.glytoucan.org>
FROM <http://rdf.glytoucan.org/core>
WHERE {
    # New Resource entry
    #?ResourceEntry a ?Class .
    #?ResourceEntry glytoucan:contributor ?Contributor .
    #?ResourceEntry glytoucan:date_registered ?Date .
    #?ResourceEntry glycan:in_glycan_database ?DB .
    #?ResourceEntry dcterms:identifier ?AccessionNumber .
    #?ResourceEntry rdfs:seeAlso ?Entry .
}
limit 200
```




#### Glycosequence 

`<http://rdf.glytoucan.org/sequence/glycoct>`  

* Glycosequence class  
* `http://rdf.glytoucan.org/sequence/glycoct`のGRAPHについて
	* 登録時のGlycoCTを記述している
	* Property
		* rdfs:label, glycan:has_glycosequence, glycan:has_sequence, glycan:in_carbohydrate_format
		* 今のところ、glycan:glycosequenceのタイプ付けはされていない
		* rdfs:labelとglycan:has_sequenceが同じデータタイプ
			* rdfs:labeは、,Stanzaでは使われていなかった


**INSERT SPARQL**

```
log_enable(2,1);
sparql
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 
INSERT
{ GRAPH <http://rdf.glytoucan.org/sequence/glycoct> {
    ?Saccharide 
        glycan:has_glycosequence ?GSequence .
    ?GSequence
        glycan:has_sequence ?Sequence ;
        glycan:in_carbohydrate_format ?Format ;
        rdfs:label ?Sequence .
  }
}
USING <http://rdf.glytoucan.org>
WHERE {
    # Glycosequence
    ?Saccharide glycan:has_glycosequence ?GSequence .
    ?GSequence glycan:has_sequence ?Sequence .
    ?GSequence glycan:in_carbohydrate_format ?Format .
};
checkpoint;
commit WORK;
```



**Confirm query**

```
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 

SELECT *
#SELECT COUNT(?label)
#SELECT COUNT(?Format)
#SELECT COUNT(?Sequence)
#SELECT COUNT(?GSequence)
#FROM <http://rdf.glytoucan.org>
FROM <http://rdf.glytoucan.org/sequence/glycoct> 
WHERE {
    # Glycosequence
    ?Saccharide glycan:has_glycosequence ?GSequence .
    ?GSequence glycan:has_sequence ?Sequence .
    ?GSequence glycan:in_carbohydrate_format ?Format .
    ?GSequence rdfs:label ?label .
}
limit 100
```






#### Glycan motf 

`<http://rdf.glytoucan.org/motif>`  


以前の`</motif>`には、glycan:has_motifのみだった


`</motif>`に、以下の要素を追加する

* rdf:type
* glycan:has_glycosequence
* rdfs:label
* glytoucan:is_reducing_end




**INSERT query**

```
log_enable(2,1);
sparql
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>

INSERT
{ GRAPH <http://rdf.glytoucan.org/motif> {
   # Motif
    ?Saccharide
        glycan:has_motif ?Motif .
    ?Motif
        a glycan:glycan_motif ;
        glycan:has_glycosequence ?GSequence ;
        rdfs:label ?MotifName ;
        glytoucan:is_reducing_end ?ReducingEnd .
  }
}
USING <http://rdf.glytoucan.org>
WHERE {
    # Motif
    ?Saccharide glycan:has_motif ?Motif .
    ?Motif a glycan:glycan_motif .
    ?Motif glycan:has_glycosequence ?GSequence .
    ?Motif rdfs:label ?MotifName .
    ?Motif glytoucan:is_reducing_end ?ReducingEnd .
};
checkpoint;
commit WORK;
```


**Confirm query**

```
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>

SELECT *
#SELECT COUNT(?MotifName)
#SELECT COUNT(?GlycanMotifAlias)
#SELECT COUNT(?ReducingEnd)
#SELECT COUNT(?GSequence)
#SELECT COUNT(?GlycanMotif)
#FROM <http://rdf.glytoucan.org>
FROM <http://rdf.glytoucan.org/motif/test> 
WHERE {
    # Motif
    #?Saccharide glycan:has_motif ?GlycanMotif.
    #?GlycanMotif a glycan:glycan_motif .
    #?GlycanMotif glycan:has_glycosequence ?GSequence .
    #?GlycanMotif glytoucan:is_reducing_end ?ReducingEnd .
    #?GlycanMotif rdfs:label ?MotifName .
}
limit 100
```







#### Component 

Component情報がgs2virtからなくなると、Glycan listおよびGlycan entryが表示されなくなる
glycan:Componentも追加する  
そのため、/ms/carbbankにComponent情報を追加する



Target GRAPH  
`<http://rdf.glytoucan.org/ms/carbbank>` 


**INSERT query**

```
log_enable(2,1);
sparql
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>

INSERT
{ GRAPH <http://rdf.glytoucan.org/ms/carbbank> {
   # Component
    ?saccharide
        glycan:has_component ?component .
    ?component
        a glycan:componentt ;
        glycan:has_cardinality ?cardinality ;
        glycan:has_monosaccharide ?mono .
  }
}
USING <http://rdf.glytoucan.org>
WHERE {
    # Component
    ?saccharide glycan:has_component ?component .
    ?component a glycan:component .
    ?component glycan:has_cardinality ?cardinality .
    ?component glycan:has_monosaccharide ?mono .
};
checkpoint;
commit WORK;
```

**Confirm query**

```
## Monosaccharide
SELECT DISTINCT ?ComponentName ?cardinality
#FROM <http://rdf.glytoucan.org>
#FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glytoucan.org/ms/carbbank>
WHERE{
    # Accession Number
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





#### Image class

`<http://rdf.glytoucan.org/image>`  

**GRAPHは作っていない(今のところ必要な場面が無いため)**


```
* GlyTouCanでは、RDFで記述されているImageのURIは利用していない
* JavascriptでイメージのURLを作っている
* 念のためにやり方を残す
```

| Instance URI        | property                 | Class          | Instance URI | Literal              | Individual                      |
|---------------------|--------------------------|----------------|--------------|----------------------|---------------------------------|
| saccharide instance | glycan:has_image         | image instance |              |                      |                                 |
| image instance      | a                        | glycan:image   |              |                      |                                 |
|                     | dc:format                |                |              | image/pingxsd:string |                                 |
|                     | glycan:has_symbol_format |                |              |                      | glycan:symbol_format_cfg        |
|                     |                          |                |              |                      | glycan:symbol_format_uoxf       |
|                     |                          |                |              |                      | glycan:symbol_format_text       |
|                     |                          |                |              |                      | glycan:symbol_format_uoxf_color |
|                     |                          |                |              |                      | glycan:symbol_format_cfg_uoxf   |
|                     |                          |                |              |                      | glycan:symbol_format_cfg_bw     |



**INSERT query**

```
log_enable(2,1);
sparql
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
INSERT
{ GRAPH <http://rdf.glytoucan.org/image> {
  ?Saccharide glycan:has_image ?Image .
    ?Image a glycan:image, glycan:Image .
    ?Image dc:format ?Format .
    ?Image glycan:has_symbol_format ?Symbol .
  }
}
FROM <http://rdf.glytoucan.org>
WHERE {
    # Image 
  ?Saccharide glycan:has_image ?Image .
    ?Image a glycan:image .
    ?Image dc:format ?Format .
    ?Image glycan:has_symbol_format ?Symbol .
}
```

**Confirm query**

```
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>

SELECT *
#SELECT COUNT(?Symbol)
#SELECT COUNT(?Format)
#SELECT COUNT(?Image)
#FROM <http://rdf.glytoucan.org>
FROM <http://rdf.glytoucan.org/image/test> 
WHERE {
    # Image 
    #?Sacc glycan:has_image ?Image .
    #?Image a ?Class .
    #?Image dc:format ?Format .
    #?Image glycan:has_symbol_format ?Symbol .

}
limit 100
```

### RDF model

各GRAPHに記述されているRDF model

**Saccharide RDF**  

```
?Saccharide a glycan:saccharide, glycan:Saccharide .
?Saccharide glycan:has_resource_entry ?ResourceEntry .
?Saccharide glytoucan:has_primary_id ?AccessionNumber .
```

**Resource entry RDF**

```
?ResourceEntry a glycan:resource_entry, glycan:Resource_entry .
?ResourceEntry glytoucan:contributor ?Person .
?ResourceEntry glytoucan:date_registered ?dateTimeStanp .
?ResourceEntry dcterms:identifier ?AccessionNumber .
?ResourceEntry rdfs:seeAlso ?GlyTouCanURL .
?ResourceEntry glycan:in_glycan_database glytoucan:database_glytoucan .
```


**Glycosequence RDF**  

```
?Saccharide glycan:has_glycosequence ?Glycosequence .
?Glycosequence a glycan:glycosequence, glycan:Glycosequence .
?Glycosequence glycan:has_sequence ?GlycoCT_Sequence .
?Glycosequence glycan:in_carbohydrate_format glycan:carbohydrate_format_glycoct .
?Glycosequence rdfs:label ?GlycoCT_String .
```

**Glycan motif RDF**  

```
?Saccharide glycan:has_motif ?GlycanMotif .
?GlycanMotif a glycan:glycan_motif, glycan:Glycan_motif .
?GlycanMotif glycan:has_glycosequence ?Glycosequence .
?GlycanMotif rdfs:label ?MotifName .
?GlycanMotif glytoucan:is_reducing_end ?Boolean .
```

**Component RDF**

**Before RDF**  

```
# Monosaccharide
?mono a glycan:monosaccharide .
?mono glycan:has_alias ?msdb .
?msdb a glycan:monosaccharide_alias .
?msdb glycan:has_alias_name ?ComponentName .
?msdb glycan:has_monosaccharide_notation_scheme glycan:monosaccharide_notation_scheme_carbbank  .
```

**After RDF**  

```
# Component
?saccharide glycan:has_component ?component .
?component a glycan:component, glycan:Component .
?component glycan:has_cardinality ?cardinality .
?component glycan:has_monosaccharide ?mono .

# Monosaccharide
?mono a glycan:monosaccharide .
?mono glycan:has_alias ?msdb .
?msdb a glycan:monosaccharide_alias .
?msdb glycan:has_alias_name ?ComponentName .
?msdb glycan:has_monosaccharide_notation_scheme glycan:monosaccharide_notation_scheme_carbbank  .
```



### Note
* http://test.ts.glytoucan.org/sparql
	* このテスト環境のエンドポイントでコンストラクトすると、 glytoucan:is_reducing_endのbooleanが数字の０と１になる
* https://ts.glytoucan.org/sparql
	* 本番環境のエンドポイントでコンストラクトをすると、glytoucan:is_reducing_endのbooleanが"true"^^xsd:booleanと"false"^^xsd:boolean になる
* テスト環境にTTLをアップロードしても、Virtuosoの状態により、0と1になってしまう。
* テスト環境、本番環境、共にINSERTクエリを利用する


