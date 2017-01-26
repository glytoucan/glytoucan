---
title: Querying Structures
authors:
- Nobuyuki Aoki
date: 2015-05-15
reviewers:
- Kiyoko Kinoshita
layout: paging
categories: [query, graphical]
previous: search-text
next: search-id
---

Motif Search
------------

Utilizing the _has motif_ relationship within the glytoucan RDF, it is possible to execute searches based on this relationship between the registered structures.  Since the Linked Data engine automatically caches queries, commonly used relationships such as motifs can return query results very efficiently.  This is important considering the large number of possible motifs within every structure registered.

<br>

![Glytoucan Graphical Interface](/images/manual/search-motif.png)

_Initially the entire list of Motifs is displayed._

<br>

Simply by clicking on a specific Motif, the results screen is then displayed.   

<br>

![Glytoucan Graphical Interface Results](/images/manual/search-motif-result.png)

_Result page of an N-glycan-core-basic Motif search._

<br>

This shows a filtered view of every structure with the chosen Motif in the repository.  It is then possible to browse through the results and click on a specific glycan for more information. 
