---
title: SPARQL Query for GlycomeDB
layout: default
---
GlycomeDB RDFには、複数のパブリックデータベースのリンクが存在する。
一度で複数のDBの情報を取得しようとすると、組み合わせが膨大になり、動作が非常に重くなることがよくある。
そのため、各DBごとに分割したSPARQL Queryを使うほうが望ましい。


## Input 
Accession number  
VALUES ?AccessionNumber { "G00051MO" }  

### Output
GlycomeDB ID  
GlycomeDB URL  

```
    PREFIX dcterms: <http://purl.org/dc/terms/>
    PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
    PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
    PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

    SELECT DISTINCT ?AccessionNumber
    #GlycomeDB ID
    ?gurl ?gid
    FROM <http://rdf.glytoucan.org>
    FROM <http://rdf.glytoucan.org/core>
    FROM NAMED <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>
    FROM NAMED <http://rdf.glycoinfo.org/glycome-db>
    WHERE{
	    VALUES ?AccessionNumber { "G00051MO" }
	    ?glytoucan glytoucan:has_primary_id ?AccessionNumber.

	    GRAPH <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>{ 
		    ?glytoucan skos:exactMatch ?gdb .
		    ?gdb glycan:has_resource_entry ?gurl .
		    ?gurl dcterms:identifier ?gid .
	    }
	}

```

### Output
Carbbank(CCSD) ID  
Carbbank(CCSD) URL  

```
    PREFIX dcterms: <http://purl.org/dc/terms/>
    PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
    PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
    PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

    SELECT DISTINCT ?AccessionNumber
    # Carbbank(CCSD)
  	?res_ccsd ?ccsd_id
    FROM <http://rdf.glytoucan.org>
    FROM <http://rdf.glytoucan.org/core>
    FROM NAMED <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>
    FROM NAMED <http://rdf.glycoinfo.org/glycome-db>
    WHERE{
	    VALUES ?AccessionNumber { "G00051MO" }
	    ?glytoucan glytoucan:has_primary_id ?AccessionNumber.

	    GRAPH <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>{ 
		    ?glytoucan skos:exactMatch ?gdb .
		    ?gdb glycan:has_resource_entry ?gurl .
		    ?gurl dcterms:identifier ?gid .
	    }

    	# Carbbank(CCSD)
    	OPTIONAL{
    	GRAPH <http://rdf.glycoinfo.org/glycome-db>{
    		?gdb glycan:has_resource_entry ?res_ccsd .
    		?res_ccsd glycan:in_glycan_database glycan:database_carbbank .
    		?res_ccsd dcterms:identifier ?ccsd_id.
    	}}
	}

```

### Output
CFG ID  
CFG URL  

```
    PREFIX dcterms: <http://purl.org/dc/terms/>
    PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
    PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
    PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

    SELECT DISTINCT ?AccessionNumber
    # CFG
    ?res_cfg ?cfg_id
    FROM <http://rdf.glytoucan.org>
    FROM <http://rdf.glytoucan.org/core>
    FROM NAMED <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>
    FROM NAMED <http://rdf.glycoinfo.org/glycome-db>
    WHERE{
	    VALUES ?AccessionNumber { "G00051MO" }
	    ?glytoucan glytoucan:has_primary_id ?AccessionNumber.

	    GRAPH <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>{ 
		    ?glytoucan skos:exactMatch ?gdb .
		    ?gdb glycan:has_resource_entry ?gurl .
		    ?gurl dcterms:identifier ?gid .
	    }
    	# CFG
    	OPTIONAL{
    	GRAPH <http://rdf.glycoinfo.org/glycome-db>{
    		?gdb glycan:has_resource_entry ?res_cfg .
    		?res_cfg glycan:in_glycan_database glycan:database_cfg .
    		?res_cfg dcterms:identifier ?cfg_id.
    	}}
	}

```

### Output
GlycoO (link to xml page) ID  
GlycoO (link to xml page) URL 

