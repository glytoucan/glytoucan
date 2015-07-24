---
title: Querying Structures
authors:
- Nobuyuki Aoki
date: 2015-05-15
reviewers:
- Kiyoko Kinoshita
layout: paging
categories: [query, graphical]
next: search-text
previous: registration-result
---

Graphical Interface
------------

To search for a specific glycan, it is possible to build the structure through a graphical interface as shown in the figure.  The tool used is based on the work done for GlycanBuilder with Vaadin as described in

<cite>
 Damerell D, Ceroni A, Maass K, Ranzinger R, Dell A, Haslam SM. The GlycanBuilder and GlycoWorkbench glycoinformatics tools: updates and new developments. Biol Chem. 2012;393:1357–1362. [PubMed](http://www.ncbi.nlm.nih.gov/pubmed/23109548).
</cite>

It is possible to create or extend from existing structures within this interface.

![Glytoucan Graphical Interface](/images/manual/search-graphical.png)
_Note: User registration is not required to query for a structure._

Once the structure is complete, a sequence is generated from the input and used to search the database for a valid id.  If the sequence is found, the structure format and any related super structures will be displayed.

![Glytoucan Graphical Interface Results](/images/manual/search-result.png)

_Result page of the search.  Other glycans containing the input structure will also be displayed._
