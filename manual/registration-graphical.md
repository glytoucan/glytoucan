---
title: Registering Structures
authors:
- Nobuyuki Aoki
date: 2015-05-15
reviewers:
- Kiyoko Kinoshita
layout: paging
categories: [registration, graphical]
previous: profile
next: registration-text
last_modified_at: 2019-08-06
---

Graphical Interface
------------

One method of submitting a glycan structure is through a graphical interface.  The interface used is based on the work done for GlycanBuilder with Vaadin as described in

<cite>
 Damerell D, Ceroni A, Maass K, Ranzinger R, Dell A, Haslam SM. The GlycanBuilder and GlycoWorkbench glycoinformatics tools: updates and new developments. Biol Chem. 2012;393:1357–1362. [PubMed](http://www.ncbi.nlm.nih.gov/pubmed/23109548).
</cite>

It is possible to create or extend embedded default structures from this interface.

<br>

![Glytoucan Graphical Interface](/images/manual/registration-graphical.png)

<br>

  Once the structure is complete, a sequence is generated from the input and sent to the database to check if it was previously registered.  If the structure is found in the database, a link and accession number indicating the structure ID will be displayed; otherwise, a final confirmation screen will be shown. If the submit button is entered to indicate confirmation, the newly "submission ref" and graphical representation will be displayed.

<br>

![Glytoucan Graphical Interface Results](/images/manual/registration-result.png)

<br>

As all sequences will be stored in GlycoCT (condensed) format, the sequence initially input will be displayed under _original structure_, while the sequence converted into WURCS will be displayed under _Structure_.  The image generated will be shown on the right.  This screen is necessary to confirm there are no issues in the conversion process.

<br>

<div id='discourse-comments'></div>

<script type="text/javascript">
  DiscourseEmbed = { discourseUrl: 'http://test.discourse.glytoucan.org/',
                     discourseEmbedUrl: 'http://code.glytoucan.org/manual/registration-graphical/' };

  (function() {
    var d = document.createElement('script'); d.type = 'text/javascript'; d.async = true;
    d.src = DiscourseEmbed.discourseUrl + 'javascripts/embed.js';
    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(d);
  })();
</script>

<br>

<br>
