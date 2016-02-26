---
title: Cleaning with SOAP
authors:
- Nobuyuki Aoki
layout: post
categories: posts
---
## We've hibernated into analysis phase

The end of the year gave us some time to breathe and look to the future.  I was able to meet some great people at [SFG](http://www.glycobiology.org/meetings.php) as well as work with Niclas' group in [Gothenburg](http://biomedicine.gu.se/biomedicine/research/niclas-karlsson).  It was not only a lot of fun, but also an enlightening experience.

I say this because it made us look again at the repository and think about how it's current interface works.  I will go into more detail here, but we did receive feedback from researchers that the interface is made for informatics people (us) and not really glyco-biologists.  This was a hard truth to face, and so we've huddled down to plan a complete revamp of the entire system.

### Build it, and they will come

The following is an excerpt of one of the specification articles I am writing.  It explains the hurdles we've faced and the one we are facing now.

The original GlyTouCan was released with a backend server that handled REST commands.  While REST is a straightforward and simple method of interfacing, it lead to a lot of complexity when programming for it.  The original release of GlyTouCan was actually based on a PHP interface, and the lack of REST frameworks/libraries available for PHP actually introduced more [unnecessary development and testing time](http://code.glytoucan.org/posts/2015/10/19/RdfRelease/), thus not soon after the release a few broad changes were implemented.

However we reached a roadblock again, after spending some time in Sweden with actual Mass Spectrometry researchers, it was found that users would rather not use a browser-only interface.  They primarily utilized Desktop applications to draw structures, which were uploaded into a local database.  It was also premature to assume that federated queries would be ready for all glycoinformatics organizations conducting research, so making use of the [endpoint](http://ts.glytoucan.org) was not an option.

So once again an architectural analysis was needed.  A simple interface that could be used by multiple applications, this time including desktop, with less development complexity (only a handful of programmers here).  As a prototype, a java-based REST [client](http://github.com/glytoucan/client) to the [API server](http://api.glytoucan.org) was implemented.  With the client it was possible to integrate into a Play Framework web application to the GlyTouCan repository (which uses Spring Framework).  This was a great first step and proved that this type of specialized-client-to-system could work.

However REST from the user or client-side required extra programming and testing which we had experienced before.  And just to get the prototype working required a lot of work.  Since we had utilized interfaces effectively it is still usable however the internals needed to be reworked in order to remove redundancy.

Thus the search for a more simple protocol that did not require a hand-stitched development phase.  As APIs are protocols, which are just definitions, a "contract-based" framework would be ideal.

Thus the SOAP protocol.

So currently working on a detailed document describing the WSDL, which will be referenced by all of the other new functionality being designed.

Current plan is to have all design documentation complete by the end of the Japanese fiscal year (End of March).  With development to start soon after.  Hoping to have a smooth development cycle with all of the thought put into the architecture. 

Slight updates to the [architecture pages](http://code.glytoucan.org/system/) describing the new client.

I was also able to use Google Container Engine to run one of our docker images, however some more work needs to be done to configure the containers to fit within our price range.  I also have doubts about the CPU processing we will need for the triplestore.
