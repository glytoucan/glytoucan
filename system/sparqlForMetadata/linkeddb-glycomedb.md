---
title: SPARQL Query for GlycomeDB in Linked DB
layout: default
---
GlycomeDB RDFには、複数のパブリックデータベースのリンクが存在します。
リンクがあるDBは以下の通りです。
* CarbBank  
* CFG
* GlycoO
* Glycobase lille
* Glycosciences.de
* JCGGDB
* KEGG
* PDB

一つのSPARQLで複数のDBの情報を取得しようとすると、組み合わせが膨大になり、動作が非常に重くなることがよくあります。
そのため、下記のSPARQLクエリは、各DBごとに分割したクエリになります。


### Input
Sample Accession number : G00051MO  
`VALUES ?AccessionNumber { "G00051MO" } ` 

### Output : GlycomeDB
| Variable | Data|
|---------|------|
| ?gurl | GlycomeDB URL |
| ?gid | GlycomeDB ID |

```
  PREFIX dcterms: <http://purl.org/dc/terms/>
  PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
  PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
  PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

  # GlycomeDB
  SELECT DISTINCT ?gurl ?gid
  FROM <http://rdf.glytoucan.org>
  FROM <http://rdf.glytoucan.org/core>
  FROM NAMED <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>
  FROM NAMED <http://rdf.glycoinfo.org/glycome-db>
  WHERE{
    VALUES ?AccessionNumber { "G00051MO" }
    ?glytoucan glytoucan:has_primary_id ?AccessionNumber.

    # GlycomeDB
    GRAPH <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>{
	    ?glytoucan skos:exactMatch ?gdb .
	    ?gdb glycan:has_resource_entry ?gurl .
	    ?gurl dcterms:identifier ?gid .
    }
  }
```

### Output : CarbBank
| Variable | Data|
|---------|------|
| ?res_ccsd | Carbbank(CCSD) URL |
| ?ccsdId | Carbbank(CCSD) ID |

```
  PREFIX dcterms: <http://purl.org/dc/terms/>
  PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
  PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
  PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

  # Carbbank(CCSD)
  SELECT DISTINCT ?res_ccsd (STR(?ccsd_id) AS ?ccsdId)
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
    GRAPH <http://rdf.glycoinfo.org/glycome-db>{
      ?gdb glycan:has_resource_entry ?res_ccsd .
      ?res_ccsd glycan:in_glycan_database glycan:database_carbbank .
      ?res_ccsd dcterms:identifier ?ccsd_id.
    }
  }
```

### Output : CFG
| Variable | Data|
|---------|------|
| ?res_cfg | CFG URL |
| ?cfgId | CFG ID |

```
  PREFIX dcterms: <http://purl.org/dc/terms/>
  PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
  PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
  PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

  # CFG
  SELECT DISTINCT ?res_cfg (STR(?cfg_id) AS ?cfgId)
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
  	GRAPH <http://rdf.glycoinfo.org/glycome-db>{
  		?gdb glycan:has_resource_entry ?res_cfg .
  		?res_cfg glycan:in_glycan_database glycan:database_cfg .
  		?res_cfg dcterms:identifier ?cfg_id.
  	}
  }
```

### Output : GlycO
| Variable | Data|
|---------|------|
| ?res_glycO | GlycO (link to xml page) URL |
| ?glycOId | GlycO (link to xml page) ID |

* G00051MOだと、マッチするGlycOがないため、マッチするものとして、G10818SMを例として使用しています。  

```
  PREFIX dcterms: <http://purl.org/dc/terms/>
  PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
  PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
  PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

  # GlycO (link to xml page, no web page)
  SELECT DISTINCT ?res_glycO (STR(?glycO_id) AS ?glycOId)
  FROM <http://rdf.glytoucan.org>
  FROM <http://rdf.glytoucan.org/core>
  FROM NAMED <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>
  FROM NAMED <http://rdf.glycoinfo.org/glycome-db>
  WHERE{
    VALUES ?AccessionNumber { "G10818SM" }
    ?glytoucan glytoucan:has_primary_id ?AccessionNumber.

    GRAPH <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>{
      ?glytoucan skos:exactMatch ?gdb .
      ?gdb glycan:has_resource_entry ?gurl .
      ?gurl dcterms:identifier ?gid .
    }
    # GlycO (link to xml page, no web page)
    GRAPH <http://rdf.glycoinfo.org/glycome-db>{
      ?gdb glycan:has_resource_entry ?res_glycO .
      ?res_glycO glycan:in_glycan_database glycan:database_glyco .
      ?res_glycO dcterms:identifier ?glycO_id.
    }
  }
```

### Output : Glycobase lille
| Variable | Data|
|---------|------|
| ?res_base | Glycobase lille URL |
| ?baseId | Glycobase lille ID |

* G00051MOだと、マッチするデータがないため、マッチするものとして、G50474NOを例として使用しています。  

