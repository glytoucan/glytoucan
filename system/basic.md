---
title: Direct API Authentication
layout: default
---
* auto-gen TOC:
{:toc}

# Registering Structures Directly to API Server

The GlyTouCan Repository offers an API server to register glycan sequences as well as structured queries to the RDF data.  This document describes in detail how to access the server using common command line tools.  There is also a Java Client and a command line script.  All tool information is available at the [system](http://code.glytoucan.org/system//) documentation.

## Features

* Full web-based documentation
* Authentication method to register structures
* Various formats such as XML or JSON
* SOAP or REST request methods available

## Documentation

All documentation is generated and available directly over a browser from [api.glytoucan.org](https://api.glytoucan.org).

## Registering Structures

In order to store user-submitted data into the GlyTouCan RDF, authorization is required to authenticate the registrant.  Instead of using a username and password, GlyTouCan generates a specific User ID and API key.  The ID and key can be obtained via the [profile](https://glytoucan.org/Users/profile) page.

### Authentication Method

Basic Authentication over HTTPS is used to transfer the user authentication information.  This is not clear from the automatically generated documentation, as it is over a browser it prompts for a username and password.  How basic authentication is handled depends upon the tool being used, for curl, the --user parameter is required.  The documentation shows the format of the input variables, the following is a json example.

### Example

```
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --user <GTC User ID>:<GTC API Key>
655dbdc7739 -d '{ "sequence": "<sequence data>" }' 'https://api.glytoucan.org/glycan/register'
```

Note how the GlyTouCan User Id and API Key are passed in the basic authentication parameter.  The sequence data should be supplied in JSON format with the "sequence" key.

### Return Message

If all went well, the result will return a message in the following format:

```
{"timestamp":"2019-08-20T05:58:13.394+0000","status":"202","error":"","message":"532eaabd9574880dbf76b9b8cc00832c20a6ec113d682299550d7a6e0f345e25","path":"/glycan/register"}
```

In order to save some time for users, the API executes an exact string match search of the sequence sent, and if it already has an Accession Number, it is returned in the "message" field.  In all other cases, a reference tag is returned.  This tag can be used to  confirm the status of the submission on the [Entries](https://glytoucan.org/Users/structure) page.

### Technical Documentation

For more details on other requests, please refer to the [generated documentation](https://api.glytoucan.org).  Please contact us if there are any other structured queries that should be added, updated.
