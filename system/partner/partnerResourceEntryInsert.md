---
title: Resource entry insert for partner
authors:
- Daisuke Shinmachi
date: 2017-11-30
layout: default
---


## Resource entry insert for partner

**Input data**

* Resource entry label (type of entry page)
    * e.g. "BCSDB", "PubChem SID", "PDBj cc"
* Entry ID (external id)
* Database name
* Entry page URL
* Exact match IRI (samtimes it does not exist)
* Partner name (use in insert query)

```
<http://rdf.glycoinfo.org/{resource_entry_label}/{entry_id}>
    a glycan:Resource_entry ;
    rdfs:label  "{resource_entry_label}" ;
    dcterms:identifier  "{entry_id}";
    glytoucan:in_glycan_database <http://rdf.glycoinfo.org/database/{database_name}> ;
    rdfs:seeAlso    <{entry_page_URL}> ;
    glytoucan:contributor <http://rdf.glycoinfo.org/glytoucan/contributor/userId/{hash}>;
    glytoucan:date_registered "date time"^^xsd:dateTimeStamp.
```



**Output insert query**


```
log_enable(2,1);
sparql
PREFIX rdfs:    <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIC glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
INSERT DATA{
        GRAPH <http://rdf.glytoucan.org/partner/{partner_name}> {
            <http://rdf.glycoinfo.org/{resource_entry_label}/{entry_id}>
                a glycan:Resource_entry ;
                rdfs:label  "{resource_entry_label}" ;
                dcterms:identifier  "{entry_id}";
                glycan:in_glycan_database <http://rdf.glycoinfo.org/database/{database_name}> ;
                rdfs:seeAlso    <{entry_page_URL}> ;
                glytoucan:contributor <http://rdf.glycoinfo.org/glytoucan/contributor/userId/{hash}>;
                glytoucan:date_registered "date time"^^xsd:dateTimeStamp.
        }
};
checkpoint;
commit WORK;
```


**Clear graph**

```
log_enable(2,1);
sparql clear graph <http://rdf.glytoucan.org/partner/{partner_name}>;
```