```
    PREFIX dcterms: <http://purl.org/dc/terms/>
    PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
    PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
    PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

    SELECT DISTINCT ?AccessionNumber
    # GlycoO (link to xml page)
  	?res_glyco ?glyco_id
    FROM <http://rdf.glytoucan.org>
    FROM <http://rdf.glytoucan.org/core>
    FROM NAMED <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>
    FROM NAMED <http://rdf.glycoinfo.org/glycome-db>
    WHERE{
	    VALUES ?AccessionNumber { "G00051MO" }
	    ?glytoucan glytoucan:has_primary_id ?AccessionNumber.

	    GRAPH <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>{ 
		    ?glytoucan skos:exactMatch ?gdb .
		    ?gdb glycan:has_resource_entry ?gurl .
		    ?gurl dcterms:identifier ?gid .
	    }
    	# GlycoO (no web page)
    	OPTIONAL{
    	GRAPH <http://rdf.glycoinfo.org/glycome-db>{
    		?gdb glycan:has_resource_entry ?res_glyco .
    		?res_glyco glycan:in_glycan_database glycan:database_glyco .
    		?res_glyco dcterms:identifier ?glyco_id.
    	}}
	}

```

### Output
Glycobase lille ID  
Glycobase lille URL  

```
    PREFIX dcterms: <http://purl.org/dc/terms/>
    PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
    PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
    PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

    SELECT DISTINCT ?AccessionNumber
    # Glycobase lille
   	?res_base ?base_id
    FROM <http://rdf.glytoucan.org>
    FROM <http://rdf.glytoucan.org/core>
    FROM NAMED <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>
    FROM NAMED <http://rdf.glycoinfo.org/glycome-db>
    WHERE{
	    VALUES ?AccessionNumber { "G00051MO" }
	    ?glytoucan glytoucan:has_primary_id ?AccessionNumber.

	    GRAPH <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>{ 
		    ?glytoucan skos:exactMatch ?gdb .
		    ?gdb glycan:has_resource_entry ?gurl .
		    ?gurl dcterms:identifier ?gid .
	    }
    	# Glycobase lille
    	OPTIONAL{
    	GRAPH <http://rdf.glycoinfo.org/glycome-db>{
    		?gdb glycan:has_resource_entry ?res_base .
    		?res_base glycan:in_glycan_database glycan:database_glycobase_lille .
    		?res_base dcterms:identifier ?base_id.
    	}}
	}

```


### Output
GLYCOSCIENCES.de ID  
GLYCOSCIENCES.de URL  

```
    PREFIX dcterms: <http://purl.org/dc/terms/>
    PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
    PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
    PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

    SELECT DISTINCT ?AccessionNumber
    # GLYCOSCIENCES.de
    ?res_gde ?gde_id
    FROM <http://rdf.glytoucan.org>
    FROM <http://rdf.glytoucan.org/core>
    FROM NAMED <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>
    FROM NAMED <http://rdf.glycoinfo.org/glycome-db>
    WHERE{
	    VALUES ?AccessionNumber { "G00051MO" }
	    ?glytoucan glytoucan:has_primary_id ?AccessionNumber.

	    GRAPH <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>{ 
		    ?glytoucan skos:exactMatch ?gdb .
		    ?gdb glycan:has_resource_entry ?gurl .
		    ?gurl dcterms:identifier ?gid .
	    }
    	# GLYCOSCIENCES.de
    	OPTIONAL{
    	GRAPH <http://rdf.glycoinfo.org/glycome-db>{
    		?gdb glycan:has_resource_entry ?res_gde .
    		?res_gde glycan:in_glycan_database glycan:database_glycosciences_de .
    		?res_gde dcterms:identifier ?gde_id.
    	}}
	}

```

### Output
JCGGDB ID
JCGGDB URL

