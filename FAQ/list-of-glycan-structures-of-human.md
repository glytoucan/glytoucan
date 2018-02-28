---
title: FAQ
layout: default
---

# How to get a list of glycan structures of human?

---------------

## SPARQL query

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


## GlyTouCan Endpoint


* [GlyTouCan Endpoint page](https://ts.glytoucan.org/sparql)

![glytoucan endpoint](/images/FAQ/faq-glytoucan-endpoint.png)


![past sparql query](/images/FAQ/faq-past-sparql-query.png)


**A.** This image (a sorrowful toucan) indicates that the selected glycan could not be drawn using
our image-drawing software based on the glycan sequence.  Reasons for this may include the
fact that the glycan contains particularities that could not be drawn, such as unexpected modifications.
<br><br>
