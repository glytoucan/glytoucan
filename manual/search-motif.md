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
last_modified_at: 2017-02-08
---

Motif Search
------------

Utilizing the _has motif_ relationship within the GlyTouCan RDF, it is possible to execute searches based on this relationship between the registered structures.  Since the Linked Data engine automatically caches queries, commonly used relationships such as motifs can return query results very efficiently.  This is important considering the large number of possible motifs within every structure registered.

<br>

![GlyTouCan Graphical Interface](/images/manual/search-motif.png)

_Initially the entire list of Motifs is displayed._

<br>

Simply by clicking on a specific Motif, the results screen is then displayed.   

<br>

![GlyTouCan Graphical Interface Results](/images/manual/search-motif-nglycan.png)

_Result page of an N-glycan-core-basic Motif search._

<br>

This shows a filtered view of every structure with the chosen Motif in the repository.  It is then possible to browse through the results and click on a specific glycan for more information. 

<div id='discourse-comments'></div>

<script type="text/javascript">
  DiscourseEmbed = { discourseUrl: 'http://test.discourse.glytoucan.org/',
                     discourseEmbedUrl: 'http://code.glytoucan.org/manual/search-motif/' };

  (function() {
    var d = document.createElement('script'); d.type = 'text/javascript'; d.async = true;
    d.src = DiscourseEmbed.discourseUrl + 'javascripts/embed.js';
    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(d);
  })();
</script>
