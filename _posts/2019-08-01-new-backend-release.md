---
title: August 2019 Release
authors:
- Nobuyuki Aoki
layout: post
categories: posts
---

# August 2019 release

This past week, a major release and infrastructure change was made to the GlyTouCan system.  Here is a brief rundown of features and then a more detailed explanation of how these changes will impact users.

It has been a while since the last post.  One reason is that the initial GlyTouCan project officially ended, while planning and expansion of the system was included into the new <a href="https://glycosmos.org">GlyCosmos Project</a>.

## Main Features

* New Registration flow, any structure format or nomenclature accepted.
* More transparency of how inputted structures are detected, converted, validated, etc.
* Background batch-processing framework introduced.
* Audited data conversion/modification/validation.
* Image background processing.
* New Server Hardware
* New [Entries](https://glytoucan.org/Users/structure) page which shows all previous registration requests.
* New UI methodology

### Questions Answered

This release answers a lot of questions that we were receiving.  In particular the following:

* "Why can't I input my structure in IUPAC/GlycoCT/KCF/... format?"
* "I have doubts about this structure, how was it generated?"
* "The image is wrong!"

## New structure registration changes

One of the main issues with the initial design of the repository, was the validation process.  The previous validation method was as a general rule, the following: "If the structure could be converted into WURCS, then it was accepted".  The problem with this policy is that it is ambiguous in important audit information such as conversion methods and specification versions.  This showed how the system was not future-proof, and so a major architecture shift was required.

This release introduces a new registration flow.  The new general rule is the following: "Any structure sequence format is accepted".  Once accepted, the submission will be given a reference tag.  This tag can be used to lookup the structure at a later time.  In case this tag is lost, all previously submitted structures are displayed in the new personalized [Entries](https://glytoucan.org/Users/structure) page.

Multiple batch processes are executed to detect the format, convert it to WURCS(if necessary), validate it, assign an Accession Number, generate the image etc.

The status of these batch processes will be visible through the Entries page as well as the detailed entry page of each structure submitted.  An "Accession Number registration batch" will assign the structure once it has been validated, converted, etc.

### Detailed Example

1. Registration of WURCS structure
1. Format Detection
1. WURCS Validation
1. Accession Number Generation

The first batch process is a simple "structure format detection" batch.  It is meant to organize structures into specific formats so that it will be more obvious what batch process needs to run next.  This will detect the structure as WURCS and add a new RDF triple indicating that the structure has a format of "wurcs".

The next batch process contains logic to search only for structures labeled as "wurcs", and validates them.  A specific WURCS library is used which reads the structure in and outputs warnings or error messages.  These warnings and error messages are now stored into the RDF and linked to the structure.  If there are error messages, it is not considered validated.  Since the warnings and error messages are now stored, the reason why the validation failed can now be displayed to the user on the Entries page.

The next process searches for validated structures, and contains logic to see if the structure was already registered or not.  If registered it will assign the resulting Accession Number.  Otherwise it will generate a new Accession Number for the new structure.  Once the Accession Number is assigned, the previous GlyTouCan system will continue to run as normal.

### Known issues

The GlycoCT conversion to WURCS batch process is not complete.  It will be introduced within the next few weeks.

## New Image Batch Processing

A new image generation batch process will convert the input structures into multiple notations and formats.  All of the different combinations of SNFG, CFG, IUPAC and SVG, PNG will be generated and stored locally.  The main problem why there were weird images appearing was because the previous system was generating the image in real-time for every user request.  Since this CPU intensive process is not put off into the background, now each request will be a simple read of the data.
