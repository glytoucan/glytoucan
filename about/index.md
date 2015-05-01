---
title: What is a glytoucan?
layout: default
---

<h2>Introduction</h2>
The first release of the [International Glycan Repository](http://glytoucan.org) was recently completed to enable the registration, query, and linking of glycan structures through a browser or programmable interface.  The service also provides a variety of methods to query and browse the relationships of structures based on logic inherent within the structures itself. Herein, we describe an overall explanation of the system structure, backend RDF ontology, and functionality of currently available tools for registered structures.  We also explain the functionality of the linked data endpoint and web services for software developers to more effectively store and query glycan structures in the repository.  As all of the system software for this project will be open-sourced, it is intended for parts or the entire system to be reusable by other teams who would like to store their data in RDF format.  This is also in hopes for better data quality and federation of queryable data across projects and endeavors.  These efforts are aimed at expanding the role of glycomics structures in research by providing an identification method, a reference implementation, and a datastore with linkages to any other works in other Semantic Web datastores worldwide.
![Glycan User Flow](/images/workflow.jpg)
<h2>Background</h2>
During the the Fifth ACGG-DB meeting held in Dalian, China, on 22 June 2013, It was first agreed upon that a framework for an international glycan structure repository was needed.
This has also been recognized by many groups including the US National Academy of Sciences (National Academy of Sciences 2012) and discussed at the 4th Charles Warren Workshop in 2012 in Athens, Georgia.
The advantages gained with a repository would be
1. It would function as a central location where glycan structures are registered, similar to DDBJ/EMBL/GenBank of the International Nucleotide Sequence Database Collaboration (INSDC) for nucleotide sequences,
2. it would provide unique identifiers for every glycan structure (including ambiguous structures and even monosaccharide compositions) such that glycan IDs can be uniquely identified from any resource by using these identifiers, and
3. researchers who publish newly identified structures can use the identifiers to link their structures with relevant information in their publications.

In other words, the main purpose of this repository would be to assure uniqueness of all registered structures guaranteeing that new structures at any level of detail or uncertainty will have an identifier assigned such that readers can retrieve the exact structure described in a paper.
Therefore, at the minimum, it was agreed that glycan structures (with no aglycon information) would be the main content of this repository, and the user and time/date of registration would be attached with the structure information. 
Any additional metadata information and experimental data would be the responsibility of the author when publishing the experimental procedures used to define the structure (as would be covered by MIRAGE;Kolarich et al. 2013); that is, it would be expected that such relevant information should be submitted to a database able to store these data. This latter type of database, as well as existing carbohydrate structure databases and publications, will then be referenced by the registry allowing users of the registry not just to retrieve for any identifiers the structure itself but also links to complementary data in other resources.