---
title: GlyTouCan Logging System
layout: default
---

[TOC]

# Overview
This document describes the core GlyTouCan Logging system.  A tool to record and inform events within the system.

## Background
The original GlyTouCan was primarily a form-driven website with no background processing functionality.  After reviewing the overall system and  bottlenecks, a framework change was found to be necessary.  One that could push the processing of complex logic into the background, offline from the user.  The number and types of errors also needed to be handled better instead of the one-time form-based method.  Logging will provide an interface for developers to easily log messages into the RDF storage, allow for historical information of data to be recorded as it is edited, and user commands that the user executes.  This will also allow logs to be queried and viewed through a variety of channels.

## Core Logging

The SOAP protocol will be used to define the API, and the [batch](/batch) project will have interfaces to the RDF store.   The logging server will exist as an SOAP server, thus any applications that will need this functionality can simply include the logging client as a dependency.

### Classes

We will be using the [RLOG Ontology](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/rlog/rlog.html), a very simple ontology based on log4j.

The LogClient class extends spring's WebServiceGatewaySupport which can be used marshal Log Request classes to the api server.
### Core functionality

The client can be referenced to see the types of logs available.
```
@Autowired
LogClient logClient;

{
...
	LogResponse response = logClient.insertDefaultLog("test message");
...
}
```
Any class can be linked to a log, however for GlyTouCan the classes are limited to Users.  Any non-linked log is to be considered a system log.

### User Logs
Logs specific for users should be linked to the Contributor class.  Here is an example SPARQL query:
```
PREFIX glytoucan:  <http://www.glytoucan.org/glyco/owl/glytoucan#>
PREFIX log: <http://persistence.uni-leipzig.org/nlp2rdf/ontologies/rlog>
SELECT ?messages ?level ?date ?class
WHERE
{
<http://rdf.glycoinfo.org/glytoucan/contributor/userId/1> glytoucan:log ?logEntry .
  ?logEntry log:message ?messages .
  ?logEntry log:level ?level .
  ?logEntry log:date ?date .
  ?logEntry log:className ?class .
}
```