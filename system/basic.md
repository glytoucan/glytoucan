---
title: REST API Client Authentication
layout: default
---
* auto-gen TOC:
{:toc}

# API server

The GTC REST API has an automatically generated [documentation](htts://api.glytoucan.org) site.  Registering data requires user authentication.  This document will provide more detail regarding how to encode the authentication information securely.

## Quick Start

An open-source collection of scripts used to interface with the API is available.  These utilize common unix command line software such as curl.

`git clone https://github.com/glytoucan/databaseSync.git`

```
./curlRegister.sh <GTC Contributor ID> <GTC API Key> <sequence data>
```

*Please Note*
Please be carefully to escape some characters such as ‘$’ that may be contained within some sequence data when using the command line scripts.

## New Submissions page (Aug 2019)

If you login to the GlyTouCan [Entries](https://glytoucan.org/Users/structure) page, the data sent over command line can be confirmed.

## Registering Structures

In order to store user-submitted data into the GlyTouCan RDF, an authorization check is required to authenticate the registrant.  Instead of using a username and password, GlyTouCan generates a specific Contributor ID and API key.  The ID and key can be obtained via the [profile](https://glytoucan.org/Users/profile) page.

### Authentication Method

Basic Authentication over HTTPS is used to transfer the user authentication information.  This is not clear from [documentation](https://api.glytoucan.org) (as it does not support basic authentication).  If accessed directly over browser it will prompt for a username and password, if the user id and api key is supplied, the request will be processed.  How basic authentication is handled depends upon the tool being used, for curl, it is the `--user` parameter.  The following is a json example.

#### Example

```
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --user <GTC Contributor ID>:<GTC API Key> -d '{ "sequence": "<sequence data>" }' 'https://api.glytoucan.org/glycan/register'
```

Note how the GlyTouCan Contributor Id and API Key are passed in the basic authentication parameter.  The sequence data should be supplied in JSON format with the "sequence" key.

### Return Message

If all went well, the result will return a message in the following format:

```
{"timestamp":"2019-08-20T05:58:13.394+0000","status":"202","error":"","message":"532eaabd9574880dbf76b9b8cc00832c20a6ec113d682299550d7a6e0f345e25","path":"/glycan/register"}
```

The message field indicates a reference tag to the submission.  This tag can be used to confirm the status of the submission on the [Submissions](https://glytoucan.org/Users/structure) page.

### Samples

We've provided sample scripts to access the API.

#### Installation

`git clone https://github.com/glytoucan/databaseSync.git`

#### Register an entry

The above curl command is in the curlRegister.sh script.

```
aoki@bluegold:~/workspace/databaseSync$ ./curlRegisterTest.sh  <GTC Contributor ID> <GTC API Key> CLITest
{"timestamp":"2021-01-05T10:10:16.972+0000","status":"202 ACCEPTED","error":"","message":"bdb497c8f2b103451a6320f765853e2c6c6c5c6dc64aec7ca5b48c96b0658675","path":"/glycan/register"}
```

*Please Note:*
The scripts ending with Test.sh are hard-coded to access the test environment using the test domain name.  To submit to the main site, use the scripts without "Test".


#### Register entries


The above curl command is in the curlRegisterFile.sh script.

```
 % ./curlRegisterFile.sh <GTC Contributor ID> <GTC API Key> <WURCS File Path>
```

* WURCS File Sample (curlWURCSfileSample.txt)

```
WURCS=2.0/4,4,3/[a2122h-1b_1-5][a2112h-1b_1-5][a2112h-1a_1-5][a2112h-1b_1-5_2*NCC/3=O]/1-2-3-4/a4-b1_b4-c1_c3-d1
WURCS=2.0/3,3,2/[a2122h-1b_1-5][a2112h-1b_1-5][a2112h-1a_1-5]/1-2-3/a4-b1_b3-c1
WURCS=2.0/2,2,1/[a2122h-1b_1-5_2*NCC/3=O][a2112h-1b_1-5]/1-2/a3-b1
WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a2112h-1b_1-5][a1221m-1a_1-5]/1-2-3/a4-b1_b2-c1
WURCS=2.0/3,3,2/[a2122h-1b_1-5_2*NCC/3=O][a2112h-1b_1-5][a2112h-1a_1-5]/1-2-3/a3-b1_b3-c1
```

* result

```

{"timestamp":"2022-01-24T07:54:46.215+0000","status":"202 ACCEPTED","error":"","message":"4cb90c263974f9b4c538bcaf438d8ba3bebbd1b0694fa81d6b1532606e6022c7","path":"/glycan/register"}
{"timestamp":"2022-01-24T07:54:46.376+0000","status":"202 ACCEPTED","error":"","message":"1c784fa0e83738c63bb050b7008d1c21bb5a0bf8bafae172c5309fe41dabdd4a","path":"/glycan/register"}
{"timestamp":"2022-01-24T07:54:46.524+0000","status":"202 ACCEPTED","error":"","message":"236f3085b9d49675d2403f67dcda898553a004a3d6248311b259d4e32c379014","path":"/glycan/register"}
...
```

*Please Note*
The scripts ending with Test.sh are hard-coded to access the test environment using the test domain name.  To submit to the main site, use the scripts without "Test".

#### Partner API

If you have registered as a [partner](http://code.glytoucan.org/partner/), the API offers partner-specific functionality.

##### Important Note Regarding Contributor ID

It is highly recommended to create a "service account" email address in order to maintain the linkage data between glytoucan and your organization.  This way it will be possible to share this account with other trusted maintainers of your database, without giving away any private passwords.

To create a service account, all that is necessary is to create an account such as "myDatabaseSupport@gmail.com", confirm the email once registered, and then login to GlyTouCan with this account.  Please be sure to confirm the email is verified as GlyTouCan does not accept submissions from users without a confirmed email address.

As GlyTouCan can handle multiple users to a database, the service account can be added later once you are ready.  Please use the contributor id and api key for this account.  This information is available on the profile screen once you have logged in.

##### Partner Page

First be sure to login to the GTC site with the email address registered as a partner.

Each entry page will recognize if you are a partner, and will offer a link to the partner page.  Here is a direct link to the [G46677TE Partner page](https://glytoucan.org/Partner/Glycans/G46677TE).

##### Add Partner ID

Add a new partner id `test0`.

```
aoki@bluegold:~/workspace/databaseSync$ ./curlPartnerAdd.sh userID apiKEY G51902CJ test0
```

##### Edit Partner ID

Modify the `test0` id to `test1`.

```
aoki@bluegold:~/workspace/databaseSync$ ./curlPartnerEdit.sh userID apiKEY G51902CJ test1 test0
```

##### Remove Partner ID

Delete the `test1` id.

```
aoki@bluegold:~/workspace/databaseSync$ ./curlPartnerDelete.sh userID apiKEY G51902CJ test1
```

The following is a sample result return:

```
{"timestamp":"2020-07-02T05:47:11.996+0000","status":"202","error":"","message":"test0 for WURCS=2.0/3,3,2/[a1122h-1x_1-5][Aad21122h-2x_2-6_5*NCC/3=O][Aad21122h-2x_2-6_5*NCCO/3=O]/1-2-3/a?-b2_b?-c2 deletion submitted.  Please check https://glytoucan.org/Users/structure for status.","path":"/glycan/register"}
```

Note that it searches for the sequence and updates ResourceEntry class directly.


#### Partner Test

* Test GlytouCan site: https://gtc.beta.glycosmos.org

##### Add Partner ID Test with csv file

```
$ php PartnerAddNaviTest.php {Contributor ID} {API Key} {csv file path}
```

##### Remove Partner ID Test with csv file

```
$ php PartnerDeleteNaviTest.php {Contributor ID} {API Key} {csv file path}
```

##### Test CSV file

```
G42666HT,5T89
G81067MN,5TA0
G84576DT,5TA5
G42666HT,5XRT
G42666HT,5XWS
G42666HT,5XWU
...
```


### Technical Documentation

For more details on other requests, please refer to the [generated documentation](https://api.glytoucan.org).  Please contact us if there are any other structured queries that should be added, updated.
