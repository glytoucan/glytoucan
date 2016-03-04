---
title: GlyTouCan API List
layout: default
---
* auto-gen TOC:
{:toc}

# Overview

This document is a listing of the GlyTouCan API.  It will be updated as the API changes.

## Background

[Long background of this explained in a post]().
TLDR: The API is a contract-first development method using the SOAP protocol, which is why this document should be updated first to clearly recognize functionality and how it will be transcribed into a definition file.

## Functionality
The below is a listing of the functionality provided by the api.  Words in **Bold** are "Complex", meaning they are a combination of literals.  *Italics* is for static data.  Multiple indicates a Set or Array of the contents directly below it.

1. Searching structures (substructure)
	1. input
		1. **GlycoSequence**
			1. sequence string
			1. *sequence format* (optional)
	1. output
		1. Multiple results based upon the current [substructure search method](/system/substructure.md)
			1. **GlycoSequence**
				2. sequence string
				3. *sequence format* (optional)
			1. [**ResponseMessage**](http://nexus.glycoinfo.org/content/sites/project/glytoucan/api.soap/apidocs/org/glytoucan/api/soap/contributor/ResponseMessage.html)
1. Registering GlycoSequences
	1. input
		1. **GlycoSequence**
			1. sequence string
			1. *sequence format* (optional)
	1. output
		1. **GlycoSequence**
			1. sequence string
			1. *sequence format* (optional)
		1. accession number string
		1. [**ResponseMessage**](http://nexus.glycoinfo.org/content/sites/project/glytoucan/api.soap/apidocs/org/glytoucan/api/soap/contributor/ResponseMessage.html)
1. Special functionality for Partners - all partner functionality determines the partner id based upon the [API authentication](/system/api_authentication).
	1. Partner GlycoSequence ID linking
		2. Registering/Updating with GlycoSequence
			1. input
				1. **GlycoSequence**
					1. sequence string
					1. *sequence format* (optional)
				2. partner glycosequence ID string
			1. output
				1. **GlycoSequence**
					1. sequence string
					1. *sequence format* (detected)
				1. accession number string
				2. partner glycosequence id string
				1. [**ResponseMessage**](http://nexus.glycoinfo.org/content/sites/project/glytoucan/api.soap/apidocs/org/glytoucan/api/soap/contributor/ResponseMessage.html)
		4. Registering/Updating with Accession Number
			1. input
				1. accession number string
				2. partner glycosequence ID string
			1. output
				1. accession number string
				2. partner glycosequence id string
				1. [**ResponseMessage**](http://nexus.glycoinfo.org/content/sites/project/glytoucan/api.soap/apidocs/org/glytoucan/api/soap/contributor/ResponseMessage.html)
	    2. Deleting with GlycoSequence
			1. input
				1. **GlycoSequence**
					1. sequence string
					1. *sequence format* (optional)
				2. partner glycosequence ID string
			1. output
				1. **GlycoSequence**
					1. sequence string
					1. *sequence format* (detected)
				1. accession number string
				2. partner glycosequence id string
				1. [**ResponseMessage**](http://nexus.glycoinfo.org/content/sites/project/glytoucan/api.soap/apidocs/org/glytoucan/api/soap/contributor/ResponseMessage.html)
		4. Deleting with Accession Number
			1. input
				1. accession number string
				2. partner glycosequence ID string
			1. output
				1. accession number string
				2. partner glycosequence id string
				1. [**ResponseMessage**](http://nexus.glycoinfo.org/content/sites/project/glytoucan/api.soap/apidocs/org/glytoucan/api/soap/contributor/ResponseMessage.html)
    1. Partner Alias management
	    2. Registering/Updating
			1. input
				1. **Alias**
					1. alias string
					1. *notation schema* (optional: default is common_name)
				1. accession number string
			1. output
				1. **Alias**
					1. alias string
					1. *notation schema*
				1. accession number string
				1. [**ResponseMessage**](http://nexus.glycoinfo.org/content/sites/project/glytoucan/api.soap/apidocs/org/glytoucan/api/soap/contributor/ResponseMessage.html)
	    2. Deleting
			1. input
				1. **Alias**
					1. alias string (optional)
					1. *notation schema*
				1. accession number string
			1. output
				1. **Alias**
					1. alias string (optional)
					1. *notation schema*
				1. accession number string
				1. [**ResponseMessage**](http://nexus.glycoinfo.org/content/sites/project/glytoucan/api.soap/apidocs/org/glytoucan/api/soap/contributor/ResponseMessage.html)
	1. Partner Motif Management
	    2. Registering/Updating with GlycoSequence
			1. input
				1. **GlycoSequence**
					1. sequence string
					1. *sequence format* (optional)
				1. **Alias**
					1. alias string
					1. *notation schema* (ignored if entered, default is motif_name)
			1. output
				1. **GlycoSequence**
					1. sequence string
					1. *sequence format* (detected)
				1. **Alias**
					1. alias string
					1. *notation schema* (motif_name)
				1. [**ResponseMessage**](http://nexus.glycoinfo.org/content/sites/project/glytoucan/api.soap/apidocs/org/glytoucan/api/soap/contributor/ResponseMessage.html)
		4. Registering/Updating with Accession Number
			1. input
				1. accession number string
				1. **Alias**
					1. alias string
					1. *notation schema* (ignored if entered, default is motif_name)
			1. output
				1. accession number string
				1. **Alias**
					1. alias string
					1. *notation schema* (motif_name)
				1. [**ResponseMessage**](http://nexus.glycoinfo.org/content/sites/project/glytoucan/api.soap/apidocs/org/glytoucan/api/soap/contributor/ResponseMessage.html)
	    2. Deleting with GlycoSequence
			1. input
				1. **GlycoSequence**
					1. sequence string
					1. *sequence format* (optional)
			1. output
				1. **GlycoSequence**
					1. sequence string
					1. *sequence format* (detected)
				1. accession number string
				1. **Alias**
					1. alias string
					1. *notation schema* (motif_name)
				1. [**ResponseMessage**](http://nexus.glycoinfo.org/content/sites/project/glytoucan/api.soap/apidocs/org/glytoucan/api/soap/contributor/ResponseMessage.html)
		4. Deleting with Accession Number
			1. input
				1. accession number string
				1. **Alias**
					1. alias string
					1. *notation schema* (ignored if entered, default is motif_name)
			1. output
				1. accession number string
				1. **Alias**
					1. alias string
					1. *notation schema* (motif_name)
				1. [**ResponseMessage**](http://nexus.glycoinfo.org/content/sites/project/glytoucan/api.soap/apidocs/org/glytoucan/api/soap/contributor/ResponseMessage.html)

> Written with [StackEdit](https://stackedit.io/).
