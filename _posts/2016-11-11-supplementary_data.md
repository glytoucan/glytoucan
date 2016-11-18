---
title: Registering supplementary data
authors:
- Nobuyuki Aoki
layout: post
categories: posts
---
# Accepting User Data

## The core values

There are many philosophies behind how a web-based system should be structured, and one major issue is how much user-supplied information should be incorporated into the system.

At it's core, GlyTouCan is very simple.  When one considers a "repository to identify structures" the keywords here are identify and structure.  At the least, the repository would store two items: a standard method of representing a structure, and an identifier.  To take this idea even further, if the structure can be represented in a *unique fashion* the representation itself could be considered the identifier, thus leaving only one field required.

What this means is that GlyTouCan will eventually have to replace the randomly-generated identifiers with a unique representation method, similar to Inchi.  This is important to consider for future work.

## Clarifying Curation

Considering the above, there would be limited curation required for the repository.  This is because the primary role of the repository is to hold a unique identifier.  If the underlying structure attached to the identifier is invalid or incorrect, then the importance of the identifier would naturally decrease.  Citing this type of identifier is simply the same as referring to an invalid structure.

This methodology is necessary for the more realistic requirements: GlyTouCan does not have a full-time support staff; it should be considered that the amount of GlyTouCan-specific maintenance resources is zero.

With this in mind, the amount of curation required for other user-input data should be handled in the same method.  However, zero support is not future-proof, a volunteer-based group of moderators is required.

The GlyTouCan Partner program exists as part of the GlycoInformatics Coalition to provide collaboration and support between Glycomics researchers, including both biological and information technology specialists.  GlyTouCan users that are members of a partner organization would be considered to have a Moderator-role.  These two roles of regular user and moderator can be utilized for all  supplementary data fields.

### Supplementary Data

Before describing in detail the accepted data fields, it should be noted how this data is accepted from the system.  On each [Glycan Entry](https://glytoucan.org/Structures/Glycans/G00055MO) page, a button links to a Register Supplementary Data Page.  This page will display the base structural information, and fields below will allow user input for each supplementary data type accepted.

In all cases, Spam-prevention will be implemented with an Image Captcha method.

#### Literature

One of the first requests regarding supplementary information was to attach associated publications in which structures are referenced.  Sample data for this case was already provided by partner databases, and can be seen on the [Glycan Entry](https://glytoucan.org/Structures/Glycans/G00055MO) under the Literature section.

This utilizes a pubmed id to link to, like the following:

[9565568](http://identifiers.org/pubmed/9565568)

##### Permissions

Any registered user will have the ability to submit a pubmed id similar to the glycan structure text input.  This will be implemented with the standard GlyTouCan System framework, starting with the API and having the web interface interact with the API server.

There should exist a method to maintain this data with removal functionality.  However any registered user should not be able to freely remove these id's that other users have submitted.  A higher-level trusted user - a moderator role - is needed to be able to have other users remove this data.

Therefore any user that is a member of a partner organization will have the ability to remove literature id's associated to structures.  This will be implemented with the client interface, as having a delete button on a web page will be prone to mistakes.

##### Curation

The amount of curation involved for this is limited.  There is no realistic method of checking to confirm if the structure truly exists within the publication, the user will be trusted with this responsibility.

One level of curation is utilizing the [NCBI API](https://www.ncbi.nlm.nih.gov/home/develop/api.shtml) to confirm the id truly exists and the link will not be broken to a 404 error message.

### Status

This document is the first proposal of this functionality.  Screenshot images and other details will be added as development progresses.  Once implementation and release is complete, this document will be moved to the core support documentation.