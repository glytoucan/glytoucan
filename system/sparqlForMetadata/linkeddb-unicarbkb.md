---
title: SPARQL Query for
layout: default
---

* 現在は、UniCarbKB側のエンドポイントで、GlyTouCanのAccessionNumberを含んだRDFが出来るのを待っている状態です。

### Input
Sample Accession number : G00048MO  
`VALUES ?AccessionNumber { "G00048MO" } `

### Output  

| Variable | Data|
|----------|-----|
| ?endpoint | UniCarbKB SPARQL Endpoint |

* ここでは、UniCarbKBのSPARQLエンドポイントを取得し、二つ目のSPARQLクエリにエンドポイントのURIを渡します。

```
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX api: <http://purl.org/linked-data/api/vocab#>

SELECT DISTINCT (str(?uri) AS ?endpoint)
FROM <http://purl.jp/bio/12/glyco/glycan#>
WHERE{
  glycan:database_unicarbkb api:sparqlEndpoint ?uri .
}
```

### Input
`?endpoint`の変数に入ったURIです。
`[input sparqlEndpoint]`に`?endpoint`の値を挿入します。


### Output  
| Variable | Data|
|----------|-----|
| ?url | UniCarbKB Entry URL |
| ?structure_id | UniCarbKB Structure ID |

```
PREFIX glyco: <http://purl.jp/bio/12/glyco/glycan/>
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

SELECT DISTINCT  ?structure_id ?url
WHERE{
?glycan glytoucan:has_primary_id ?accNum FILTER(?accNum = "Input Accession Number")  .
SERVICE SILENT [input sparqlEndpoint] {
?entry dcterms:identifier ?accNum .
?entry glyco:in_glycan_database glytoucan:database_glytoucan  .
?refcomp glyco:has_resource_entry ?entry .
?refcomp glyco:has_resource_entry ?kb_entry .
?kb_entry dcterms:identifier ?structure_id .
?kb_entry glyco:in_glycan_database glyco:database_unicarbkb  .
}
BIND(CONCAT("http://www.unicarbkb.org/structure/", ?structure_id) AS ?url)
}
```
