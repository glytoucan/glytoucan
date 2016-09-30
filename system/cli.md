---
title: GlyTouCan Command Line Interface to API
layout: default
---
* auto-gen TOC:
{:toc}

# GlyTouCan Client CLI

The GTCC is a command line interface to the GlyTouCan API.

It is primarily written in groovy.

##  Requirements
1. This is a unix script.  This has not been tested on windows, but it probably could be converted to a bat file.  Please take a look at simple.groovy, a simple groovy script that can execute a request.
1. [Java 8](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
1. [Groovy](http://groovy-lang.org/download.html)
  1. it is recommended to install using the SDK.io method
1. Your Contributor ID*
1. Your API Key*
1. If you want to register your database id links, your URL template must be registered with the [Partner Program](http://code.glytoucan.org/partner/registration/)

*The ID and key can be obtained via the [profile](https://glytoucan.org/Users/profile) page

## Installation
`git clone https://github.com/glytoucan/databaseSync.git`

## Configuration
The gtc command is the glytoucan command line interface.  This is actually a simple script using /usr/bin/groovy as the interpreter.  If your groovy installation has the groovy application in a different location, please configure the first line in the gtc file: `#!/usr/bin/groovy`

## Usage

To register a single sequence:
`groovy gtc -u [contributor id] -a [API key] -s [sequence]`

This will register the sequence if it does not exist, and return the Accession Number.

To register sequences in a csv file:
`groovy gtc -u [contributor id] -a [API key] -c [csvFile]`

The first line will be ignored as it will be expected to be a header.
It will read every cell in the CSV file and attempt to register it as a glycan sequence.

### On first execute, why is it stuck?

The first time this is run, groovy will download the dependencies required by the client.  This is a few megabytes of libraries (approximately 30MB) and may take some time depending on your network connection.

## Examples

`groovy gtc -u 254 -a abcdefghijklmnopqrstuvwxyz1234567890== -s "RES\n1b:b-dglc-HEX-1:5\n2s:n-acetyl\n3b:b-dgal-HEX-1:5\nLIN\n1:1d(2+1)2n\n2:1o(4+1)3d\n"`

GlycoCT - note the carriage returns are "\n"

`groovy gtc -u 254 -a abcdefghijklmnopqrstuvwxyz1234567890== -s "WURCS=2.0/2,2,1/[a2122h-1b_1-5_2*NCC/3=O][a2112h-1b_1-5]/1-2/a4-b1"`

Register a WURCS sequence.

## Features

* recognizes the sequence format automatically

## Linking Partner ID

After registration and confirmation from [GLIC](http://glic.glycoinfo.org) that your Contributor ID is registered to your Organization, it will be possible to link the IDs of your website so that it will appear on the Glycan Entry page under the "External Ids" section.


## Notes

1. For some formats, the carriage return characters must be replaced with "\n".
1. Because of "\n", the entire sequence must be in quotes (see example).