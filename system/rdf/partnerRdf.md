---
title: Partner RDF
authors:
- Daisuke Shinmachi
date: 2016-04-20
layout: default
---

# <a name="menu"> GlyTouCan Partner RDF
* [from BCSDB](#from BCSDB)
* [from GlycomeDB](#from GlycomeDB)  
* [from GlycoEpitope](#from GlycoEpitope)
* [from GlycoNAVI](#from GlycoNAVI)
	* [PubChem](#pubchem)
	* [wwPDB](#wwpdb) 
* [from UniCarbKB](#from UniCarbKB)
* [SPARQL Query](#SPARQL Query)


##  About IRI

**Domain** 

- rdf.glycoinfo.org  
- identifier.org



**Instance IRI**

```
Source instance  
http://rdf.glycoinfo.org/source/{taxnomomy id}


Taxonomy instance    
http://identifiers.org/taxonomy/{taxonomy_id}
=> http://identifiers.org/taxonomy/1010795

# In the case of a taxon has not taxonomy id.
http://rdf.glycoinfo.org/source/{encode_taxon_name}
=> http://rdf.glycoinfo.org/source/Helicobacter%20pylori%20O3


Article instance   
http://rdf.glycoinfo.org/references/{pubmed_id}


PubMed URL  
http://identifiers.org/pubmed/{pubmed_id}


Resource entry instance IRI  
http://rdf.glycoinfo.org/{database label}/{entry page id of the partner}

	# BCSDB
	http://rdf.glycoinfo.org/bcsdb/6922
	# GlycomeDB
	http://rdf.glycoinfo.org/glycome-db/48
	# JCGGDB
	http://rdf.glycoinfo.org/jcggdb/JCGG-STR010506
	# GlycoEpitope
	http://rdf.glycoinfo.org/glycoepitope/EP0011
	# PubChem SID
	http://rdf.glycoinfo.org/pubchem/SID252275760
	# PubChem CID
	http://rdf.glycoinfo.org/pubchem/CID91844939
	# PDBj CC
	http://rdf.glycoinfo.org/pdbj-cc/03F
	# PDBe CC
	http://rdf.glycoinfo.org/pdbe-cc/03F
	# RCSB PDB CC
	http://rdf.glycoinfo.org/rcsb_pdb-cc/03F
	# UniCarbKB
	http://rdf.glycoinfo.org/unicarbkb/1
```





**Entry page URL**  

```
BCSDB  
http://csdb.glycoscience.ru/bacterial/core/search_id.php?mode=record&id_list={bcsdb_id}
=> http://csdb.glycoscience.ru/bacterial/core/search_id.php?mode=record&id_list=6922 

GlycomeDB  
http://www.glycome-db.org/database/showStructure.action?glycomeId={glycome-db id}
=> http://www.glycome-db.org/database/showStructure.action?glycomeId=48

JCGGDB
http://jcggdb.jp/idb/jcggdb/{JCGGDB ID}
=> http://jcggdb.jp/idb/jcggdb/JCGG-STR010506

GlycoEpitope  
http://identifiers.org/glycoepitope/{epitope id}
=> http://identifiers.org/glycoepitope/EP0011

PubChem substance  
http://pubchem.ncbi.nlm.nih.gov/substance/{SID number}
=> http://pubchem.ncbi.nlm.nih.gov/substance/SID252275760

PubChem compound  
http://pubchem.ncbi.nlm.nih.gov/compound/{CID number}
=> http://pubchem.ncbi.nlm.nih.gov/compound/CID91844939

PDBj CC
http://pdbj.org/chemie/summary/{id}
=> http://pdbj.org/chemie/summary/

PDBe CC
http://rdf.glycoinfo.org/pdbe-cc/{id}
=> hhttp://rdf.glycoinfo.org/pdbe-cc/{id}

RCSB PDB CC
http://rdf.glycoinfo.org/rcsb_pdb-cc/{id}
=> hhttp://rdf.glycoinfo.org/rcsb_pdb-cc/{id}

UniCarbKB
http://www.unicarbkb.org/structure/{structure id}
=> http://www.unicarbkb.org/structure/1
```




### <a name="from BCSDB">from BCSDB 
[return to menu](#menu)


GRAPH : `<http://rdf.glytoucan.org/partner/bcsdb>`  

**Dataset**

``` 
# Species
<http://rdf.glycoinfo.org/glycan/{accession number}> #Saccharide 
	glycan:is_from_source <http://rdf.glycoinfo.org/source/{taxonomy_id}> ;
	glycan:is_from_source <http://rdf.glycoinfo.org/source/{encode_taxon_name}> .

# exist taxonomy id
<http://rdf.glycoinfo.org/source/{taxonomy_id}>
	a glycan:Source ;
	rdfs:label "taxon name" ;
	dcterms:identifier "Taxonomy ID" ;
	rdfs:seeAlso <http://identifiers.org/taxonomy/{taxonomy_id}> .

# dose not taxonomy id
<http://rdf.glycoinfo.org/source/{encode_taxon_name}>
	a glycan:Source ;
	rdfs:label "taxon name" .


# Literature
<http://rdf.glycoinfo.org/glycan/{accession number}> #Saccharide 
	dcterms:references <http://rdf.glycoinfo.org/references/{pubmed_id}> ; #Article

<http://rdf.glycoinfo.org/references/{pubmed_id}>
	a bibo:Article ;
	dcterms:identifier "PubMed id" ;
	rdfs:seeAlso <http://identifiers.org/pubmed/{pubmed_id}> . #PubMed URL


# External ID
<http://rdf.glycoinfo.org/glycan/{accession number}> #Saccharide 
	glycan:has_resource_entry <http://rdf.glycoinfo.org/bcsdb/{bcsdb id}>.

<http://rdf.glycoinfo.org/bcsdb/{bcsdb id}>
	a glycan:Resource_entry ;
	rdfs:label	"BCSDB" ;
	glycan:in_glycan_database glycan:Database_bcsdb ;
	dcterms:identifier  "BCSDB ID" ;
	rdfs:seeAlso	<http://csdb.glycoscience.ru/bacterial/core/search_id.php?mode=record&id_list={bcsdb_id}> .

glycan:Database_bcsdb rdfs:label "BCSDB".
```



### <a name="from GlycomeDB">from  GlycomeDB
[return to menu](#menu)

GRAPH : `<http://rdf.glytoucan.org/partner/glycome-db>`  

**Dataset**

```
# Species
<http://rdf.glycoinfo.org/glycan/{accession number}> #Saccharide 
	glycan:is_from_source <http://rdf.glycoinfo.org/source/{taxonomy_id}> .

<http://rdf.glycoinfo.org/source/{taxonomy_id}>
	a glycan:Source ;
	dcterms:identifier "Taxonomy ID" ;
	rdfs:seeAlso <http://identifiers.org/taxonomy/{taxonomy_id}> .


# External ID
<http://rdf.glycoinfo.org/glycan/{accession number}> #Saccharide 
	glycan:has_resource_entry <http://rdf.glycoinfo.org/glycome-db/{glycomedb id>.

<http://rdf.glycoinfo.org/glycome-db/{glycomedb id}>
	a glycan:Resource_entry ;
	rdfs:label	"GlycomeDB" ;
	glycan:in_glycan_database glycan:Database_glycomedb ;
	dcterms:identifier  "GlycomeDB ID" ;
	rdfs:seeAlso	<http://www.glycome-db.org/database/showStructure.action?glycomeId={glycome-db id}> .

glycan:Database_glycomedb rdfs:label "GlycomeDB"



# JCGGDB entry (External ID) from GlycomeDB 
<http://rdf.glycoinfo.org/glycan/{accession number}> #Saccharide 
	glycan:has_resource_entry <http://rdf.glycoinfo.org/jcggdb/{jcggdb id}>.

<http://rdf.glycoinfo.org/jcggdb/{jcggdb id}>
	a glycan:Resource_entry ;
	rdfs:label	"JCGGDB" ;
	glycan:in_glycan_database glycan:Database_jcggdb ;
	dcterms:identifier  "JCGGDB ID" ;
	rdfs:seeAlso	<http://jcggdb.jp/idb/jcggdb/{jcggdb id}> .

glycan:Database_jcggdb	rdfs:label	"JCGGDB" .
```




### <a name="from GlycoEpitope">from GlycoEpitope 
[return to menu](#menu)

GRAPH : `<http://rdf.glytoucan.org/partner/glycoepitope>`  

**Dataset**

```
 # Species
<http://rdf.glycoinfo.org/glycan/{accession number}> #Saccharide 
 glycan:is_from_source <http://rdf.glycoinfo.org/source/{taxonomy_id}> ;

<http://rdf.glycoinfo.org/source/{taxonomy_id}>
 a glycan:Source ;
 dcterms:identifier "Taxonomy ID" ;
 rdfs:seeAlso <http://identifiers.org/taxonomy/{taxonomy_id}> .


# Literature
<http://rdf.glycoinfo.org/glycan/{accession number}> #Saccharide 
 dcterms:references <http://rdf.glycoinfo.org/references/{pubmed_id}> ; #Article

<http://rdf.glycoinfo.org/references/{pubmed_id}>
 a bibo:Article ;
 dcterms:identifier "PubMed id" ;
 rdfs:seeAlso <http://identifiers.org/pubmed/{pubmed_id}> . #PubMed URL


# External ID
<http://rdf.glycoinfo.org/glycan/{accession number}> #Saccharide 
	glycan:has_resource_entry <http://rdf.glycoinfo.org/glycoepitope/{epitope id}> .

<http://rdf.glycoinfo.org/glycoepitope/{epitope id}>
	a glycan:Resource_entry ;
	rdfs:label	"GlycoEpitope" ;
	glycan:in_glycan_database glycan:Database_glycoepitope ;
	dcterms:identifier	"Epitope id" ;
	rdfs:seeAlso	<http://identifiers.org/glycoepitope/{epitope id}> .

glycan:Database_glycoepitope rdfs:label "GlycoEpitope".
```




### <a name="from GlycoNAVI">from GlycoNAVI 
[return to menu](#menu)

GRAPH : `<http://rdf.glytoucan.org/partner/glyconavi>`  

**Dataset**

<a name="pubchem"> PubChem  
[return to menu](#menu)


```
<http://rdf.glycoinfo.org/glycan/{accession number}>
	glycan:has_resource_entry 
 			<http://rdf.glycoinfo.org/pubchem/{sid}> ,
			<http://rdf.glycoinfo.org/pubchem/{cid}> .

<http://rdf.glycoinfo.org/pubchem/{sid}>
	a glycan:Resource_entry ;
	rdfs:label "PubChem SID" ;
	glycan:in_glycan_database　glycan:Database_pubchem ;
	rdfs:seeAlso <http://pubchem.ncbi.nlm.nih.gov/substance/{sid}> ;
	dcterms:identifier "252275760" .

<http://rdf.glycoinfo.org/pubchem/{cid}>
	a glycan:Resource_entry ;
	rdfs:label "PubChem CID" ;
	glycan:in_glycan_databse	glytoucan:Database_pubchem ;
	rdfs:seeAlso <http://pubchem.ncbi.nlm.nih.gov/compound/{cid}> ;
	dcterms:identifier "91844939" .

glycan:Database_pubchem rdfs:label "PubChem".
```


<a name="wwwpdb"> wwPDB    
[return to menu](#menu)


* cc : chemical component

```
<http://rdf.glycoinfo.org/glycan/{Accession number}>
	a glycan:Saccharide ;
	glycan:has_resource_entry <http://rdf.glycoinfo.org/pdbj-cc/{id}> ;
	glycan:has_resource_entry <http://rdf.glycoinfo.org/pdbe-cc/{id}> ;
	glycan:has_resource_entry <http://rdf.glycoinfo.org/rcsb_pdb-cc/{id}> .

<http://rdf.glycoinfo.org/pdbj-cc/{id}>
	a glycan:Resource_entry ;
	rdfs:label	"PDBj CC" ;
	dcterms:identifier	"id";
	glycan:in_glycan_database  glycan:Database_pdbj ;
	rdfs:seeAlso	<http://pdbj.org/chemie/summary/{id}> ;
	skos:exactMatch	<http://rdf.wwpdb.org/cc/{id}> .

<http://rdf.glycoinfo.org/pdbe-cc/{id}>
	dcterms:identifier	"id";
	rdfs:label	"PDBe CC" ;
	glycan:in_glycan_database  glycan:Database_pdbe ;
	rdfs:seeAlso	<http://www.ebi.ac.uk/pdbe/entry/pdb/{id}> ;
	skos:exactMatch	<http://rdf.wwpdb.org/cc/{id}> .

<http://rdf.glycoinfo.org/rcsb_pdb-cc/{id}>
	dcterms:identifier	"id";
	rdfs:label	"RCSB PDB CC" ;
	glycan:in_glycan_database  glycan:Database_rcsb_pdb ;
	rdfs:seeAlso	<http://www.rcsb.org/pdb/explore.do?structureId={id}> ;
	skos:exactMatch	<http://rdf.wwpdb.org/cc/{id}> .

<http://rdf.wwpdb.org/cc/{id}>
	dcterms:identifier	"id".

glycan:Database_pdbj
	rdfs:label	"PDBj" .

glycan:Database_pdbe
	rdfs:label	"PDBe" .

glycan:Database_rcsb_pdb
	rdfs:label	"RCSB PDB" .
```


### <a name="from GlycoNAVI">from UniCarbKB
[return to menu](#menu)

GRAPH : `<http://rdf.glytoucan.org/partner/unicarbkb>`  

**Dataset**

```
<http://rdf.glycoinfo.org/glycan/{Accession number}>
	a glycan:Saccharide ;
	glycan:has_resource_entry <https://glytoucan.org/Structures/Glycans/{Accession number}> ;
	glycan:has_resource_entry <http://rdf.glycoinfo.org/unicarbkb/{structure id}> .

<http://rdf.glycoinfo.org/unicarbkb/{structure id}>
	a glycan:Resource_entry ;
	glycan:in_glycan_database  glycan:Database_unicarbkb ;
	dcterms:identifier	"{structure id}";
	rdfs:label	"UnicarbKB" ;
	rdfs:seeAlso	<http://www.unicarbkb.org/structure/{structure id}> .

glycan:Database_unicarbkb
	rdfs:label	"UnicarbKB" .
```



## <a name="SPARQL Query">SPARQL query
[return to menu](#menu)

Construct query  
[SPARQL query](/system/sparql/partnerRdfConstructQuery)

Insert query  
[SPARQL query](/system/sparql/partnerRdfInsertQuery)
