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

# Text Interface
------------
The simplest method to register structures is via the text interface.  Any format is accepted, however if it cannot be converted into WURCS format, then an error will be displayed.  GlyTouCan utilizes the [RINGS conversion tool](http://rings.t.soka.ac.jp/cgi-bin/tools/utilities/convert/index.pl) to transform the input sequence.  Please refer to this resource for conversion issues.
  
The sequence can be typed or pasted into the text area input screen.  Multiple sequences can be input.

<br>

![Glytoucan Text Interface](/images/manual/registration-text.png)  
*Multiple sequences can be pasted into this field, the Add button also generates another text field for multiple entry.*

Once entered, each structure will be checked for redundancy and if not previously registered, the confirmation screen will be shown.

<br>

## Registration Confirmation

![Glytoucan Registration Confirmation](/images/manual/registration-result.png)

<br>

The sequences input will be converted into WURCS and displayed on this screen.  The results on this screen can be downloaded into a spreadsheet format for review.

Please note the checkbox to the left of each structure result, as there can be multiple structures registered on this page, and a checkbox is provided to choose the sequence that is to be submitted.  For those that are checked, a new Accession number will be generated and placed in the registration queue.
