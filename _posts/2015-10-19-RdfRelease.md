---
title: Google signin and our article
authors:
- Nobuyuki Aoki
layout: post
categories: posts
---
## We have been very busy these three months since the last release.  Here are a few of the highlights:

The life of a system developer is never easy.  In 90% of the work done the results are not visible to the end user.  For this release, it is very true.

### Google Signin!

Possibly the first noticable difference is a new login and registration process.  Glycan Registration is clearly visible on the menu while the signin methods are just a few clicks using a Google account.  The other 80% technical upgrades will be explained below.

### Publication online!

It is official, our article is now available via [Pubmed](http://www.ncbi.nlm.nih.gov/pubmed/26476458).  Here is the doi:10.1093/nar/gkv1041.  My favorite section is the [Supplementary Data](http://nar.oxfordjournals.org/content/suppl/2015/10/15/gkv1041.DC1) *mmm juicy data*  It explains how the sparql endpoint should be used and how much better it is compared to standard REST-based web services.

### other fixes:

* The monosaccharide composition section of GlyTouCan entries lacked some substituents such as sulfate.
* The GlycoCT example code used for a text query did not reveal a result.
* When clicking on a "Show full list of motifs / monosaccharides" link in the search results, the scrollbar was not working properly for Firefox browsers on windows.

### RDF'd

Altering the core functionality of how an application communicates with backend data should never be considered lightly.  However when it came to the overall development process, and the other new functionality that we wanted to implement, using multiple programming languages for no real benefit started to make less and less sense.  In the last release we were using PHP, Java, Sparql, and SQL.  It also required apache w/ php, tomcat, virtuoso, and postgresql servers.  Amazingly, utilizing [docker](http://docker.io) and jenkins helped to hold the wild frankensteining thing together, but I could see it hindering us in the long run.

Thus, an overhaul had to be done.  The php and database were removed, leaving behind a simpler 2-tier architecture of java and sparql.  So now both the HTML framework and the web services are using the same codebase, and only interacting with one data source, the RDF.  I had to rewrite all of the web services that we were using so that it could interact with RDF.  Thus the architecture explained in the article is still there, it's just that the process involved to synchronize the databases is less involved, as there is only one data store.

I should have run some speed tests to see the performance of displaying each page with this overall redesign, but I can just feel the difference clicking through the pages.  Spring Boot has been amazing and shows how thoroughly tested it has been over the years, it always seems to have a solution for any issue that has come up.

I guess that's enough geek talk, the [architecture pages](http://code.glytoucan.org/system/) on our site will be udpated soon for anyone interested.
