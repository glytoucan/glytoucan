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
A new modular, step-wise method was introduced with version two; this workflow provided the user more transparency in the registration process.  The entire process is broken down into three steps:

1. Initial Registration: This will be the initial submission of data with minimal validation.
2. Enrichment: submitted data can be enriched with supplementary information where applicable.
3. Release: The user submitting the data can confirm how the data will be presented on the website privately, the option then exists to release the information into the public repository.

### Enrichment Batch Method

The original registration method processed all enrichment from a glycoct sequence in one process.  If an error occurred within this process, the entire transaction was rolled back and an error message was displayed.  This method proved to be not very friendly for users and was difficult to process multiple sequences at once.

Herein introduces a new method to store input specifically for the user at the beginning, with minimal validation.  At regular intervals or at the user's request, a registration batch process is executed which enriches the data with required fields and can quickly convey results for massive numbers of structures in a simple user interface.  The same method will be used for all data submitted, not just glycan sequence data.

### Data Flow

A separate RDF triplestore will be used to store draft data privately for the initial user content.  This data is not public through the repository website, and should be considered unpublished information.  When a user inputs data to register(such as a glycan sequence string) via the website or client/REST API, the information is stored immediately in RDF.  A log entry is also created to relate the information to the user.

```sequence
User->GlyTouCan: User submits structure
GlyTouCan->Draft RDF: GlyTouCan stores preregister data
GlyTouCan->Draft RDF: GlyTouCan logs storage of data
Note right of GlyTouCan: Batch process here, explained below
User->GlyTouCan: User requests view of structure with public data (draft view)
GlyTouCan->Draft RDF: GlyTouCan queries user data
Draft RDF->GlyTouCan: results
GlyTouCan->User: overall view of draft data in repo
User->GlyTouCan: User requests registration status
GlyTouCan->Draft RDF: GlyTouCan queries status
Draft RDF->GlyTouCan: registration log returned
GlyTouCan->User: status displayed
```

All of the queries are also available via the [API](/system/api).
The module execution flow will be explained below.

### Pre-Register Data

The following is the data fields accepted and the associated Class that will be stored.  Each type will have it's own validation checks and enrichment.  The Data field column is a link to the registration process in detail.

| Data field | Class
| -- | --
| [Glycan Sequence](/system/glycan_registration) | GlycoRDF GlycoSequence
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

### Batch Module Execution Flow

The following describes the processing that occurs after data is first submitted and enriched.  Modules are executed and results can be reviewed from the dashboard.

```sequence
GlyTouCanBatch->Draft RDF: checks draft for pre-register data
GlyTouCanBatch->Module: executes module
Draft RDF-->Module: optionally retrieves data
Module->Draft RDF: executes logic and writes RDF
Module->GlyTouCanBatch: results of process and messages
GlyTouCanBatch->Draft RDF: status log recorded
```
Once ready, the structure can be committed by the user.   

```sequence
User->GlyTouCan: commits data for repository
GlyTouCan->Draft RDF: check status
GlyTouCan->RDF: move data to production
GlyTouCan->Draft RDF: logs
Note right of GlyTouCan: identical batch modules run
Note right of GlyTouCan: with production graph policies
User->GlyTouCan: requests registration status
GlyTouCan->Draft RDF: queries status
Draft RDF->GlyTouCan: status log returned
GlyTouCan->User: status log displayed
User->GlyTouCan: clicks on link
GlyTouCan->RDF: registered data queried
RDF->GlyTouCan: retrieved
GlyTouCan->User: registered data displayed
```
Once committed the data is destroyed, however the graph can also be completely reset in case there is remaining enrichment data.

The "move structure to production" process executes the first workflow, running the modules again this time into the associated 
graphs visible on production.

## RDF Process Framework

The GlyTouCan project has created a framework for storing glycoinfo data into RDF.  This section will describe the parent class functionality that are inherited.  It is a high-level view of the framework intentions.

