---
title: Subsumption data model
authors:
- Daisuke Shinmachi
date: 2019-10-21
layout: default
---

**Subsumption image**

![Subsumption](/images/system/subsumption.png)



**RDF model**

- This RDF using the ROCS ontogoy  
- [ROCS](https://github.com/glytoucan/rocs) : Relation Ontology Carbohydrate Structure

```
<Saccharide A>
	a glycan:Saccharide, rocs:Linkage_defined_saccharide ;
	rocs:subsumes_by <Saccharide B> ;
	rocs:has_topology <Saccharide B> .

<Saccharide B>
	a glycan:Saccharide, rocs:Glycosidic_topology ;
	rocs:subsumed_by <Saccharide C> ;
	rocs:has_composition_with_linkage <Saccharide C> .

<Saccharide C>
	a glycan:Saccharide, rocs:Monosaccharide_composition_with_linkage ;
	rocs:subsumed_by <Saccharide D-1> ;
	rocs:same_components <Saccharide D-1> .
	rocs:subsumed_by <Saccharide D-2> ;
	rocs:has_base_composition_with_linkage <Saccharide D-2> .

<Saccharide D-1>
	a glycan:Saccharide, rocs:Monosaccharide_composition_without_linkage ;
	rocs:subsumed_by <Saccharide E> ;
	rocs:has_base_composition_without_linkage <Saccharide E> .

<Saccharide D-2>
	a glycan:Saccharide, rocs:Base_composition_with_linkage ;
	rocs:subsumed_by <Saccharide E> ;
	rocs:same_components <Saccharide E> .

<Saccharide E>
	a glycan:Saccharide, rocs:Base_composition_without_linkage ;
```