```
    PREFIX dcterms: <http://purl.org/dc/terms/>
    PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
    PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
    PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

    SELECT DISTINCT ?AccessionNumber
    # JCGGDB
    ?res_jcggdb ?jcggdb_id
    FROM <http://rdf.glytoucan.org>
    FROM <http://rdf.glytoucan.org/core>
    FROM NAMED <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>
    FROM NAMED <http://rdf.glycoinfo.org/glycome-db>
    WHERE{
	    VALUES ?AccessionNumber { "G00051MO" }
	    ?glytoucan glytoucan:has_primary_id ?AccessionNumber.

	    GRAPH <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>{ 
		    ?glytoucan skos:exactMatch ?gdb .
		    ?gdb glycan:has_resource_entry ?gurl .
		    ?gurl dcterms:identifier ?gid .
	    }
    	# JCGGDB
    	OPTIONAL{
    	GRAPH <http://rdf.glycoinfo.org/glycome-db>{
    		?gdb glycan:has_resource_entry ?res_jcggdb .
    		?res_jcggdb glycan:in_glycan_database glycan:database_jcggdb .
    		?res_jcggdb dcterms:identifier ?jcggdb_id.
    	}}
	}

```

### Output
KEGG ID
KEGG URL

```
    PREFIX dcterms: <http://purl.org/dc/terms/>
    PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
    PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
    PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

    SELECT DISTINCT ?AccessionNumber
    # KEGG
    ?res_kegg ?kegg_id
    FROM <http://rdf.glytoucan.org>
    FROM <http://rdf.glytoucan.org/core>
    FROM NAMED <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>
    FROM NAMED <http://rdf.glycoinfo.org/glycome-db>
    WHERE{
	    VALUES ?AccessionNumber { "G00051MO" }
	    ?glytoucan glytoucan:has_primary_id ?AccessionNumber.

	    GRAPH <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>{ 
		    ?glytoucan skos:exactMatch ?gdb .
		    ?gdb glycan:has_resource_entry ?gurl .
		    ?gurl dcterms:identifier ?gid .
	    }
    	# KEGG
    	OPTIONAL{
    	GRAPH <http://rdf.glycoinfo.org/glycome-db>{
    		?gdb glycan:has_resource_entry ?res_kegg .
    		?res_kegg glycan:in_glycan_database glycan:database_kegg .
    		?res_kegg dcterms:identifier ?kegg_id.
    	}}
	}

```


### Output
PDB ID  
PDB URL  

```
    PREFIX dcterms: <http://purl.org/dc/terms/>
    PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
    PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
    PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

    SELECT DISTINCT ?AccessionNumber
    # PDB
    ?res_pdb ?pdb_id
    FROM <http://rdf.glytoucan.org>
    FROM <http://rdf.glytoucan.org/core>
    FROM NAMED <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>
    FROM NAMED <http://rdf.glycoinfo.org/glycome-db>
    WHERE{
	    VALUES ?AccessionNumber { "G00051MO" }
	    ?glytoucan glytoucan:has_primary_id ?AccessionNumber.

	    GRAPH <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>{ 
		    ?glytoucan skos:exactMatch ?gdb .
		    ?gdb glycan:has_resource_entry ?gurl .
		    ?gurl dcterms:identifier ?gid .
	    }
    	# PDB
    	OPTIONAL{
    	GRAPH <http://rdf.glycoinfo.org/glycome-db>{
    		?gdb glycan:has_resource_entry ?res_pdb .
    		?res_pdb glycan:in_glycan_database glycan:database_pdb .
    		?res_pdb dcterms:identifier ?pdb_id.
    	}}
	}

```


