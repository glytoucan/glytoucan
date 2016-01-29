---
title: SPARQL Query for PubChem
layout: default
---

* 現在は、テスト環境のみ動作を確認できます。
* http://test.ts.glytoucan.org/sparql

### Input
Sample Accession number : G00051MO  
`VALUES ?AccessionNumber { "G00051MO" } `

### Output
| Variable | Data|
|----------|-----|
| ?cid | PubChem CID |
| ?cid_url| PubChem URL by CID |
| ?sid | PubChem SID |
| ?sid_url| PubChem URL by SID |

[SPARQL endpoint](http://test.ts.glytoucan.org/sparql)

```
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>

SELECT DISTINCT ?cid ?cid_url ?sid ?sid_url
FROM <http://rdf.glytoucan.org>
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glycoinfo.org/mapping/glytoucan/pubchem>
WHERE{
  VALUES ?AccessionNumber {"G00051MO"}
  ?saccharide glytoucan:has_primary_id ?AccessionNumber .
  ?saccharide glycan:has_resource_entry  ?cid_entry, ?sid_entry .

  ?cid_entry skos:closeMatch ?cid_url.
  ?cid_entry dcterms:identifier ?cid .

  ?sid_entry skos:exactMatch ?sid_url .
  ?sid_entry dcterms:identifier ?sid .
}
```
