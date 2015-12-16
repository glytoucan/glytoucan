---
title: Registering Structures
authors:
- Nobuyuki Aoki
date: 2015-05-15
reviewers:
- Kiyoko Kinoshita
layout: paging
categories: [registration, graphical]
next: registration-text
---

Graphical Interface
------------

One method of submitting a glycan structure is through a graphical interface.  The interface used is based on the work done for GlycanBuilder with Vaadin as described in

<cite>
 Damerell D, Ceroni A, Maass K, Ranzinger R, Dell A, Haslam SM. The GlycanBuilder and GlycoWorkbench glycoinformatics tools: updates and new developments. Biol Chem. 2012;393:1357–1362. [PubMed](http://www.ncbi.nlm.nih.gov/pubmed/23109548).
</cite>

It is possible to create or extend embedded default structures from this interface.

![Glytoucan Graphical Interface](/images/manual/registration-graphical.png)

  Once the structure is complete, a sequence is generated from the input and sent to the database to check if it was previously registered.  If the structure is found in the database, a link and accession number indicating the structure ID will be displayed; otherwise, a final confirmation screen will be shown. If the submit button is entered to indicate confirmation, the newly registered accession number and graphical representation will be displayed.

![Glytoucan Graphical Interface Results](/images/manual/registration-result.png)
As all sequences will be stored in GlycoCT (condensed) format, the sequence initially input will be displayed under _original structure_, while the sequence converted into WURCS will be displayed under _Structure_.  The image generated will be shown on the right.  This screen is necessary to confirm there are no issues in the conversion process.
