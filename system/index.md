---
title: Glytoucan System Architecture
layout: default
---
![Glytoucan System Architecture diagram](/images/glytoucan-system-architecture.svg)
The glycan repository (below: glytoucan) consists of three major components.  Each component is a different method of accessing the information in the repository.  GlySpace is the backend server with the database storing the glycan and user information.  This server provides a RESTful web service interface allowing to access, insert and update the information stored in the database.  Third party applications (API Programmers) can freely use the web services directly to access the data content and to modify or extend it.  glytoucan.org is the web front-end server providing web pages cleanly formatted to display the information in the repository.  The site allow users to visual inspect, create, or modify the data in the repository using a web browser (glycoscientist).  The front-end server uses the web services provided by the backend server to extract or modify information in the database and does not store data itself.  The Linked Data datastore is main method of data storage.  In difference to the main database only glycan information (no user management data) will be stored and provided as RDF data.  This will make the data free accessible for the semantic web community which can use SPARQL queries to retrieve information.  Link Data batch processes and loaders were also created that converted and enriched the RDF data from the backend and other external databases.  How each component was designed, the technologies used, and source code locations will be described in detail below.

## glyspace

glyspace is a REST interface with a postgresql database backend written in java.  The architecture for this system is [available](glyspace).  This system was written by the [glyspace team](http://glyspace.org)  

## Linked Data

All data stored by glytoucan is transferred into RDF format stored in a Virtuoso server.  Please refer to the [Linked Data architecture](quadstore) for details on how the data is transferred and enriched.

## glytoucan

The glytoucan front-end is written utilizing a combination of the cakephp framework for the front and static pages, and [togostanza](http://www.togostanza.org/) to access the RDF data.  The details behind how this is accomplished is available in the [glytoucan architecture](glytoucan) page.

## infrastructure

All of the above could not be completed in an efficient manner without the tools used to manage the multiple environments and requirements demanded for each environment.  The [infrastructure](infrastructure) page delves into how this was managed, and the development methods used behind each tool.