```
  PREFIX dcterms: <http://purl.org/dc/terms/>
  PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
  PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
  PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

  # Glycobase lille
  SELECT DISTINCT ?res_base (STR(?base_id) AS ?baseId)
  FROM <http://rdf.glytoucan.org>
  FROM <http://rdf.glytoucan.org/core>
  FROM NAMED <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>
  FROM NAMED <http://rdf.glycoinfo.org/glycome-db>
  WHERE{
    VALUES ?AccessionNumber { "G50474NO" }
    ?glytoucan glytoucan:has_primary_id ?AccessionNumber.

    GRAPH <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>{
      ?glytoucan skos:exactMatch ?gdb .
      ?gdb glycan:has_resource_entry ?gurl .
      ?gurl dcterms:identifier ?gid .
    }
    # Glycobase lille
    GRAPH <http://rdf.glycoinfo.org/glycome-db>{
      ?gdb glycan:has_resource_entry ?res_base .
      ?res_base glycan:in_glycan_database glycan:database_glycobase_lille .
      ?res_base dcterms:identifier ?base_id.
    }
  }
```


### Output : Glycosciences.de
| Variable | Data|
|---------|------|
| ?res_gde | Glycosciences.de URL |
| ?gdeId | Glycosciences.de ID |

```
  PREFIX dcterms: <http://purl.org/dc/terms/>
  PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
  PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
  PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

  # Glycosciences.de
  SELECT DISTINCT ?res_gde (STR(?gde_id) AS ?gdeId)
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
    # Glycosciences.de
    GRAPH <http://rdf.glycoinfo.org/glycome-db>{
      ?gdb glycan:has_resource_entry ?res_gde .
      ?res_gde glycan:in_glycan_database glycan:database_glycosciences_de .
      ?res_gde dcterms:identifier ?gde_id.
    }
  }
```

### Output : JCGGDB
| Variable | Data|
|---------|------|
| ?res_jcggdb | JCGGDB URL |
| ?jcggdbId | JCGGDB ID |

* G00051MOだと、マッチするデータがないため、マッチするものとして、G43195TRを例として使用しています。  

```
  PREFIX dcterms: <http://purl.org/dc/terms/>
  PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
  PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
  PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

  # JCGGDB
  SELECT DISTINCT ?res_jcggdb (STR(?jcggdb_id) AS ?jcggdbId)
  FROM <http://rdf.glytoucan.org>
  FROM <http://rdf.glytoucan.org/core>
  FROM NAMED <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>
  FROM NAMED <http://rdf.glycoinfo.org/glycome-db>
  WHERE{
    VALUES ?AccessionNumber { "G43195TR" }
    ?glytoucan glytoucan:has_primary_id ?AccessionNumber.

    GRAPH <http://rdf.glycoinfo.org/mapping/glytoucan/glycome-db>{
      ?glytoucan skos:exactMatch ?gdb .
      ?gdb glycan:has_resource_entry ?gurl .
      ?gurl dcterms:identifier ?gid .
    }
    # JCGGDB
    GRAPH <http://rdf.glycoinfo.org/glycome-db>{
      ?gdb glycan:has_resource_entry ?res_jcggdb .
      ?res_jcggdb glycan:in_glycan_database glycan:database_jcggdb .
      ?res_jcggdb dcterms:identifier ?jcggdb_id.
    }
  }
```

### Output KEGG
| Variable | Data|
|---------|------|
| ?res_kegg | KEGG URL |
| ?keggId | KEGG ID|


```
  PREFIX dcterms: <http://purl.org/dc/terms/>
  PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
  PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
  PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

  # KEGG
  SELECT DISTINCT ?res_kegg (STR(?kegg_id) AS ?keggId)
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
    GRAPH <http://rdf.glycoinfo.org/glycome-db>{
      ?gdb glycan:has_resource_entry ?res_kegg .
      ?res_kegg glycan:in_glycan_database glycan:database_kegg .
      ?res_kegg dcterms:identifier ?kegg_id.
    }
  }
```


### Output : PDB
| Variable | Data|
|---------|------|
| ?res_pdb | PDB URL |
| ?pdbId | PDB ID |


```
  PREFIX dcterms: <http://purl.org/dc/terms/>
  PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
  PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
  PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

  # PDB
  SELECT DISTINCT ?res_pdb (STR(?pdb_id) AS ?pdbId)
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
    GRAPH <http://rdf.glycoinfo.org/glycome-db>{
      ?gdb glycan:has_resource_entry ?res_pdb .
      ?res_pdb glycan:in_glycan_database glycan:database_pdb .
      ?res_pdb dcterms:identifier ?pdb_id.
    }
  }
```


# merge query

* ９のDBのエントリーを一つのSPARQLクエリで取得します。
* 動作が重い場合がほとんどです。

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
    # Glycosciences.de
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

    	# Glycosciences.de
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
