---
title: GlyTouCan Registration System Flow
layout: default
---

[TOC]

# Overview
This document describes the GlyTouCan Registration system and flow, as well as details describing the plugin system.

## Background
Originally the Glycan Registration process was a singular process which executed every enrichment processing by default.  This became bloated, prone to issues, and difficult to manage.  The majority of functions were compartmentalized, however there was no concrete framework to add new functionality.

## Improvement
A new modular, step-wise method was introduced with version two; this workflow provided the user more transparency in the registration process.

### Batch Method

The original registration method processed all enrichment from a glycoct sequence in one process.  If an error occurred within this process, the entire transaction was rolled back and an error message was displayed.  This method proved to be not very friendly for users and was difficult to process multiple sequences at once.

Herein introduces a new method to store input specifically for the user at the beginning, with minimal validation.  At regular intervals or at the user's request, a registration batch process is executed which enriches the data with required fields and can quickly convey results for massive numbers of structures in a simple user interface

### Data Flow

A new graph will be used to store draft data for the initial user content.  This data is not public through the repository website, and should be considered unpublished information.  When a user inputs data to register(such as a glycan sequence string) via the website or client/REST API, the information is stored immediately in RDF.  A Resource Entry is also created to relate the information to the user.

```sequence
User->GlyTouCan: User submits structure
GlyTouCan->RDF: GlyTouCan stores preregister data
GlyTouCan->RDF: GlyTouCan logs storage of data
User->GlyTouCan: User requests registration status
GlyTouCan->RDF: GlyTouCan queries status
RDF->GlyTouCan: registration log returned
GlyTouCan->User: status displayed
```

All of the queries are also available via the [API](/system/api).
The module execution flow will be explained below.

### Pre-Register Data

The following is the data fields accepted and the associated Class that will be stored.  Each type will have it's own validation checks and enrichment.  The field column is a link to the registration process in detail.

| Data field | Class
| -- | --
| [Glycan Sequence](/system/glycan_registration.md) | GlycoRDF GlycoSequence
| [Glycan Name](/system/name) | Saccharide Alias
| [Glycan Motif](/system/motif) | GlycoRDF Motif class
| [Pubmed ID](/system/publication) | `dc:references <http://identifiers.org/pubmed/IDHERE>` as described in  [guidelines for the ToGo Project](http://wiki.lifesciencedb.jp/mw/BH14.14/RDFizingDatabaseGuideline)
| [Taxonomy](/system/taxonomy) | `glycan:taxon <http://identifiers.org/taxonomy/IDHERE>`  as described in  [guidelines for the ToGo Project](http://wiki.lifesciencedb.jp/mw/BH14.14/RDFizingDatabaseGuideline)

### Logging

The logging process is fairly complicated, and will be described in a [separate article](/system/logging).  In general information such as ID, contributor, description, and type of the action will be stored.

### Staging Process

As explained above, the information received will be stored in a draft-version graph section of the triplestore.  When the batch process is initiated, all generated content and logging will also be stored in this draft section.  The user will be able to view this information in combination with live data to show how it would be once the data is committed in the [Draft View](/system/draftview) functionality.

This simply combines the draft data with public data currently stored in the repository.

Once the user is ready to publish the information, the preregister data is then transferred to the public graph.  Once again the same enrichment modules are executed and all results can be checked from the [Log View Dashboard](/manual/dashboard).

### Module Execution Flow

The most complicated registration process is the sequence structure.
The following describes the processing that occurs when a structure is first recorded.  Modules are executed and results can be reviewed from the dashboard.

```sequence
User->GlyTouCan: User submits structure
GlyTouCan->RDF: GlyTouCan checks stores core structure data
GlyTouCan->RDF: Writes out result
GlyTouCan->Module: Executes modules
RDF-->Module: Optionally retrieves data
Module->RDF: Executes logic and writes RDF
Module->GlyTouCan: Return results of process and messages
GlyTouCan->RDF: Writes out result of module and log
RDF->GlyTouCan: Retrieve all logs of modules and structures
GlyTouCan->User: View logs of structures
```

Once ready, the structure can be committed by the user.   

```sequence
User->GlyTouCan: commits structure for repository
GlyTouCan->RDF: check status of structure
GlyTouCan->RDF: move structure to production
GlyTouCan->User: show user link to entry page
```
Once committed the data is destroyed, however the graph can also be completely reset in case there is remaining enrichment data.

The "move structure to production" process executes the first workflow, running the modules again this time into the associated 
graphs visible on production.

## RDF Process Framework

The GlyTouCan project has created a framework for storing glycoinfo data into RDF.  This section will describe the parent class functionality that are inherited.  It is a high-level view of the framework intentions.

The main purpose of this framework is to give developers a simple interface to query and store GlyTouCan RDF repository data.  By simply inheriting the parent classes, an instance of an RDF DAO is made available, thus an interface to execute any SPARQL.  This way there is no need to worry about the complex details regarding how to connect to the RDF Triplestore, software driver dependencies, transactions, and error handling.  The [logging](/system/logging) system is also made available, for a very simple method to communicate to the end user the status of the program.

The following is the ResourceProcess interface.  This is the minimal interface required by a module.
```
public interface ResourceProcess {
	public ResourceProcessResult run() throws ResourceProcessException;
}
```

Please Note: In most cases developers will be extending the child classes for each module.  This interface is a bit too simple and only used by the framework for each pre-register child module.  Please refer to the "Pre-Register Data" section above.  The simplicity allows for flexibility in how the batch process is to be used now and in the future.

More details can be seen in the returned ResourceProcessResult class:

```
public class ResourceProcessResult {

	Log logMessage;
	String id;
	SparqlEntity sparqlEntity;
	InsertSparql insertSparql;

...

}
```

The logMessage is a Log class, which just contains a description of an event and a status:
```

public class Log {
    protected String description;
    protected Status status;
...
}
```
The status is just one of three events:
```
public enum Status {

    SUCCESS,
    WARNING,
    ERROR
...
}    
```

This will be logged directly into the [logging system](/system/logging).  The interesting parts are the InsertSparql and SparqlEntity classes.  This shows that implementations of this interface is given access to the RDF repository.  By simply returning a SPARQL insert statement, data resulting from the process is added into the repository RDF. 

Note the exception handling also uses a specialized class:
```
public class ResourceProcessException extends Exception {

	public ResourceProcessException(ResourceProcessResult result) {
		super(result.getMessage());
	}
}
```

The exception also contains the ResourceProcessResult class.  Thus in case of errors the logging interface should be updated for the user.

If no SPARQL-update insert is to be made, it should not be set.

At run-time, the DAO is available from the parent class of all child module interfaces:

```
public abstract class ResourceProcessParent implements ResourceProcess {
	@Autowired
	SparqlDAO sparqlDAO;
}
```

sparqlDAO has methods such as `query()` and `insert()` which can be used to execute SELECT and INSERT SPARQL, respectively.

It should be noted that at pre-registration time, all graphs will be replaced with the draft graph.  There already exists a graph policy specific to the [partner](/partner) program.

> Written with [StackEdit](https://stackedit.io/).