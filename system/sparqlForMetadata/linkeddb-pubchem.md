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


[TestData](http://test.ts.glytoucan.org/sparql?default-graph-uri=&query=PREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A+%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0APREFIX+dcterms%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0APREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0D%0A%0D%0ASELECT+DISTINCT+%3Fcid+%3Fcid_url+%3Fsid+%3Fsid_url%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%3E%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fcore%3E%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glycoinfo.org%2Fmapping%2Fglytoucan%2Fpubchem%3E%0D%0AWHERE\{%0D%0A++VALUES+%3FAccessionNumber+\{%22G00051MO%22}%0D%0A++%3Fsaccharide+glytoucan%3Ahas_primary_id+%3FAccessionNumber+.%0D%0A++%3Fsaccharide+glycan%3Ahas_resource_entry++%3Fcid_entry%2C+%3Fsid_entry+.%0D%0A%0D%0A++%3Fcid_entry+skos%3AcloseMatch+%3Fcid_url.%0D%0A++%3Fcid_entry+dcterms%3Aidentifier+%3Fcid+.%0D%0A%0D%0A++%3Fsid_entry+skos%3AexactMatch+%3Fsid_url+.%0D%0A++%3Fsid_entry+dcterms%3Aidentifier+%3Fsid+.%0D%0A}&should-sponge=&format=text%2Fhtml&timeout=0&debug=on)

```
[Data](http://test.ts.glytoucan.org/sparql?default-graph-uri=&query=PREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A+%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0APREFIX+dcterms%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0APREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0D%0A%0D%0ASELECT+DISTINCT+%3Fcid+%3Fcid_url+%3Fsid+%3Fsid_url%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%3E%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fcore%3E%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glycoinfo.org%2Fmapping%2Fglytoucan%2Fpubchem%3E%0D%0AWHERE{%0D%0A++VALUES+%3FAccessionNumber+{%22G00051MO%22}%0D%0A++%3Fsaccharide+glytoucan%3Ahas_primary_id+%3FAccessionNumber+.%0D%0A++%3Fsaccharide+glycan%3Ahas_resource_entry++%3Fcid_entry%2C+%3Fsid_entry+.%0D%0A%0D%0A++%3Fcid_entry+skos%3AcloseMatch+%3Fcid_url.%0D%0A++%3Fcid_entry+dcterms%3Aidentifier+%3Fcid+.%0D%0A%0D%0A++%3Fsid_entry+skos%3AexactMatch+%3Fsid_url+.%0D%0A++%3Fsid_entry+dcterms%3Aidentifier+%3Fsid+.%0D%0A}&should-sponge=&format=text%2Fhtml&timeout=0&debug=on)
```
