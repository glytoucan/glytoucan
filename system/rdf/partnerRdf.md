---
title: Partner RDF
authors:
- Daisuke Shinmachi
date: 2016-04-20
layout: pading
---

# GlyTouCan Partner RDF

## SPARQL query

Construct query  
[SPARQL query](/system/sparql/partnerRdfConstructQuery)

Insert query  
[SPARQL query](/system/sparql/partnerRdfInsertQuery)



##  Named GRAPH 

from BCSDB  
`<http://rdf.glytoucan.org/partner/bcsdb>`  

from GlycomeDB  
`<http://rdf.glytoucan.org/partner/glycome-db>`  

from GlycoEpitope  
`<http://rdf.glytoucan.org/partner/glycoepitope>`  

from GlycoNAVI  
`<http://rdf.glytoucan.org/partner/glyconavi>`  



## from BCSDB  

`<http://rdf.glytoucan.org/partner/bcsdb>`  

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
 glycan:in_glycan_database glycan:Database_bcsdb ;
 dcterms:identifier  "BCSDB ID" ;
 rdfs:seeAlso	<http://csdb.glycoscience.ru/bacterial/core/search_id.php?mode=record&id_list={bcsdb_id}> .
```


### IRI

**Species**  

glycan:SourceのインスタンスIRI

```
http://rdf.glycoinfo.org/source/{taxonomy_id}
http://rdf.glycoinfo.org/source/85962

http://rdf.glycoinfo.org/source/{encode_taxon_name}
http://rdf.glycoinfo.org/source/Helicobacter%20pylori%20O3
```

TaxonomyのURL

```
http://identifiers.org/taxonomy/{taxonomy_id}
http://identifiers.org/taxonomy/1010795
```


**Literature**  

bibo:ArticleのインスタンスIRI

```
http://rdf.glycoinfo.org/references/{pubmed_id}
http://rdf.glycoinfo.org/references/10200296
```

PubMedのURL

```
http://identifiers.org/pubmed/{pubmed_id}
http://identifiers.org/pubmed/10200296
```


**External ID**  

glycan:Resource_entryのインスタンスIRI

```
http://rdf.glycoinfo.org/bcsdb/{bcsdb id}
http://rdf.glycoinfo.org/bcsdb/6922
```

BCSDBのエントリーページURL

```
http://csdb.glycoscience.ru/bacterial/core/search_id.php?mode=record&id_list={bcsdb_id}
http://csdb.glycoscience.ru/bacterial/core/search_id.php?mode=record&id_list=6922 
```


## from GlycomeDB  

`<http://rdf.glytoucan.org/partner/glycome-db>`  

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
 glycan:in_glycan_database glycan:Database_glycomedb ;
 dcterms:identifier  "GlycomeDB ID" ;
 rdfs:seeAlso	<http://www.glycome-db.org/database/showStructure.action?glycomeId={glycome-db id}> .
```


### IRI

**Species**  

glycan:SourceのインスタンスIRI

```
http://rdf.glycoinfo.org/source/{taxonomy_id}
http://rdf.glycoinfo.org/source/85962
```

TaxonomyのURL

```
http://identifiers.org/taxonomy/{taxonomy_id}
http://identifiers.org/taxonomy/85962
```


**External ID**  

glycan:Resource_entryのインスタンスIRI

```
http://rdf.glycoinfo.org/glycome-db/{glycome-db id}
http://rdf.glycoinfo.org/glycome-db/6922
```

エントリーページURL

```
http://www.glycome-db.org/database/showStructure.action?glycomeId={glycome-db id}
http://www.glycome-db.org/database/showStructure.action?glycomeId=48
```


## from GlycoEpitope  
`<http://rdf.glytoucan.org/partner/glycoepitope>`  

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
 glycan:in_glycan_database glycan:Database_glycoepitope ;
 dcterms:identifier	"Epitope id" ;
 rdfs:seeAlso	<http://identifiers.org/glycoepitope/{epitope id}> .
```


### IRI

**Species**  

glycan:SourceのインスタンスIRI

```
http://rdf.glycoinfo.org/source/{taxonomy_id}
http://rdf.glycoinfo.org/source/9606
```

TaxonomyのURL

```
http://identifiers.org/taxonomy/{taxonomy_id}
http://identifiers.org/taxonomy/9606
```


**Literature**  

bibo:ArticleのインスタンスIRI

```
http://rdf.glycoinfo.org/references/{pubmed_id}
http://rdf.glycoinfo.org/references/10728707
```

PubMedのURL

```
http://identifiers.org/pubmed/{pubmed_id}
http://identifiers.org/pubmed/10728707
```


**External ID**  

glycan:Resource_entryのインスタンスIRI

```
http://rdf.glycoinfo.org/glycoepitope/{epitope id}
http://rdf.glycoinfo.org/glycoepitope/EP0011
```

エントリーページURL

```
http://identifiers.org/glycoepitope/{epitope id}
http://identifiers.org/glycoepitope/EP0011
```


## from GlycoNAVI  

`<http://rdf.glytoucan.org/partner/glyconavi>`  

**Dataset**

```
<http://rdf.glycoinfo.org/glycan/G35898DT>
 glycan:has_resource_entry <http://rdf.glycoinfo.org/pubchem/SID252275760> .

<http://rdf.glycoinfo.org/pubchem/SID252275760>
 a glycan:Resource_entry ;
 glycan:in_glycan_database　glycan:Database_pubchem ;
 rdfs:seeAlso <http://pubchem.ncbi.nlm.nih.gov/substance/SID252275760> ;
 dcterms:identifier "252275760" .

 <http://rdf.glycoinfo.org/glycan/G35898DT>
 a glycan:Saccharide ;
 glycan:has_resource_entry <http://rdf.glycoinfo.org/pubchem/CID91844939> .

<http://rdf.glycoinfo.org/pubchem/CID91844939>
 a glycan:Resource_entry ;
 glycan:in_glycan_databse	glytoucan:Database_pubchem ;
 rdfs:seeAlso <http://pubchem.ncbi.nlm.nih.gov/compound/CID91844939> ;
dcterms:identifier "91844939" .
```


### IRI

**External ID**  

glycan:Resource_entryのインスタンスIRI

```
http://rdf.glycoinfo.org/pubchem/{SID number}
http://rdf.glycoinfo.org/pubchem/SID252275760

http://rdf.glycoinfo.org/pubchem/{CID number}
http://rdf.glycoinfo.org/pubchem/CID91844939

```

エントリーページURL

```
http://pubchem.ncbi.nlm.nih.gov/substance/{SID number}
http://pubchem.ncbi.nlm.nih.gov/substance/SID252275760

http://pubchem.ncbi.nlm.nih.gov/compound/{CID number}
http://pubchem.ncbi.nlm.nih.gov/compound/CID91844939

```

