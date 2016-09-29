---
title: GlyTouCan Command Line Interface to API
layout: default
---
* auto-gen TOC:
{:toc}

# Welcome to the GlyTouCan Client CLI!

The GTCC is a command line interface to the GlyTouCan API.

It is primarily written in groovy.

##  Requirements
1. This is a unix script.  This has not been tested on windows, but it probably could be converted to a bat file.  Please take a look at simple.groovy, a simple groovy script that can execute a request.
1. [Java 8](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
1. [Groovy](http://groovy-lang.org/download.html)
1. Your Contributor ID*
1. Your API Key*
1. If you want to register your database id links, your URL template must be registered with the [Partner Program](http://code.glytoucan.org/partner/registration/)

*The ID and key can be obtained via the [profile](https://glytoucan.org/Users/profile) page

## Installation
`git clone https://github.com/glytoucan/databaseSync.git`

## Configuration
The gtc command is the glytoucan command line interface.  This is actually a simple script using /usr/bin/groovy as the interpreter.  If your groovy installation has the groovy application in a different location, please configure the first line in the gtc file: `#!/usr/bin/groovy`

## Usage

`gtc -u [contributor id] -a [API key] -s [sequence]`

## Examples

`gtc -u 254 -a abcdefghijklmnopqrstuvwxyz1234567890== -s "RES\n1b:b-dglc-HEX-1:5\n2s:n-acetyl\n3b:b-dgal-HEX-1:5\nLIN\n1:1d(2+1)2n\n2:1o(4+1)3d\n"`

## Features

* recognizes the sequence format automatically

## Note

1. For GlycoCT, the carriage returns must be replaced with "\n".
1. Because of "\n", the entire sequence must be in quotes (see exaple).