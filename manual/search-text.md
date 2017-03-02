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
next: search-motif
---

Text Interface
------------
  Another method to query structures is via the text interface.  If the glycan structure sequence string is known, and the format is one of the following:
   
  * GlycoCT
  * LinearCode
  * KCF
  
  
The sequence can be typed or pasted into the text area input screen.

<br>

![Glytoucan Text Interface](/images/manual/search-text.png)

*Only one sequence can be pasted into this field.  Please be careful of whitespace when pasting text.* 

<br>

Once entered, any related super-structures will be displayed.  If the input structure is not registered, it will indicate so as it will not have an Accession Number. 

<br>

![Glytoucan Graphical Interface](/images/manual/search-result.png)

_Please note that the sequence is converted to WURCS, and the WURCS sequence is used to search for the structure_

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
