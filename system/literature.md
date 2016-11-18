---
title: Pubmed IDs to GlyTouCan Structures
layout: default
---
* auto-gen TOC:
{:toc}

# Attaching PubMed IDs

During the Discussion Forum at the [2016 Warren Workshop](http://warrenworkshop2016.glycoinfo.org/) one major request was to attach pubmed IDs to the unique structures registered in the GlyTouCan Repository.

## Requirements

1.  Authorization: The required permissions would be the same as registering structures.  The user will have to sign-in to the GlyTouCan website.  This is to provide some amount of accountability on the submitted data, as it will not be manually curated.
1.  Backwards compatibility with manually constructed data.
1.  Web interface.
1.  API interface.
1.  Submitted IDs confirmed to be pubmed ID.
1.  Multiple IDs submitted per structure.

##  Current Status

An explanation of the current situation of the system before these changes are proposed.

### Manually added pubmed IDs

Parts of the bulk data provided to GlyTouCan already contained pubmed IDs in various RDF ontological formats.  This was standardized to one format:

```
		?saccharide dcterms:references ?article .
		?article a bibo:Article .
		?article dcterms:identifier ?pubmed_id .
		?article rdfs:seeAlso ?pubmed_url .
```

The pubmed url is used as an HTTP link.  The structure of this link is based upon [identifiers.org](http://identifiers.org).

```
http://identifiers.org/pubmed/7503987
```

### Pubmed API

Pubmed offers an API that can validate a submitted ID to confirm it is an actual pubmed identifier.

## New functionality

As the frontend web site interface is dependent upon the client-API library, the API needs to be designed first.

### API interface

The addition of a new interface 




## Notes

1. For some formats, the carriage return characters must be replaced with "\n".
1. Because of "\n", the entire sequence must be in quotes (see example).
2. [Partner Registration in Japanese](http://code.glytoucan.org/partner/registration_ja/)