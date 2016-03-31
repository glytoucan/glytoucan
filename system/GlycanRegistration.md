---
title: GlyTouCan Glycan Registration System
layout: default
---
* auto-gen TOC:
{:toc}

# Overview
This document describes the GlyTouCan Registration system and flow, as well as details describing the plugin system.

## Background
Originally the Glycan Registration process was a singular process which executed every enrichment processing by default.  This became bloated, prone to issues, and difficult to manage.  The majority of functions were compartmentalized, however there was no concrete framework to add new functionality.

## Improvement
A new modular, step-wise, method was introduced with the latest version; this workflow provided the user more transparency in the registration process.

### Batch Method

The original registration method processed all enrichment from a glycoct sequence in one process.  If an error occurred within this process, the entire transaction was rolled back and an error message was displayed.  This method proved to be not very friendly for users and was difficult to process multiple sequences at once.

Herein introduces a new method to store input specifically for the user at the beginning, with minimal validation.  At regular intervals or at the user's request, a registration batch process is executed which enriches the data with required fields and can quickly convey results for massive numbers of structures in a simple user interface

### Data flow

A new graph will be used to store draft data for the initial user content.  This data is not publicly viewable from the repository website, and should be considered unpublished information.  When a user inputs a sequence via the text area or graphical builder or client/REST api, the information is stored immediately in GlycoRDF's GlycoSequence class.  A Resource Entry is also created to relate the information to the user.


```sequence
User->GlyTouCan: User submits structure
GlyTouCan->RDF: GlyTouCan stores preregister data
GlyTouCan->RDF: GlyTouCan logs storage of data
User->GlyTouCan: User requests registration status
GlyTouCan->RDF: GlyTouCan queries status
RDF->GlyTouCan: registration log returned
GlyTouCan->User: status displayed
```

### Preregister data

Currently the following data is accepted:

1. Glycan Sequence strings
2. Glycan Name
3. Glycan Motif
4. Pubmed ID
5. Taxonomy ID

### Logging

The logging process is fairly complicated, and will be described in a [separate article](/system/logging).  In general the following information will be stored:

1. registration number, a unique number to identify the preregister information.

### Staging process

As explained above, the information received will be stored in a draft-version graph section of the triplestore.  When the batch process is initiated, all generated content and logging will also be stored in this draft section.  The user will be able to view this information in combination with live data to show how it would be once the data is committed in the [Draft View](/system/draftview) functionality.

This simply combines the draft data with public data currently stored in the repository.

Once the user is ready to publish the information, the preregister data is then transferred to the public graph.  Once again the same enrichment modules are executed and all results can be checked from the [Log View Dashboard](/system/dashboard).

### Module execution flow

The most complicated registration process is the sequence structure.
The following describes the processing that occurs when a structure is first recorded.  Modules are executed and results can be reviewed from the dashboard.

Once committed the data is destroyed, however the graph can also be completely reset in case there is remaining enrichment data.

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

The "move structure to production" process executes the first workflow, running the modules again this time into the associated 
graphs visible on production.

## RDF Framework

The GlyTouCan project has created a framework for storing data inputs to RDF.  This framework is highly flexible however for the purposes of this article the scope will be limited to the GlycoSequence string to RDF interface.

The following is the GlycoSequenceResourceProcess interface.  This is the minimal information required by the registration batch to execute the processing of a structural sequence.
```
public interface GlycoSequenceResourceProcess {
	public ResourceProcessResult processGlycoSequence(String sequence) throws ResourceProcessException;
}
```

Note that this is a very simple interface to follow.  The simplicity allows for flexibility in how the batch process is to be used.

More details can be seen in the ResourceProcessResult class:

```
public class ResourceProcessResult {

	String status;
	String message;
	String id;
	SparqlEntity sparqlEntity;
	InsertSparql insertSparql;
	
	public String getStatus() {
		return status;
	}
...	
}
```

As would be expected the status, message, and preregister id is returned.  This will be logged directly into the [logging system](/system/logging).  The interesting parts are the InsertSparql and SparqlEntity classes.  This shows that implementations of this interface is given access to the triplestore.  By simply returning a SPARQL Insert statement, data resulting from the process is added into the repository RDF. 

More details regarding process-time access to the RDF will be given in the future, however as of now this shows a simple framework for processing a variety of data that can be logically determined from a Glycan Sequence string.

TODO:
process-time triplestore connection
log messaging by exception management
suggested graph to input - outside of framework?
required parameters:

> Written with [StackEdit](https://stackedit.io/).