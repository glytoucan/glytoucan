---
title: Querying Structures
authors:
- Nobuyuki Aoki
date: 2015-05-15
reviewers:
- Kiyoko Kinoshita
layout: paging
categories: [query, graphical]
next: search-id
previous: search-text
---

Motif Search
------------

Utilizing the _has motif_ relationship within the glytoucan RDF, it is possible to execute searches based on this relationship between the registered structures.  Since the Linked Data engine automatically caches queries, commonly used relationships such as motifs can return query results very efficiently.  This is important to know considering the large number of possible motifs within every structure registered.

![Glytoucan Graphical Interface](/images/manual/search-motif.png)
_Initially the entire list of Motifs is displayed._

Simply by clicking on a specific Motif, the results screen is then displayed.   

![Glytoucan Graphical Interface Results](/images/manual/search-motif-result.png)
_Result page of an N-glycan-core-basic Motif search._

This shows a filtered view of every structure with the chosen Motif in the repository.  It is then possible to browse through the results and click on a specific glycan for more information. 
