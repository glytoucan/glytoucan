---
title: Glytoucan System Architecture
layout: default
---

<p>
The glycan repository (below: GlyTouCan) consists of three major components.  Each component is a different method of accessing the information in the repository. GlySpace is the backend server with the database storing the glycan and the user information. The server provides a RESTful web service interface allowing to access, insert and update the information in the database. In addition to the web services for the implementation searches provided. Third party applications can freely use the web services directly to access the data content and to modify or extend it.  (figure?) GlyTOUcan.org is the web frontend server providing human readable and browsable web pages to display the information in the repository. The web pages allow users with to visual inspect, create or modify the data in the repository using a web browser (left column of the figure). The frontend server uses the web services provided by the backend server to extract or modify information in the database and does not store data itself. The Triplestore is main method of data storage. In difference to the main database only glycan information (no user management data) will be stored and provided as RDF data. This will make the data free accessible for the semantic web community which can use SPARQL queries to request information from the triplestore.  How each component was designed, the technologies used, and source code locations will be described in detail below.
</p>

1. [glyspace](glyspace.html)
2. [Linked Data](quadstore.html)
3. [glytoucan](glytoucan.html)
9. infrastructure
  * squid
  * docker
  * jenkins
10. Development methods
  * continuous integration
