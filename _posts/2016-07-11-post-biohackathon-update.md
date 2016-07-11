---
title: After the BioHackathon
authors:
- Nobuyuki Aoki
layout: post
categories: posts
---
## The Awakening

After being [in deep hibernation](http://code.glytoucan.org/posts/2016/02/24/cleaning-with-soap/) the notification for the yearly hackathon was released.  I had wanted to give a brief talk about the usability of stable, reliable, basically "enterprise" quality systems on RDF technology as the datastore.  [Slides here](https://docs.google.com/presentation/d/1iS-eE388WAz953UII0KcD8Fr1GsZ-z7KtZ5r6vGLe_U/edit?usp=sharing).  I think I got my point across, if you can recognize the source code in the slides, you will understand if SparqlBeans are for you.

It was quite an event, attending the [BioHackathon2016](http://2016.biohackathon.org/).  In most situations, for an introverted person like myself, being in a conference room for a week with a huge crowd and expecting to give talks every few days can be quite a stressful situation.  However this year, I made some changes by giving myself my much-needed recharge time and staying at a small hotel not far from the venue.

But I digress, the reason I felt it was quite an experience was because of the interaction with other bioinfo people.  Sharing our knowledge to get something big done.  Like last year, we made an effort to accomplish the holy grail of a perfect bridge between glycoinfo and cheminfo data.  This time we had a better strategy instead of the pitfall we fell into last year, of just hacking away at something.  We needed an overall plan with good test coverage to make sure the bridge was safe to pass.  So we needed to figure out how the bridge can be built, and then make sure we ran thousands of tests over it.

### Bridge Construction

After a long discussion about what interfaces exist and the formats they expect, we came down to a few formats to focus on.  These were chosen because of their standardization, publication, common use in the community, and resources behind the formats.
IUPAC is known by any chemist.  GlycoCT has been popular for over a decade and is common in a variety of public databases.  WURCS2 is the latest format being developed which was originally designed to be a bridge between chemistry and glycomics.  Out of the conversion programs that exist currently, it was possible to test with IUPAC->GlycoCT->WURCS2->IUPAC.

### Testing the bridge

The issue of format conversion has always been a lingering pain in the development of GlyTouCan.  After importing a variety of the glycoCT data directly into our system, a number of issues came about just converting them into WURCS, or even into a simple image format.

### Frameworks Proven

So the hackathon proved that these issues are the main roadblock behind the construction of a perfectly running bridge.  It was comforting to know that the original idea of having a [conversion framework](https://bitbucket.org/glycosw/glyconvert) is truly necessary and could quickly highlight the problem areas.  This is done simply by having standard unit test cases.  During the project, any specifically weird structure that caused issues was thrown into the test cases.  This was a form of challenge to the conversion programs to see if they could efficiently process even the extremely uncommon structures.  (as well as the most common knowledge ones, like say sucrose, or glucose) 

I wonder if we'll have the resources to be able to perfectly create the bridge.  Because not only do the formats need to be converted, the decision needs to be made upon if the extreme cases actually need to be added into the IUPAC standard.  This is beyond the scope of this blog post.

The good news is, there is a plan.  The plan should make clear what will be required for a whole new project-sized effort to propose, implement, test, accept, and complete.


### Back to Hacking

One of the things we really wanted to implement on the hacking side was to make use of theoretical data from the Unicorn publication.

So we were able to create a server, setup apache, play framework web interface, virtuoso backend to get a fully-fledged glyco informatic system up in a week.  [unicorn.glycoinfo.org](http://unicorn.glycoinfo.org/structure/87524) was just a bit of muscle-flexing showing off how easy it is to create these systems now from scratch with docker and cloud servers.
