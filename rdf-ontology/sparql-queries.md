---
title: Sample SPARQL Queries
authors:
- Daisuke Shinmachi
- Issaku Yamada
date: 2018-02-06
modify data: 2021-10-14
layout: default
---

<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Find all Glycan structures (WURCS)](#find-all-glycan-structures-wurcs)
- [Find all Glycan structures (GlycoCT)](#find-all-glycan-structures-glycoct)
- [Find A GlyTouCan Accession from GlycomeDB ID](#find-a-glytoucan-accession-from-glycomedb-id)
- [Find Glycan structures (IUPAC Condensed) related to Homo sapines](#find-glycan-structures-iupac-condensed-related-to-homo-sapiens)
- [Find Glycan structures (IUPAC Condensed) related to Mus musculus](#find-glycan-structures-iupac-condensed-related-to-mus-musculus)

<!-- /TOC -->


# Find all Glycan structures (WURCS)

```
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>

SELECT DISTINCT ?Saccharide ?PrimaryId ?Sequence
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glytoucan.org/sequence/wurcs>
WHERE {
    ?Saccharide glytoucan:has_primary_id ?PrimaryId .
    ?Saccharide glycan:has_glycosequence ?GlycoSequence .
    ?GlycoSequence glycan:has_sequence ?Sequence .
    ?GlycoSequence glycan:in_carbohydrate_format glycan:carbohydrate_format_wurcs.
}
ORDER BY ?PrimaryId
limit 100
```

*This result shows 100 items by "limit" opiton*

[=> run (limit 100 items)](https://ts.glytoucan.org/sparql?default-graph-uri=&query=PREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A++%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0A%0D%0ASELECT+DISTINCT+%3FSaccharide+%3FPrimaryId+%3FSequence%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fcore%3E%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fsequence%2Fwurcs%3E%0D%0AWHERE+%7B%0D%0A++++%3FSaccharide+glytoucan%3Ahas_primary_id+%3FPrimaryId+.%0D%0A++++%3FSaccharide+glycan%3Ahas_glycosequence+%3FGlycoSequence+.%0D%0A++++%3FGlycoSequence+glycan%3Ahas_sequence+%3FSequence+.%0D%0A++++%3FGlycoSequence+glycan%3Ain_carbohydrate_format+glycan%3Acarbohydrate_format_wurcs.%0D%0A%7D%0D%0AORDER+BY+%3FPrimaryId%0D%0Alimit+100&format=text%2Fhtml&timeout=0&debug=on)<br>
[=> endpoint (https://ts.glytoucan.org/sparql)](https://ts.glytoucan.org/sparql)


# Find all Glycan structures (GlycoCT)

```
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>

SELECT DISTINCT ?Saccharide ?PrimaryId ?Sequence
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glytoucan.org/sequence/glycoct>
WHERE {
    ?Saccharide glytoucan:has_primary_id ?PrimaryId .
    ?Saccharide glycan:has_glycosequence ?GlycoSequence .
    ?GlycoSequence glycan:has_sequence ?Sequence .
    ?GlycoSequence glycan:in_carbohydrate_format glycan:carbohydrate_format_glycoct.
}
ORDER BY ?PrimaryId
limit 100
```

*This result shows 100 items by "limit" opiton*

[=> run (limit 100)](https://ts.glycosmos.org/sparql?query=PREFIX+dcterms%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0APREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A+%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0A%0D%0ASELECT+DISTINCT+%3FaccNum++%3Fexternal_id%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fcore%3E%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fpartner%2Fglycome-db%3E%0D%0AWHERE%7B%0D%0A++%3Fsaccharide+glytoucan%3Ahas_primary_id+%3FaccNum+.%0D%0A++%3Fsaccharide+glycan%3Ahas_resource_entry+%3Fentry+.%0D%0A++%3Fentry+a+glycan%3AResource_entry+.%0D%0A++%3Fentry+glycan%3Ain_glycan_database+glycan%3ADatabase_glycomedb+.%0D%0A%0D%0A++VALUES+%3Fexternal_id+%7B%2210923%22%7D%0D%0A++%3Fentry+dcterms%3Aidentifier+%3Fexternal_id+.%0D%0A%7D&render=HTML&limit=25&offset=0#loadstar-results-section)<br>
[=> endpoint (https://ts.glycosmos.org/sparql)](https://ts.glycosmos.org/sparql)


# Find A GlyTouCan Accession from GlycomeDB ID

```
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

SELECT DISTINCT ?accNum  ?external_id
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glytoucan.org/partner/glycome-db>
WHERE{
  ?saccharide glytoucan:has_primary_id ?accNum .
  ?saccharide glycan:has_resource_entry ?entry .
  ?entry a glycan:Resource_entry .
  ?entry glycan:in_glycan_database glycan:Database_glycomedb .

  VALUES ?external_id {"10923"}
  ?entry dcterms:identifier ?external_id .
}
```

[=> run](https://ts.glycosmos.org/sparql?query=PREFIX+dcterms%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0APREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A+%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0A%0D%0ASELECT+DISTINCT+%3FaccNum++%3Fexternal_id%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fcore%3E%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fpartner%2Fglycome-db%3E%0D%0AWHERE%7B%0D%0A++%3Fsaccharide+glytoucan%3Ahas_primary_id+%3FaccNum+.%0D%0A++%3Fsaccharide+glycan%3Ahas_resource_entry+%3Fentry+.%0D%0A++%3Fentry+a+glycan%3AResource_entry+.%0D%0A++%3Fentry+glycan%3Ain_glycan_database+glycan%3ADatabase_glycomedb+.%0D%0A%0D%0A++VALUES+%3Fexternal_id+%7B%2210923%22%7D%0D%0A++%3Fentry+dcterms%3Aidentifier+%3Fexternal_id+.%0D%0A%7D&render=HTML&limit=25&offset=0#loadstar-results-section)<br>
[=> endpoint (https://ts.glycosmos.org/sparql)](https://ts.glycosmos.org/sparql)


# Find Glycan structures (IUPAC Condensed) related to Homo sapiens

```
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

SELECT DISTINCT ?accNum ?taxon_id   (str(?sequence) AS ?sequence_list)
WHERE{
	 ?saccharide  glytoucan:has_primary_id ?accNum .
	 ?saccharide glycan:is_from_source ?source.
	 ?source a glycan:Source .

	 VALUES ?taxon_id {"9606"}
	 ?source dcterms:identifier ?taxon_id .
	 ?saccharide glycan:has_glycosequence ?gseq.
	 ?gseq glycan:has_sequence ?sequence.
	 ?gseq glycan:in_carbohydrate_format glycan:carbohydrate_format_iupac_condensed.
} limit 100
```

[=> run](https://ts.glycosmos.org/sparql?query=PREFIX+dcterms%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0APREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A+%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0A%0D%0ASELECT+DISTINCT+%3FaccNum+%3Ftaxon_id+++%28str%28%3Fsequence%29+AS+%3Fsequence_list%29%0D%0AWHERE%7B%0D%0A%09+%3Fsaccharide++glytoucan%3Ahas_primary_id+%3FaccNum+.%0D%0A%09+%3Fsaccharide+glycan%3Ais_from_source+%3Fsource.%0D%0A%09+%3Fsource+a+glycan%3ASource+.%0D%0A%0D%0A%09+VALUES+%3Ftaxon_id+%7B%229606%22%7D%0D%0A%09+%3Fsource+dcterms%3Aidentifier+%3Ftaxon_id+.%0D%0A%09+%3Fsaccharide+glycan%3Ahas_glycosequence+%3Fgseq.%0D%0A%09+%3Fgseq+glycan%3Ahas_sequence+%3Fsequence.%0D%0A%09+%3Fgseq+glycan%3Ain_carbohydrate_format+glycan%3Acarbohydrate_format_iupac_condensed.%0D%0A%7D+limit+100&render=HTML&limit=25&offset=0#loadstar-results-section)<br>
[=> endpoint (https://ts.glycosmos.org/sparql)](https://ts.glycosmos.org/sparql)



# Find Glycan structures (IUPAC Condensed) related to Mus musculus

```
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

SELECT DISTINCT ?accNum ?taxon_id   (str(?sequence) AS ?sequence_list)
WHERE{
	 ?saccharide  glytoucan:has_primary_id ?accNum .
	 ?saccharide glycan:is_from_source ?source.
	 ?source a glycan:Source .

   VALUES ?taxon_id {"10090"}
	 ?source dcterms:identifier ?taxon_id .
	 ?saccharide glycan:has_glycosequence ?gseq.
	 ?gseq glycan:has_sequence ?sequence.
	 ?gseq glycan:in_carbohydrate_format glycan:carbohydrate_format_iupac_condensed.
} limit 100
```

[=> run](https://ts.glycosmos.org/sparql?query=PREFIX+dcterms%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0APREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A+%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0A%0D%0ASELECT+DISTINCT+%3FaccNum+%3Ftaxon_id+++%28str%28%3Fsequence%29+AS+%3Fsequence_list%29%0D%0AWHERE%7B%0D%0A%09+%3Fsaccharide++glytoucan%3Ahas_primary_id+%3FaccNum+.%0D%0A%09+%3Fsaccharide+glycan%3Ais_from_source+%3Fsource.%0D%0A%09+%3Fsource+a+glycan%3ASource+.%0D%0A%0D%0A+++VALUES+%3Ftaxon_id+%7B%2210090%22%7D%0D%0A%09+%3Fsource+dcterms%3Aidentifier+%3Ftaxon_id+.%0D%0A%09+%3Fsaccharide+glycan%3Ahas_glycosequence+%3Fgseq.%0D%0A%09+%3Fgseq+glycan%3Ahas_sequence+%3Fsequence.%0D%0A%09+%3Fgseq+glycan%3Ain_carbohydrate_format+glycan%3Acarbohydrate_format_iupac_condensed.%0D%0A%7D+limit+100&render=HTML&limit=25&offset=0#loadstar-results-section)<br>
[=> endpoint (https://ts.glycosmos.org/sparql)](https://ts.glycosmos.org/sparql)
