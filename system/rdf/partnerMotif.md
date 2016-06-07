---
title: Partner Motif Insert
authors:
- Daisuke Shinmachi
date: 2016-06-07
layout: default
---


## Overview

A GlyTouCan partner has data such as taxonomy, article, external database entry URL.
And also it has other data is one of motif data.
In update and managemet of motif data as partner data, a entry page of glycan structure be albe to display relation of glycan motif informatin.


## What data need for insert?

* Partner name
* WURCS sequence
* WURCSKey
* position name (Motif position name)
* Motif name



## Insert sparql

```
PREFIX glycan:  <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
INSERT DATA{
	GRAPH <http://rdf.glytoucan.org/partner/{partner name}>{
		<http://rdf.glycoinfo.org/motif/{position name}/{WURCSKey}> 
			a	glycan:Glycan_motif ;
			glycan:has_glycosequence <http://rdf.glycoinfo.org/motif/{position name}/{WURCSKey}/sequence/wurcs>;
			glytoucan:has_type	glytoucan:Motif_position_{position name}; 
			glycan:has_alias	<http://rdf.glycoinfo.org/motif/{position name}/{WURCSKey}/alisas>.

		<http://rdf.glycoinfo.org/motif/{position name}/{WURCSKey}/sequence/wurcs>
			a	glycan:Glycosequence ;
			rdfs:label "{WURCS sequence}"^^xsd:string;
			glycan:has_sequence "{WURCS sequence}"^^xsd:string;
			glycan:in_carbohydrate_format	glycan:carbohydrate_format_wurcs.

		<http://rdf.glycoinfo.org/motif/{position name}/{WURCSKey}/alisas>
			a	glytoucan:Glycan_motif_alias ;
			glycan:has_alias_name	"{Motif name}"@en. 
	}
}
```

## Input data


**Partner name**

This partner name is using in name of partner graph.

* bcsdb
* glycoepitope
* glycome-db
* glyconavi

**WURCSKey**

* What is WURCSKey?
	* WURCS2md5 + Hash(MD5)

* Convert MD5 with WURCS : G00051MO
	* WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1
	* --> 0401b43b4a36d0b2974e890d77a7b2a4

* WURCSKey (ex:G00051MO)
	* WURCS2md5=0401b43b4a36d0b2974e890d77a7b2a4


**WURCS sequence**

* ex: "WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1"^^xsd:string


**position name**

Motif position has 3 type of position name

* reducing_end
* internal
* non_reducing_end


**Motif name**

"@en" means English language tag 

* ex: "Lewis X"@en.



## Sample RDF of Motif

```
<http://rdf.glycoinfo.org/motif/non_reducing_end/WURCS2md5=0401b43b4a36d0b2974e890d77a7b2a4> 
	a	glycan:Glycan_motif ;
	glycan:has_glycosequence <http://rdf.glycoinfo.org/motif/non_reducing_end/WURCS2md5=0401b43b4a36d0b2974e890d77a7b2a4/sequence/wurcs>;
	glytoucan:has_type	glytoucan:Motif_type_non_reducing_end;
	glycan:has_alias	<http://rdf.glycoinfo.org/motif/non_reducing_end/WURCS2md5=0401b43b4a36d0b2974e890d77a7b2a4/alisas>.

<http://rdf.glycoinfo.org/motif/non_reducing_end/WURCS2md5=0401b43b4a36d0b2974e890d77a7b2a4/sequence/wurcs>
	a	glycan:Glycosequence ;
	rdfs:label "WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1"^^xsd:string;
	glycan:has_sequence "	WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1"^^xsd:string;
	glycan:in_carbohydrate_format	glycan:carbohydrate_format_wurcs.

<http://rdf.glycoinfo.org/motif/non_reducing_end/WURCS2md5=0401b43b4a36d0b2974e890d77a7b2a4/alisas>
	a	glytoucan:Glycan_motif_alias ;
	glycan:has_alias_name	"Lewis X"@en.
```