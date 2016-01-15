---
title: Breaking Down a Glycan
layout: default
---
# 糖鎖の分解

## Registration
## 登録時

When a new glycan structure is registered, one fairly complex process that occurs is the breaking down of the components.  Components in this case can be any unit piece of a Glycan, such as a monosaccharide.  These can include substituents as well as the linkage information. 

GlyTouCanに糖鎖構造を登録する時のコンポーネント分解フローの詳細を説明します。

### Flow
### 新規登録のフロー

* 新規登録
  * シーケンスの分解WFW(converter)から取得＊
      * 現時点、[WurcsRDF](https://bitbucket.org/glycosw/wurcsrdf)を利用して単糖データ（MS）を生成します。＊
  * 単糖別
      * [単糖のタイプをSPARQL](https://github.org/glytoucan/batch)で取得し分解
      * monosaccharideタイプ別のReadableNameを取得
          * [msDB](http://www.monosaccharidedb.org/remote_access.action#conversion)
          * [土屋くんのIUPAC](https://bitbucket.org/glycosw/glycanformatconverter)

＊開発済み<BR>

Aglyconは[スコープ外](http://glycob.oxfordjournals.org/content/23/12/1422.full?ijkey=b52b4890001eddbfdb29bd160185613b932538b0&keytype2=tf_ipsecsha)

### RDF提案

    <Saccharide>
    	a	glycan:saccharide
    	glytoucan:has_primary_id	"accession number"  ## もう使わないけど、とりあえず残す
    	glycan:has_component	<Component>

    <Component>
    	a	glycan:component
    	glycan:has_cardinality	integer
    	glycan:has_monosaccharide	<glycoRDF:Monosaccharide>

    <glycoRDF:Monosaccharide> #=> wurcsの文字列が入るURI
    	is_type1 true/false
    	rdfs:label “ReadableName”
    	glycan:has_alias	<Monosaccharide alias>

    <Monosaccharide alias>
    	a	glycan:monosaccharide_alias
    	glycan:has_monosaccharide_notation_scheme glycan:monosaccharide_notation_scheme_carbbank 
    	glycan:has_alias_name "monosaccharide alias name"
    "# "monosaccharide alias name" => Gal-ol"


注意点：現在glycoRDF:MonosaccharideのURIは、下記の通り：

    <http://www.monosaccharidedb.org/rdf/monosaccharide_alias.action?scheme=IUPAC&name=Gal-ol>
    <http://www.monosaccharidedb.org/rdf/monosaccharide_alias.action?scheme=CARBBANK&name=Gal-ol>

重複がないか確認する必要があります。

### WURCSRDFが生成する単糖のRDF

[WURCS-MS-RDF](https://bitbucket.org/glycosw/wurcsrdf)のライブラリーにある、WURCSシーケンスら単糖データのRDFを生成する

[Glycan Format Converter](https://bitbucket.org/glycosw/glycanformatconverter)ではない？

    <wurcs:Monosaccharide> #monosaccharide residue
    	a          wurcs:Monosaccharide
    	noc:is_type	2
    	noc:is_modified	false

\<wurcs:Monosaccharide\> URIのサンプル

    <http://rdf.glycoinfo.org/glycan/wurcs/2.0/Monosaccharide/Aad211d2h-2a_2-6_5%2ANCC%2F3%3DO>

### ComponentGenerator

上記の単糖データを利用してタイプ別にコンポーネントを作成します。

SPARQL:


#### MonosaccharideDBから取得場合：

WURCSのResidue文字列でRDFを取得：

<http://www.monosaccharidedb.org/rdf/monosaccharide.action?name=Aad211d2h-2a_2-6_5%2ANCC%2F3%3DO>

#### Cardinalityの計算


### 新しい[GlycoRDF](https://github.com/glycoinfo/GlycoRDF)の変更点

[最初の設計書](/system/composition_aglycon)

[n-core glycan composition]のサンプル
