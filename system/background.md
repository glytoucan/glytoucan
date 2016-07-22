---
title: GlyTouCan Background System
layout: default
---
* auto-gen TOC:
{:toc}

# Overview
This document describes the GlyTouCan Background system.  A number of batches are created based upon a framework for easily constructing enrichment data.  There also exists a robust tool for logging to record and inform about system events.  Both are integrated together with Jenkins to providing a complete scheduling and management interface with detailed logs for all batches.

## Background
The original GlyTouCan was primarily a form-driven website with no background processing functionality.  After reviewing the overall system and  bottlenecks, a framework change was necessary.  Separating the Registration process from the Enrichment(extraction of information about the structure) will enhance system stability and user friendliness by processing complex logic in the background.  There was also a number of error-catching logic that required specialized communication to the user, which could not be properly handled by a one-time form-based post/response method.  Logging will provide an interface for developers to easily log messages into the RDF storage, allow for historical information of data to be recorded as it is edited or processed, as well as the possibility of recording user interaction for commands that may require more transparency.  This will also allow logs to be queried and viewed through a variety of channels.

Batch processes did exist already which were used to convert/enrich the structure data, however these were considered one-time options at the time.  Now with the architecture change, these batches can be fully utilized, and with the logging functionality more transparency to the user could be conveyed.

## Core Logging

The logging service is a core aspect of the entire backend system.
The logging server exists as a SOAP server, thus any applications that will need this functionality can simply call simple POST requests directly or utilize the logging client binary.

### Log Classes

A choice of ontologies are available, however the [RLOG Ontology](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/rlog/rlog.html) will be used as it is simple and based on the familiar log4j concepts.

The LogClient package is also used for simplicity to interact with the log api server.

### Core functionality

The client can be used to both insert and query messages.  This is an example of inserting a log:
```
@Autowired
LogClient logClient;

{
...
	LogResponse response = logClient.insertDefaultLog("test message");
...
}
```

This is a default log, it can be queried however not very useful for GlyTouCan.  This is a test case in the logclient package, it merely confirms the system is working.

### Log characteristics

Each Log can be identified with the following characteristics, each field except for resource and date is required.  When date is not inserted specifically, the date and time in which the message is generated on the server will be used.

 - LevelType The log level type, either of the following, default is DEBUG:
	 - ALL
	 - TRACE
	 - DEBUG
	 - INFO
	 - WARN
	 - ERROR
	 - FATAL
	 - OFF
 - Date - Date and time of the Log Event
 - Class Name - A string to distinguish this log event.  Open to implementation.
 - Resource - URI to associate the log event.
 - Message - The log message.

As can be seen, the Resource field allows for any class to be related to a log event, so for GlyTouCan this can be Users, Saccharides, or GlycoSequences.  Any non-linked log should be considered a system log.

### System Logs

System logs could be used for cases such as startup, shutdown, or error cases such as a datastore connection timeout.

### Saccharide Logs

Saccharide logs will be recorded for any information regarding a registered glycan structure from the time it is a validated and recorded.  Batch processes in particular will be adding logs to the Saccharide for any enrichment processes that occur such as IUPAC conversion, mass calculations, or WURCS RDF generation.

The following is an example of inserting a log for Saccharide:

```
Entry entry = new Entry();

// note the lack of <>
entry.setResource("http://rdf.glycoinfo.org/glycan/G58087YP");
entry.setClassName("jp.bluetree.Test");
entry.setLevel(LevelType.DEBUG);
entry.setMessage("this is a test");

logClient.insertLogEntry(entry);

```

The URI used for Resource only needs to be the contents of the URI, no brackets, to keep things simple.

### Retrieving the information

The following is an example sparql query to retrieve all log information for a specific Saccharide.

```
prefix log: <http://persistence.uni-leipzig.org/nlp2rdf/ontologies/rlog#>
SELECT ?level ?className ?message ?date ?hasCode
WHERE {
  ?uri log:level ?level .
  ?uri log:className ?className .
  ?uri log:message ?message .
  OPTIONAL { ?uri log:date ?date . } 
  OPTIONAL { ?uri log:hasCode ?hasCode . } 
  ?uri log:resource <http://rdf.glycoinfo.org/glycan/G58087YP> .
}
```

Note that the where clause can filter by type, level, date, and/or code.

#### Log Client query
The log client also contains a query method, which is self-explanatory.

### Batch processes

The following will describe the logs created for each batch process.  They will be split up into each section of an ETL process:

 - Extract: The extraction or selection criteria used to retrieve data.  Batch initiation will be recorded.
 - Transform: Transformation of the selected data, process-specific logs and error logs most likely generated here
 - Load: Loading of the data.  Actual insertion.  Insertion errors should be considered system issues so logs should not be provided, excluding special situations which should be explained in the design specification.  Successful completion logs added here.

In all cases for batch programs, unless otherwise specified, the resource to asssociate the log will be the Saccharide.  The Resource field will thus contain the Saccharide URI:
`http://rdf.glycoinfo.org/glycan/AccessionNumberHere`

The level will be informational:
`LevelType.INFO`

and the classname will be the name of the batch run, for example:
`Iupac Conversion Process`

#### Conversion
Conversion processes retrieve the glycosequence of various saccharides and converts them into another format.  The main conversion processes are IUPAC condensed, IUPAC extended, and GlycoCT.  Since WURCS to GlycoCT does not exist at the time of this writing, it will make a best effort to convert from IUPAC condensed to GlycoCT.

##### Extract
For each saccharide selected, the message will be:
`Starting conversion to IUPAC Condensed`

Note this filters by checking the already-converted sequences:

```
FILTER NOT EXISTS {
?SaccharideURI glycan:has_glycosequence ?existingseq .
?existingseq glycan:has_sequence ?someSequence .
?existingseq glycan:in_carbohydrate_format glycan:carbohydrate_format_iupac_condensed .
}
```

##### Transform
Once conversion is complete, the following will be the message:
`Converted to <format> format: <IUPAC_condensed value>`

if an error occurs, an ERROR level message is:
`Failed conversion to <format>: <exception message>`

##### Load
The insertion should take place without issue, however just in case:
`<format value> committed to RDF`

All of the log messages will be associated to the Saccharide, which will contain the Accession Number.

## Batch Processes

The above section explained how the log system works and is integrated with the batch process.  The batch process and framework from the initial registration is described in detail in the [registration flow](/system/registration_flow) document.  The following will describe the continuously processing system after a glycan registration is complete.

## System Management

Batch processes are executed in a schedule or dependent upon other criteria.  Jenkins has been a reliable integration system used for GlyTouCan releases, and so this time used again internally for the management of scheduled system batches and their dependencies.

### Batch processes

As of this writing, the following batches will be executed on a regular schedule:

 - WURCS2 mass calculation
 - WURCS2 to IUPAC condensed conversion
 - WURCS2 to IUPAC extended conversion
 - IUPAC to GlycoCT conversion
 - WURCS2 topology generation
 - WURCS2 RDF generation
	 - Motif generation

These processes will be added to jenkins and scheduled to run on a 24 hour cycle.  Note the Motif generation will be dependent upon the WURCS2 RDF batch.