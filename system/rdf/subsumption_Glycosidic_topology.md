---
title: Subsumption Glycosidic_topology data model
authors:
- Keiko Tokunaga
date: 2016-06-22
layout: default
---

**Subsumption image**

![Subsumption](/images/system/subsumption_Glycosidic_topology.png)



**RDF model**

- This RDF using the ROCS ontogoy  
- [ROCS](https://bitbucket.org/glycosw/glycanrelationontology) : Relation Ontology Carbohydrate Structure

```
<Saccharide A>
	a glycan:Saccharide ;
	rocs:subsumes <Saccharide B> ;
	rocs:has_topology <Saccharide B> .

<Saccharide B>
	a glycan:Saccharide, rocs:Glycosidic_topology ;
	rocs:subsumed_by <Saccharide A> ;
```


**Template RDF**

ex: If four accession numbers has follwing relationship.

- {Accession number 1} has_topology {Accession number 2}

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
```
