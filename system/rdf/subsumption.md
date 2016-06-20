---
title: Subsumption
authors:
- Daisuke Shinmachi
date: 2016-06-07
layout: default
---

#### Subsumption image

![Subsumption](/images/system/subsumption.png)



#### RDF 

- This RDF using the ROCS ontogoy  
- [ROCS](https://bitbucket.org/glycosw/glycanrelationontology) : Relation Ontology Carbohydrate Structure


**RDF model**

```
<Saccharide A>
	a glycan:Saccharide ;
	rocs:subsumes <Saccharide B> ;
	rocs:has_topology <Saccharide B> .

<Saccharide B>
	a glycan:Saccharide, rocs:Glycosidic_topology ;
	rocs:subsumed_by <Saccharide A> ;
	rocs:subsumes <Saccharide C> ;
	rocs:has_composition <Saccharide C> .

<Saccharide C>
	a glycan:Saccharide, rocs:Monosaccharide_composition ;
	rocs:subsumed_by <Saccharide B> ;
	rocs:subsumes <Saccharide D> ;
	rocs:has_base_composition <Saccharide D> .

<Saccharide D>
	a glycan:Saccharide, rocs:Base_composition ;
	rocs:subsumed_by <Saccharide C> .
```


**Template RDF**

ex:  

- {Accession number 1} has_topology {Accession number 2}
- {Accession number 2} has_composition {Accession number 3}
- {Accession number 3} has_base_composition {Accession number 4}

```
@prefix glycan: <http://purl.jp/bio/12/glyco/glycan#> .
@prefix rocs: <http://www.glycoinfo.org/glyco/owl/relation#> .

<http://rdf.glycoinfo.org/glycan/{Accession number 1}>
	a glycan:Saccharide ;
	rocs:subsumes <http://rdf.glycoinfo.org/glycan/{Accession number 2}> ;
	rocs:has_topology <http://rdf.glycoinfo.org/glycan/{Accession number 2}> .

<http://rdf.glycoinfo.org/glycan/{Accession number 2}>
	a glycan:Saccharide, rocs:Glycosidic_topology ;
	rocs:subsumed_by <http://rdf.glycoinfo.org/glycan/{Accession number 1}> ;
	rocs:subsumes <http://rdf.glycoinfo.org/glycan/{Accession number 3}> ;
	rocs:has_composition <http://rdf.glycoinfo.org/glycan/{Accession number 3}> .

<http://rdf.glycoinfo.org/glycan/{Accession number 3}>
	a glycan:Saccharide, rocs:Monosaccharide_composition ;
	rocs:subsumed_by <http://rdf.glycoinfo.org/glycan/{Accession number 2}> ;
	rocs:subsumes <http://rdf.glycoinfo.org/glycan/{Accession number 4}> ;
	rocs:has_base_composition <http://rdf.glycoinfo.org/glycan/{Accession number 4}> .

<http://rdf.glycoinfo.org/glycan/{Accession number 4}>
	a glycan:Saccharide, rocs:Base_composition ;
	rocs:subsumed_by <http://rdf.glycoinfo.org/glycan/{Accession number 3}> .
```


