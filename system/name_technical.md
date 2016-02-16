---
title: Glycan Trivial Name Process
layout: default
---

[TOC]

## Overview ##

This document will cover the trivial name processing when registering a new glycan.

### Monosaccharides

As of this writing, the monosaccharideDB[^msDB] database is the main resource for trivial names of monosaccharides.  The [composition](/system/composition_ja) paper explains in more detail the system flow of how this works when broken down from a larger glycan.

#### Sequential flow
The following is a sequence flow diagram explaining the roles and communication made within this process.  To simplify this will be for a singular monosaccharide.
```sequence
User->GlyTouCan: register glycan X
GlyTouCan->GlyTouCan: various processing for a glycan
GlyTouCan->monosaccharideDB: request names of RDF for monosaccharides in glycan X
monosaccharideDB-->GlyTouCan:process request and return RDF with trivial names
GlyTouCan->GlyTouCan: various post-processing for a glycan
GlyTouCan->RDF Datastore: register glycan information including contributor data
RDF Datastore->GlyTouCan: 
GlyTouCan->User: display new accession number
User->GlyTouCan: request glycan entry page of glycan X
GlyTouCan->RDF Datastore: retrieve RDFs including data from monosaccharideDB contribution
RDF Datastore->GlyTouCan: 
GlyTouCan->User: display trivial names
```

#### Remote Access
[Remote access](http://www.monosaccharidedb.org/remote_access.action) to monosaccharideDB[^msDB] is a web service providing conversion routines via http protocol.

Here is an example of a remote access request using the WURCS residue code:

```
http://www.monosaccharidedb.org/rdf/monosaccharide.action?name=Aad211d2h-2a_2-6_5%2ANCC%2F3%3DO
```

[link](http://www.monosaccharidedb.org/rdf/monosaccharide.action?name=Aad211d2h-2a_2-6_5%2ANCC%2F3%3DO)

Example result, with unused parts such as `glycan:has_external_substituent` removed
```
<http://www.monosaccharidedb.org/rdf/monosaccharide_alias.action?scheme=BCSDB&name=aD3,7dgalNonp5N-ulosonic&substName=Ac&substPos=5&substLink=o>
      a       glycan:monosaccharide_alias ;
      glycan:has_alias_name
	      "aD3,7dgalNonp5N-ulosonic" ;
      glycan:has_monosaccharide_notation_scheme "glycan:monosaccharide_notation_scheme_bcsdb"^^<http://www.w3.org/2001/XMLSchema#string> ;
```

This data will be converted as contributor data using the trivial name contributor submission webservice:
```

```

```sparql
    PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
    INSERT DATA { 
      GRAPH <http://rdf.glytoucan.org/contributor/monosaccharidedb> { 
	<glycan:Monosaccharide> glycan:has_alias <http://www.monosaccharidedb.org/rdf/monosaccharide_alias.action?scheme=BCSDB&name=aD3,7dgalNonp5N-ulosonic&substName=Ac&substPos=5&substLink=o>;
	a glycan:Monosaccharide_alias;
	glycan:has_alias_name "aD3,7dgalNonp5N-ulosonic" .
      glycan:has_monosaccharide_notation_scheme "glycan:monosaccharide_notation_scheme_bcsdb"^^<http://www.w3.org/2001/XMLSchema#string>       }
    }
```


It will then be retrievable using the [trivial name architecture](/system/name).

[^msDB]: [monosaccharideDB](http://monosaccharidedb.morg)




> Written with [StackEdit](https://stackedit.io/).
