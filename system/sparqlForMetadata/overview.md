---
title: SPARQL Query for Overview
layout: default
---
このSPARQLクエリは、GlyTouCanの糖鎖構造エントリーページにあるOverviewの情報を取得するクエリです。  
WURCS, GlycoCTのデータ、Massの値、糖鎖構造の投稿者とその投稿時間が取得できます。  
下記のクエリには、Accession numberと糖鎖構造のイメージの取得を指定していません。

### Input
Sample Accession number : G00051MO  
`?glycan glytoucan:has_primary_id "Input Accession number"`


### Output

| Variable | Data|
|---------|------|
| ?WURCS | WURCS |
| ?GlycoCT | GlycoCT |
| ?Mass | Mass |
| ?Contributor | Contributor |
| ?ContributionTime | Contribution time |

```
    PREFIX glycan: <http://purl.jp/bio/12/glyco/glycan#>
    PREFIX glytoucan: <http://www.glytoucan.org/glyco/owl/glytoucan#>

    SELECT DISTINCT (STR(?WURCS_label) AS ?WURCS) (STR(?GlycoCT) AS ?GlycoCT) (STR(?Mass_label) AS ?Mass) (STR(?cName) AS ?Contributor) (STR(?cTime) AS ?ContributionTime)
    FROM <http://rdf.glytoucan.org>
    FROM <http://rdf.glytoucan.org/core>
    FROM NAMED <http://rdf.glytoucan.org/mass>
    FROM <http://rdf.glytoucan.org/sequence/wurcs>
    FROM <http://rdf.glytoucan.org/sequence/glycoct>
    FROM <http://rdf.glytoucan.org/users>
    WHERE {
    # repository RDF
    # Accession Number
    ?glycan a glycan:saccharide.
    ?glycan glytoucan:has_primary_id "G00051MO" .

    # Sequence
    # WURCS
    OPTIONAL{
    ?glycan glycan:has_glycosequence ?wcsSeq .
    ?wcsSeq rdfs:label ?WURCS_label .
    ?wcsSeq glycan:in_carbohydrate_format glycan:carbohydrate_format_wurcs .
    }
    # GlycoCT
    OPTIONAL{
    ?glycan glycan:has_glycosequence ?gctSeq .
    ?gctSeq glycan:has_sequence ?GlycoCT .
    ?gctSeq glycan:in_carbohydrate_format glycan:carbohydrate_format_glycoct .
    }

    # Mass
    OPTIONAL{
    GRAPH <http://rdf.glytoucan.org/mass>{
    ?glycan glytoucan:has_derivatized_mass ?dmass .
    ?dmass rdfs:label ?Mass_label .
    }}

    # Contributor
    OPTIONAL{
    ?glycan glycan:has_resource_entry ?res .
    ?res a glycan:resource_entry ;
    glytoucan:date_registered ?cTime ;
    glytoucan:contributor ?c .
    ?c foaf:name ?cName .
        }
    } LIMIT 1

```

[Sample Data](http://beta.ts.glytoucan.org/sparql?default-graph-uri=&query=+PREFIX+glycan%3A+%3Chttp%3A%2F%2Fpurl.jp%2Fbio%2F12%2Fglyco%2Fglycan%23%3E%0D%0A++++PREFIX+glytoucan%3A+%3Chttp%3A%2F%2Fwww.glytoucan.org%2Fglyco%2Fowl%2Fglytoucan%23%3E%0D%0A%0D%0A++++SELECT+DISTINCT+%28STR%28%3FWURCS_label%29+AS+%3FWURCS%29+%28STR%28%3FGlycoCT%29+AS+%3FGlycoCT%29+%28STR%28%3FMass_label%29+AS+%3FMass%29+%28STR%28%3FcName%29+AS+%3FContributor%29+%28STR%28%3FcTime%29+AS+%3FContributionTime%29%0D%0A++++FROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%3E%0D%0A++++FROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fcore%3E%0D%0A++++FROM+NAMED+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fmass%3E%0D%0A++++FROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fsequence%2Fwurcs%3E%0D%0A++++FROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fsequence%2Fglycoct%3E%0D%0A++++FROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fusers%3E%0D%0A++++WHERE+%7B%0D%0A++++%23+repository+RDF%0D%0A++++%23+Accession+Number%0D%0A++++%3Fglycan+a+glycan%3Asaccharide.%0D%0A++++%3Fglycan+glytoucan%3Ahas_primary_id+%22G00051MO%22+.%0D%0A%0D%0A++++%23+Sequence%0D%0A++++%23+WURCS%0D%0A++++OPTIONAL%7B%0D%0A++++%3Fglycan+glycan%3Ahas_glycosequence+%3FwcsSeq+.%0D%0A++++%3FwcsSeq+rdfs%3Alabel+%3FWURCS_label+.%0D%0A++++%3FwcsSeq+glycan%3Ain_carbohydrate_format+glycan%3Acarbohydrate_format_wurcs+.%0D%0A++++%7D%0D%0A++++%23+GlycoCT%0D%0A++++OPTIONAL%7B%0D%0A++++%3Fglycan+glycan%3Ahas_glycosequence+%3FgctSeq+.%0D%0A++++%3FgctSeq+glycan%3Ahas_sequence+%3FGlycoCT+.%0D%0A++++%3FgctSeq+glycan%3Ain_carbohydrate_format+glycan%3Acarbohydrate_format_glycoct+.%0D%0A++++%7D%0D%0A%0D%0A++++%23+Mass%0D%0A++++OPTIONAL%7B%0D%0A++++GRAPH+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fmass%3E%7B%0D%0A++++%3Fglycan+glytoucan%3Ahas_derivatized_mass+%3Fdmass+.%0D%0A++++%3Fdmass+rdfs%3Alabel+%3FMass_label+.%0D%0A++++%7D%7D%0D%0A%0D%0A++++%23+Contributor%0D%0A++++OPTIONAL%7B%0D%0A++++%3Fglycan+glycan%3Ahas_resource_entry+%3Fres+.%0D%0A++++%3Fres+a+glycan%3Aresource_entry+%3B%0D%0A++++glytoucan%3Adate_registered+%3FcTime+%3B%0D%0A++++glytoucan%3Acontributor+%3Fc+.%0D%0A++++%3Fc+foaf%3Aname+%3FcName+.%0D%0A++++++++%7D%0D%0A++++%7D+LIMIT+1&format=text%2Fhtml&timeout=0&debug=on)
