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
next: search-graphical
---

Registration Processing
------------

  Once the registration is complete, several batch processes are run on a timely basis in order to extract, enrich, and link the data with currently available information.  

* mass calculation

For every structure submitted, the components and linkage information will have a known mass.  Using this information the calculation of the entire structure is a simple process and will be recorded for all newly registered sequences.

* conversion to RDF

The information from the sequence will be converted into RDF format and accessible from the glytoucan [endpoint](http://ts.glytoucan.org/sparql).  As the data will be in [glycoRDF](http://glycoinfo.org/glycoRDF) and [glytoucanRDF](http://glycoinfo.org/rdf) ontologies, it is possible to extract information about the sequence and any other linked data using standard SPARQL.

* conversion to WURCS

In order to enrich data using the logic available in the wurcs libraries, conversion from glycoCT was required.  A batch process to convert the glycoCT and insert the WURCS into RDF was created to enable this.

* motif relationship search

Using the wurcs formats it was possible to search through the structural data to find substructure relationships of the specifically-defined [motif structures](http://www.glytoucan.org/Motifs/listAll).  The batch process then inserts these relationships back into RDF.