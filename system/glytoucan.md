---
title: Glytoucan Front End Framework
layout: default
---

## A simple interface to complex data

As can be seen in the system diagram, four different systems and a multitude of dependent libraries are embedded in the site code in order to display the top page.  The following is a list of the different systems/tools that were used to generate the web interface, as well as future plans on the subject.
![Glytoucan System Architecture diagram](/images/system/glytoucan-system-architecture.svg)

### Web MVC framework

CakePHP was chosen as the web framework and, after overcoming some hurdles, it has provided enough functionality to deliver what was necessary.  The requirements involved for creating a cakephp interface without it's own database backend added some complexity to the infrastructure, however that will be covered in the next chapter.

* [CakePHP](http://cakephp.org/)
* [source code](https://github.com/glytoucan/glytoucan-php)

### GlycanBuilder

The GlycanBuilder Vaadin version was used for a graphical interface to construct the glycan structures.  This interface was used for both searching and registering structures. 

* [source code](https://github.com/alternativeTime/GlycanBuilderVaadin7Version)

citation:

```
Campbell MP, Peterson R, Mariethoz J, Gasteiger E, Akune Y, Aoki-Kinoshita KF, Lisacek F, Packer NH.
 UniCarbKB: building a knowledge platform for glycoproteomics.
 Nucleic Acids Res. 2014 Jan 1;42(1):D215-21. PubMed PMID: 24234447.
```

### RINGS

As there are a variety of sequence formats available to describe a glycan, a robust method to convert the sequences was necessary.  The format stored within the glyspace database was GlycoCT.  Therefore it was necessary to convert any input sequence into this format in real-time.  The RINGS conversion web service was used to pass the correct format into the glyspace web service.

* [rings](http://rings.t.soka.ac.jp/)
* [rings conversion tool](http://rings.t.soka.ac.jp/cgi-bin/tools/utilities/convert/index.pl)

### TogoStanza

Once data was converted into RDF format, it was necessary to extract the data and present it with a specific design.  As it was possible to embed TogoStanza into CakePHP, this framework was used when interacting with the quadstore.  TogoStanza was another completely different service and so a separate server was constructed to provide the SPARQL query results.

* [TogoStanza](http://www.togostanza.org)

### glyspace

It should be noted here that the [glyspace](glyspace) web service has the functionality to generate images of a registered glycan.  This functionality was effectively used throughout the site to generate the structures' images.

* [glyspace](glyspace)

### <a name="i18n">&nbsp;</a>Internationalization

A completely new localization framework was also developed during this phase of the project.  By storing the translations within a different database, and caching the results locally as a JSON file, a quick and reliable translation service was created.  There was a minor change on the view side of the site to incorporate this method, but the end result is a robust and clean multilingual system.  Considering glytoucan.org is to be used for all countries globally, this was an important requirement for the site.

![Glytoucan Localization](/images/manual/localization.png)

* [glytoucan localization](https://bitbucket.org/glytoucan_localization/glytoucan_localization)

### <a name="futurework">&nbsp;</a>Future work

User-editable is the key word for version two.  We hope to have more social-esque functionality for nearly all of the pages, and have the data stored completely in RDF.  Adding social functionality will have privacy concerns, so some governing rules will have to be prepared for intent to be clear with everyone involved.
