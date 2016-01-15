---
title: Glycan Composition Process
layout: default
---
# Breaking Down a Glycan
# 糖鎖の分解

## Registration
## 登録時

When a new glycan structure is registered, one fairly complex process that occurs is the breaking down of the components.  Components in this case can be any unit piece of a Glycan, such as a monosaccharide.  These can include substituents as well as the linkage information. 

GlyTouCanに糖鎖構造を登録する時のコンポーネント分解フローの詳細を説明します。

### Flow
### 新規登録のフロー

* 新規登録
    * シーケンスの分解WFW(converter)から取得＊
      * 現時点、[WurcsRDF](https://bitbucket.org/glycosw/wurcsrdf)を利用して担当データ（MS）を生成します。＊
    * 単糖別
        * [単糖のタイプをSPARQL](https://github.org/glytoucan/batch)で取得し分解
             * monosaccharideタイプ別のReadableNameを取得
                * [monosaccharideDB](http://www.monosaccharidedb.org/remote_access.action#conversion)
                * [土屋くんのIUPAC]
             * aglyconのクラスも作成＊＊

＊開発済み
＊＊現時点[スコープ外](http://glycob.oxfordjournals.org/content/23/12/1422.full?ijkey=b52b4890001eddbfdb29bd160185613b932538b0&keytype2=tf_ipsecsha)

### 新しい[GlycoRDF](https://github.com/glycoinfo/GlycoRDF)の変更点

    <Saccharide or Glycoconjugate>
    	a	glycan:saccharide or glycoconjugate
    <Saccharide>
    	a	glycan:saccharide
    	glytoucan:has_primary_id	"accession number"  ## もう使わないけど、とりあえず残す
    	glycan:has_component	<Component>
    	glycan:has_resource_entry	<Resource entry>
    	glycan:has_glycosequence	<Glycosequence>

#### Glycoconjugateの場合のみ
    glycan:has_glycoconjugate_sequence	<Glycoconjugate_Sequence>
    	glycan:has_attached_glycan	<Saccharide> # GlycoconjugateのWURCSからSaccharideのWURCSを取得
    	glycan:has_aglycon <Aglycon>


Resource Entry
    <Resource entry>
    	dcterms:identifier	“GXXXXYZ”
    	glycan:in_glycan_database	“GlyTouCan”

WURCSのGlycoSequenceは、WURCS-RDFを利用している

    <Aglycon>
    	foaf:name	“trivial name”  # WFW?

    <Glycoconjugate_Sequence>
    	a	glycan:glycocojugate_sequence
    	glycan:has_sequence		“WURCS=2.0/”
    	glycan:in_carbohydrate_format	glycan:carbohydrate_format_wurcs

    <Component>
    	a	glycan:component
    	glycan:has_cardinality	integer
    	glycan:has_monosaccharide	<glycoRDF:Monosaccharide>
    	or 
    	glycan:has_aglycon	<Aglycon>


WURCS-MS-RDF - WURCSから生成したもの

    <http://rdf.glycoinfo.org/glycan/wurcs/2.0/Monosaccharide/Aad211d2h-2a_2-6_5%2ANCC%2F3%3DO>
    <wurcs:Monosaccharide> #monosaccharide residue
    	a          wurcs:Monosaccharide
    	noc:is_type	2
    	noc:is_modified	false

Relation of MS

ここまでが、gs2virtで生成したRDF

ここからが、<http://rdf.glytoucan.org/ms/carbbank>に含まれるRDF
コンストラクトで生成（手動）していたが、WURCSベースにしますので、

    # < http://www.monosaccharidedb.org/rdf/monosaccharide.action?name=o-xgal-HEX-0:0|1:aldi>
    # <glycoRDF:Monosaccharide> => wurcsの文字列が入るURI
    # ComponentGenerator:
    # <http://www.monosaccharidedb.org/rdf/monosaccharide.action?name=Aad211d2h-2a_2-6_5%2ANCC%2F3%3DO>
    <glycoRDF:Monosaccharide>
    	a	glycan:monosaccharide
    	glycan:has_alias	<Monosaccharide alias>
    # new alias graph:
    # <http://www.monosaccharidedb.org/rdf/monosaccharide_alias.action?scheme=IUPAC&name=Gal-ol>
    #
    # <http://www.monosaccharidedb.org/rdf/monosaccharide_alias.action?scheme=CARBBANK&name=Gal-ol>
    <Monosaccharide alias>
    	a	glycan:monosaccharide_alias
    	glycan:has_monosaccharide_notation_scheme glycan:monosaccharide_notation_scheme_carbbank 
    	glycan:has_alias_name "monosaccharide alias name"
    "# "monosaccharide alias name" => Gal-ol"

    <Aglycon>
    	a	glycan:aglycon
    案１
    <saccharide or glycoconjugate>
               a  saccharide, glycoconjugate
    <saccharide>
               a  saccharide
    	has_component <Component>
    
    <Component>
    	is_monosaccharide <Monosaccharide>

    <Monosaccharide>
    	is_type1 true/false
    　　　rdfs:label “ReadableName”

    <Component>
    	is_aglycon <Aglycon>


