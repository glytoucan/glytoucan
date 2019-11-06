---
title: Registering Structures
authors:
- Nobuyuki Aoki
date: 2015-05-15
reviewers:
- Kiyoko Kinoshita
layout: paging
categories: [registration, results, glycan]
previous: registration-upload
next: publication-registration
last_modified_at: 2019-08-06
---

Registration Processing
------------

  Once the submission is complete, several batch processes are run on a timely basis in order to extract and link the data with currently available information.  

### Detect format batch

For every structure submitted, the sequence string depend on several format (GlycoCT, WURCS etc...). Using this sequence characteristic, determine the format of the sequence string.

<br>

### WURCS validator batch

If the sequence format is a WURCS, this validator batch verifies that the WURCS string is correct. If there is a problem as a result of WURCS validation, Error and Warning are saved as record(s).

<br>

### Accession batch

In this batch, only that there is no error in the verification of WURCS, to generate the accession number, assignment it.


<br>

### WURCS to image batch

Generate an image of the glycan structure from WURCS. The format is png only, and  as notation that are IUPAC, SNFG, and Oxford-color images are generated.

<br>



<div id='discourse-comments'></div>

<script type="text/javascript">
  DiscourseEmbed = { discourseUrl: 'http://test.discourse.glytoucan.org/',
                     discourseEmbedUrl: 'http://code.glytoucan.org/manual/registration-result/' };

  (function() {
    var d = document.createElement('script'); d.type = 'text/javascript'; d.async = true;
    d.src = DiscourseEmbed.discourseUrl + 'javascripts/embed.js';
    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(d);
  })();
</script>

<br>

<br>
