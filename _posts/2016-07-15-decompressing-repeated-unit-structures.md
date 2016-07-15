---
title: Decompressing Repeating Structures
authors:
- Nobuyuki Aoki
layout: post
categories: posts
---
## Natural structures versus Data Structures

Glycan structures can have a specific number of repeating monosaccharides.

![decompressed](http://beta.glytoucan.org/glycans/G00285OE/image?style=extended&format=png&notation=cfg)

However redundancy is not interesting so there are tendencies to compress them in a specific fashion.

![compressed](http://www.glycome-db.org/getSugarImage.action?id=15959&type=cfg)

The same can be said about the text sequences.

It should be noted that in all cases where there is a repeating structure with limited number of repeats, it is decompressed to have linkages fully defined and displayed.  Any textual format that indicates repeating structure will be decompressed.  This decompressed format will be used as a replacement for any queries or relations with other structures.

So when you request a search for the following:
![compressed](http://www.glycome-db.org/getSugarImage.action?id=15959&type=cfg)

GlyTouCan will assume you are actually searching for:
![decompressed](http://beta.glytoucan.org/glycans/G00285OE/image?style=extended&format=png&notation=cfg)
