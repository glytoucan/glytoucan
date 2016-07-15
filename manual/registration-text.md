---
title: Registering Structures
authors:
- Nobuyuki Aoki
date: 2015-05-15
reviewers:
- Kiyoko Kinoshita
layout: paging
categories: [registration, graphical]
previous: registration-graphical
next: registration-upload
---

Text Interface
------------
  Another method to register structures is via the text interface.  If the glycan structure sequence string is known, and the format is one of the following:
   
  * GlycoCT
  * LinearCode
  * KCF

    # Sequence
# WURCS
OPTIONAL{
?glycan glycan:has_glycosequence ?wcsSeq .
?wcsSeq rdfs:label ?WURCS_label .
?wcsSeq glycan:in_carbohydrate_format glycan:carbohydrate_format_wurcs .
}
# GlycoCT
OPTIONAL{
?glycan glycan:has_glycosequence ?gctSeq .
?gctSeq glycan:has_sequence ?GlycoCT .
?gctSeq glycan:in_carbohydrate_format glycan:carbohydrate_format_glycoct .
}

  
the sequence can be typed or pasted into the text area input screen.  Multiple sequences can be input with a carriage return between each sequence.

![Glytoucan Text Interface](/images/manual/registration-text.png)
*Multiple sequences can be pasted into this field.*

Once entered, each structure will be checked for redundancy and if not previously registered, the confirmation screen will be shown.

![Glytoucan Graphical Interface](/images/manual/registration-result.png)

The sequences input will be converted into WURCS and displayed on this screen.  The results on this screen can be downloaded into spreadsheet format for review.

Please note the checkbox to the left of each structure result.  As there can be multiple structures registered on this page, a checkbox is provided to choose the sequence that is to be submitted.  For those that are checked, a new Accession number will be generated and stored into the repository.
