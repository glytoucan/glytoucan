---
title: GlyTouCan System Architecture
layout: default
---
## Target Audience

This is a detailed description of the various parts of the GlyTouCan repository.  It is meant to be a resource to understand how the system is maintained and to analyze where there improvements can be made.

![Glytoucan System Architecture diagram](/images/system/glytoucan2-system-architecture.svg)

<br>

## Repository of Subsystems

The GlyTouCan glycan repository is actually a combination of various subsystems.  Each subsystem undertakes a specific role in managing the information stored in the repository; this information will ultimately be stored in a triplestore.  How each component was designed, the technologies used, and the source code will be provided in detail below.

### Linked Data RDF Triplestore

All data stored in the repository is added as Linked-data into a triplestore.  Through the triplestore web-interface, all glycan-related information is provided publically as RDF.  This will make the data freely accessible for the semantic web community, enabling the use of SPARQL queries to retrieve information.  Linked Data batch processes and loaders were also created that converted and enriched the RDF data from various sources such as currently available public databases.  Please refer to the [Linked Data architecture](quadstore) for details on how the data is transferred and enriched.

### API Server and Java Client

The [api server](http://api.glytoucan.org) interacts directly with the triplestore and is used as a form of a gateway to the data.  It provides a RESTful web service interface allowing to access, insert and update the information stored in RDF (triplestore data).  Third party applications (API Programmers) can freely use the web services directly to access the data content and to modify or extend it.  For Java programmers there is a [java client](http://github.com/glytoucan/client) which can be used to interact with the API server without having to deal with the complexities of the REST protocol.

* [API Server Documentation](https://github.com/glytoucan/api)
* [Java Client Library Documentation](https://github.com/glytoucan/client)
* [Java Client CLI Documentation](/system/cli)
* [Basic Tool CLI Documentation](/system/basic)

### Web Server and Internationalization

The GlyTouCan java icon is the front-end server providing web pages cleanly formatted to display the information in the repository.  The site allows users(glycoscientists) to visually inspect, create, or modify the data in the repository using a web browser.  The front-end server uses the web services provided by the backend servers to extract or modify information in the database and does not store data itself.  It utilizes the [java client](http://github.com/glytoucan/client) to implement this cleanly.  

It is primarily written in Java using the Spring Framework as a controller and [togostanza](http://www.togostanza.org/) as a dynamic view of the RDF data.  The details behind on how this is accomplished is available in the [glytoucan architecture](glytoucan) page.

<br>

## Infrastructure

All of the above could not be completed in an efficient manner without the tools used to manage the multiple environments and requirements demanded for each environment.  The [infrastructure](infrastructure) page delves into how this was managed, and the development methods that were used behind each tool.
