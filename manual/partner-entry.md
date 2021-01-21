---
title: Partner Entry Page
authors:
- Nobuyuki Aoki
date: 2020-01-20
reviewers:
- Kiyoko Kinoshita
layout: paging
categories: [partner, glycan]
previous: browse
last_modified_at: 2020-01-20
---

Partner Entry Page
------------

A partner-specific page was created for users [registered in the partner program](https://code.glytoucan.org/partner) to be able to modify their external id and associated linkages.

### Signin First

In order to access this page for a specific accession number, it is necessary to first sign in:

![Signin](/images/manual/gtc-signin.png)

This will allow the system to recognize the email-to-partner association stored in our RDF backend.  When [a specific glycan entry page](https://glytoucan.org/Structures/Glycans/G46677TE) is displayed, the backend will check partner status and display a special link.

![PartnerLink](/images/manual/gtc-entry-partner-link.png)

This is a link to the partner-specific version of an entry.  It has the same summary information and details, however the external link section has new functionality.

![PartnerEntry](/images/manual/gtc-partner-entry.png)

If you have already associated your identifiers to this entry, they will be editable as in the figure.  The Add input field is to specify a new identifier to link.  In this case, the `test0` id will be used.  Once submitted, the backend will generate the link based upon the template url of your partner registration data.

*Please note* your partner information is viewable through the [User Profile](http://code.glytoucan.org/manual/profile/)).

![PartnerEntryInput](/images/manual/gtc-partner-entry-input.png)

Any editable identifier viewable through this page is also displayed on the original entry page.

![EntryPartnerInput](/images/manual/gtc-entry-partner-input.png)

<div id='discourse-comments'></div>

<script type="text/javascript">
  DiscourseEmbed = { discourseUrl: 'http://test.discourse.glytoucan.org/',
                     discourseEmbedUrl: 'http://code.glytoucan.org/manual/partner-entry/' };

  (function() {
    var d = document.createElement('script'); d.type = 'text/javascript'; d.async = true;
    d.src = DiscourseEmbed.discourseUrl + 'javascripts/embed.js';
    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(d);
  })();
</script>

<br>

<br>
