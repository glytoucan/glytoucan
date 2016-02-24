---
title: SPARQL Query for
layout: default
---

* 現在は、テスト環境のみ動作を確認できます。
* G00048MOのみ対応しています。
* http://test.ts.glytoucan.org/sparql

### Input
Sample Accession number : G00048MO  
`VALUES ?AccessionNumber { "G00048MO" } `

### Output  

| Variable | Data|
|----------|-----|
| ?unicarbdb_url | UniCarb-DB URL |
| ?unicarbdb_id | UniCarb-DB ID |


```
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX bibo: <http://purl.org/ontology/bibo/>
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glycodb: <http://purl.jp/bio/12/database/>
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

SELECT DISTINCT  ?unicarbdb_url ?unicarbdb_id
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glytoucan.org>
WHERE {
  # Glytoucan
  VALUES ?AccessionNumber {"G00048MO"}
  ?glytoucan glytoucan:has_primary_id ?AccessionNumber.
  ?glytoucan glycan:has_resource_entry ?entry .

  # UniCarb-DB
  ?entry glycan:in_glycan_database glycan:database_unicarb_db .
  ?entry dcterms:identifier ?unicarbdb_id .
  ?entry rdfs:seeAlso ?unicarbdb_url .
}

```
