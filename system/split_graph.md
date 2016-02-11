---
title: Split GlyTouCan RDF GRAPH
layout: default
---
# rdf.glytoucan.org(from gs2virt)をバラす



## Virtuoso note
VirtuosoのSPARQLの結果件数の設定  
ResultSetMaxRows = 100万(テスト環境&本番環境)  
テスト環境では、CONSTRCTで全て取れた  
本番環境では、CONSTRCTで全て取れなかった  



## Target GRAPH
**From**   
`http://rdf.glytoucan.org` (made by gs2virt)

**To**  
`http://rdf.glytoucan.org/core`  
including following classes  

* Saccharide class  
* Resource entry class  


`http://rdf.glytoucan.org/sequence/glycoct`  
including following classes  

* Glycosequence class  


`http://rdf.glytoucan.org/image`  
including following classes  

* Image class


`http://rdf.glytoucan.org/motif`  
including following classes  

* Motif class




## Saccharide Class  
**From**`http://rdf.glytoucan.org`  
**To**`http://rdf.glytoucan.org/core`  

* glycan:componentは今後利用しない  
* Accession numberは、has_primary_idを利用しない  
	* Accession number はResource entryに移動する
	* `<glycan:resource_entry> dcterms:identifier “Accession number”`とする

| Instance URI | Proerty   | Class |  Instance URI Literal | Literal | Individual |
|--------------|-----------|-------|-----------------------|---------|------------|
| Saccharide instance | a | glycan:saccharide | 
|                     | glycan:has_motif |  | Glycan motif instance |
|                     | glycan:has_image |  | Image instance |
|                     | glycan:has_resource_entry |  | Glycosequence instance |
|                     | ~~glycan:has_component~~ |  | ~~component instance~~ |
|                     | ~~glytoucan:has_primary_id~~ |  |  | ~~"Accession number"~~ |



### INSERT query
```
log_enable(2,1);
sparql
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
INSERT
{ GRAPH <http://rdf.glytoucan.org/core> {
    ?Saccharide a glycan:saccharide .
    ?Saccharide glycan:has_image ?Image .
    ?Saccharide glycan:has_resource_entry ?Entry .
    ?Saccharide glycan:has_glycosequence ?GSequence .
    ?Saccharide glytoucan:has_primary_id ?AccNum .
  }
}
USING <http://rdf.glytoucan.org>
WHERE {
    # Saccharide
    ?Saccharide a glycan:saccharide .
    ?Saccharide glycan:has_image ?Image .
    ?Saccharide glycan:has_resource_entry ?Entry .
    ?Saccharide glycan:has_glycosequence ?GSequence .
    ?Saccharide glytoucan:has_primary_id ?AccNum .
    OPTIONAL{
      ?Saccharide glycan:has_motif ?Motif .
    }
};
checkpoint;
commit WORK;
```




## Resource entry Class
**From**`http://rdf.glytoucan.org`  
**To**`http://rdf.glytoucan.org/core`  

* 目的語のPerson instaceは、`http://rdf.glytoucan.org/users`のGRAPHにある
* gs2virt版には、`dcterms:identifier`と`rdfs:seeAlso`が含まれていなかったので追加する。
	* `glycan:resource_entry`のインスタンスに対して、`dcterms:identifier`を繋げて記述する事は、`glytoucan:has_primary_id`が実質、`glycan:resource_entry`に紐ずく形になる
	* `glycan:resource_entry`のインスタンスがGlyTouCanのURLとなっているが、わかりやすくするため、`rdfs:seeAlso`を追加する

| Instance URI | Proerty   | Class |  Instance URI Literal | Literal | Individual |
|--------------|-----------|-------|-----------------------|---------|------------|
| Resource entry instance | a | glycan:resource_entry | 
|                     | glytoucan:contributor |  | Person instance |
|                     | glytoucan:date_registered |  |  | dateTimestamp |
|                     | dcterms:identifier |  |  | Accession number |
|                     | rdfs:seeAlso |  |  | GlyTouCan URL | 
|                     | glycan:in_glycan_database |  |  |  | glytoucan:database_glytoucan |


