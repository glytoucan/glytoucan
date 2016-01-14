---
title: GlySpace Glycan Database
layout: default
---

As glyspace stores the authentication and user information for the system, there are privacy and security concerns regarding how much source code to be made available.  Regardless, a stripped down version was released on [github](https://github.com/glycoinfo/glyspace).  While the currently running production copy is located in a private repository on [bitbucket](https://bitbucket.org/aokinobu/glytoucan-ws).  Glyspace provides a method for application programmers to access the information stored in the repository.  Using the Glyspace API, it is possible to search, retrieve, signup for, signin, and register new glycans.  Currently the [glytoucan front-end](glytoucan) is fully utilizing glyspace to manage the users and access restrictions required, with no datastore of it's own, other than the [Semantic Web datastore](quadstore).  

## quick start

The api is available [online](http://glytoucan.org/glyspace/documentation/apidoc.html) and describes in detail the functionality of each method. 

![sample screen shot of api](/images/system/glyspaceApiSample.png)

For example, the above describes how a GET request to the glyspace service is possible with a parameter {accessionNumber} within the context path.

So a request in this format:

[http://glytoucan.org/glyspace/service/glycans/G00026MO](http://glytoucan.org/glyspace/service/glycans/G00026MO)

Can be executed to retrieve the sequence(and other information) of the glycan with ID of G00026MO in an XML-formatted response.

```xml
<glycan accessionNumber="G00026MO" 
dateEntered="2014-10-20T06:40:24.086Z" 
glycanId="97106" 
mass="910.3277800379999" 
structureLength="194">
<glycan-compositions/>
<contributor active="true" 
affiliation="The Glycan Registry" 
email="" 
lastLoggedIn="2015-01-15T11:02:58.486Z" 
loginId="admin" 
userId="1" 
userName="Administrator" 
validated="true">
<roles roleId="2" roleName="ADMIN"/>
</contributor>
<motifs/>
<structure>
RES 1b:x-dglc-HEX-x:x 2s:n-acetyl 3b:b-dglc-HEX-1:5 4s:n-acetyl 5b:b-dman-HEX-1:5 6b:a-dman-HEX-1:5 7b:a-dman-HEX-1:5 LIN 1:1d(2+1)2n 2:1o(4+1)3d 3:3d(2+1)4n 4:3o(4+1)5d 5:5o(3+1)6d 6:5o(6+1)7d
</structure>
</glycan>
```


Please note that the majority of functions can also return in JSON format by adding the .json extension:

[http://glytoucan.org/glyspace/service/glycans/G00026MO.json](http://glytoucan.org/glyspace/service/glycans/G00026MO.json)

```json
{"glycanId":97106,
"accessionNumber":"G00026MO",
"structure":"RES\n1b:x-dglc-HEX-x:x\n2s:n-acetyl\n3b:b-dglc-HEX-1:5\n4s:n-acetyl\n5b:b-dman-HEX-1:5\n6b:a-dman-HEX-1:5\n7b:a-dman-HEX-1:5\nLIN\n1:1d(2+1)2n\n2:1o(4+1)3d\n3:3d(2+1)4n\n4:3o(4+1)5d\n5:5o(3+1)6d\n6:5o(6+1)7d\n",
"structureLength":194,
"contributor":
{"userId":1,
"userName":"Administrator",
"loginId":"admin",
"email":"",
"active":true,
"validated":true,
"affiliation":"The Glycan Registry",
"roles":[{"roleId":2,"roleName":"ADMIN"}],
"dateRegistered":null,
"lastLoggedIn":"2015-01-15T11:02:58Z"},
"mass":910.3277800379999,
"motifs":[],
"compositions":[],
"dateEntered":"2014-10-20T06:40:24Z"}
```
 
## architecture

Glyspace was written completely in java utilizing the [spring framework](http://www.springframework.org) and [postgresql](http://www.postgresql.org/).
The [project source code information, test cases, and dependencies](http://code.glycoinfo.org/glyspace) are generated continuously and are pushed onto the [glycoinfo website](http://www.glycoinfo.org).

  * [project information](http://code.glycoinfo.org/glyspace)
  * recent [changelog](http://code.glycoinfo.org/glyspace/changelog.html)
  * [test results](http://code.glycoinfo.org/glyspace/surefire-report.html)
  * [source code](https://github.com/glycoinfo/glyspace)

### dependencies

A majority of dependencies used by glyspace were developed in the [EuroCarb](http://www.ebi.ac.uk/eurocarb) project.  The source code and other materials can be found on the [newly transferred github](https://github.com/glycoinfo/eurocarbdb).  Here are some links to the libraries that were added to the glycoinfo continuous integration process:

1. Molecular Framework
  * [project information](http://code.glycoinfo.org/MolecularFramework) (generated continuously)
  * recent [changelog](http://code.glycoinfo.org/MolecularFramework/changelog.html)
  * [test results](http://code.glycoinfo.org/MolecularFramework/surefire-report.html)
  * [source code](https://bitbucket.org/glycosw/eurocarbmolecularframework)
2. ResourcesDB
  * [project information](http://code.glycoinfo.org/ResourcesDB)
  * recent [changelog](http://code.glycoinfo.org/ResourcesDB/changelog.html)
  * [test results](http://code.glycoinfo.org/ResourcesDB/surefire-report.html)
  * [source code](https://github.com/glycoinfo/ResourcesDB)
  
