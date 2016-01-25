---
title: SPARQL Query for Motif in Related data
layout: default
---
このSPARQL Queryは、GlyTouCanの糖鎖構造のエントリー画面にあるRelated dataにあるMotifの情報を取得するクエリです。

### Input
Sample Accession number : G00051MO  
`?glycan glytoucan:has_primary_id "Input Accession number"`


### Output
| Variable | Data|
|---------|------|
| ?MotifName | Motif name |
| ?moAccNum | Accession number of the Motif |

```
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX glycan:  <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>

SELECT DISTINCT ?MotifName (STR(?label) AS ?property) ?moAccNum
FROM <http://purl.jp/bio/12/glyco/glycan#>
FROM <http://rdf.glytoucan.org>
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glytoucan.org/motif>
WHERE{
    # Accession Number
    ?glycan a glycan:saccharide.
    ?glycan glytoucan:has_primary_id "G00051MO" .

    ## Motif
    ?glycan glycan:has_motif ?motif .
    ?motif a glycan:glycan_motif ;
    rdfs:label ?motifLabel .
    BIND((str(?motifLabel) AS ?MotifName))
    ?motif glytoucan:has_primary_id ?moAccNum .

	## Property label
    glycan:has_motif rdfs:label ?label .

}
```
[Data](http://beta.ts.glytoucan.org/sparql?default-graph-uri=&query=PREFIX+foaf%3A+%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E%0D%0APREFIX+glycan%3A++%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A++%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0A%0D%0ASELECT+DISTINCT+%3FMotifName+%28STR%28%3Flabel%29+AS+%3Fproperty%29+%3FmoAccNum%0D%0AFROM+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%3E%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fcore%3E%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fmotif%3E%0D%0AWHERE{%0D%0A++++%23+Accession+Number%0D%0A++++%3Fglycan+a+glycan%3Asaccharide.%0D%0A++++%3Fglycan+glytoucan%3Ahas_primary_id+%22G00051MO%22+.%0D%0A%0D%0A++++%23%23+Motif%0D%0A++++%3Fglycan+%3Frelation+%3Fmotif+.%0D%0A++++%3Fglycan+glycan%3Ahas_motif+%3Fmotif+.%0D%0A++++%3Fmotif+a+glycan%3Aglycan_motif+%3B%0D%0A++++rdfs%3Alabel+%3FmotifLabel+.%0D%0A++++BIND%28%28str%28%3FmotifLabel%29+AS+%3FMotifName%29%29%0D%0A++++%3Fmotif+glytoucan%3Ahas_primary_id+%3FmoAccNum+.%0D%0A%0D%0A++++glycan%3Ahas_motif+rdfs%3Alabel+%3Flabel+.%0D%0A%0D%0A}%0D%0A%0D%0A%0D%0A&format=text%2Fhtml&timeout=0&debug=on)
