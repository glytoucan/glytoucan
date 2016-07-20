---
title: Partner Resource entry RDF
authors:
- Daisuke Shinmachi
date: 2016-06-30s
layout: default
---


## Partner Resource entry RDF

**Input data**

* resource entry label (type of entry page) 
	* e.g. "BCSDB", "PubChem SID", "PDBj cc"
* entry ID (external id)
* database name
* entry page URL
* exact match IRI



```
<http://rdf.glycoinfo.org/{resource_entry_label}/{entry_id}>
	a glycan:Resource_entry ;
	rdfs:label	"{resource_entry_label}" ;
	dcterms:identifier	"{entry_id}";
	glytoucan:in_database <http://rdf.glycoinfo.org/database/{database_name}> ;
	rdfs:seeAlso	<Resource entry URL> ;
	skos:exactMatch	<exaceMatch IRI> .


# <http://rdf.glycoinfo.org/database/{database_name}> 
# 	a glytoucan:Database ;
# 	rdfs:label "{database name}" ;
# 	rdfs:seeAlso <databae URL> .
```

Q: Why does not use "glycan:in_glycan_database"?  
A: The PubChem and the wwPDB are not glycan database.




**Sample template**

```
@prefix rdfs:	<http://www.w3.org/2000/01/rdf-schema#> .
@prefix dcterms: <http://purl.org/dc/terms/> .
@prefix glycan:	<http://purl.jp/bio/12/glyco/glycan#> .
@prefix glytoucan:	<http://www.glytoucan.org/glyco/owl/glytoucan#> .
@prefix skos: <http://www.w3.org/2004/02/skos/core#> .

<http://rdf.glycoinfo.org/glycan/{accession_number}>
	a glycan:Saccharide ;
	glycan:has_resource_entry <http://rdf.glycoinfo.org/pdbj-cc/{pdb_chem-comp_id}> ;

<http://rdf.glycoinfo.org/pdbj-cc/{pdb_chem-comp_id}>
	a glycan:Resource_entry ;
	rdfs:label	"PDBj CC" ;
	dcterms:identifier	"{pdb_chem-comp_id}";
	glycan:in_glycan_database  glycan:Database_pdbj ;
	rdfs:seeAlso	<http://pdbj.org/chemie/summary/{pdb_chem-comp_id}> ;
	skos:exactMatch	<http://rdf.wwpdb.org/cc/{pdb_chem-comp_id}> .

```



