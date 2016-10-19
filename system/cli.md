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
1. [Groovy](http://groovy-lang.org)
  1.  Tested only on version 2.4
  1.  it is recommended to install using the [SDKMAN! method](http://groovy-lang.org/download.html) as described in the groovy download page.
1. Your Contributor ID*
1. Your API Key*
1. If you want to register your database id links, your URL template must be registered with the [Partner Program](http://code.glytoucan.org/partner/registration/)

*The ID and key can be obtained via the [profile](https://glytoucan.org/Users/profile) page.

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

The CSV file is expected to have at least one column.  The first row is not considered data and expected to be a header.  One column must contain the word "sequence" and all data below it will be considered a sequence format.


### On first execute, why is it stuck?

The first time this is run, groovy will download the dependencies required by the client.  This is a few megabytes of libraries (approximately 30MB) and may take some time depending on your network connection.

## Examples

`groovy gtc -u 254 -a abcdefghijklmnopqrstuvwxyz1234567890== -s "RES\n1b:b-dglc-HEX-1:5\n2s:n-acetyl\n3b:b-dgal-HEX-1:5\nLIN\n1:1d(2+1)2n\n2:1o(4+1)3d\n"`

GlycoCT - note the carriage returns are "\n"

`groovy gtc -u 254 -a abcdefghijklmnopqrstuvwxyz1234567890== -s "WURCS=2.0/2,2,1/[a2122h-1b_1-5_2*NCC/3=O][a2112h-1b_1-5]/1-2/a4-b1"`

Register a WURCS sequence.

## Features

* recognizes the sequence format automatically

# Linking Partner ID

After registration and confirmation from [GLIC](http://glic.glycoinfo.org) that your Contributor ID is registered to your Organization, it will be possible to link the IDs of your website so that it will appear on the Glycan Entry page under the "External Ids" section.

This will require [registration](http://code.glytoucan.org/partner/registration/) and then confirmation.

To register a single sequence with your id:

`groovy gtc -u [contributor id] -a [API key] -s [sequence] -p [your id]`

This will register the sequence if it does not exist, and return the Accession Number.  The linkage will be formulated from the organizational information 

To register sequences in a csv file:

`groovy gtc -u [contributor id] -a [API key] -c [csvFile]`

The CSV file format is described above.  Another column must contain "ID",  with your id in the rows below.  The sequence on the same row will be linked to this id.

example CSV file:
```
id,sequence
"1","WURCS=2.0/2,2,1/[a2122h-1b_1-5_2*NCC/3=O][a2112h-1b_1-5]/1-2/a4-b1"
"2","WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a1221m-1a_1-5][a2112h-1b_1-5]/1-2-3/a3-b1_a4-c1"
"3","WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a2112h-1b_1-5][Aad21122h-2a_2-6_5*NCC/3=O]/1-2-3/a4-b1_b3-c2"
"4","WURCS=2.0/3,3,2/[a2122h-1x_1-5_2*NCC/3=O][a2112h-1b_1-5][a1221m-1a_1-5]/1-2-3/a3-b1_a4-c1"
```

## Notes

1. For some formats, the carriage return characters must be replaced with "\n".
1. Because of "\n", the entire sequence must be in quotes (see example).
2. Since WURCS contains "," in the sequence, it should be in quotes.
2. [Partner Registration in Japanese](http://code.glytoucan.org/partner/registration_ja/)