# merge query
```
    PREFIX dcterms: <http://purl.org/dc/terms/>
    PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
    PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
    PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

    SELECT DISTINCT ?AccessionNumber
    #GlycomeDB ID
    ?gurl ?gid
    # Carbbank(CCSD)
    	?res_ccsd ?ccsd_id
    # CFG
    	?res_cfg ?cfg_id
    # GlycoO (link to xml page)
    	?res_glyco ?glyco_id
    # Glycobase lille
    	?res_base ?base_id
    # GLYCOSCIENCES.de
    	?res_gde ?gde_id
    # JCGGDB
    	?res_jcggdb ?jcggdb_id
    # KEGG
    	?res_kegg ?kegg_id
    # PDB
    	?res_pdb ?pdb_id

    FROM <http://rdf.glytoucan.org>
    FROM <http://rdf.glytoucan.org/core>
    FROM NAMED <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>
    FROM NAMED <http://rdf.glycoinfo.org/glycome-db>
    WHERE{
	    VALUES ?AccessionNumber { "G00051MO" }
	    ?glytoucan glytoucan:has_primary_id ?AccessionNumber.

	    GRAPH <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>{ 
		    ?glytoucan skos:exactMatch ?gdb .
		    ?gdb glycan:has_resource_entry ?gurl .
		    ?gurl dcterms:identifier ?gid .
	    }

    	# Carbbank(CCSD)
    	OPTIONAL{
    	GRAPH <http://rdf.glycoinfo.org/glycome-db>{
    		?gdb glycan:has_resource_entry ?res_ccsd .
    		?res_ccsd glycan:in_glycan_database glycan:database_carbbank .
    		?res_ccsd dcterms:identifier ?ccsd_id.
    	}}

    	# CFG
    	OPTIONAL{
    	GRAPH <http://rdf.glycoinfo.org/glycome-db>{
    		?gdb glycan:has_resource_entry ?res_cfg .
    		?res_cfg glycan:in_glycan_database glycan:database_cfg .
    		?res_cfg dcterms:identifier ?cfg_id.
    	}}

    	# GlyAffinity withhold

    	# GlycoO (no web page)
    	OPTIONAL{
    	GRAPH <http://rdf.glycoinfo.org/glycome-db>{
    		?gdb glycan:has_resource_entry ?res_glyco .
    		?res_glyco glycan:in_glycan_database glycan:database_glyco .
    		?res_glyco dcterms:identifier ?glyco_id.
    	}}

    	# Glycobase lille
    	OPTIONAL{
    	GRAPH <http://rdf.glycoinfo.org/glycome-db>{
    		?gdb glycan:has_resource_entry ?res_base .
    		?res_base glycan:in_glycan_database glycan:database_glycobase_lille .
    		?res_base dcterms:identifier ?base_id.
    	}}

    	# GLYCOSCIENCES.de
    	OPTIONAL{
    	GRAPH <http://rdf.glycoinfo.org/glycome-db>{
    		?gdb glycan:has_resource_entry ?res_gde .
    		?res_gde glycan:in_glycan_database glycan:database_glycosciences_de .
    		?res_gde dcterms:identifier ?gde_id.
    	}}

    	# JCGGDB
    	OPTIONAL{
    	GRAPH <http://rdf.glycoinfo.org/glycome-db>{
    		?gdb glycan:has_resource_entry ?res_jcggdb .
    		?res_jcggdb glycan:in_glycan_database glycan:database_jcggdb .
    		?res_jcggdb dcterms:identifier ?jcggdb_id.
    	}}

    	# KEGG
    	OPTIONAL{
    	GRAPH <http://rdf.glycoinfo.org/glycome-db>{
    		?gdb glycan:has_resource_entry ?res_kegg .
    		?res_kegg glycan:in_glycan_database glycan:database_kegg .
    		?res_kegg dcterms:identifier ?kegg_id.
    	}}

    	# PDB
    	OPTIONAL{
    	GRAPH <http://rdf.glycoinfo.org/glycome-db>{
    		?gdb glycan:has_resource_entry ?res_pdb .
    		?res_pdb glycan:in_glycan_database glycan:database_pdb .
    		?res_pdb dcterms:identifier ?pdb_id.
    	}}

    }
```