### INSERT query
```
log_enable(2,1);
sparql
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX dcterms: <http://purl.org/dc/terms/>

INSERT
{ GRAPH <http://rdf.glytoucan.org/core> {
    ?REntry a glycan:resource_entry .
    ?REntry glytoucan:contributor ?Contributor .
    ?REntry glytoucan:date_registered ?Date .
    ?REntry glycan:in_glycan_database ?DB .
	?REntry dcterms:identifier ?AccessionNumber .
	?REntry rdfs:seeAlso ?REntry .
  }
}
FROM <http://rdf.glytoucan.org>
WHERE {
    # Resource entry
    ?Saccharide glytoucan:has_primary_id ?AccessionNumber .
    ?Saccharide glycan:has_resource_entry ?REntry .
    ?REntry a glycan:resource_entry .
    ?REntry glytoucan:contributor ?Contributor .
    ?REntry glytoucan:date_registered ?Date .
    ?REntry glycan:in_glycan_database ?DB .
};
checkpoint;
commit WORK;
```





## Glycosequence Class
**From**`http://rdf.glytoucan.org`  
**To**`http://rdf.glytoucan.org/sequence/glycoct`  

* `http://rdf.glytoucan.org/sequence/glycoct`のGRAPHについて
	* 登録時のGlycoCTを記述している
	* Property
		* rdfs:label, glycan:has_glycosequence, glycan:has_sequence, glycan:in_carbohydrate_format
		* glycan:glycosequenceのタイプ付けは無し
			* glycan:glycosequenceのタイプ付けをした方が良い
		* rdfs:labelとglycan:has_sequenceが同じ
			* rdfs:labeはどこかで使われているか？

### INSERT query
```
log_enable(2,1);
sparql
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 
INSERT
{ GRAPH <http://rdf.glytoucan.org/sequence/glycoct> {
    ?GSequence a glycan:glycosequence .
    ?GSequence glycan:has_sequence ?Sequence .
    ?GSequence glycan:in_carbohydrate_format ?Format .
  }
}
USING <http://rdf.glytoucan.org>
WHERE {
    # Glycosequence
    ?GSequence a glycan:glycosequence .
    ?GSequence glycan:has_sequence ?Sequence .
    ?GSequence glycan:in_carbohydrate_format ?Format .
};
checkpoint;
commit WORK;
```





## Image Class
**From**`http://rdf.glytoucan.org`  
**To**`http://rdf.glytoucan.org/image`  

* 新しいGRAPH `http://rdf.glytoucan.org/image`を用意する
* gs2virtにあるImageをインサートする


### INSERT query
```
log_enable(2,1);
sparql
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
INSERT
{ GRAPH <http://rdf.glytoucan.org/image> {
    ?Image a glycan:image .
    ?Image dc:format ?Format .
    ?Image glycan:has_symbol_format ?Symbol .
  }
}
FROM <http://rdf.glytoucan.org>
WHERE {
    # Image 
    ?Image a glycan:image .
    ?Image dc:format ?Format .
    ?Image glycan:has_symbol_format ?Symbol .
}
```





## Motif Class
**From**`http://rdf.glytoucan.org`  
**To**`http://rdf.glytoucan.org/motif`  


### INSERT query
```
log_enable(2,1);
sparql
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>

INSERT
{ GRAPH <http://rdf.glytoucan.org/motif> {
   # Motif
    ?Motif a glycan:glycan_motif ;
           rdfs:label ?MotifName ;
    	   glycan:has_glycosequence ?GSequence ;
           glytoucan:is_reducing_end ?ReducingEnd .
  }
}
USING <http://rdf.glytoucan.org>
WHERE {
    # Motif
    ?Motif a glycan:glycan_motif ;
           rdfs:label ?MotifName ;
    	   glycan:has_glycosequence ?GSequence ;
           glytoucan:is_reducing_end ?ReducingEnd .
};
checkpoint;
commit WORK;
```

### Note
* http://test.ts.glytoucan.org/sparql
	* このテスト環境のエンドポイントでコンストラクトすると、 glytoucan:is_reducing_endのbooleanが数字の０と１になる
* https://ts.glytoucan.org/sparql
	* 本番環境のエンドポイントでコンストラクトをすると、glytoucan:is_reducing_endのbooleanが"true"^^xsd:booleanと"false"^^xsd:boolean になる
* テスト環境にTTLをアップロードしても、Virtuosoの状態により、0と1になってしまう。
* テスト環境、本番環境、共にINSERTクエリを利用する

