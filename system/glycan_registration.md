---
title: GlyTouCan Glycan Registration System Flow
layout: default
---
[TOC]

# Overview
This document describes the GlyTouCan Glycan Sequence Registration flow System.  Please refer to the [manual](http://code.glytoucan.org/manual) for specifics regarding the user interface.

# Prerequisite

The [registration flow](/system/registration_flow.md) explains the background of this module and high-level functionality.

This will cover the case of a single sequence string, the format does not need to be specified.  So the only input will be a string and the user id submitting it.

# Initial Validation
As of this writing, glycan structures are currently input into GlyTouCan using either a text sequence or graphical interface.  With respect to the graphical interface, the resulting structure is actually converted into a GlycoCT sequence format and pushed into the same process as the text interface.  The [API](http://api.glytoucan.org) also accepts input directly.

As the repository is not curated, the validation of the initial input is limited to a single WURCS format conversion process.  If an error occurs at this point, a response is immediately returned, as registration is not acceptable.  The conversion process utilizes the [GlyConvert](http://bitbucket.org/glycoSW/glyconvert) project.  Please refer to the test cases and conversion status for any conversion issues that may arise with the format used to submit the sequence.  As of this writing, GlycoCT can be converted without issue into WURCS.

A log entry is created with the sequence text and any related information.  Please refer to this log for details regarding your submission.

If the WURCS is valid, then an accession number is created at this point.  The initially input sequence string is also stored, with the format that was detected.  This is all that is necessary to register the structure.  However from the new structural information the data will be enriched with information existing in the structure as well as relations to other structures in the repository.

From a user perspective, there is no more interaction necessary, other than checking the status of the registered information.  This can be tracked via links from the user's profile page.  The following is a technical explanation of what happens next in the system, specifically how to implement an enrichment module for the glycan registration process.

# Enrichment

Once submitted, the enrichment phase begins.  At regular intervals batch processes are run that contain a module which follow the ```GlycoSequenceResourceProcess``` interface.

## Interface

The ```GlycoSequenceResourceProcess``` is the main interface that should be implemented, it is basically the aforementioned user submitted data, which is any String and User ID.
```
public interface GlycoSequenceResourceProcess extends ResourceProcess {
	public ResourceProcessResult processGlycoSequence(String sequence, String contributorId) throws ResourceProcessException;
}
```

As an example, the WURCS to IUPAC conversion process will be used.

### Test Case

A test case best describes the specification:

```
@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = { WurcsToIupacSequenceResourceProcessConfig.class, VirtSesameDAOTestConfig.class })
public class WurcsToIupacSequenceResourceProcessTest {

	@Autowired
	GlycoSequenceResourceProcess wurcsToIupacSequenceResourceProcess;
	
	/**
	 * Base case test of a blank sequence.  Expected to throw exception as the sequence format cannot be detected.
	 * 
	 * Test method for {@link org.glycoinfo.rdf.glycan.wurcs.WurcsSequenceResourceProcess#processGlycoSequence(java.lang.String)}.
	 */
	@Test(expected=ResourceProcessException.class)
	public void testProcessGlycoSequenceBlank() throws Exception {
		// from org.glycoinfo.convert.ConvertTest
		ResourceProcessResult result = wurcsSequenceResourceProcess.processGlycoSequence("", "0");
		
		Assert.assertTrue(result.getLogMessage().getStatus().equals(Status.ERROR));
	}
	
	/**
	 * Already registered and Conversion test case.  Already registered as G15021LG.
	 * Test method for {@link org.glycoinfo.rdf.glycan.wurcs.WurcsSequenceResourceProcess#processGlycoSequence(java.lang.String)}.
	 */
	@Test
	@Transactional
	public void testProcessGlycoSequenceExisting() throws Exception {
		// from org.glycoinfo.convert.ConvertTest
		String initial = "WURCS=2.0/1,1,0/[x2122h-1x_1-5]/1/";
		
		ResourceProcessResult result = wurcsSequenceResourceProcess.processGlycoSequence(initial, "1");
		  Assert.assertTrue(result.getLogMessage().getStatus().equals(Status.SUCCESS));
		Assert.assertTrue(result.getLogMessage().getDescription().contains("-R"));

// confirm it exists
String confirm = "PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>
SELECT distinct *
WHERE { 
?s a glycan:saccharide .
       ?s glytoucan:has_primary_id "G15021LG" .
       ?s glycan:has_glycosequence ?gseq .
       ?gseq glycan:has_sequence ?Seq .
       ?gseq glycan:in_carbohydrate_format glycan:carbohydrate_format_iupac .
 }
limit 1";

	}
	
}

```

The module expects a wurcs sequence string and converts it into the appropriate IUPAC format sequence.  For all conversions, the [GlyConvert](https://bitbucket.org/glycosw/glyconvert) library will be used.  It expects a WURCS sequence and returns the IUPAC format.

The source code for the actual WurcsToIupacSequenceResourceProcess module can be found [here](https://github.com/glytoucan/batch/blob/bbb539915d9714d1432d74c2be5d59bed65e13ea/src/main/java/org/glycoinfo/rdf/glycan/wurcs/WurcsSequenceResourceProcess.java)

In most cases, the ResourceProcess is just a bridge layer between the batch process and libraries that exist to enhance data.

## SparqlDAO

More details on SparqlDAO and SparqlBeans can be found at the [GlyTouCan Batch project](/batch).

> Written with [StackEdit](https://stackedit.io/).