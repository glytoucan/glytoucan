---
title: GlyTouCan Registration Process
layout: default
---

# Overview

GlyTouCan fundamentally uses the [Google Identity Platform](https://developers.google.com/identity/) in order to authenticate users and the information submitted into the repository.

This document will describe the technical details behind what kind of information is retrieved from the authentication service and how it is stored.

## Flow

The following is a control and sequential-flow model of the registration process.

```sequence
User->GlyTouCan: User clicks on sign-in button
GlyTouCan->Google: GlyTouCan forwards the request to Google
Google->User: Google sends a request to authenticate
User->Google: User accepts/denies request
Google->GlyTouCan: Result is forwarded back
GlyTouCan-->Google: GlyTouCan requests user data
Google-->GlyTouCan: User data sent back
GlyTouCan->User: User is given access based upon results
```

In order to have a public view of the users, a Contributor class is created:
```
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
INSERT DATA {
	<URI:foaf:Person> a foaf:Person .
	<URI:foaf:Person> dcterms:identifier "contributor number"^^xsd:int .
	<URI:foaf:Person> foaf:name "contributor name"^^xsd:string .
}
```

This class is stored in the publicly available [GlyTouCan endpoint](http://ts.glytoucan.org).
The contributor number is a sequential number used for each registering user.
This number is also used to associate the with the user data received from the authentication service.

The contributor name is the first name retrieved from the authentication service.

The private information retrieved from the authentication service is stored in a separate repository using the schema.org ontology:
```
PREFIX schema: <http://schema.org/>

INSERT DATA {
	<URI:schema:Person> schema:given_name "Given"^^xsd:string .
	<URI:schema:Person> schema:family_name "Family"^^xsd:string .
	<URI:schema:Person> schema:email "email@address.org"^^xsd:string .
	<URI:schema:Person> schema:owns <URI:foaf:Person> .
}
```
Note how the Person class owns the Contributor class.

They are also registered as a member of the GlyTouCan Organziation:
```
PREFIX schema: <http://schema.org/>
INSERT DATA {
	<URI:schema:Person> schema:member <URI:schema:Organization#glytoucan> .
}
```

Based upon the authentication service results, if the user has a verified email address, they will also be considered a contributor:
```
PREFIX schema: <http://schema.org/>
INSERT DATA {
	<URI:schema:Person> schema:contributor <URI:schema:Organization#glytoucan> .
}
```

At the same time, the registration is recorded by storing a RegisterAction:
```
PREFIX schema: <http://schema.org/>
INSERT DATA {
	<URI:schema:RegisterAction#UniquePerson> schema:participant <URI:schema:Person> .
	<URI:schema:RegisterAction#UniquePerson> schema:startTime "DateTime" .
}
```

As part of authorization checking of the web services from this web application, the user needs to be identified with an API key.  The first key is also generated at registration time:
```
PREFIX schema: <http://schema.org/>
INSERT DATA {
	<URI:schema:ProgramMembership#glytoucanPartnerProgram#UniquePerson> schema:membershipNumber "key" .
	<URI:schema:Person> schema:memberOf <URI:schema:ProgramMembership#glytoucanPartnerProgram#UniquePerson>
}
```

This shows how there exists a GlyTouCan Partner Program which holds Program Membership information.  All users are automatically a member of the partner program and are given a unique key to indicate their membership number.

Note that this is primarily the relationships stored for an individual user, and is separate from a user who is a member of an Organization that is part of the [GlyTouCan Partnership](/partner).

## Conclusion

Once this registration is complete, the user is thus validated and is able to use the registered user specific functionality.  More details are available from the [manual](/manual)











> Written with [StackEdit](https://stackedit.io/).