The main purpose of this framework is to give developers a simple interface to query and store GlyTouCan RDF repository data.  By simply inheriting the parent classes, an instance of an RDF DAO is made available.  This allows for the module to execute any SPARQL necessary.  This way there is no need to worry about the complex details regarding how to connect to the RDF Triplestore, software driver dependencies, transactions, and error handling.  The [logging](/system/logging) system is also made available, for a very simple method to communicate to the end user the status of the program.

As an example the following is the interface of GlycoSequence RDF processing.  This is the minimal interface required by a module to process a user input GlycoSequence.
```
public interface GlycoSequenceResourceProcess extends ResourceProcess {
	public ResourceProcessResult processGlycoSequence(String sequence, String contributorId) throws ResourceProcessException;
}

public interface ResourceProcess {
	public SparqlDAO getSparqlDAO();

	public void setSparqlDAO(SparqlDAO sparqlDAO);
}
```

Please Note: In most cases developers will be extending the child classes for each type of input.  Please refer to the "Pre-Register Data" section above for the types of data input and better examples of how to create modules for them.  This example is used to show the simplicity of the framework; which allows for flexibility in how the batch process is to be used now and in the future, on multiple data types.

More details can be seen in the returned ResourceProcessResult class:

```
public class ResourceProcessResult {

	Entry logMessage;
	InsertSparql;
	String id;
...

}
```

The logMessage is an Entry class, which is very similar to a log4j log entry:
```
public class Entry {

    protected LevelType level;
    protected XMLGregorianCalendar date;
    protected String className;
    protected String resource;
    protected String message;
...
}
```

The level type is a status level, which is enumerated as follows:
```
public enum LevelType {
    ALL,
    TRACE,
    DEBUG,
    INFO,
    WARN,
    ERROR,
    FATAL,
    OFF;
...
}    
```
This will be logged directly into the [logging system](/system/logging). 

The interesting part is access to the SparqlDAO class, which is part of the GlyTouCan [batch project](http://code.glytoucan.org/batch/).  This is provided for access to the RDF repository.  It is possible to run any SPARQL from this class, without infrastructure worries.

Note the exception handling also uses a specialized class:
```
public class ResourceProcessException extends Exception {

	public ResourceProcessException(ResourceProcessResult result) {
		super(result.getMessage());
	}
}
```
The exception also contains the ResourceProcessResult class.  Thus in case of errors the logging interface should be updated for the user.

To simplify things, an implementation using the Spring Framework is available from the parent class.  All child-modules inherit this to simplify redundant definitions:
```
public class ResourceProcessParent implements ResourceProcess { 
	@Autowired
	SparqlDAO sparqlDAO;

	public SparqlDAO getSparqlDAO() {
		return sparqlDAO;
	}

	public void setSparqlDAO(SparqlDAO sparqlDAO) {
		this.sparqlDAO = sparqlDAO;
	}
}
```

SparqlDAO has methods such as `query()` and `insert()` which can be used to execute SELECT and INSERT SPARQL, respectively.  

### Editing and Archiving

Even though modules are meant to create new data into the repository, nothing is perfect.  Therefore as a way to support *module versioning* or upgrading of modules, there are two methods to upgrade the data created.

1. Complete removal of the data.  ResourceProcess Modules can be run both as one-structure web services, as well as complete-repository batches.  In the case of batch modules, the ResourceProcessBatch interface should be implemented.  This has a specific flag which indicates whether the graph should be cleared on startup.

```
public interface ResourceProcessBatch extends ResourceProcess {
	public boolean initClearGraph();
}
```

The main GlyTouCan Batch controller will refer to this every time it is run.  This should be a configuration specific for the situation in which the batch is run.

2.  DeleteBean: 

### Demonstration
As a demonstration of how to use this framework, please refer to the [Glycan Registration](/system/glycan_registration) for a detailed test case.

### Batch Project
For more details on SparqlBeans and the SparqlDAO, please refer to the [GlyTouCan batch project](/batch)

## Graphs
There already exists a graph policy specific to the [partner](/partner) program, once the registration is committed by the user.

> Written with [StackEdit](https://stackedit.io/).