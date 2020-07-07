---
title: GlyTouCan RDF
authors:
- Daisuke Shinmachi
date: 2018-01-25
layout: rdf-docs
last_modified_at: 2020-07-02
---


<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Ontology](#ontology)
- [Overview diagram](#overview-diagram)
- [GRAPHs](#graphs)
  - [Graph list](#graph-list)
  - [Core graph](#core-graph)
  - [Mass graph](#mass-graph)
  - [Monosaccharide graph (MsDB CarbBank schema)](#monosaccharide-graph-msdb-carbbank-schema)
  - [Sequence graph](#sequence-graph)
    - [WURCS graph](#wurcs-graph)
    - [GlycoCT graph](#glycoct-graph)
  - [Partner graph](#partner-graph)
    - [Bacterial Carbohydrate Structure Database (BCSDB) graph](#bacterial-carbohydrate-structure-database-bcsdb-graph)
    - [GlycoChemExplorer AIST graph](#glycochemexplorer-aist-graph)
    - [GlycoEpitope garph](#glycoepitope-garph)
    - [GlycomeDB graph](#glycomedb-graph)
    - [GlycoNAVI graph](#glyconavi-graph)
      - [PubChem](#pubchem)
      - [PDBj CC](#pdbj-cc)
      - [PDBe CC](#pdbe-cc)
      - [RCSB PDB CC](#rcsb-pdb-cc)
    - [JCGGDB AIST graph](#jcggdb-aist-graph)
    - [JMSDB AIST graph](#jmsdb-aist-graph)
    - [UniCarb-DB graph](#unicarb-db-graph)
    - [UniCarbKB graph](#unicarbkb-graph)
    - [SugarBindDB graph](#sugarbinddb-graph)
    - [GlycoStore graph](#glycostore-graph)
    - [Glyconnect graph](#glyconnect-graph)
    - [GlyConnect (composition) graph](#glyconnect-composition-graph)
    - [MatrixDB graph](#matrixdb-graph)

<!-- /TOC -->



# Ontology

  Prefix|  Namespace |  Vocabularies
--|---|--
rdf  | `http://www.w3.org/1999/02/22-rdf-syntax-ns#` |  RDF
rdfs  | `http://www.w3.org/2000/01/rdf-schema#`  |  RDF Schema
owl  | `http://www.w3.org/2002/07/owl#`  |  OWL
xsd  | `http://www.w3.org/2001/XMLSchema#`  |  XML Schema
foaf  | `http://xmlns.com/foaf/0.1/`  |  FOAF Vocabulary
bibo  | `http://purl.org/ontology/bibo/`  |  Bibliographic Ontology
glycan  | `http://purl.jp/bio/12/glyco/glycan#`  |  GlycoRDF Ontology
glytoucan  | `http://www.glytoucan.org/glyco/owl/glytoucan#`  |  GlyTouCan Ontology
wurcs  | `http://www.glycoinfo.org/glyco/owl/wurcs#`  |  WURCS OWL


# Overview diagram

[![overview](/images/rdf_doc/overview-schema.png)](/images/rdf_doc/overview-schema.png)

# GRAPHs

The GlyTouCan RDF consists of multiple Named GRAPHs.

## Graph list 

Graphs | Named graph | Data
--|---|--
Core graph | http://rdf.glytoucan.org/core | GlyTouCan accession number and a submitted date
Mass graph | http://rdf.glytoucan.org/mass | Mass value of glycan
Monosaccharide graph (MsDB CarbBank schema) | http://rdf.glytoucan.org/ms/carbbank | Monosaccharide label that is from MsDB
WURCS sequence graph | http://rdf.glytoucan.org/sequence/wurcs | WURCS sequence data
GlycoCT sequence graph | http://rdf.glytoucan.org/sequence/glycoct | GlycoCT sequence data
Bacterial Carbohydrate Structure Database (BCSDB) graph | http://rdf.glytoucan.org/partner/bcsdb | Asociated with BCSDB ID to accession number
GlycoChemExplorer AIST graph | http://rdf.glytoucan.org/partner/glycochemexplorer_jcggdb_aist | Asociated with GlycoChemExplorer ID to accession number 
GlycoEpitope garph | http://rdf.glytoucan.org/partner/glycoepitope | Asociated with Epitope ID to accession number, inclued spcies and PubMed ID
GlycomeDB graph | http://rdf.glytoucan.org/partner/glycome-db | Asociated with GlycomeDB ID to accession number, inclued spcies and external DB ID that is related GlycomeDB
GlycoNAVI graph (PubChem) | http://rdf.glytoucan.org/partner/glyconavi | Asociated with SID, CID in PubChem to accession number
GlycoNAVI graph (PDBj) | http://rdf.glytoucan.org/partner/glyconavi | Asociated with Chemical Compound ID in PDBj to accession number
GlycoNAVI graph (PDBe) | http://rdf.glytoucan.org/partner/glyconavi | Asociated with Chemical Compound ID in PDBe to accession number
GlycoNAVI graph (RCSB PDB) | http://rdf.glytoucan.org/partner/glyconavi | Asociated with Chemical Compound ID in RCSB PDB to accession number
JCGGDB AIST graph | http://rdf.glytoucan.org/partner/jcggdb_aist | Asociated with JCGGDB ID to accession number
JMSDB AIST graph | http://rdf.glytoucan.org/partner/jmsdb_jcggdb_aist | Asociated with JMSDB ID to accession number
UniCarb-DB graph | http://rdf.glytoucan.org/partner/unicarb-db | Asociated with UniCarb-DB ID to accession number
UniCarbKB graph | http://rdf.glytoucan.org/partner/unicarbkb | Asociated with UniCarbKB ID to accession number
SugarBindDB graph | http://rdf.glytoucan.org/partner/swiss_institute_of_bioinformatics | Asociated with SugarBindDB ID to accession number
GlycoStore graph | http://rdf.glytoucan.org/partner/glycostore | Asociated with Glycan ID in GlycoStore to accession number
GlyConnect graph | http://rdf.glytoucan.org/partner/glyconnect | Asociated with GlyConnect ID to accession number
GlyConnect (composition) graph | http://rdf.glytoucan.org/partner/glyconnect-comp | Asociated with GlyConnect ID (composition specific) to accession number
MatrixDB graph | http://rdf.glytoucan.org/partner/matrixdb | Asociated with MatrixDB ID to accession number

## Core graph

Named graph: `http://rdf.glytoucan.org/core`

**Sample Triple**

```
@prefix rdf:	<http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs:	<http://www.w3.org/2000/01/rdf-schema#> .
@prefix xsd:	<http://www.w3.org/2001/XMLSchema#> .
@prefix glycan:	<http://purl.jp/bio/12/glyco/glycan#> .
@prefix glytoucan:	<http://www.glytoucan.org/glyco/owl/glytoucan#> .

<http://rdf.glycoinfo.org/glycan/G19529BG>
    rdf:type  glycan:saccharide;
    glycan:has_resource_entry <http://rdf.glycoinfo.org/resource-entry/G19529BG>;
    glytoucan:has_primary_id G19529BG.

<http://rdf.glycoinfo.org/resource-entry/G19529BG>
    rdf:type  glycan:resource_entry;
    rdfs:seeAlso  <http://glytoucan.org/Structures/Glycans/G19529BG>;
    dcterms:identifier  G19529BG;
    glycan:in_glycan_database glytoucan:database_glytoucan;
    glytoucan:date_registered 2014-10-31 16:00:57.41;
    glytoucan:contributor <http://rdf.glycoinfo.org/glytoucan/contributor/userId/1>.
```

**SPARQL example**

```
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX bibo: <http://purl.org/ontology/bibo/> 
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX wurcs:	<http://www.glycoinfo.org/glyco/owl/wurcs#> 

SELECT DISTINCT *
FROM <http://rdf.glytoucan.org/core>
WHERE {
    ?Saccharide a ?SaccharideClass .
    ?Saccharide glytoucan:has_primary_id ?AccessionNumber .
    ?Saccharide glycan:has_resource_entry ?ResourceEntry .

    ?ResourceEntry a ?ResourceEntryClass .
    ?ResourceEntry glytoucan:contributor ?Contributor .
    ?ResourceEntry glytoucan:date_registered ?Date .
    ?ResourceEntry glycan:in_glycan_database ?DB .
    ?ResourceEntry dcterms:identifier ?AccessionNumber .
    ?ResourceEntry rdfs:seeAlso ?Entry .
}
limit 20
```
[=> Run query](https://ts.glytoucan.org/sparql?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0D%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0D%0APREFIX+dcterms%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0APREFIX+foaf%3A+%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E%0D%0APREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0D%0APREFIX+bibo%3A+%3Chttp%3A%2F%2Fpurl.org%2Fontology%2Fbibo%2F%3E+%0D%0APREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A++%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0APREFIX+wurcs%3A%09%3Chttp%3A%2F%2Fwww.glycoinfo.org%2Fglyco%2Fowl%2Fwurcs%23%3E+%0D%0A%0D%0ASELECT+DISTINCT+*%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fcore%3E%0D%0AWHERE+%7B%0D%0A++++%3FSaccharide+a+%3FSaccharideClass+.%0D%0A++++%3FSaccharide+glytoucan%3Ahas_primary_id+%3FAccessionNumber+.%0D%0A++++%3FSaccharide+glycan%3Ahas_resource_entry+%3FResourceEntry+.%0D%0A%0D%0A++++%3FResourceEntry+a+%3FResourceEntryClass+.%0D%0A++++%3FResourceEntry+glytoucan%3Acontributor+%3FContributor+.%0D%0A++++%3FResourceEntry+glytoucan%3Adate_registered+%3FDate+.%0D%0A++++%3FResourceEntry+glycan%3Ain_glycan_database+%3FDB+.%0D%0A++++%3FResourceEntry+dcterms%3Aidentifier+%3FAccessionNumber+.%0D%0A++++%3FResourceEntry+rdfs%3AseeAlso+%3FEntry+.%0D%0A%7D%0D%0Alimit+20&render=HTML&limit=25&offset=0#loadstar-results-section)


## Mass graph

Named graph: `http://rdf.glytoucan.org/mass`

**Sample RDF Triple**

```
@prefix rdf:	<http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix xsd:	<http://www.w3.org/2001/XMLSchema#> .
@prefix rdfs:	<http://www.w3.org/2000/01/rdf-schema#> .
@prefix glytoucan:	<http://www.glytoucan.org/glyco/owl/glytoucan#> .

<http://rdf.glycoinfo.org/glycan/G25033GC>
    glytoucan:has_derivatized_mass	<http://rdf.glycoinfo.org/derivatization_type_node/1754.3911661> .

<http://rdf.glycoinfo.org/derivatization_type_node/1754.3911661>
    rdf:type	glytoucan:derivatized_mass ;
    rdfs:label	"1754.3911661"^^xsd:string ;
    glytoucan:has_mass	1754.391166099999964 ;
    glytoucan:has_derivatization_type	glytoucan:derivatization_type_none .
```

**SPARQL example**

```
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX bibo: <http://purl.org/ontology/bibo/> 
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX wurcs:	<http://www.glycoinfo.org/glyco/owl/wurcs#> 

SELECT DISTINCT *
FROM <http://rdf.glytoucan.org/mass>
WHERE{
    ?saccharide glytoucan:has_derivatized_mass ?d_mass.
    ?d_mass a ?class .
    ?d_mass rdfs:label ?d_mass_label.
    ?d_mass glytoucan:has_mass ?mass.
    BIND(datatype(?mass) AS ?datatype)
    ?d_mass glytoucan:has_derivatization_type ?d_mass_type.
}
limit 10
```
[=> Run query](https://ts.glytoucan.org/sparql?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0D%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0D%0APREFIX+dcterms%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0APREFIX+foaf%3A+%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E%0D%0APREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0D%0APREFIX+bibo%3A+%3Chttp%3A%2F%2Fpurl.org%2Fontology%2Fbibo%2F%3E+%0D%0APREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A++%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0APREFIX+wurcs%3A%09%3Chttp%3A%2F%2Fwww.glycoinfo.org%2Fglyco%2Fowl%2Fwurcs%23%3E+%0D%0A%0D%0ASELECT+DISTINCT+*%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fmass%3E%0D%0AWHERE%7B%0D%0A++++%3Fsaccharide+glytoucan%3Ahas_derivatized_mass+%3Fd_mass.%0D%0A++++%3Fd_mass+a+%3Fclass+.%0D%0A++++%3Fd_mass+rdfs%3Alabel+%3Fd_mass_label.%0D%0A++++%3Fd_mass+glytoucan%3Ahas_mass+%3Fmass.%0D%0A++++BIND%28datatype%28%3Fmass%29+AS+%3Fdatatype%29%0D%0A++++%3Fd_mass+glytoucan%3Ahas_derivatization_type+%3Fd_mass_type.%0D%0A%7D%0D%0Alimit+10&render=HTML&limit=25&offset=0#loadstar-results-section)



## Monosaccharide graph (MsDB CarbBank schema)

Named graph: `http://rdf.glytoucan.org/ms/carbbank`

**Sample RDF Triple**

```

@prefix rdf:	<http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix glycan:	<http://purl.jp/bio/12/glyco/glycan#> .

<http://rdf.glycoinfo.org/glycan/G00051MO>
    glycan:has_component	<http://rdf.glycoinfo.org/component/1_b-dgal-HEX-1:5> .

<http://rdf.glycoinfo.org/component/1_b-dgal-HEX-1:5>
    rdf:type	glycan:component ;
    glycan:has_cardinality	1 ;
    glycan:has_monosaccharide	<http://www.monosaccharidedb.org/rdf/monosaccharide.action?name=b-dgal-HEX-1:5> .

<http://www.monosaccharidedb.org/rdf/monosaccharide.action?name=b-dgal-HEX-1:5>
    rdf:type	glycan:monosaccharide ;
    glycan:has_alias	<http://www.monosaccharidedb.org/rdf/monosaccharide_alias.action?scheme=CARBBANK&name=b-D-Galp> .

<http://www.monosaccharidedb.org/rdf/monosaccharide_alias.action?scheme=CARBBANK&name=b-D-Galp>
    rdf:type	glycan:monosaccharide_alias ;
    glycan:has_alias_name	"b-D-Galp" ;
    glycan:has_monosaccharide_notation_scheme	glycan:monosaccharide_notation_scheme_carbbank .
```

**SPARQL example**

```
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX bibo: <http://purl.org/ontology/bibo/> 
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX wurcs:	<http://www.glycoinfo.org/glyco/owl/wurcs#> 

SELECT DISTINCT *
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glytoucan.org/ms/carbbank>
WHERE{
    # Accession Number
    ?glycan glytoucan:has_primary_id "G00051MO" .
    OPTIONAL{
        ?glycan glycan:has_component ?comp .
        ?comp glycan:has_cardinality ?cardinality .
        ?comp glycan:has_monosaccharide ?mono .
        ?mono glycan:has_alias ?msdb .
        ?mono a ?class.
        ?msdb glycan:has_alias_name ?ComponentName .
    }
}
```
[=> Run query](https://ts.glytoucan.org/sparql?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0D%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0D%0APREFIX+dcterms%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0APREFIX+foaf%3A+%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E%0D%0APREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0D%0APREFIX+bibo%3A+%3Chttp%3A%2F%2Fpurl.org%2Fontology%2Fbibo%2F%3E+%0D%0APREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A++%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0APREFIX+wurcs%3A%09%3Chttp%3A%2F%2Fwww.glycoinfo.org%2Fglyco%2Fowl%2Fwurcs%23%3E+%0D%0A%0D%0ASELECT+DISTINCT+*%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fcore%3E%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fms%2Fcarbbank%3E%0D%0AWHERE%7B%0D%0A++++%23+Accession+Number%0D%0A++++%3Fglycan+glytoucan%3Ahas_primary_id+%22G00051MO%22+.%0D%0A++++OPTIONAL%7B%0D%0A++++++++%3Fglycan+glycan%3Ahas_component+%3Fcomp+.%0D%0A++++++++%3Fcomp+glycan%3Ahas_cardinality+%3Fcardinality+.%0D%0A++++++++%3Fcomp+glycan%3Ahas_monosaccharide+%3Fmono+.%0D%0A++++++++%3Fmono+glycan%3Ahas_alias+%3Fmsdb+.%0D%0A++++++++%3Fmono+a+%3Fclass.%0D%0A++++++++%3Fmsdb+glycan%3Ahas_alias_name+%3FComponentName+.%0D%0A++++%7D%0D%0A%7D&render=HTML&limit=25&offset=0#loadstar-results-section)


## Sequence graph

### WURCS graph

Named graph: `http://rdf.glytoucan.org/sequence/wurcs`

**Sample RDF Triple**

```
@prefix rdf:	<http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix xsd:	<http://www.w3.org/2001/XMLSchema#> .
@prefix rdfs:	<http://www.w3.org/2000/01/rdf-schema#> .
@prefix owl:	<http://www.w3.org/2002/07/owl#> .
@prefix glycan:	<http://purl.jp/bio/12/glyco/glycan#> .
@prefix wurcs:	<http://www.glycoinfo.org/glyco/owl/wurcs#> .

<http://rdf.glycoinfo.org/glycan/G95616YE>
    rdf:type	glycan:saccharide ;
    glycan:has_glycosequence	<http://rdf.glycoinfo.org/glycan/G95616YE/wurcs> ,
      <http://rdf.glycoinfo.org/glycan/G95616YE/wurcs/2.0> .

<http://rdf.glycoinfo.org/glycan/G95616YE/wurcs>
    rdfs:label	"WURCS=2.0/5,7,6/[u2122h_2*NCC/3=O][a1122h-1b_1-5][a1122h-1a_1-5][a2122h-1b_1-5_2*NCC/3=O][a2112h-1b_1-5]/1-2-3-4-5-4-5/a4-b1_b3-c1_c2-d1_c4-f1_d4-e1_f4-g1"^^xsd:string ;
    glycan:has_sequence	"WURCS=2.0/5,7,6/[u2122h_2*NCC/3=O][a1122h-1b_1-5][a1122h-1a_1-5][a2122h-1b_1-5_2*NCC/3=O][a2112h-1b_1-5]/1-2-3-4-5-4-5/a4-b1_b3-c1_c2-d1_c4-f1_d4-e1_f4-g1"^^xsd:string ;
    glycan:in_carbohydrate_format	glycan:carbohydrate_format_wurcs .

<http://rdf.glycoinfo.org/glycan/G95616YE/wurcs/2.0>
    rdf:type	glycan:glycosequence ;
    rdfs:label	"WURCS=2.0/5,7,6/[u2122h_2*NCC/3=O][a1122h-1b_1-5][a1122h-1a_1-5][a2122h-1b_1-5_2*NCC/3=O][a2112h-1b_1-5]/1-2-3-4-5-4-5/a4-b1_b3-c1_c2-d1_c4-f1_d4-e1_f4-g1"^^xsd:string ;
    owl:sameAs	<http://rdf.glycoinfo.org/glycan/wurcs/2.0/WURCS%3D2.0%2F5%2C7%2C6%2F%5Bu2122h_2%2ANCC%2F3%3DO%5D%5Ba1122h-1b_1-5%5D%5Ba1122h-1a_1-5%5D%5Ba2122h-1b_1-5_2%2ANCC%2F3%3DO%5D%5Ba2112h-1b_1-5%5D%2F1-2-3-4-5-4-5%2Fa4-b1_b3-c1_c2-d1_c4-f1_d4-e1_f4-g1> ;
    glycan:has_sequence	"WURCS=2.0/5,7,6/[u2122h_2*NCC/3=O][a1122h-1b_1-5][a1122h-1a_1-5][a2122h-1b_1-5_2*NCC/3=O][a2112h-1b_1-5]/1-2-3-4-5-4-5/a4-b1_b3-c1_c2-d1_c4-f1_d4-e1_f4-g1"^^xsd:string ;
    glycan:in_carbohydrate_format	glycan:carbohydrate_format_wurcs ;
    wurcs:LIN_count	6 ;
    wurcs:RES_count	7 ;
    wurcs:has_LIN	<http://rdf.glycoinfo.org/glycan/G95616YE/wurcs/2.0/LIN/c4-f1> ,
      <http://rdf.glycoinfo.org/glycan/G95616YE/wurcs/2.0/LIN/d4-e1> ,
      <http://rdf.glycoinfo.org/glycan/G95616YE/wurcs/2.0/LIN/b3-c1> ,
      <http://rdf.glycoinfo.org/glycan/G95616YE/wurcs/2.0/LIN/c2-d1> ,
      <http://rdf.glycoinfo.org/glycan/G95616YE/wurcs/2.0/LIN/f4-g1> ,
      <http://rdf.glycoinfo.org/glycan/G95616YE/wurcs/2.0/LIN/a4-b1> ;
    wurcs:has_basetype	<http://rdf.glycoinfo.org/glycan/wurcs/2.0/Basetype/u2112h> ,
      <http://rdf.glycoinfo.org/glycan/wurcs/2.0/Basetype/u1122h ,
      <http://rdf.glycoinfo.org/glycan/wurcs/2.0/Basetype/u2122h_2%2ANCC%2F3%3DO> ;
    wurcs:has_monosaccharide	<http://rdf.glycoinfo.org/glycan/wurcs/2.0/Monosaccharide/a2112h-1b_1-5> ,
      <http://rdf.glycoinfo.org/glycan/wurcs/2.0/Monosaccharide/a1122h-1a_1-5> ,
      <http://rdf.glycoinfo.org/glycan/wurcs/2.0/Monosaccharide/a1122h-1b_1-5> ,
      <http://rdf.glycoinfo.org/glycan/wurcs/2.0/Monosaccharide/a2122h-1b_1-5_2%2ANCC%2F3%3DO> ,
      <http://rdf.glycoinfo.org/glycan/wurcs/2.0/Monosaccharide/u2122h_2%2ANCC%2F3%3DO> ;
    wurcs:has_root_RES	<http://rdf.glycoinfo.org/glycan/G95616YE/wurcs/2.0/RES/a> ;
    wurcs:has_uniqueRES	<http://rdf.glycoinfo.org/glycan/G95616YE/wurcs/2.0/UniqueRES/1> ,
      <http://rdf.glycoinfo.org/glycan/G95616YE/wurcs/2.0/UniqueRES/5> ,
      <http://rdf.glycoinfo.org/glycan/G95616YE/wurcs/2.0/UniqueRES/2> ,
      <http://rdf.glycoinfo.org/glycan/G95616YE/wurcs/2.0/UniqueRES/3> ,
      <http://rdf.glycoinfo.org/glycan/G95616YE/wurcs/2.0/UniqueRES/4> ;
    wurcs:uniqueRES_count	5 ;
    wurcs:has_root_GRES	<http://rdf.glycoinfo.org/glycan/G95616YE/wurcs/2.0/GRES/1> ;
    wurcs:has_GRES	<http://rdf.glycoinfo.org/glycan/G95616YE/wurcs/2.0/GRES/1> ,
      <http://rdf.glycoinfo.org/glycan/G95616YE/wurcs/2.0/GRES/2> ,
      <http://rdf.glycoinfo.org/glycan/G95616YE/wurcs/2.0/GRES/7> ,
      <http://rdf.glycoinfo.org/glycan/G95616YE/wurcs/2.0/GRES/5> ,
      <http://rdf.glycoinfo.org/glycan/G95616YE/wurcs/2.0/GRES/6> ,
      <http://rdf.glycoinfo.org/glycan/G95616YE/wurcs/2.0/GRES/3> ,
      <http://rdf.glycoinfo.org/glycan/G95616YE/wurcs/2.0/GRES/4> .
```

**SPARQL example**

```
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX bibo: <http://purl.org/ontology/bibo/> 
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX wurcs:	<http://www.glycoinfo.org/glyco/owl/wurcs#> 

SELECT DISTINCT *
FROM <http://rdf.glytoucan.org/sequence/wurcs>
WHERE{
  ?saccharide a ?sclass;
  	glycan:has_glycosequence ?gseq.
  ?gseq a ?gsclass.
  ?gseq glycan:has_sequence ?seq.
}
limit 10
```
[=> Run query](https://ts.glytoucan.org/sparql?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0D%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0D%0APREFIX+dcterms%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0APREFIX+foaf%3A+%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E%0D%0APREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0D%0APREFIX+bibo%3A+%3Chttp%3A%2F%2Fpurl.org%2Fontology%2Fbibo%2F%3E+%0D%0APREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A++%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0APREFIX+wurcs%3A%09%3Chttp%3A%2F%2Fwww.glycoinfo.org%2Fglyco%2Fowl%2Fwurcs%23%3E+%0D%0A%0D%0ASELECT+DISTINCT+*%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fsequence%2Fwurcs%3E%0D%0AWHERE%7B%0D%0A++%3Fsaccharide+a+%3Fsclass%3B%0D%0A++%09glycan%3Ahas_glycosequence+%3Fgseq.%0D%0A++%3Fgseq+a+%3Fgsclass.%0D%0A++%3Fgseq+glycan%3Ahas_sequence+%3Fseq.%0D%0A%7D%0D%0Alimit+1&render=HTML&limit=25&offset=0#loadstar-results-section)


### GlycoCT graph

Named graph: `http://rdf.glytoucan.org/sequence/glycoct`

**Sample RDF Triple**

```
@prefix rdf:	<http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs:	<http://www.w3.org/2000/01/rdf-schema#> .
@prefix xsd:	<http://www.w3.org/2001/XMLSchema#> .
@prefix glycan:	<http://purl.jp/bio/12/glyco/glycan#> .
@prefix glytoucan:	<http://www.glytoucan.org/glyco/owl/glytoucan#> .

<http://rdf.glycoinfo.org/glycan/G35898DT>
  glycan:has_glycosequence  <http://rdf.glycoinfo.org/glycan/G35898DT/glycoct> .

<http://rdf.glycoinfo.org/glycan/G35898DT/glycoct>
		rdfs:label  "RES\n1b:a-dgal-HEX-1:5\n2s:n-acetyl\n3b:b-dgal-HEX-1:5\n4b:b-dglc-HEX-1:5\n5s:n-acetyl\n6b:b-dgal-HEX-1:5\n7b:a-lgal-HEX-1:5|6:d\n8b:b-dglc-HEX-1:5\n9s:n-acetyl\n10b:b-dglc-HEX-1:5\n11s:n-acetyl\n12b:b-dgal-HEX-1:5\n13b:a-lgal-HEX-1:5|6:d\nLIN\n1:1d(2+1)2n\n2:1o(3+1)3d\n3:3o(3+1)4d\n4:4d(2+1)5n\n5:4o(4+1)6d\n6:6o(2+1)7d\n7:3o(6+1)8d\n8:8d(2+1)9n\n9:1o(6+1)10d\n10:10d(2+1)11n\n11:10o(4+1)12d\n12:12o(2+1)13d"^^xsd:string ;
		glycan:has_sequence  "RES\n1b:a-dgal-HEX-1:5\n2s:n-acetyl\n3b:b-dgal-HEX-1:5\n4b:b-dglc-HEX-1:5\n5s:n-acetyl\n6b:b-dgal-HEX-1:5\n7b:a-lgal-HEX-1:5|6:d\n8b:b-dglc-HEX-1:5\n9s:n-acetyl\n10b:b-dglc-HEX-1:5\n11s:n-acetyl\n12b:b-dgal-HEX-1:5\n13b:a-lgal-HEX-1:5|6:d\nLIN\n1:1d(2+1)2n\n2:1o(3+1)3d\n3:3o(3+1)4d\n4:4d(2+1)5n\n5:4o(4+1)6d\n6:6o(2+1)7d\n7:3o(6+1)8d\n8:8d(2+1)9n\n9:1o(6+1)10d\n10:10d(2+1)11n\n11:10o(4+1)12d\n12:12o(2+1)13d"^^xsd:string ;
		glycan:in_carbohydrate_format	glycan:carbohydrate_format_glycoct .
```

**SPARQL example**

```
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX bibo: <http://purl.org/ontology/bibo/> 
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX wurcs:	<http://www.glycoinfo.org/glyco/owl/wurcs#> 

SELECT *
FROM <http://rdf.glytoucan.org/sequence/glycoct>
WHERE {
    # Glycosequence
    ?Saccharide glycan:has_glycosequence ?GSequence .
    ?GSequence glycan:has_sequence ?Sequence .
    ?GSequence glycan:in_carbohydrate_format ?Format .
    ?GSequence rdfs:label ?label .
}
limit 10
```
[=> Run query](https://ts.glytoucan.org/sparql?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0D%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0D%0APREFIX+dcterms%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0APREFIX+foaf%3A+%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E%0D%0APREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0D%0APREFIX+bibo%3A+%3Chttp%3A%2F%2Fpurl.org%2Fontology%2Fbibo%2F%3E+%0D%0APREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A++%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0APREFIX+wurcs%3A%09%3Chttp%3A%2F%2Fwww.glycoinfo.org%2Fglyco%2Fowl%2Fwurcs%23%3E+%0D%0A%0D%0ASELECT+*%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fsequence%2Fglycoct%3E%0D%0AWHERE+%7B%0D%0A++++%23+Glycosequence%0D%0A++++%3FSaccharide+glycan%3Ahas_glycosequence+%3FGSequence+.%0D%0A++++%3FGSequence+glycan%3Ahas_sequence+%3FSequence+.%0D%0A++++%3FGSequence+glycan%3Ain_carbohydrate_format+%3FFormat+.%0D%0A++++%3FGSequence+rdfs%3Alabel+%3Flabel+.%0D%0A%7D%0D%0Alimit+1&render=HTML&limit=25&offset=0#loadstar-results-section)

## Partner graph

### Bacterial Carbohydrate Structure Database (BCSDB) graph

Named graph: `http://rdf.glytoucan.org/partner/bcsdb`

**Sample RDF Triple**

```
@prefix rdfs:	<http://www.w3.org/2000/01/rdf-schema#> .
@prefix dcterms: <http://purl.org/dc/terms/> .
@prefix bibo: <http://purl.org/ontology/bibo/> .
@prefix glycan:	<http://purl.jp/bio/12/glyco/glycan#> .
@prefix glytoucan:	<http://www.glytoucan.org/glyco/owl/glytoucan#> .


> Species
<http://rdf.glycoinfo.org/glycan/{accession_number}> #Saccharide
	glycan:is_from_source <http://rdf.glycoinfo.org/source/{taxonomy_id}> ;
	glycan:is_from_source <http://rdf.glycoinfo.org/source/{encode_taxon_name}> .

> exist taxonomy id
<http://rdf.glycoinfo.org/source/{taxonomy_id}>
	a glycan:Source ;
	rdfs:label "taxon name" ;
	dcterms:identifier "{taxonomy_id}" ;
	rdfs:seeAlso <http://identifiers.org/taxonomy/{taxonomy_id}> .

> dose not taxonomy id
<http://rdf.glycoinfo.org/source/{encode_taxon_name}>
	a glycan:Source ;
	rdfs:label "taxon name" .


> Literature
<http://rdf.glycoinfo.org/glycan/{accession_number}> #Saccharide
	dcterms:references <http://rdf.glycoinfo.org/references/{pubmed_id}> ; #Article

<http://rdf.glycoinfo.org/references/{pubmed_id}>
	a bibo:Article ;
	dcterms:identifier "{pubmed_id}" ;
	rdfs:seeAlso <http://identifiers.org/pubmed/{pubmed_id}> . #PubMed URL


> External ID
<http://rdf.glycoinfo.org/glycan/{accession_number}> #Saccharide
	glycan:has_resource_entry <http://rdf.glycoinfo.org/bcsdb/{bcsdb_id}>.

<http://rdf.glycoinfo.org/bcsdb/{bcsdb_id}>
	a glycan:Resource_entry ;
	rdfs:label	"BCSDB" ;
	glycan:in_glycan_database glycan:Database_bcsdb ;
	dcterms:identifier  "{bcsdb_id}" ;
	rdfs:seeAlso	<http://csdb.glycoscience.ru/bacterial/core/search_id.php?mode=record&id_list={bcsdb_id}> .

glycan:Database_bcsdb
	rdfs:label "BCSDB".
```

**SPARQL example**

```
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX bibo: <http://purl.org/ontology/bibo/> 
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX wurcs:	<http://www.glycoinfo.org/glyco/owl/wurcs#> 

SELECT DISTINCT ?accNum ?entry ?entry_label ?external_id ?url
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glytoucan.org/partner/bcsdb>
WHERE{
  ?saccharide glytoucan:has_primary_id ?accNum .
  ?saccharide glycan:has_resource_entry ?entry .
  ?entry a glycan:Resource_entry .
  ?entry rdfs:label ?entry_label .
  ?entry dcterms:identifier ?external_id .
  ?entry rdfs:seeAlso ?url .
} limit 10
```
[=> Run query](https://ts.glytoucan.org/sparql?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0D%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0D%0APREFIX+dcterms%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0APREFIX+foaf%3A+%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E%0D%0APREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0D%0APREFIX+bibo%3A+%3Chttp%3A%2F%2Fpurl.org%2Fontology%2Fbibo%2F%3E+%0D%0APREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A++%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0APREFIX+wurcs%3A%09%3Chttp%3A%2F%2Fwww.glycoinfo.org%2Fglyco%2Fowl%2Fwurcs%23%3E+%0D%0A%0D%0ASELECT+DISTINCT+%3FaccNum+%3Fentry+%3Fentry_label+%3Fexternal_id+%3Furl%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fcore%3E%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fpartner%2Fbcsdb%3E%0D%0AWHERE%7B%0D%0A++%3Fsaccharide+glytoucan%3Ahas_primary_id+%3FaccNum+.%0D%0A++%3Fsaccharide+glycan%3Ahas_resource_entry+%3Fentry+.%0D%0A++%3Fentry+a+glycan%3AResource_entry+.%0D%0A++%3Fentry+rdfs%3Alabel+%3Fentry_label+.%0D%0A++%3Fentry+dcterms%3Aidentifier+%3Fexternal_id+.%0D%0A++%3Fentry+rdfs%3AseeAlso+%3Furl+.%0D%0A%7D+limit+1&render=HTML&limit=25&offset=0#loadstar-results-section)


### GlycoChemExplorer AIST graph

Named graph: `http://rdf.glytoucan.org/partner/glycochemexplorer_jcggdb_aist`

**Sample RDF Triple**

```
@prefix rdf:	<http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs:	<http://www.w3.org/2000/01/rdf-schema#> .
@prefix xsd:	<http://www.w3.org/2001/XMLSchema#> .
@prefix dcterms:	<http://purl.org/dc/terms/> .
@prefix glycan:	<http://purl.jp/bio/12/glyco/glycan#> .
@prefix glytoucan:	<http://www.glytoucan.org/glyco/owl/glytoucan#> .

<http://rdf.glycoinfo.org/glycan/G85930OB>
    glycan:has_resource_entry	<http://rdf.glycoinfo.org/glycan/resource-entry/G85930OB/glycochemexplorer_jcggdb_aist/JCGG-M0000101407> .

<http://rdf.glycoinfo.org/glycan/resource-entry/G85930OB/glycochemexplorer_jcggdb_aist/JCGG-M0000101407>
    rdf:type	glycan:Resource_entry ;
    rdfs:label	"GlycoChemExplorer" ;
    rdfs:seeAlso	<http://jcggdb.jp/GlycoChemExplorer/jsp/SViewer.jsp?id=JCGG-M0000101407> ;
    dcterms:identifier	"JCGG-M0000101407" ;
    glycan:in_glycan_database	<http://rdf.glytoucan.org/partner/glycochemexplorer_jcggdb_aist> ;
    glytoucan:date_registered	"2017-02-15 23:39:33.303"^^xsd:dateTimeStamp ,
		"2017-02-15 23:39:33.306"^^xsd:dateTimeStamp ;
    glytoucan:contributor	<http://rdf.glycoinfo.org/glytoucan/contributor/userId/6f152bd8af82b4514812b87fb4bd8f99eb10ba3e07554249bdce51ef1c1fb0a8> .
```

**SPARQL example**

```
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX bibo: <http://purl.org/ontology/bibo/> 
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX wurcs:	<http://www.glycoinfo.org/glyco/owl/wurcs#> 

SELECT DISTINCT ?accNum ?entry ?entry_label ?external_id ?url
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glytoucan.org/partner/glycochemexplorer_jcggdb_aist>
WHERE{
  ?saccharide glytoucan:has_primary_id ?accNum .
  ?saccharide glycan:has_resource_entry ?entry .
  ?entry a glycan:Resource_entry .
  ?entry rdfs:label ?entry_label .
  ?entry dcterms:identifier ?external_id .
  ?entry rdfs:seeAlso ?url .
} limit 10
```

[=> Run query](https://ts.glytoucan.org/sparql?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0D%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0D%0APREFIX+dcterms%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0APREFIX+foaf%3A+%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E%0D%0APREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0D%0APREFIX+bibo%3A+%3Chttp%3A%2F%2Fpurl.org%2Fontology%2Fbibo%2F%3E+%0D%0APREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A++%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0APREFIX+wurcs%3A%09%3Chttp%3A%2F%2Fwww.glycoinfo.org%2Fglyco%2Fowl%2Fwurcs%23%3E+%0D%0A%0D%0ASELECT+DISTINCT+%3FaccNum+%3Fentry+%3Fentry_label+%3Fexternal_id+%3Furl%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fcore%3E%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fpartner%2Fglycochemexplorer_jcggdb_aist%3E%0D%0AWHERE%7B%0D%0A++%3Fsaccharide+glytoucan%3Ahas_primary_id+%3FaccNum+.%0D%0A++%3Fsaccharide+glycan%3Ahas_resource_entry+%3Fentry+.%0D%0A++%3Fentry+a+glycan%3AResource_entry+.%0D%0A++%3Fentry+rdfs%3Alabel+%3Fentry_label+.%0D%0A++%3Fentry+dcterms%3Aidentifier+%3Fexternal_id+.%0D%0A++%3Fentry+rdfs%3AseeAlso+%3Furl+.%0D%0A%7D+limit+1&render=HTML&limit=25&offset=0#loadstar-results-section)



### GlycoEpitope garph

Named graph: `http://rdf.glytoucan.org/partner/glycoepitope`

**Sample RDF Triple**

```
@prefix rdfs:	<http://www.w3.org/2000/01/rdf-schema#> .
@prefix dcterms: <http://purl.org/dc/terms/> .
@prefix bibo: <http://purl.org/ontology/bibo/> .
@prefix glycan:	<http://purl.jp/bio/12/glyco/glycan#> .
@prefix glytoucan:	<http://www.glytoucan.org/glyco/owl/glytoucan#> .

 # Species
<http://rdf.glycoinfo.org/glycan/{accession_number}> #Saccharide
    glycan:is_from_source <http://rdf.glycoinfo.org/source/{taxonomy_id}> ;

<http://rdf.glycoinfo.org/source/{taxonomy_id}>
    a glycan:Source ;
    dcterms:identifier "{taxonomy_id}" ;
    rdfs:seeAlso <http://identifiers.org/taxonomy/{taxonomy_id}> .


> Literature
<http://rdf.glycoinfo.org/glycan/{accession_number}> #Saccharide
    dcterms:references <http://rdf.glycoinfo.org/references/{pubmed_id}> ; #Article

<http://rdf.glycoinfo.org/references/{pubmed_id}>
    a bibo:Article ;
    dcterms:identifier "{pubmed_id}" ;
    rdfs:seeAlso <http://identifiers.org/pubmed/{pubmed_id}> . #PubMed URL


> External ID
<http://rdf.glycoinfo.org/glycan/{accession_number}> #Saccharide
    glycan:has_resource_entry <http://rdf.glycoinfo.org/glycoepitope/{epitope_id}> .

<http://rdf.glycoinfo.org/glycoepitope/{epitope_id}>
    a glycan:Resource_entry ;
    rdfs:label	"GlycoEpitope" ;
    glycan:in_glycan_database glycan:Database_glycoepitope ;
    dcterms:identifier	"{epitope_id}" ;
    rdfs:seeAlso	<http://identifiers.org/glycoepitope/{epitope_id}> .

glycan:Database_glycoepitope
    rdfs:label "GlycoEpitope".
```

**SPARQL example**

```
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX bibo: <http://purl.org/ontology/bibo/> 
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX wurcs:	<http://www.glycoinfo.org/glyco/owl/wurcs#> 

SELECT DISTINCT ?accNum ?entry ?entry_label ?external_id ?url
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glytoucan.org/partner/glycoepitope>
WHERE{
  ?saccharide glytoucan:has_primary_id ?accNum .
  ?saccharide glycan:has_resource_entry ?entry .
  ?entry a glycan:Resource_entry .
  ?entry rdfs:label ?entry_label .
  ?entry dcterms:identifier ?external_id .
  ?entry rdfs:seeAlso ?url .
} limit 10
```

[=> Run query](https://ts.glytoucan.org/sparql?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0D%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0D%0APREFIX+dcterms%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0APREFIX+foaf%3A+%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E%0D%0APREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0D%0APREFIX+bibo%3A+%3Chttp%3A%2F%2Fpurl.org%2Fontology%2Fbibo%2F%3E+%0D%0APREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A++%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0APREFIX+wurcs%3A%09%3Chttp%3A%2F%2Fwww.glycoinfo.org%2Fglyco%2Fowl%2Fwurcs%23%3E+%0D%0A%0D%0ASELECT+DISTINCT+%3FaccNum+%3Fentry+%3Fentry_label+%3Fexternal_id+%3Furl%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fcore%3E%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fpartner%2Fglycoepitope%3E%0D%0AWHERE%7B%0D%0A++%3Fsaccharide+glytoucan%3Ahas_primary_id+%3FaccNum+.%0D%0A++%3Fsaccharide+glycan%3Ahas_resource_entry+%3Fentry+.%0D%0A++%3Fentry+a+glycan%3AResource_entry+.%0D%0A++%3Fentry+rdfs%3Alabel+%3Fentry_label+.%0D%0A++%3Fentry+dcterms%3Aidentifier+%3Fexternal_id+.%0D%0A++%3Fentry+rdfs%3AseeAlso+%3Furl+.%0D%0A%7D+limit+10&render=HTML&limit=25&offset=0#loadstar-results-section)

### GlycomeDB graph

Named graph: `http://rdf.glytoucan.org/partner/glycome-db`

**Sample RDF Triple**

```
@prefix rdfs:	<http://www.w3.org/2000/01/rdf-schema#> .
@prefix dcterms: <http://purl.org/dc/terms/> .
@prefix glycan:	<http://purl.jp/bio/12/glyco/glycan#> .
@prefix glytoucan:	<http://www.glytoucan.org/glyco/owl/glytoucan#> .

> Species
<http://rdf.glycoinfo.org/glycan/{accession_number}> #Saccharide
	glycan:is_from_source <http://rdf.glycoinfo.org/source/{taxonomy_id}> .

<http://rdf.glycoinfo.org/source/{taxonomy_id}>
	a glycan:Source ;
	dcterms:identifier "{taxonomy_id}" ;
	rdfs:seeAlso <http://identifiers.org/taxonomy/{taxonomy_id}> .


> External ID
<http://rdf.glycoinfo.org/glycan/{accession_number}> #Saccharide
	glycan:has_resource_entry <http://rdf.glycoinfo.org/glycome-db/{glycome-db_id>.

<http://rdf.glycoinfo.org/glycome-db/{glycome-db_id}>
	a glycan:Resource_entry ;
	rdfs:label	"GlycomeDB" ;
	glycan:in_glycan_database glycan:Database_glycomedb ;
	dcterms:identifier  "{glycome-db_id}" ;
	rdfs:seeAlso	<http://www.glycome-db.org/database/showStructure.action?glycomeId={glycome-db id}> .

glycan:Database_glycomedb
	rdfs:label "GlycomeDB".


> JCGGDB entry (External ID) from GlycomeDB
<http://rdf.glycoinfo.org/glycan/{accession_number}> #Saccharide
	glycan:has_resource_entry <http://rdf.glycoinfo.org/jcggdb/{jcggdb_id}>.

<http://rdf.glycoinfo.org/jcggdb/{jcggdb_id}>
	a glycan:Resource_entry ;
	rdfs:label	"JCGGDB" ;
	glycan:in_glycan_database glycan:Database_jcggdb ;
	dcterms:identifier  "jcggdb_id" ;
	rdfs:seeAlso	<http://jcggdb.jp/idb/jcggdb/{jcggdb_id}> .

glycan:Database_jcggdb
	rdfs:label	"JCGGDB" .


> Carbbank(CCSD) entry (External ID) from GlycomeDB
<http://rdf.glycoinfo.org/glycan/{accession_number}> #Saccharide
	glycan:has_resource_entry <http://rdf.glycoinfo.org/carbbank/{carbbank_id}>.

<http://rdf.glycoinfo.org/carbbank/{carbbank_id}>
	a glycan:Resource_entry ;
	rdfs:label	"Carbbank(CCSD)" ;
	glycan:in_glycan_database glycan:Database_carbbank ;
	dcterms:identifier  "carbbank_id" ;
	rdfs:seeAlso	<http://www.genome.jp/dbget-bin/www_bget?carbbank+{carbbank_id}> .

glycan:Database_carbbank
	rdfs:label	"Carbbank(CCSD)" .


> CFG entry (External ID) from GlycomeDB
<http://rdf.glycoinfo.org/glycan/{accession_number}> #Saccharide
	glycan:has_resource_entry <http://rdf.glycoinfo.org/cfg/{cfg_id}>.

<http://rdf.glycoinfo.org/cfg/{cfg_id}>
	a glycan:Resource_entry ;
	rdfs:label	"CFG" ;
	glycan:in_glycan_database glycan:Database_cfg ;
	dcterms:identifier  "cfg_id" ;
	rdfs:seeAlso	<http://www.functionalglycomics.org/glycomics/CarbohydrateServlet?pageType=view&view=view&operationType=view&carbId={cfg_id}&sideMenu=no> .

glycan:Database_cfg
	rdfs:label	"CFG" .


> Glycobase entry (External ID) from GlycomeDB
<http://rdf.glycoinfo.org/glycan/{accession_number}> #Saccharide
	glycan:has_resource_entry <http://rdf.glycoinfo.org/glycobase_lille/{glycobase_lille_id}>.

<http://rdf.glycoinfo.org/glycobase_lille/{glycobase_lille_id}>
	a glycan:Resource_entry ;
	rdfs:label	"Glycobase" ;
	glycan:in_glycan_database glycan:Database_glycobase_lille ;
	dcterms:identifier  "glycobase_lille_id" ;
	rdfs:seeAlso	<http://glycobase.univ-lille1.fr/base/view_mol.php?id={glycobase_lille_id}> .

glycan:Database_glycobase_lille
	rdfs:label	"Glycobase" .


> GLYCOSCIENCES.de entry (External ID) from GlycomeDB
<http://rdf.glycoinfo.org/glycan/{accession_number}> #Saccharide
	glycan:has_resource_entry <http://rdf.glycoinfo.org/glycosciences_de/{glycosciences_de_id}>.

<http://rdf.glycoinfo.org/glycosciences_de/{glycosciences_de_id}>
	a glycan:Resource_entry ;
	rdfs:label	"GLYCOSCIENCES.de" ;
	glycan:in_glycan_database glycan:Database_glycosciences_de ;
	dcterms:identifier  "glycosciences_de_id" ;
	rdfs:seeAlso	<http://www.glycosciences.de/database/start.php?action=explore_linucsid&linucsid=10082&show=1#struct%0A%20%20%09%09>.

glycan:Database_glycosciences_de
	rdfs:label	"GLYCOSCIENCES.de" .


> KEGG entry (External ID) from GlycomeDB
<http://rdf.glycoinfo.org/glycan/{accession_number}> #Saccharide
	glycan:has_resource_entry <http://rdf.glycoinfo.org/kegg/{kegg_id}>.

<http://rdf.glycoinfo.org/kegg/{kegg_id}>
	a glycan:Resource_entry ;
	rdfs:label	"KEGG" ;
	glycan:in_glycan_database glycan:Database_kegg ;
	dcterms:identifier  "kegg_id" ;
	rdfs:seeAlso	<http://www.genome.jp/dbget-bin/www_bget?gl:{kegg_id}> .

glycan:Database_kegg
	rdfs:label	"KEGG" .


> PDB entry (External ID) from GlycomeDB
<http://rdf.glycoinfo.org/glycan/{accession_number}> #Saccharide
	glycan:has_resource_entry <http://rdf.glycoinfo.org/pdb/{pdb_id}>.

<http://rdf.glycoinfo.org/pdb/{pdb_id}>
	a glycan:Resource_entry ;
	rdfs:label	"PDB" ;
	glycan:in_glycan_database glycan:Database_pdb ;
	dcterms:identifier  "pdb_id" ;
	rdfs:seeAlso	<http://www.rcsb.org/pdb/explore/explore.do?structureId={pdb_id}> .

glycan:Database_pdb
	rdfs:label	"PDB" .

```

**SPARQL example**

```
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX bibo: <http://purl.org/ontology/bibo/> 
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX wurcs:	<http://www.glycoinfo.org/glyco/owl/wurcs#> 

SELECT DISTINCT ?accNum ?entry ?entry_label ?external_id ?url
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glytoucan.org/partner/glycome-db>
WHERE{
  ?saccharide glytoucan:has_primary_id ?accNum .
  ?saccharide glycan:has_resource_entry ?entry .
  ?entry a glycan:Resource_entry .
  VALUES ?entry_label {"GlycomeDB"}
  ?entry rdfs:label ?entry_label .
  ?entry dcterms:identifier ?external_id .
  ?entry rdfs:seeAlso ?url .
} limit 10
```

[=> Run query](https://ts.glytoucan.org/sparql?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0D%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0D%0APREFIX+dcterms%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0APREFIX+foaf%3A+%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E%0D%0APREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0D%0APREFIX+bibo%3A+%3Chttp%3A%2F%2Fpurl.org%2Fontology%2Fbibo%2F%3E+%0D%0APREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A++%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0APREFIX+wurcs%3A%09%3Chttp%3A%2F%2Fwww.glycoinfo.org%2Fglyco%2Fowl%2Fwurcs%23%3E+%0D%0A%0D%0ASELECT+DISTINCT+%3FaccNum+%3Fentry+%3Fentry_label+%3Fexternal_id+%3Furl%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fcore%3E%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fpartner%2Fglycome-db%3E%0D%0AWHERE%7B%0D%0A++%3Fsaccharide+glytoucan%3Ahas_primary_id+%3FaccNum+.%0D%0A++%3Fsaccharide+glycan%3Ahas_resource_entry+%3Fentry+.%0D%0A++%3Fentry+a+glycan%3AResource_entry+.%0D%0A++VALUES+%3Fentry_label+%7B%22GlycomeDB%22%7D%0D%0A++%3Fentry+rdfs%3Alabel+%3Fentry_label+.%0D%0A++%3Fentry+dcterms%3Aidentifier+%3Fexternal_id+.%0D%0A++%3Fentry+rdfs%3AseeAlso+%3Furl+.%0D%0A%7D+limit+10&render=HTML&limit=25&offset=0#loadstar-results-section)


### GlycoNAVI graph


#### PubChem

Named graph: `http://rdf.glytoucan.org/partner/glyconavi`

**Sample RDF Triple**

```
@prefix rdfs:	<http://www.w3.org/2000/01/rdf-schema#> .
@prefix dcterms: <http://purl.org/dc/terms/> .
@prefix glycan:	<http://purl.jp/bio/12/glyco/glycan#> .
@prefix glytoucan:	<http://www.glytoucan.org/glyco/owl/glytoucan#> .
@prefix skos: <http://www.w3.org/2004/02/skos/core#> .


<http://rdf.glycoinfo.org/glycan/{accession_number}>
	glycan:has_resource_entry
 			<http://rdf.glycoinfo.org/pubchem/{sid}> ,
			<http://rdf.glycoinfo.org/pubchem/{cid}> .

<http://rdf.glycoinfo.org/pubchem/{sid}>
	a glycan:Resource_entry ;
	rdfs:label "PubChem SID" ;
	glycan:in_glycan_database　glycan:Database_pubchem ;
	rdfs:seeAlso <http://pubchem.ncbi.nlm.nih.gov/substance/{sid}> ;
	skos:exactMatch <http://pubchem.ncbi.nlm.nih.gov/substance/{sid}> ;
	dcterms:identifier "{sid}" .

<http://rdf.glycoinfo.org/pubchem/{cid}>
	a glycan:Resource_entry ;
	rdfs:label "PubChem CID" ;
	glycan:in_glycan_databse	glytoucan:Database_pubchem ;
	rdfs:seeAlso <http://pubchem.ncbi.nlm.nih.gov/compound/{cid}> ;
	skos:closeMatch	<http://pubchem.ncbi.nlm.nih.gov/compound/{cid}> ;
	dcterms:identifier "{cid}" .

glycan:Database_pubchem
	rdfs:label "PubChem".
```

**SPARQL example**

```
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX bibo: <http://purl.org/ontology/bibo/> 
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX wurcs:	<http://www.glycoinfo.org/glyco/owl/wurcs#> 

SELECT DISTINCT ?accNum ?entry ?entry_label ?external_id ?url
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glytoucan.org/partner/glyconavi>
WHERE{
  ?saccharide glytoucan:has_primary_id ?accNum .
  ?saccharide glycan:has_resource_entry ?entry .
  ?entry a glycan:Resource_entry .
  VALUES ?entry_label {"PubChem SID"}
  ?entry rdfs:label ?entry_label .
  ?entry dcterms:identifier ?external_id .
  ?entry rdfs:seeAlso ?url .
} limit 10
```
[=> Run query](https://ts.glytoucan.org/sparql?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0D%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0D%0APREFIX+dcterms%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0APREFIX+foaf%3A+%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E%0D%0APREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0D%0APREFIX+bibo%3A+%3Chttp%3A%2F%2Fpurl.org%2Fontology%2Fbibo%2F%3E+%0D%0APREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A++%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0APREFIX+wurcs%3A%09%3Chttp%3A%2F%2Fwww.glycoinfo.org%2Fglyco%2Fowl%2Fwurcs%23%3E+%0D%0A%0D%0ASELECT+DISTINCT+%3FaccNum+%3Fentry+%3Fentry_label+%3Fexternal_id+%3Furl%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fcore%3E%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fpartner%2Fglyconavi%3E%0D%0AWHERE%7B%0D%0A++%3Fsaccharide+glytoucan%3Ahas_primary_id+%3FaccNum+.%0D%0A++%3Fsaccharide+glycan%3Ahas_resource_entry+%3Fentry+.%0D%0A++%3Fentry+a+glycan%3AResource_entry+.%0D%0A++VALUES+%3Fentry_label+%7B%22PubChem+SID%22%7D%0D%0A++%3Fentry+rdfs%3Alabel+%3Fentry_label+.%0D%0A++%3Fentry+dcterms%3Aidentifier+%3Fexternal_id+.%0D%0A++%3Fentry+rdfs%3AseeAlso+%3Furl+.%0D%0A%7D+limit+10&render=HTML&limit=25&offset=0#loadstar-results-section)

#### PDBj CC

Named graph: `http://rdf.glytoucan.org/partner/glyconavi`

**Sample RDF Triple**

```
@prefix rdfs:	<http://www.w3.org/2000/01/rdf-schema#> .
@prefix dcterms: <http://purl.org/dc/terms/> .
@prefix glycan:	<http://purl.jp/bio/12/glyco/glycan#> .
@prefix glytoucan:	<http://www.glytoucan.org/glyco/owl/glytoucan#> .
@prefix skos: <http://www.w3.org/2004/02/skos/core#> .

<http://rdf.glycoinfo.org/glycan/{accession_number}>
	a glycan:Saccharide ;
	glycan:has_resource_entry <http://rdf.glycoinfo.org/pdbj-cc/{pdb_chem-comp_id}> .

<http://rdf.glycoinfo.org/pdbj-cc/{pdb_chem-comp_id}>
	a glycan:Resource_entry ;
	rdfs:label	"PDBj CC" ;
	dcterms:identifier	"{pdb_chem-comp_id}";
	glycan:in_glycan_database  glycan:Database_pdbj ;
	rdfs:seeAlso	<http://pdbj.org/chemie/summary/{pdb_chem-comp_id}> ;
	skos:exactMatch	<http://rdf.wwpdb.org/cc/{pdb_chem-comp_id}> .

<http://rdf.wwpdb.org/cc/{pdb_chem-comp_id}>
	dcterms:identifier	"{pdb_chem-comp_id}".

glycan:Database_pdbj
	rdfs:label	"PDBj" .
```

**SPARQL example**

```
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX bibo: <http://purl.org/ontology/bibo/> 
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX wurcs:	<http://www.glycoinfo.org/glyco/owl/wurcs#> 

SELECT DISTINCT ?accNum ?entry ?entry_label ?external_id ?url
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glytoucan.org/partner/glyconavi>
WHERE{
  ?saccharide glytoucan:has_primary_id ?accNum .
  ?saccharide glycan:has_resource_entry ?entry .
  ?entry a glycan:Resource_entry .
  VALUES ?entry_label {"PDBj CC"}
  ?entry rdfs:label ?entry_label .
  ?entry dcterms:identifier ?external_id .
  ?entry rdfs:seeAlso ?url .
} limit 10
```

[=> Run query](https://ts.glytoucan.org/sparql?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0D%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0D%0APREFIX+dcterms%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0APREFIX+foaf%3A+%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E%0D%0APREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0D%0APREFIX+bibo%3A+%3Chttp%3A%2F%2Fpurl.org%2Fontology%2Fbibo%2F%3E+%0D%0APREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A++%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0APREFIX+wurcs%3A%09%3Chttp%3A%2F%2Fwww.glycoinfo.org%2Fglyco%2Fowl%2Fwurcs%23%3E+%0D%0A%0D%0ASELECT+DISTINCT+%3FaccNum+%3Fentry+%3Fentry_label+%3Fexternal_id+%3Furl%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fcore%3E%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fpartner%2Fglyconavi%3E%0D%0AWHERE%7B%0D%0A++%3Fsaccharide+glytoucan%3Ahas_primary_id+%3FaccNum+.%0D%0A++%3Fsaccharide+glycan%3Ahas_resource_entry+%3Fentry+.%0D%0A++%3Fentry+a+glycan%3AResource_entry+.%0D%0A++VALUES+%3Fentry_label+%7B%22PDBj+CC%22%7D%0D%0A++%3Fentry+rdfs%3Alabel+%3Fentry_label+.%0D%0A++%3Fentry+dcterms%3Aidentifier+%3Fexternal_id+.%0D%0A++%3Fentry+rdfs%3AseeAlso+%3Furl+.%0D%0A%7D+limit+10&render=HTML&limit=25&offset=0#loadstar-results-section)

#### PDBe CC

Named graph: `http://rdf.glytoucan.org/partner/glyconavi`

**Sample RDF Triple**

```
@prefix rdfs:	<http://www.w3.org/2000/01/rdf-schema#> .
@prefix dcterms: <http://purl.org/dc/terms/> .
@prefix glycan:	<http://purl.jp/bio/12/glyco/glycan#> .
@prefix glytoucan:	<http://www.glytoucan.org/glyco/owl/glytoucan#> .
@prefix skos: <http://www.w3.org/2004/02/skos/core#> .

<http://rdf.glycoinfo.org/glycan/{accession_number}>
	a glycan:Saccharide ;
	glycan:has_resource_entry <http://rdf.glycoinfo.org/pdbe-cc/{pdb_chem-comp_id}> .

<http://rdf.glycoinfo.org/pdbe-cc/{pdb_chem-comp_id}>
	a glycan:Resource_entry ;
	rdfs:label	"PDBe CC" ;
	dcterms:identifier	"{pdb_chem-comp_id}";
	glycan:in_glycan_database  glycan:Database_pdbe ;
	rdfs:seeAlso	<http://www.ebi.ac.uk/pdbe-srv/pdbechem/chemicalCompound/show/{pdb_chem-comp_id}> ;
	skos:exactMatch	<http://rdf.wwpdb.org/cc/{pdb_chem-comp_id}> .

<http://rdf.wwpdb.org/cc/{pdb_chem-comp_id}>
	dcterms:identifier	"{pdb_chem-comp_id}".

glycan:Database_pdbe
	rdfs:label	"PDBe" .
```

**SPARQL example**

```
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX bibo: <http://purl.org/ontology/bibo/> 
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX wurcs:	<http://www.glycoinfo.org/glyco/owl/wurcs#> 

SELECT DISTINCT ?accNum ?entry ?entry_label ?external_id ?url
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glytoucan.org/partner/glyconavi>
WHERE{
  ?saccharide glytoucan:has_primary_id ?accNum .
  ?saccharide glycan:has_resource_entry ?entry .
  ?entry a glycan:Resource_entry .
  VALUES ?entry_label {"PDBe CC"}
  ?entry rdfs:label ?entry_label .
  ?entry dcterms:identifier ?external_id .
  ?entry rdfs:seeAlso ?url .
} limit 10
```

[=> Run query](https://ts.glytoucan.org/sparql?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0D%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0D%0APREFIX+dcterms%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0APREFIX+foaf%3A+%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E%0D%0APREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0D%0APREFIX+bibo%3A+%3Chttp%3A%2F%2Fpurl.org%2Fontology%2Fbibo%2F%3E+%0D%0APREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A++%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0APREFIX+wurcs%3A%09%3Chttp%3A%2F%2Fwww.glycoinfo.org%2Fglyco%2Fowl%2Fwurcs%23%3E+%0D%0A%0D%0ASELECT+DISTINCT+%3FaccNum+%3Fentry+%3Fentry_label+%3Fexternal_id+%3Furl%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fcore%3E%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fpartner%2Fglyconavi%3E%0D%0AWHERE%7B%0D%0A++%3Fsaccharide+glytoucan%3Ahas_primary_id+%3FaccNum+.%0D%0A++%3Fsaccharide+glycan%3Ahas_resource_entry+%3Fentry+.%0D%0A++%3Fentry+a+glycan%3AResource_entry+.%0D%0A++VALUES+%3Fentry_label+%7B%22PDBe+CC%22%7D%0D%0A++%3Fentry+rdfs%3Alabel+%3Fentry_label+.%0D%0A++%3Fentry+dcterms%3Aidentifier+%3Fexternal_id+.%0D%0A++%3Fentry+rdfs%3AseeAlso+%3Furl+.%0D%0A%7D+limit+10&render=HTML&limit=25&offset=0#loadstar-results-section)


#### RCSB PDB CC

Named graph: `http://rdf.glytoucan.org/partner/glyconavi`

**Sample RDF Triple**

```
@prefix rdfs:	<http://www.w3.org/2000/01/rdf-schema#> .
@prefix dcterms: <http://purl.org/dc/terms/> .
@prefix glycan:	<http://purl.jp/bio/12/glyco/glycan#> .
@prefix glytoucan:	<http://www.glytoucan.org/glyco/owl/glytoucan#> .
@prefix skos: <http://www.w3.org/2004/02/skos/core#> .

<http://rdf.glycoinfo.org/glycan/{accession_number}>
	a glycan:Saccharide ;
	glycan:has_resource_entry <http://rdf.glycoinfo.org/rcsb_pdb-cc/{pdb_chem-comp_id}> .

<http://rdf.glycoinfo.org/rcsb_pdb-cc/{pdb_chem-comp_id}>
	a glycan:Resource_entry ;
	rdfs:label	"RCSB PDB CC" ;
	dcterms:identifier	"{pdb_chem-comp_id}";
	glycan:in_glycan_database  glycan:Database_rcsb_pdb ;
	rdfs:seeAlso	<http://ligand-expo.rcsb.org/pyapps/ldHandler.py?formid=cc-index-search&operation=ccid&target={pdb_chem-comp_id}> ;
	skos:exactMatch	<http://rdf.wwpdb.org/cc/{pdb_chem-comp_id}> .

<http://rdf.wwpdb.org/cc/{pdb_chem-comp_id}>
	dcterms:identifier	"{pdb_chem-comp_id}".

glycan:Database_rcsb_pdb
	rdfs:label	"RCSB PDB" .
```

**SPARQL example**

```
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX bibo: <http://purl.org/ontology/bibo/> 
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX wurcs:	<http://www.glycoinfo.org/glyco/owl/wurcs#> 

SELECT DISTINCT ?accNum ?entry ?entry_label ?external_id ?url
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glytoucan.org/partner/glyconavi>
WHERE{
  ?saccharide glytoucan:has_primary_id ?accNum .
  ?saccharide glycan:has_resource_entry ?entry .
  ?entry a glycan:Resource_entry .
  VALUES ?entry_label {"RCSB PDB CC"}
  ?entry rdfs:label ?entry_label .
  ?entry dcterms:identifier ?external_id .
  ?entry rdfs:seeAlso ?url .
} limit 10
```

[=> Run query](https://ts.glytoucan.org/sparql?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0D%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0D%0APREFIX+dcterms%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0APREFIX+foaf%3A+%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E%0D%0APREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0D%0APREFIX+bibo%3A+%3Chttp%3A%2F%2Fpurl.org%2Fontology%2Fbibo%2F%3E+%0D%0APREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A++%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0APREFIX+wurcs%3A%09%3Chttp%3A%2F%2Fwww.glycoinfo.org%2Fglyco%2Fowl%2Fwurcs%23%3E+%0D%0A%0D%0ASELECT+DISTINCT+%3FaccNum+%3Fentry+%3Fentry_label+%3Fexternal_id+%3Furl%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fcore%3E%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fpartner%2Fglyconavi%3E%0D%0AWHERE%7B%0D%0A++%3Fsaccharide+glytoucan%3Ahas_primary_id+%3FaccNum+.%0D%0A++%3Fsaccharide+glycan%3Ahas_resource_entry+%3Fentry+.%0D%0A++%3Fentry+a+glycan%3AResource_entry+.%0D%0A++VALUES+%3Fentry_label+%7B%22RCSB+PDB+CC%22%7D%0D%0A++%3Fentry+rdfs%3Alabel+%3Fentry_label+.%0D%0A++%3Fentry+dcterms%3Aidentifier+%3Fexternal_id+.%0D%0A++%3Fentry+rdfs%3AseeAlso+%3Furl+.%0D%0A%7D+limit+10&render=HTML&limit=25&offset=0#loadstar-results-section)


### JCGGDB AIST graph

Named graph: `http://rdf.glytoucan.org/partner/jcggdb_aist`

**Sample RDF Triple**

```
@prefix rdf:	<http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs:	<http://www.w3.org/2000/01/rdf-schema#> .
@prefix xsd:	<http://www.w3.org/2001/XMLSchema#> .
@prefix dcterms:	<http://purl.org/dc/terms/> .
@prefix glycan:	<http://purl.jp/bio/12/glyco/glycan#> .
@prefix glytoucan:	<http://www.glytoucan.org/glyco/owl/glytoucan#> .

<http://rdf.glycoinfo.org/glycan/G35898DT>
    glycan:has_resource_entry	<http://rdf.glycoinfo.org/glycan/resource-entry/G35898DT/jcggdb_aist/JCGG-STR005139> .

<http://rdf.glycoinfo.org/glycan/resource-entry/G35898DT/jcggdb_aist/JCGG-STR005139>
    rdf:type	glycan:Resource_entry ;
    rdfs:label	"JCGGDB AIST" ;
    rdfs:seeAlso	<http://jcggdb.jp/idb/jcggdb/JCGG-STR005139> ;
    dcterms:identifier	"JCGG-STR005139" ;
    glycan:in_glycan_database	<http://rdf.glytoucan.org/partner/jcggdb_aist> ;
    glytoucan:date_registered	"2017-02-16 21:19:58.919"^^xsd:dateTimeStamp ,
		"2017-02-16 21:19:58.914"^^xsd:dateTimeStamp ;
    glytoucan:contributor	<http://rdf.glycoinfo.org/glytoucan/contributor/userId/ca64a33829cb339aafbea70f2abbced1b212518d411ece053c64790c7269a0ee> .
```

**SPARQL example**

```
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX bibo: <http://purl.org/ontology/bibo/> 
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX wurcs:	<http://www.glycoinfo.org/glyco/owl/wurcs#> 

SELECT DISTINCT ?accNum ?entry ?entry_label ?external_id ?url
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glytoucan.org/partner/jcggdb_aist>
WHERE{
  ?saccharide glytoucan:has_primary_id ?accNum .
  ?saccharide glycan:has_resource_entry ?entry .
  ?entry a glycan:Resource_entry .
  ?entry rdfs:label ?entry_label .
  ?entry dcterms:identifier ?external_id .
  ?entry rdfs:seeAlso ?url .
} limit 10
```

[=> Run query](https://ts.glytoucan.org/sparql?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0D%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0D%0APREFIX+dcterms%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0APREFIX+foaf%3A+%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E%0D%0APREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0D%0APREFIX+bibo%3A+%3Chttp%3A%2F%2Fpurl.org%2Fontology%2Fbibo%2F%3E+%0D%0APREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A++%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0APREFIX+wurcs%3A%09%3Chttp%3A%2F%2Fwww.glycoinfo.org%2Fglyco%2Fowl%2Fwurcs%23%3E+%0D%0A%0D%0ASELECT+DISTINCT+%3FaccNum+%3Fentry+%3Fentry_label+%3Fexternal_id+%3Furl%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fcore%3E%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fpartner%2Fjcggdb_aist%3E%0D%0AWHERE%7B%0D%0A++%3Fsaccharide+glytoucan%3Ahas_primary_id+%3FaccNum+.%0D%0A++%3Fsaccharide+glycan%3Ahas_resource_entry+%3Fentry+.%0D%0A++%3Fentry+a+glycan%3AResource_entry+.%0D%0A++%3Fentry+rdfs%3Alabel+%3Fentry_label+.%0D%0A++%3Fentry+dcterms%3Aidentifier+%3Fexternal_id+.%0D%0A++%3Fentry+rdfs%3AseeAlso+%3Furl+.%0D%0A%7D+limit+10&render=HTML&limit=25&offset=0#loadstar-results-section)


### JMSDB AIST graph

Named graph: `http://rdf.glytoucan.org/partner/jmsdb_jcggdb_aist`

**Sample RDF Triple**

```
@prefix rdf:	<http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs:	<http://www.w3.org/2000/01/rdf-schema#> .
@prefix xsd:	<http://www.w3.org/2001/XMLSchema#> .
@prefix dcterms:	<http://purl.org/dc/terms/> .
@prefix glycan:	<http://purl.jp/bio/12/glyco/glycan#> .
@prefix glytoucan:	<http://www.glytoucan.org/glyco/owl/glytoucan#> .

<http://rdf.glycoinfo.org/glycan/G81807JV>
    glycan:has_resource_entry	<http://rdf.glycoinfo.org/glycan/resource-entry/G81807JV/jmsdb_jcggdb_aist/JMS0331> .

<http://rdf.glycoinfo.org/glycan/resource-entry/G81807JV/jmsdb_jcggdb_aist/JMS0331>
    rdf:type	glycan:Resource_entry ;
    rdfs:label	"JMSDB" ;
    rdfs:seeAlso	<http://jcggdb.jp/search/ChemGlycan.cgi?msid=JMS0331> ;
    dcterms:identifier	"JMS0331" ;
    glycan:in_glycan_database	<http://rdf.glytoucan.org/partner/jmsdb_jcggdb_aist> ;
    glytoucan:date_registered	"2016-12-13 01:32:19.878"^^xsd:dateTimeStamp ,
		"2016-12-13 01:32:19.875"^^xsd:dateTimeStamp ;
    glytoucan:contributor	<http://rdf.glycoinfo.org/glytoucan/contributor/userId/dedee3c346471769aa57c2d018033a314e5173f052819eda3c7872722b9c0f7b> .
```

**SPARQL example**

```
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX bibo: <http://purl.org/ontology/bibo/> 
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX wurcs:	<http://www.glycoinfo.org/glyco/owl/wurcs#> 

SELECT DISTINCT ?accNum ?entry ?entry_label ?external_id ?url
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glytoucan.org/partner/jmsdb_jcggdb_aist>
WHERE{
  ?saccharide glytoucan:has_primary_id ?accNum .
  ?saccharide glycan:has_resource_entry ?entry .
  ?entry a glycan:Resource_entry .
  ?entry rdfs:label ?entry_label .
  ?entry dcterms:identifier ?external_id .
  ?entry rdfs:seeAlso ?url .
} limit 10
```

[=> Run query](https://ts.glytoucan.org/sparql?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0D%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0D%0APREFIX+dcterms%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0APREFIX+foaf%3A+%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E%0D%0APREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0D%0APREFIX+bibo%3A+%3Chttp%3A%2F%2Fpurl.org%2Fontology%2Fbibo%2F%3E+%0D%0APREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A++%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0APREFIX+wurcs%3A%09%3Chttp%3A%2F%2Fwww.glycoinfo.org%2Fglyco%2Fowl%2Fwurcs%23%3E+%0D%0A%0D%0ASELECT+DISTINCT+%3FaccNum+%3Fentry+%3Fentry_label+%3Fexternal_id+%3Furl%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fcore%3E%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fpartner%2Fjmsdb_jcggdb_aist%3E%0D%0AWHERE%7B%0D%0A++%3Fsaccharide+glytoucan%3Ahas_primary_id+%3FaccNum+.%0D%0A++%3Fsaccharide+glycan%3Ahas_resource_entry+%3Fentry+.%0D%0A++%3Fentry+a+glycan%3AResource_entry+.%0D%0A++%3Fentry+rdfs%3Alabel+%3Fentry_label+.%0D%0A++%3Fentry+dcterms%3Aidentifier+%3Fexternal_id+.%0D%0A++%3Fentry+rdfs%3AseeAlso+%3Furl+.%0D%0A%7D+limit+10&render=HTML&limit=25&offset=0#loadstar-results-section)


### UniCarb-DB graph

Named graph: `http://rdf.glytoucan.org/partner/unicarb-db`

**Sample RDF Triple**

```
@prefix rdf:	<http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs:	<http://www.w3.org/2000/01/rdf-schema#> .
@prefix xsd:	<http://www.w3.org/2001/XMLSchema#> .
@prefix dcterms:	<http://purl.org/dc/terms/> .
@prefix glycan:	<http://purl.jp/bio/12/glyco/glycan#> .
@prefix glytoucan:	<http://www.glytoucan.org/glyco/owl/glytoucan#> .

<http://rdf.glycoinfo.org/glycan/G84942UA>
    glycan:has_resource_entry	<http://rdf.glycoinfo.org/glycan/resource-entry/G84942UA/unicarb-db/29002> .

<http://rdf.glycoinfo.org/glycan/resource-entry/G84942UA/unicarb-db/29002>
    rdf:type	glycan:Resource_entry ;
    rdfs:label	"UniCarb-DB" ;
    rdfs:seeAlso	<http://unicarb-db.expasy.org/searchStructures/29002> ;
    dcterms:identifier	"29002" ;
    glycan:in_glycan_database	<http://rdf.glytoucan.org/partner/unicarb-db> ;
    glytoucan:date_registered	"2016-12-18 21:06:10.396"^^xsd:dateTimeStamp ,
		"2016-12-18 20:35:52.751"^^xsd:dateTimeStamp ,
		"2016-12-18 21:06:10.393"^^xsd:dateTimeStamp ;
    glytoucan:contributor	<http://rdf.glycoinfo.org/glytoucan/contributor/userId/7ca54f6ce8a9ba3e0f2a7d99e67e5b9c719e3a5aa21b5581a76f321fc7190748> .
```

**SPARQL example**

```
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX bibo: <http://purl.org/ontology/bibo/> 
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX wurcs:	<http://www.glycoinfo.org/glyco/owl/wurcs#> 

SELECT DISTINCT ?accNum ?entry ?entry_label ?external_id ?url
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glytoucan.org/partner/unicarb-db>
WHERE{
  ?saccharide glytoucan:has_primary_id ?accNum .
  ?saccharide glycan:has_resource_entry ?entry .
  ?entry a glycan:Resource_entry .
  ?entry rdfs:label ?entry_label .
  ?entry dcterms:identifier ?external_id .
  ?entry rdfs:seeAlso ?url .
} limit 10
```

[=> Run query](https://ts.glytoucan.org/sparql?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0D%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0D%0APREFIX+dcterms%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0APREFIX+foaf%3A+%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E%0D%0APREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0D%0APREFIX+bibo%3A+%3Chttp%3A%2F%2Fpurl.org%2Fontology%2Fbibo%2F%3E+%0D%0APREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A++%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0APREFIX+wurcs%3A%09%3Chttp%3A%2F%2Fwww.glycoinfo.org%2Fglyco%2Fowl%2Fwurcs%23%3E+%0D%0A%0D%0ASELECT+DISTINCT+%3FaccNum+%3Fentry+%3Fentry_label+%3Fexternal_id+%3Furl%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fcore%3E%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fpartner%2Funicarb-db%3E%0D%0AWHERE%7B%0D%0A++%3Fsaccharide+glytoucan%3Ahas_primary_id+%3FaccNum+.%0D%0A++%3Fsaccharide+glycan%3Ahas_resource_entry+%3Fentry+.%0D%0A++%3Fentry+a+glycan%3AResource_entry+.%0D%0A++%3Fentry+rdfs%3Alabel+%3Fentry_label+.%0D%0A++%3Fentry+dcterms%3Aidentifier+%3Fexternal_id+.%0D%0A++%3Fentry+rdfs%3AseeAlso+%3Furl+.%0D%0A%7D+limit+10&render=HTML&limit=25&offset=0#loadstar-results-section)


### UniCarbKB graph

Named graph: `http://rdf.glytoucan.org/partner/unicarbkb`

**Sample RDF Triple**

```
@prefix rdf:	<http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs:	<http://www.w3.org/2000/01/rdf-schema#> .
@prefix dcterms:	<http://purl.org/dc/terms/> .
@prefix glycan:	<http://purl.jp/bio/12/glyco/glycan#> .

<http://rdf.glycoinfo.org/glycan/G73971ME>
    glycan:has_resource_entry	<http://rdf.glycoinfo.org/unicarbkb/144> .

<http://rdf.glycoinfo.org/unicarbkb/144>
    rdf:type	glycan:Resource_entry ;
    rdfs:label	"UniCarbKB" ;
    rdfs:seeAlso	<http://www.unicarbkb.org/structure/144> ;
    dcterms:identifier	"144" ;
    glycan:in_glycan_database	glycan:Database_unicarbkb .
```

**SPARQL example**

```
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX bibo: <http://purl.org/ontology/bibo/> 
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX wurcs:	<http://www.glycoinfo.org/glyco/owl/wurcs#> 

SELECT DISTINCT ?accNum ?entry ?entry_label ?external_id ?url
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glytoucan.org/partner/unicarbkb>
WHERE{
  ?saccharide glytoucan:has_primary_id ?accNum .
  ?saccharide glycan:has_resource_entry ?entry .
  ?entry a glycan:Resource_entry .
  ?entry rdfs:label ?entry_label .
  ?entry dcterms:identifier ?external_id .
  ?entry rdfs:seeAlso ?url .
} limit 10
```

[=> Run query](https://ts.glytoucan.org/sparql?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0D%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0D%0APREFIX+dcterms%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0APREFIX+foaf%3A+%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E%0D%0APREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0D%0APREFIX+bibo%3A+%3Chttp%3A%2F%2Fpurl.org%2Fontology%2Fbibo%2F%3E+%0D%0APREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A++%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0APREFIX+wurcs%3A%09%3Chttp%3A%2F%2Fwww.glycoinfo.org%2Fglyco%2Fowl%2Fwurcs%23%3E+%0D%0A%0D%0ASELECT+DISTINCT+%3FaccNum+%3Fentry+%3Fentry_label+%3Fexternal_id+%3Furl%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fcore%3E%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fpartner%2Funicarbkb%3E%0D%0AWHERE%7B%0D%0A++%3Fsaccharide+glytoucan%3Ahas_primary_id+%3FaccNum+.%0D%0A++%3Fsaccharide+glycan%3Ahas_resource_entry+%3Fentry+.%0D%0A++%3Fentry+a+glycan%3AResource_entry+.%0D%0A++%3Fentry+rdfs%3Alabel+%3Fentry_label+.%0D%0A++%3Fentry+dcterms%3Aidentifier+%3Fexternal_id+.%0D%0A++%3Fentry+rdfs%3AseeAlso+%3Furl+.%0D%0A%7D+limit+10&render=HTML&limit=25&offset=0#loadstar-results-section)



### SugarBindDB graph

Named graph: `http://rdf.glytoucan.org/partner/swiss_institute_of_bioinformatics`

**Sample RDF Triple**
```
@prefix rdf:	<http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs:	<http://www.w3.org/2000/01/rdf-schema#> .
@prefix xsd:	<http://www.w3.org/2001/XMLSchema#> .
@prefix dcterms:	<http://purl.org/dc/terms/> .
@prefix glycan:	<http://purl.jp/bio/12/glyco/glycan#> .
@prefix glytoucan:	<http://www.glytoucan.org/glyco/owl/glytoucan#> .

<http://rdf.glycoinfo.org/glycan/G90562PB>
  glycan:has_resource_entry	<http://rdf.glycoinfo.org/glycan/resource-entry/swiss_institute_of_bioinformatics/4> .

<http://rdf.glycoinfo.org/glycan/resource-entry/swiss_institute_of_bioinformatics/4>
    rdf:type	glycan:Resource_entry ;
    rdfs:label	"SugarBindDB" ;
    rdfs:seeAlso	<http://sugarbind.expasy.org/structures/4> ;
    dcterms:identifier	"4" ;
    glycan:in_glycan_database	<http://rdf.glytoucan.org/partner/swiss_institute_of_bioinformatics> ;
    glytoucan:date_registered	"2016-11-22 15:30:02.383"^^xsd:dateTimeStamp ,
		"2016-11-22 15:30:02.373"^^xsd:dateTimeStamp ;
    glytoucan:contributor	<http://rdf.glycoinfo.org/glytoucan/contributor/userId/170a483144766d5a90684144d455ba485c4c76a95c6fe51b5a570f5b6a9d2b27> .
```

**SPARQL example**
```
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX bibo: <http://purl.org/ontology/bibo/> 
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX wurcs:	<http://www.glycoinfo.org/glyco/owl/wurcs#> 

SELECT DISTINCT ?accNum ?entry ?entry_label ?external_id ?url
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glytoucan.org/partner/swiss_institute_of_bioinformatics>
WHERE{
  ?saccharide glytoucan:has_primary_id ?accNum .
  ?saccharide glycan:has_resource_entry ?entry .
  ?entry a glycan:Resource_entry .
  ?entry rdfs:label ?entry_label .
  ?entry dcterms:identifier ?external_id .
  ?entry rdfs:seeAlso ?url .
} limit 10
```

[=> Run query](https://ts.glytoucan.org/sparql?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0D%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0D%0APREFIX+dcterms%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0APREFIX+foaf%3A+%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E%0D%0APREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0D%0APREFIX+bibo%3A+%3Chttp%3A%2F%2Fpurl.org%2Fontology%2Fbibo%2F%3E+%0D%0APREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A++%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0APREFIX+wurcs%3A%09%3Chttp%3A%2F%2Fwww.glycoinfo.org%2Fglyco%2Fowl%2Fwurcs%23%3E+%0D%0A%0D%0ASELECT+DISTINCT+%3FaccNum+%3Fentry+%3Fentry_label+%3Fexternal_id+%3Furl%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fcore%3E%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fpartner%2Fswiss_institute_of_bioinformatics%3E%0D%0AWHERE%7B%0D%0A++%3Fsaccharide+glytoucan%3Ahas_primary_id+%3FaccNum+.%0D%0A++%3Fsaccharide+glycan%3Ahas_resource_entry+%3Fentry+.%0D%0A++%3Fentry+a+glycan%3AResource_entry+.%0D%0A++%3Fentry+rdfs%3Alabel+%3Fentry_label+.%0D%0A++%3Fentry+dcterms%3Aidentifier+%3Fexternal_id+.%0D%0A++%3Fentry+rdfs%3AseeAlso+%3Furl+.%0D%0A%7D+limit+10&render=HTML&limit=25&offset=0#loadstar-results-section)



### GlycoStore graph 

Named graph: `http://rdf.glytoucan.org/partner/glycostore`

**Sample RDF Triple**
```
@prefix rdf:	<http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix glycan:	<http://purl.jp/bio/12/glyco/glycan#> .
@prefix rdfs:	<http://www.w3.org/2000/01/rdf-schema#> .
@prefix dcterms:	<http://purl.org/dc/terms/> .

<http://rdf.glycoinfo.org/glycan/G33284MM>
	glycan:has_resource_entry	<http://rdf.glycoinfo.org/glycan/resource-entry/G33284MM/glycostore/816> .

<http://rdf.glycoinfo.org/glycan/resource-entry/G33284MM/glycostore/816>
	rdf:type	glycan:Resource_entry ;
	rdfs:label	"GlycoStore" ;
	rdfs:seeAlso	<https://glycostore.org/glycan/816> ;
	dcterms:identifier	"816" .
```

**SPARQL example**
```
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX bibo: <http://purl.org/ontology/bibo/> 
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX wurcs:	<http://www.glycoinfo.org/glyco/owl/wurcs#> 

SELECT DISTINCT ?accNum ?entry ?entry_label ?external_id ?url
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glytoucan.org/partner/glycostore>
WHERE{
  ?saccharide glytoucan:has_primary_id ?accNum .
  ?saccharide glycan:has_resource_entry ?entry .
  ?entry a glycan:Resource_entry .
  ?entry rdfs:label ?entry_label .
  ?entry dcterms:identifier ?external_id .
  ?entry rdfs:seeAlso ?url .
} limit 10
```

[=> Run query](https://ts.glytoucan.org/sparql?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0D%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0D%0APREFIX+dcterms%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0APREFIX+foaf%3A+%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E%0D%0APREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0D%0APREFIX+bibo%3A+%3Chttp%3A%2F%2Fpurl.org%2Fontology%2Fbibo%2F%3E+%0D%0APREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A++%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0APREFIX+wurcs%3A%09%3Chttp%3A%2F%2Fwww.glycoinfo.org%2Fglyco%2Fowl%2Fwurcs%23%3E+%0D%0A%0D%0ASELECT+DISTINCT+%3FaccNum+%3Fentry+%3Fentry_label+%3Fexternal_id+%3Furl%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fcore%3E%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fpartner%2Fglycostore%3E%0D%0AWHERE%7B%0D%0A++%3Fsaccharide+glytoucan%3Ahas_primary_id+%3FaccNum+.%0D%0A++%3Fsaccharide+glycan%3Ahas_resource_entry+%3Fentry+.%0D%0A++%3Fentry+a+glycan%3AResource_entry+.%0D%0A++%3Fentry+rdfs%3Alabel+%3Fentry_label+.%0D%0A++%3Fentry+dcterms%3Aidentifier+%3Fexternal_id+.%0D%0A++%3Fentry+rdfs%3AseeAlso+%3Furl+.%0D%0A%7D+limit+10&render=HTML&limit=25&offset=0#loadstar-results-section)



### Glyconnect graph 

Named graph: `http://rdf.glytoucan.org/partner/glyconnect`

**Sample RDF Triple**
```
@prefix rdf:	<http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix glycan:	<http://purl.jp/bio/12/glyco/glycan#> .
@prefix rdfs:	<http://www.w3.org/2000/01/rdf-schema#> .
@prefix dcterms:	<http://purl.org/dc/terms/> .

<http://rdf.glycoinfo.org/glycan/G42436GS> 
	glycan:has_resource_entry	<http://rdf.glycoinfo.org/glycan/resource-entry/G42436GS/glyconnect/2961> .

<http://rdf.glycoinfo.org/glycan/resource-entry/G42436GS/glyconnect/2961>
	rdf:type	glycan:Resource_entry ;
	rdfs:label	"GlyConnect" ;
	rdfs:seeAlso	<https://glyconnect.expasy.org/browser/structures/2961> ;
	dcterms:identifier	"2961" .
```

**SPARQL example**
```
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX bibo: <http://purl.org/ontology/bibo/> 
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX wurcs:	<http://www.glycoinfo.org/glyco/owl/wurcs#> 

SELECT DISTINCT ?accNum ?entry ?entry_label ?external_id ?url
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glytoucan.org/partner/glyconnect>
WHERE{
  ?saccharide glytoucan:has_primary_id ?accNum .
  ?saccharide glycan:has_resource_entry ?entry .
  ?entry a glycan:Resource_entry .
  ?entry rdfs:label ?entry_label .
  ?entry dcterms:identifier ?external_id .
  ?entry rdfs:seeAlso ?url .
} limit 10
```

[=> Run query](https://ts.glytoucan.org/sparql?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0D%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0D%0APREFIX+dcterms%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0APREFIX+foaf%3A+%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E%0D%0APREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0D%0APREFIX+bibo%3A+%3Chttp%3A%2F%2Fpurl.org%2Fontology%2Fbibo%2F%3E+%0D%0APREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A++%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0APREFIX+wurcs%3A%09%3Chttp%3A%2F%2Fwww.glycoinfo.org%2Fglyco%2Fowl%2Fwurcs%23%3E+%0D%0A%0D%0ASELECT+DISTINCT+%3FaccNum+%3Fentry+%3Fentry_label+%3Fexternal_id+%3Furl%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fcore%3E%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fpartner%2Fglyconnect%3E%0D%0AWHERE%7B%0D%0A++%3Fsaccharide+glytoucan%3Ahas_primary_id+%3FaccNum+.%0D%0A++%3Fsaccharide+glycan%3Ahas_resource_entry+%3Fentry+.%0D%0A++%3Fentry+a+glycan%3AResource_entry+.%0D%0A++%3Fentry+rdfs%3Alabel+%3Fentry_label+.%0D%0A++%3Fentry+dcterms%3Aidentifier+%3Fexternal_id+.%0D%0A++%3Fentry+rdfs%3AseeAlso+%3Furl+.%0D%0A%7D+limit+10&render=HTML&limit=25&offset=0#loadstar-results-section)



### GlyConnect (composition) graph 
Named graph: `http://rdf.glytoucan.org/partner/glyconnect-comp`

**Sample RDF Triple**
```
@prefix glycan:	<http://purl.jp/bio/12/glyco/glycan#> .
@prefix rdf:	<http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs:	<http://www.w3.org/2000/01/rdf-schema#> .
@prefix dcterms:	<http://purl.org/dc/terms/> .

<http://rdf.glycoinfo.org/glycan/G76613WN>
	glycan:has_resource_entry	<http://rdf.glycoinfo.org/resource-entry/G76613WN/glyconnect-comp/698> .

<http://rdf.glycoinfo.org/resource-entry/G76613WN/glyconnect-comp/698>
	rdf:type	glycan:Resource_entry ;
	rdfs:label	"GlyConnect" ;
	rdfs:seeAlso	<https://glyconnect.expasy.org/browser/compositions/698> ;
	dcterms:identifier	"698" .
```

**SPARQL example**
```
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX bibo: <http://purl.org/ontology/bibo/> 
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX wurcs:	<http://www.glycoinfo.org/glyco/owl/wurcs#> 

SELECT DISTINCT ?accNum ?entry ?entry_label ?external_id ?url
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glytoucan.org/partner/glyconnect-comp>
WHERE{
  ?saccharide glytoucan:has_primary_id ?accNum .
  ?saccharide glycan:has_resource_entry ?entry .
  ?entry a glycan:Resource_entry .
  ?entry rdfs:label ?entry_label .
  ?entry dcterms:identifier ?external_id .
  ?entry rdfs:seeAlso ?url .
} limit 10
```

[=> Run query](https://ts.glytoucan.org/sparql?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0D%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0D%0APREFIX+dcterms%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0APREFIX+foaf%3A+%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E%0D%0APREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0D%0APREFIX+bibo%3A+%3Chttp%3A%2F%2Fpurl.org%2Fontology%2Fbibo%2F%3E+%0D%0APREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A++%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0APREFIX+wurcs%3A%09%3Chttp%3A%2F%2Fwww.glycoinfo.org%2Fglyco%2Fowl%2Fwurcs%23%3E+%0D%0A%0D%0ASELECT+DISTINCT+%3FaccNum+%3Fentry+%3Fentry_label+%3Fexternal_id+%3Furl%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fcore%3E%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fpartner%2Fglyconnect-comp%3E%0D%0AWHERE%7B%0D%0A++%3Fsaccharide+glytoucan%3Ahas_primary_id+%3FaccNum+.%0D%0A++%3Fsaccharide+glycan%3Ahas_resource_entry+%3Fentry+.%0D%0A++%3Fentry+a+glycan%3AResource_entry+.%0D%0A++%3Fentry+rdfs%3Alabel+%3Fentry_label+.%0D%0A++%3Fentry+dcterms%3Aidentifier+%3Fexternal_id+.%0D%0A++%3Fentry+rdfs%3AseeAlso+%3Furl+.%0D%0A%7D+limit+10&render=HTML&limit=25&offset=0#loadstar-results-section)



### MatrixDB graph 

Named graph: `http://rdf.glytoucan.org/partner/matrixdb`

**Sample RDF Triple**
```
@prefix rdf:	<http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix glycan:	<http://purl.jp/bio/12/glyco/glycan#> .
@prefix rdfs:	<http://www.w3.org/2000/01/rdf-schema#> .
@prefix dcterms:	<http://purl.org/dc/terms/> .

<http://rdf.glycoinfo.org/glycan/G39123FZ>
	glycan:has_resource_entry	<http://rdf.glycoinfo.org/glycan/resource-entry/G39123FZ/matrixdb/GAG_42> .

<http://rdf.glycoinfo.org/glycan/resource-entry/G39123FZ/matrixdb/GAG_42>
	rdf:type	glycan:Resource_entry ;
	rdfs:label	"MatrixDB" ;
	rdfs:seeAlso	<http://matrixdb.univ-lyon1.fr/cgi-bin/current/newPort?type=biomolecule&value=GAG_42> ;
	dcterms:identifier	"GAG_42" .
```

**SPARQL example**
```
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX bibo: <http://purl.org/ontology/bibo/> 
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX wurcs:	<http://www.glycoinfo.org/glyco/owl/wurcs#> 

SELECT DISTINCT ?accNum ?entry ?entry_label ?external_id ?url
FROM <http://rdf.glytoucan.org/core>
FROM <http://rdf.glytoucan.org/partner/matrixdb>
WHERE{
  ?saccharide glytoucan:has_primary_id ?accNum .
  ?saccharide glycan:has_resource_entry ?entry .
  ?entry a glycan:Resource_entry .
  ?entry rdfs:label ?entry_label .
  ?entry dcterms:identifier ?external_id .
  ?entry rdfs:seeAlso ?url .
} limit 10
```

[=> Run query](https://ts.glytoucan.org/sparql?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0D%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0D%0APREFIX+dcterms%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0APREFIX+foaf%3A+%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E%0D%0APREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0D%0APREFIX+bibo%3A+%3Chttp%3A%2F%2Fpurl.org%2Fontology%2Fbibo%2F%3E+%0D%0APREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0APREFIX+glytoucan%3A++%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0APREFIX+wurcs%3A%09%3Chttp%3A%2F%2Fwww.glycoinfo.org%2Fglyco%2Fowl%2Fwurcs%23%3E+%0D%0A%0D%0ASELECT+DISTINCT+%3FaccNum+%3Fentry+%3Fentry_label+%3Fexternal_id+%3Furl%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fcore%3E%0D%0AFROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fpartner%2Fmatrixdb%3E%0D%0AWHERE%7B%0D%0A++%3Fsaccharide+glytoucan%3Ahas_primary_id+%3FaccNum+.%0D%0A++%3Fsaccharide+glycan%3Ahas_resource_entry+%3Fentry+.%0D%0A++%3Fentry+a+glycan%3AResource_entry+.%0D%0A++%3Fentry+rdfs%3Alabel+%3Fentry_label+.%0D%0A++%3Fentry+dcterms%3Aidentifier+%3Fexternal_id+.%0D%0A++%3Fentry+rdfs%3AseeAlso+%3Furl+.%0D%0A%7D+limit+10&render=HTML&limit=25&offset=0#loadstar-results-section)
