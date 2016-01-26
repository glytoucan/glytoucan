---
title: Glycan entry Metadata (by SPARQL Query)
layout: default
---

# SPARQL Query

## Overview
* [SPARQL Query](/system/sparqlForMetadata/overview)
* エントリーページのOverviewの情報を取得するクエリ。

![overview](/images/manual/glycan-entry-G00051MO-Overview.png)


## Related Data
### Motif
* [SPARQL Query](/system/sparqlForMetadata/related-data-motif)
* エントリーページのMotifに関する情報を取得するクエリ。

### Monosaccharide composition
* [SPARQL Query](/system/sparqlForMetadata/related-data-monosaccharide)
* エントリーページのMonosaccharideに関する情報を取得するクエリ。

![related data](/images/manual/glycan-entry-G00051MO-RelatedData.png)


## Linked DB
### BCSDB
* [SPARQL Query](/system/sparqlForMetadata/linkeddb-bcsdb)
* エントリーページの糖鎖構造に対して、BCSDB内の糖鎖構造が一致する場合、関連するBCSDB情報を取得するクエリ。

### GlycomeDB
* [SPARQL Query](/system/sparqlForMetadata/linkeddb-glycomedb)
* エントリーページの糖鎖構造に対して、GlycomeDB内の糖鎖構造が一致する場合、関連するGlycomeDB情報を取得するクエリ。

### GlycoEpitope
* [SPARQL Query](/system/sparqlForMetadata/linkeddb-glycoepitope)
* エントリーページの糖鎖構造に対して、GlycoEpitope内の糖鎖構造が一致する場合、関連するGlycoEpitope情報を取得するクエリ。

### UniCarb-DB
* [SPARQL Query](/system/sparqlForMetadata/linkeddb-unicarb-db)
* エントリーページの糖鎖構造に対して、UniCarb-DB内の糖鎖構造が一致する場合、関連するUniCarb-DB情報を取得するクエリ。
* 本番環境では、未対応

### UniCarbKB
* [SPARQL Query](/system/sparqlForMetadata/linkeddb-unicarbkb)
* エントリーページの糖鎖構造に対して、UniCarbKB内の糖鎖構造が一致する場合、関連するUniCarbKB情報を取得するクエリ。
* 本番環境では、未対応

### PubChem
* [SPARQL Query](/system/sparqlForMetadata/linkeddb-pubchem)
* エントリーページの糖鎖構造に対して、PubChem内の糖鎖構造が一致する場合、関連するPubChem情報を取得するクエリ。
* テスト番環境では、対応しています。
* 本番環境では、未対応


![linked db](/images/manual/glycan-entry-G00051MO-LinkdDB.png)


## Glycan Structure form WURCS RDF SEQ
WURCS RDF SEQを利用して、一つのエントリーページにある糖鎖構造の情報を取得する。
* GRES = AccessionNumberが入ったMonosaccharide Residue URI
* SEQ0.3には、GRESのクラスはタイプ付けされてはいない。
