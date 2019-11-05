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
last_modified_at: 2019-11-05
---

Graphical Interface
------------

To search registered glycans with a specific structural fragment, it is possible to build through a graphical interface as shown in the figure.  The tool used is based on the work done for GlycanBuilder with Vaadin as described in

<cite>
 Damerell D, Ceroni A, Maass K, Ranzinger R, Dell A, Haslam SM. The GlycanBuilder and GlycoWorkbench glycoinformatics tools: updates and new developments. Biol Chem. 2012;393:1357–1362. [PubMed](http://www.ncbi.nlm.nih.gov/pubmed/23109548).
</cite>

It is possible to create or extend from existing structures within this interface.

<br>

![Glytoucan Graphical Interface](/images/manual/search-graphical.v2.png)

_Note: User registration is not required to query for a structure._

<br>

Once the structure is complete, a sequence is generated from the input  and send to GlyCosmos text search interface.

<br>

![Glycosmos Text Search Interface](/images/manual/search-graphical-text.png)

<br>

Click the search button to perform a complete match search. As a result, the image of the matched glycan structure and the accession number are displayed.

<br>

![Glytoucan Graphical Interface Results](/images/manual/search-result.v2.png)

_Note: The search result can be download as a CSV file._

<br>

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

<br>

<br>
