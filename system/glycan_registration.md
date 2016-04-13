---
title: GlyTouCan Glycan Registration System Flow
layout: default
---
[TOC]

# Overview
This document describes the GlyTouCan Glycan Sequence Registration flow.

# Prerequisite

The [registration flow](/system/registration_flow.md) is a useful explanation of the high level functionality.

## Interface

The GlycoSequenceResourceProcess is the main interface that should be implemented, it indicates the required input.  In this case it is basically any String and User ID.
```
public interface GlycoSequenceResourceProcess extends ResourceProcess {
	public ResourceProcessResult processGlycoSequence(String sequence, String contributorId) throws ResourceProcessException;
}
```

How this is used will be explained below, with some background.

## Initial Input

As of this writing, the glycans are currently input into GlyTouCan using either a text sequence or graphical interface.  With respect to the graphical interface, the resulting structure is actually converted into a GlycoCT sequence format and pushed into the same process as the text interface.

## Primary Validation Module Example

The primary validation module is then executed, it will be used as an example to explain the GlycoSequence registration framework.

### Test Case

The test case should be used to describe the specification.

```
@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = { WurcsSequenceResourceProcessConfig.class, VirtSesameDAOTestConfig.class })
public class WurcsSequenceResourceProcessTest {

	@Autowired
	GlycoSequenceResourceProcess wurcsSequenceResourceProcess;
	
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
	public void testProcessGlycoSequenceGlycoctExisting() throws Exception {
		// from org.glycoinfo.convert.ConvertTest
		String glycoct = "RES\n" + "1b:x-dglc-HEX-1:5";
		
		ResourceProcessResult result = wurcsSequenceResourceProcess.processGlycoSequence(glycoct, "0");
		
		Assert.assertTrue(result.getLogMessage().getStatus().equals(Status.WARNING));
		Assert.assertTrue(result.getLogMessage().getDescription().contains("G15021LG"));
	}
	
	/**
	 * New Sequence and Conversion test case.  Not registered so should be success.
	 * Test method for {@link org.glycoinfo.rdf.glycan.wurcs.WurcsSequenceResourceProcess#processGlycoSequence(java.lang.String)}.
	 */
	@Test
	@Transactional
	public void testProcessGlycoSequenceGlycoctNew() throws Exception {
		String glycoct = "RES\n"
				+ "1b:x-dgro-dgal-NON-2:6|1:a|2:keto|3:d\n"
				+ "2b:x-dgal-HEX-1:5\n"
				+ "3b:x-llyx-PEN-1:5\n"
				+ "4s:n-acetyl\n"
				+ "5s:n-acetyl\n"
				+ "LIN\n"
				+ "1:1o(-1+1)2d\n"
				+ "2:2o(-1+1)3d\n"
				+ "3:2d(2+1)4n\n"
				+ "4:1d(5+1)5n";
		
		ResourceProcessResult result = wurcsSequenceResourceProcess.processGlycoSequence(glycoct, "0");
		
		Assert.assertTrue(result.getLogMessage().getStatus().equals(Status.SUCCESS));
	}
}

```

The module is meant to accept any sequence string and convert it into the appropriate WURCS format sequence.  For all conversions, the [GlyConvert](https://bitbucket.org/glycosw/glyconvert) library will be used.  It detects the sequence format and then converts it into WURCS.

Once the wurcs format is available, a search is executed to confirm if it has already been registered.  If already registered, the accession number will be returned.

If it has not been registered and is a newly defined unique wurcs sequence, then a new accession number will be returned and the GlycoSequence class inserted.

Note the simplicity of this functionality.  It is very modular and can be reused in other programs.  It is used by the [GlyTouCan API](http://api.glytoucan.org) in order to quickly return an accession number.

The source code for the actual WurcsSequenceResourceProcess module can be found [here](https://github.com/glytoucan/batch/blob/bbb539915d9714d1432d74c2be5d59bed65e13ea/src/main/java/org/glycoinfo/rdf/glycan/wurcs/WurcsSequenceResourceProcess.java)

## SparqlDAO

More details on SparqlDAO and SparqlBeans can be found at the [GlyTouCan Batch project](/batch).

> Written with [StackEdit](https://stackedit.io/).