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
<LinkageDefinedSaccharide>
	a glycan:Saccharide, rocs:Linkage_defined_saccharide ;
	rocs:subsumes_by <GlycosidicTopology> ;
	rocs:has_topology <GlycosidicTopology> .

<GlycosidicTopology>
	a glycan:Saccharide, rocs:Glycosidic_topology ;
	rocs:subsumed_by <MonosaccharideCompositionWithLinkage> ;
	rocs:has_composition_with_linkage <MonosaccharideCompositionWithLinkage> ;
	rocs:subsumed_by <MonosaccharideCompositionWithoutLinkage> ;
	rocs:has_composition_without_linkage <MonosaccharideCompositionWithoutLinkage> .

<MonosaccharideCompositionWithLinkage>
	a glycan:Saccharide, rocs:Monosaccharide_composition_with_linkage ;
	rocs:subsumed_by <MonosaccharideCompositionWithoutLinkage> ;
	rocs:same_components <MonosaccharideCompositionWithoutLinkage> .
	rocs:subsumed_by <BaseCompositionWithLinkage> ;
	rocs:has_base_composition_with_linkage <BaseCompositionWithLinkage> .

<MonosaccharideCompositionWithoutLinkage>
	a glycan:Saccharide, rocs:Monosaccharide_composition_without_linkage ;
	rocs:subsumed_by <BaseCompositionWithoutLinkage> ;
	rocs:has_base_composition_without_linkage <BaseCompositionWithoutLinkage> .

<BaseCompositionWithLinkage>
	a glycan:Saccharide, rocs:Base_composition_with_linkage ;
	rocs:subsumed_by <BaseCompositionWithoutLinkage> ;
	rocs:same_components <BaseCompositionWithoutLinkage> .

<BaseCompositionWithoutLinkage>
	a glycan:Saccharide, rocs:Base_composition_without_linkage ;
```
