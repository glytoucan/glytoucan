---
title: Querying Structures
authors:
- Nobuyuki Aoki
date: 2015-05-15
reviewers:
- Kiyoko Kinoshita
layout: paging
categories: [query, graphical]
previous: search-graphical
next: search-id
last_modified_at: 2018-11-05  
---

Text Interface
------------
  Another method to query structures is via the text interface (using GlyCosmso text search).  If the glycan structure sequence string is known, and the format is one of the following:

  * GlycoCT condensed
  * IUPAC condensed
  * IUPAC extended
  * Linear Code &reg;
  * KCF
  * WURCS


The sequence can be typed or pasted into the text area input screen.

<br>

![Glytoucan Text Interface](/images/manual/search-text.png)

*Only one sequence can be pasted into this field.  Please be careful of whitespace when pasting text.*

<br>

Click the search button to perform a complete match search. As a result, the image of the matched glycan structure and the accession number are displayed.

<br>

![Glytoucan Graphical Interface](/images/manual/search-result.v2.png)

_Please note that the sequence is converted to WURCS, and the WURCS sequence is used to search for the structure_

<br>

<div id='discourse-comments'></div>

<script type="text/javascript">
  DiscourseEmbed = { discourseUrl: 'http://test.discourse.glytoucan.org/',
                     discourseEmbedUrl: 'http://code.glytoucan.org/manual/search-text/' };

  (function() {
    var d = document.createElement('script'); d.type = 'text/javascript'; d.async = true;
    d.src = DiscourseEmbed.discourseUrl + 'javascripts/embed.js';
    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(d);
  })();
</script>

<br>

<br>
