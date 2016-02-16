---
title: Glycan Naming Architecture
layout: default
---

## Overview

The formal and colloquial names of glycans are an essential aspect of glycobiological research.  Commonly used names are used to communicate specific saccharides and structural patterns found in glycans.  These names can differ between languages, organizations, and research groups for the same structure or pattern.  The various names of glycan structures can be considered larger and more generalized in scope in comparison to the notation schemes proposed in various literature[^1]. 

As a glycan repository, it is important for the system to be able to associate names and notations to specific structures or structural patterns.  This will allow for easier queries and recognizable associations for users and contributors.

This document describes a system architecture designed to be flexible enough to handle contributions of names from different organizations, as well as associate defined notations that are or will be used by glycan and other biochemical researchers.

### Vocabulary

To simplify the wording used for the scope of this document, please note the following definitions.

| Name | Definition
| Glycan | A glycan is any structure that can be registered into the Glycan Repository.  This is described as any structure that is unique ["at any level of detail or uncertainty"](http://glycob.oxfordjournals.org/content/23/12/1422.long){:target="_blank"}.  This would not include glycan fragments nor aglycon information.
| Structure | A "structure" is used for any structural sequence clearly definable by any major glycan sequence format such as GlycoCT[^2] or WURCS[^3].
| Glycan Motif | A Glycan motif is a pattern identified within glycan structures that have been associated with a specific function and thus given a name.  It is important to note that motifs need to be defined as either any location of an entire glycan structure, or to be specific to a reducing end.  This is very different from a typical saccharide.
| Glycan Name | A name is any name given to a glycan.  We will distinguish here the difference between a Glycan Name and a Motif Name.  A Motif Name is not associated to a distinct structure, rather a set of structures that match a pattern.
| Trivial Name | A trivial name is an abbreviation given to specific saccharide structures.  MonosaccharideDB [explains](http://www.monosaccharidedb.org/notation.action?topic=trivialname){:target="_blank"} how they can be ambiguous in nature as not enough detail is given to be able to define the structure from the name.
| Contributor| The person or organization responsible for maintaining a trivial naming convention.
| Glycan Alias | This will be considered the same as a Trivial Name.
| Notation | A notation is a textual system used to represent glycan structures.  The definition of the system must be in a referencable, published work.  For example, the GlycoCT and WURCS sequence structures are considered notations, as well as the Abbreviated Terminology of Oligosaccharide Chains[^4] as an early model.
| GlycoSequence | The term glycosequence is used to define a notation that is supported by GlyTouCan, which is simply the notations fully supported in the [GlyConvert](http://bitbucket/glycosw/glyconvert){:target="_blank"} project.

As of this writing, the glycosequences supported include the following formats:

1. GlycoCT[^2]
1. WURCS[^3]
1. KCF[^5]
1. Linearcode[^6]

Please note that glycosequences are considered special and are handled in a completely different manner as they are considered critical to the system to operate.  It is important for conversions to be handled in a subproject in order to modularize and reuse the conversion logic.  The project also ensures the supported notation can represent the multitude of unique structures possible.

### Changes to GlycoRDF schema

In order to support the naming of a glycan, a slight change was needed in the GlycoRDF Ontology.

Before:

    <glycan:saccharide> a saccharide;

    <glycan:monosaccharide> a monosaccharide;
      rdfs:subClassOf glycan:saccharide;
      glycan:has_alias <glycan:monosaccharide_alias>

    <glycan:monosaccharide_alias> a glycan:monosaccharide_alias
      glycan:has_alias_name xsd:string

As can be seen, trivial names were placed inside a `monosaccharide_alias` class.

We would also like to handle the naming of motifs, which were stored in this manner:

    <glycan:motif> a glycan:motif;

    <glycan:glycan_motif> a glycan:glycan_motif;
      rdfs:subClassOf glycan:motif;
      glycan:has_glycosequence <glycan:glycosequence>
      rdfs:label  "Lewis C"@en

As there was no naming convention in the ontology at the time, we had used an `rdfs:label` as a temporary solution.

In order to support naming, and by following convention, a `Saccharide_alias` class is defined as a superclass of `Monosaccharide_alias`. 

    <glycan:Saccharide> a Saccharide;
      glycan:has_alias <glycan:Saccharide_alias>

    <glycan:Saccharide_alias> a glycan:Saccharide_alias
      glycan:has_alias_name xsd:String

    <glycan:Monosaccharide_alias> a glycan:Monosaccharide_alias
      rdfs:subClassOf glycan:Saccharide_alias;

The `glycan:has_alias_name` is then passed on implicitly by inheritance to the `Monosaccharide_alias` class.

The same can then be done for Glycan_Motif.

    <glycan:Glycan_motif> a glycan:Glycan_motif;
      rdfs:subClassOf glycan:Motif;
      glycan:has_alias <glycan:Glycan_motif_alias>

    <glycan:Glycan_motif_alias> a glycan:Glycan_motif_alias;
      glycan:has_alias_name xsd:String

Since GlyTouCan does not deal with Glyconjugates there is no need to define anything in the `glycan:Motif` level at this time.  The `rdfs:label` will have to be converted into this alias.  Also, the `glycan:Motif` is independent of the `glycan:Saccharide`, so there is no relationships between them.

#### Contributions

Within the schema above, there is no clear location to define the contributor information of the trivial name.  This is important for the repository in order to reference which person or organization utilizes the naming method.  For monosaccharides, there does exist `has_monosaccharide_notation_scheme` predicate, however this is very similar to a `glycan:carbohydrate_format`.  Another issue is that contributor information does not have a _logical_ connection to the scientific glycan information being stored in GlycoRDF.  It is rather particular to the glycan repository.

Thus [RDF Datasets](https://www.w3.org/TR/rdf11-concepts/#section-dataset) are a convenient place for this kind of information, and also fits very well with how the data is organized.  A policy of _all data from a Contributor A is placed in Dataset A_ can be defined.  This actually allows for simplicity from a data management perspective, as it will be possible to execute contributor-specific all-encompassing data management methods such as _replace all information from Contributor A with New Dataset A'_, or queries such as _What are all of the N-glycan names contributed by Contributor A?_ is simply a reusable N-glycan query on Dataset A instead of all data within the repository.
To explain this in a more concrete manner, this is how an insertion of a glycan name contributed by monosaccharidedb for the bcsdb [notation scheme](http://www.monosaccharidedb.org/notation.action?topic=schemes) would be in SPARQL:

    PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
    INSERT DATA { 
      GRAPH <http://rdf.glytoucan.org/contributor/monosaccharidedb> { 
        <glycan:Saccharide> glycan:has_alias <glycan:Saccharide_alias> .
        <glycan:Saccharide_alias> a glycan:Saccharide_alias .
        <glycan:Saccharide_alias> glycan:has_alias_name .
        <glycan:Saccharide_alias> glycan:has_monosaccharide_notation_scheme glycan:monosaccharide_notation_scheme_bcsdb;
      }
    }

The `monosaccharidedb` section of the graph name should be a unique name for the contributor, possibly held within `Glycan_database` or `Monosaccharide_notation_scheme` classes.

Another example of retrieving all saccharide trivial names contributed by monosaccharidedb: 

    PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
    SELECT *
    FROM <http://rdf.glytoucan.org/contributor/monosaccharidedb> { 
    WHERE {
        <glycan:Saccharide_alias> a glycan:Saccharide_alias .
        <glycan:Saccharide_alias> glycan:has_alias_name xsd:String .
      }
    }

Note the similarity with retrieving all trivial names:

    PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
    SELECT *
    WHERE {
        <glycan:Saccharide_alias> a glycan:Saccharide_alias .
        <glycan:Saccharide_alias> glycan:has_alias_name xsd:String .
    }

This shows how using datasets simplifies system maintenance and development. 


## Conclusion

This explains how GlyTouCan handles naming from an overall architectural perspective, as well as the reasoning behind the changes proposed for the GlycoRDF ontology.

How the repository will be importing this data from various sources, as well as methods to contribute data will be explained in a [technical article](/system/name_technical).

### References:

[^1]: [Polysaccharide Nomenclature](http://pac.iupac.org/publications/pac/pdf/1982/pdf/5408x1523.pdf)
[^2]: [GlycoCT](http://www.ncbi.nlm.nih.gov/pubmed/18436199)
[^3]: [WURCS](http://www.ncbi.nlm.nih.gov/pubmed/24897372)
[^4]: [Abbreviated Terminology of Oligosaccharide Chain](http://www.jbc.org/content/257/7/3347.full.pdf)
[^5]: [KCF](http://rings.t.soka.ac.jp/help/kcf.html)
[^6]: [LinearCode](http://web.media.mit.edu/~yanival/Alt02.pdf)

1. [CFG notation](http://www.functionalglycomics.org/static/consortium/Nomenclature.shtml)
2. [PGA Nomenclature](http://glycomics.scripps.edu/coreD/PGAnomenclature.pdf)



> Written with [StackEdit](https://stackedit.io/).
