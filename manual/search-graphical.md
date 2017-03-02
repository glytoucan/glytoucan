---
title: Querying Structures
authors:
- Nobuyuki Aoki
date: 2015-05-15
reviewers:
- Kiyoko Kinoshita
layout: paging
categories: [query, graphical]
previous: publication-registration
next: search-text
---

Graphical Interface
------------

To search registered glycans with a specific structural fragment, it is possible to build through a graphical interface as shown in the figure.  The tool used is based on the work done for GlycanBuilder with Vaadin as described in

<cite>
 Damerell D, Ceroni A, Maass K, Ranzinger R, Dell A, Haslam SM. The GlycanBuilder and GlycoWorkbench glycoinformatics tools: updates and new developments. Biol Chem. 2012;393:1357–1362. [PubMed](http://www.ncbi.nlm.nih.gov/pubmed/23109548).
</cite>

It is possible to create or extend from existing structures within this interface.

<br>

![Glytoucan Graphical Interface](/images/manual/search-graphical.png)

_Note: User registration is not required to query for a structure._

<br>

Once the structure is complete, a sequence is generated from the input and used to search the database for a valid id.  If the sequence is found, the structure format and any related super structures will be displayed.

<br>

![Glytoucan Graphical Interface Results](/images/manual/search-result.png)

_Result page of the search.  Other glycans containing the input structure will also be displayed._


<div id='discourse-comments'></div>

<script type="text/javascript">
  DiscourseEmbed = { discourseUrl: 'http://test.discourse.glytoucan.org/',
                     discourseEmbedUrl: 'http://code.glytoucan.org/manual/search-graphical/' };

  (function() {
    var d = document.createElement('script'); d.type = 'text/javascript'; d.async = true;
    d.src = DiscourseEmbed.discourseUrl + 'javascripts/embed.js';
    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(d);
  })();
</script>
