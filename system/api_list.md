---
title: GlyTouCan API List
layout: default
---


* auto-gen TOC:
{:toc}

## Overview ##

This document will be a technical explanation of the GlyTouCan API and the technical architecture behind it.  It will be updated as the API changes.

#### Background

[Long background of this explained in a post]().
TLDR: Thus the SOAP protocol.

#### Functionality
The below is a listing of the functionality provided by the api.  Words in **Bold** are "Complex", meaning they are a combination of literals.  *Italics* is for static data.  Multiple indicates a Set or Array of the contents directly below it.

1. Searching structures (substructure)
	2. input
		3. **GlycoSequence**
			2. sequence string
			3. *sequence format* (optional)
	4. output
		5. Multiple
			7. **GlycoSequence**
				2. sequence string
				3. *sequence format* (optional)
 			6. [**ResponseMessage**](http://nexus.glycoinfo.org/content/sites/project/glytoucan/api.soap/apidocs/index.html)

2. Registering GlycoSequences
	3. New GlycoSequence
		3. input
			4. **GlycoSequence**
				2. sequence string
				3. *sequence format* (optional)
		4. output
			5. **GlycoSequence**
			6. accession number string
			6. [**ResponseMessage**](http://nexus.glycoinfo.org/content/sites/project/glytoucan/api.soap/apidocs/index.html)
	7. Update GlycoSequence
		8. Input
			4. **GlycoSequence**
				2. sequence string
				3. *sequence format* (optional)
			6. accession number string
		4. output
			5. **GlycoSequence**
			6. accession number string
			6. [**ResponseMessage**](http://nexus.glycoinfo.org/content/sites/project/glytoucan/api.soap/apidocs/index.html)
1. Partner management of the public database's glycan identifiers
	2. N
		4. [CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete) Management of glycan aliases
		4. [CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete) Management of Motifs from already registered structures
	6. From the glytoucan client API:
		7. All of the above functionality

The already existing Public Database data in the GlycoRDF owl will be loaded into the GlyTouCan repository.  Thus it can be assumed that this is the static list of GlyTouCan partners.  Maintenance of the ontology, which will be part of the responsibilities of [GLIC](http://glic.glycoinfo.org), will be essential to the stability of GlyTouCan.  The system will depend on this data to be accurate as described in this document.


#### GlycoRDF



> Written with [StackEdit](https://stackedit.io/).
