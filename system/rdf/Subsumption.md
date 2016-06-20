---
title: Partner Motif Insert
authors:
- Daisuke Shinmachi
date: 2016-06-07
layout: default
---

## RDF 

This RDF using the ROCS ontogoy  
[ROCS](https://bitbucket.org/glycosw/glycanrelationontology) : Relation Ontology Carbohydrate Structure


**RDF model**

```
<Saccharide A>
	a glycan:Saccharide ;
	rocs:subsumed_by <Saccharide B> ;
	rocs:has_topology <Saccharide B> .

<Saccharide B>
	a glycan:Saccharide, rocs:Glycosidic_topology ;
	rocs:subsumed_by <Saccharide C> ;
	rocs:has_composition <Saccharide C> .

<Saccharide C>
	a glycan:Saccharide, rocs:Monosaccharide_composition ;
	rocs:subsumed_by <Saccharide D> ;
	rocs:has_base_composition <Saccharide D> .

<Saccharide D>
	a glycan:Saccharide, rocs:Base_composition ;
```



**Template RDF**

```
@prefix glycan: <http://purl.jp/bio/12/glyco/glycan#> .
@prefix rocs: <http://www.glycoinfo.org/glyco/owl/relation#> .

<http://rdf.glycoinfo.org/glycan/{Accession number 1}>
	a glycan:Saccharide ;
	rocs:subsumed_by <http://rdf.glycoinfo.org/glycan/{Accession number 2}> ;
	rocs:has_topology <http://rdf.glycoinfo.org/glycan/{Accession number 2}> .

<http://rdf.glycoinfo.org/glycan/{Accession number 2}>
	a glycan:Saccharide, rocs:Glycosidic_topology ;
	rocs:subsumed_by <http://rdf.glycoinfo.org/glycan/{Accession number 3}> ;
	rocs:has_composition <http://rdf.glycoinfo.org/glycan/{Accession number 3}> .

<http://rdf.glycoinfo.org/glycan/{Accession number 3}>
	a glycan:Saccharide, rocs:Monosaccharide_composition ;
	rocs:subsumed_by <http://rdf.glycoinfo.org/glycan/{Accession number 4}> ;
	rocs:has_base_composition <http://rdf.glycoinfo.org/glycan/{Accession number 4}> .

<http://rdf.glycoinfo.org/glycan/{Accession number 4}>
	a glycan:Saccharide, rocs:Base_composition ;
```


