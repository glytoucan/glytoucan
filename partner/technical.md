---
title: Technical Details of the Partner Program
layout: default
---
* auto-gen TOC:
{:toc}

# Overview

This document will cover the internal architecture of the role relationship system used by GlyTouCan.  This was initiated with the phase two of the project, as it was found necessary to be more collaborative in nature, instead of a systematic registration system.  The new collaborative functionality required more granularity on the types of users and their roles, as well as security measures to confirm the system could not be compromised.

## The system as-is

A very simple system in which users were split between two roles.  Registered users with confirmed email addresses had access to the glycan registration functionality, whereas non-registered anonymous users did not.  The google oauth service was used primarily to determine if the user was registered.  This was also how the user's email was obtained.  The schema.org ontology was the primary data schema, as it had well defined classes that matched the data types involved.

All registered users with confirmed emails (according to google) were considered members of the GlyTouCan Organization.

More details are available in the [registration](/system/registration) explanatory page.

## The system to-be

With the [GlyTouCan partner](/partner) program, multiple Organizations are introduced, thus adding some complexity to the 'memberOf' relationship.

### Functionality review

A quick listing of functionality, in order of authorization.

1. Anonymous users:
	2. Searching structures
	3. Viewing structures
	4. Register User
1. Registered users:
	2. Registering of glycosequences
	4. [CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete) Management of a pubmed or doi ID
		5. Update/Deletion only available for their own registered data
	5. CRUD management of a Taxonomy ID
	6. Update Username
1. Partner users:
	2. CRUD Management of the public database's glycan identifiers
	4. CRUD Management of glycan aliases
	4. CRUD Management of Motifs from already registered structures
		5. Update/Deletion only available for their own organization

Please note all of the above functionality is provided by the [GlyTouCan web services](/system/api_list).

### Organization Management

The GlyTouCan Admin team will be responsible for creating new Partner Organizations and memberships.
The request form for this will be available soon, please [contact us](https://docs.google.com/forms/d/1O8xm39fLK6u1NQEn6ftRO-_2GBLUrE10TmJFBJW0hNc/viewform) if you have any questions.

The Ontology used is schema.org and GlycoRDF.  The following is an example RDF of a new Organization:

```
PREFIX schema: <http://schema.org/>
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
INSERT DATA {
    <URI:schema:Organization#new> schema:legalName "New Organization Name" .
    <URI:schema:Organization#new> schema:email "email@new.org"^^xsd:string .
    <URI:schema:Organization#new> schema:owns <glycan:glycan_database#new> .
}
```

The Legal Name is required and will be used when displaying the "From" section of any contributed data.
The email address is an optional field which will be stored in case any communication is necessary.
The Organization should own one or many Glycan Databases.  This is managed by [GLIC](http://glic.glycoinfo.org) and stored in the [GlycoRDF](http://github.com/glycoinfo/GlycoRDF) ontology.

It should be noted that in GlycoRDF, a URL template exists for the Glycan Database.  This template will be used to link back to the Database for any linked glycans.  Thus the proper maintenance of URL templates (GlycoRDF) will be the reponsibility of the GLIC members.

The partner registration process also expects a list of email addresses of the users that have already registered with GlyTouCan.  This list will be added as members of the Organization.

```
PREFIX schema: <http://schema.org/>
INSERT DATA {
    <URI:schema:Organization#new> member <URI:schema:Person#newMember0> .
    <URI:schema:Organization#new> member <URI:schema:Person#newMember1> .
    <URI:schema:Organization#new> member <URI:schema:Person#newMember2> .
}
```

Finally, the new Organization will be partnered with GlyTouCan

```
PREFIX schema: <http://schema.org/>
INSERT DATA {
    <URI:schema:Organization#new> member <URI:schema:Organization#glytoucan> .
}
```

Thus for the majority of services, the following query will be executed to check for the partnership:

```
PREFIX schema: <http://schema.org/>
SELECT *
WHERE {
 ?Organization schema:member <URI:schema:Person#newMember0> .
 ?Organization schema:member <URI:schema:Organization#glytoucan> .
}
```

As the user will be logged in the Person information will be available.  This simple check will determine if the person is a member of an organization that has partnered with GlyTouCan.

From here, the ownership of Databases can be confirmed, and the user will have access to functionality such as registering partner glycosequence IDs.

### Registering GlycoSequence IDs

Once the user has been confirmed to be a member of the partnership program, specialized functionality such as name/motif creation and ID linking will be available.

Perhaps the most complex functionality is the ID linking feature, so the technical aspects of this will be explained in detail.

The Partner ID linking functionality is available in many different methods, from the initial GlycoSequence Registration to the Glycan Entry Edit screen, as well as the API.

In order to authenticate the user to have access to this functionality, the user's Organization was checked.  Thus the Organization and related information is available if the user registered a GlycoSequence ID.  

```
PREFIX schema: <http://schema.org/>
SELECT *
WHERE
{
    <URI:schema:Organization#new> schema:legalName "New Organization Name" .
    <URI:schema:Organization#new> schema:owns ?database .
    ?database glycan:has_url_template "http://foo.bar.com/someglycan?id=%s"^^xsd:String .
}
```
Once the registration is submitted, it is passed to the Resource Entry web service, which ultimately will have the data be stored in the following fashion:

```
PREFIX dc: <http://purl.org/dc/elements/1.1/> 
PREFIX dcterms: <http://purl.org/dc/terms/> 
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 
INSERT DATA {
  <http://rdf.glycoinfo.org/resource-entry/331ebfcfc29a997790a7a4f1671a9882> a    glycan:resource_entry ;
    glycan:in_glycan_database ?database ;
    dcterms:identifier "00001" ;
    dc:contributor    <http://rdf.glycoinfo.org/glytoucan/contributor/1> ;
    dcterms:dataSubmitted  "2014-10-20 06:47:31.204"^^xsd:dateTimeStamp .
}
```
The `?database` field is the one chosen by the user, and retrieved from the above query, and the `00001` is input by the user.

In order to generate the link, the above fields are combined:

```
PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#> 
PREFIX schema: <http://schema.org/>
SELECT *
WHERE
{
	<URI:Saccharide:entry> glycan:hasResourceEntry ?resource .
	?resource glycan:in_glycan_database ?database .
	?resource dcterms:identifier "00001" .
	?organization schema:member <URI:schema:Person#newMember0> .
	?organization schema:owns ?database .
	?database glycan:has_url_template "http://foo.bar.com/someglycan?id=%s"^^xsd:String .
}
```

The identifier can then be embedded into the URL template:
`http://foo.bar.com/someglycan?id=00001`

Utilizing the same authentication checks, the other partner-specific features will be available.  A full listing is best viewed from the [API List](/system/api_list).