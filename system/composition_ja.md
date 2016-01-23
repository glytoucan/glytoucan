---
title: 糖鎖の分解
layout: default
---
# 糖鎖の分解

糖鎖を登録する時、構造を分析して関連しているデータをRDF化しています。GlyTouCanに糖鎖構造を登録する時のコンポーネント（単糖、残機、リンケージ）分解プロセスを説明します。

### プロセスの概要

* 糖鎖を登録時
  * シーケンスの分解WURCS(converter)から取得＊
      * 現時点、[WurcsRDFのMSライブラリー](https://bitbucket.org/glycosw/wurcsrdf)を利用して単糖データ（MS）を生成します。＊
  * 糖鎖に含まれている単糖をループして[ComponentGenerator](#ComponentGenerator)を実行します：
    * 単糖のWURCSを取得・生成
    * 単糖を登録します。
    * Monosaccharide情報をｗurcsのMS（新しいオントロジー？）と連携します。
      * 登録した単糖のAccesion番号をComponentを通してユニークRESに連携します。
    * [Cardinality](#Cardinality)の計算
    * monosaccharideタイプ別のReadableNameを取得
      * 取得する方法
        * [wurcs2msDB](http://www.monosaccharidedb.org/remote_access.action#conversion)
        * [土屋くんのIUPAC](https://bitbucket.org/glycosw/glycanformatconverter)
      * monosaccharide_aliasにインサート、Componentにリンクします。。
    * 残機を登録します。?
    * 還元末端を指定します。?

＊開発済み<BR>

### 関係しているRDF

    <Saccharide or Monosaccharide>
    	a	glycan:saccharide #or
      a	glycan:monosaccharide
    	glycan:has_component	<Component>
      glycan:has_alias	<Monosaccharide alias>

    <Component>
    	a	glycan:component
    	glycan:has_cardinality	integer
    	glycan:has_monosaccharide	<wurcs:Monosaccharide>

    <wurcs:Monosaccharide>
      a wurcs:Monosaccharide ;
      wurcs:has_basetype <http://rdf.glycoinfo.org/glycan/wurcs/2.0/Basetype/u2122h_2%2ANCC%2F3%3DO> ;
      wurcs:has_MOD	<http://rdf.glycoinfo.org/glycan/wurcs/2.0/MOD/1-5>
      wurcs:has_MOD ; <http://rdf.glycoinfo.org/glycan/wurcs/2.0/MOD/2%2ANCC%2F3%3DO>
      wurcs:has_SC ; <http://rdf.glycoinfo.org/glycan/wurcs/2.0/SkeletonCode/a2122h>
      wurcs:has_anomeric_position	1 ;
      wurcs:has_anomeric_symbol "x"^^<http://www.w3.org/2001/XMLSchema#string> ;
      wurcs:has_ring <http://rdf.glycoinfo.org/glycan/wurcs/2.0/MOD/1-5> .

    <Monosaccharide alias> a	glycan:monosaccharide_alias
      glycan:is_monosaccharide <wurcs:Monosaccharide> ;
    	glycan:has_monosaccharide_notation_scheme glycan:monosaccharide_notation_scheme_iupac ;
    	glycan:has_alias_name "Gal-ol" .

### WURCS MSが生成する単糖のRDF

[WURCS-MS-RDF](https://bitbucket.org/glycosw/wurcsrdf)のライブラリーにある、WURCSシーケンスら単糖データのRDFを生成する単糖データ

[設計中](https://bitbucket.org/glycosw/wurcsrdf/issues/1)

    <wurcs:Monosaccharide> #monosaccharide residue
    	a          wurcs:Monosaccharide
    	noc:is_type	2
    	noc:is_modified	false

&lt;wurcs:Monosaccharide> URIのサンプル

    <http://rdf.glycoinfo.org/glycan/wurcs/2.0/Monosaccharide/Aad211d2h-2a_2-6_5%2ANCC%2F3%3DO>

### 既存データとバッチ

すでに登録されてい糖鎖構造が存在していますので新しいデータを追加するには、[バッチプロセス](http://code.glytoucan.org/batch/)を実行する必要があります。

WURCS MSのライブラリーが更新されたら実行する必要があります。

新しくインサートするコンポーネントと登録する単糖も同じように既存の糖鎖を改めて更新する必要があります。

[バッチとSPARQLBeanの設計書](http://code.glytoucan.org/batch/new/2016)

### <a name="ComponentGenerator"></a>ComponentGenerator

単糖データを利用して単糖と関連しているコンポーネントのRDFを作成します。

単糖を取得するSPARQL[設計中](https://bitbucket.org/glycosw/wurcsrdf/issues/1)
:

    SELECT ?monosaccharide
    WHERE {
	    ?monosaccharide a wurcs:Monosaccharide
    	?monosaccharide noc:is_type	2
    	?monosaccharide noc:is_modified	false
      ?monosaccharide noc:wurcs_sequence	?sequence
    }

[Sample](http://beta.ts.glytoucan.org/sparql?default-graph-uri=&query=PREFIX+wurcs%3A+%3Chttp%3A%2F%2Fwww.glycoinfo.org%2Fglyco%2Fowl%2Fwurcs%23%3E%0D%0ASELECT+distinct+%3Fmono%0D%0A++++++++++++++++FROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fwurcs%2Fms%3E%0D%0A++++++++++++++++WHERE%7B%0D%0A%3Fmono+a+wurcs%3AMonosaccharide+.%0D%0A%7D%0D%0Alimit+100&format=text%2Fhtml&timeout=0&debug=on)

### 単糖のWURCSを登録します。

    String id = glycanProcedure.register("monosaccharide WURCS string");

#### <a name="Cardinality"></a>Cardinalityの計算

どのタイプでフィルター？

    SELECT ?monosaccharide count(distinct ?residue)
    WHERE
      ?SaccharideURI a glycan:saccharide .
      ?monosaccharide a wurcs:Monosaccharide .
      ?monosaccharide noc:is_type	2 .
      #?monosaccharide noc:is_modified	false
      #?monosaccharide noc:wurcs_sequence	?sequence

### Componentを作成

    INSERT {
      GRAPH <http://rdf.glycoinfo.org/component> {
        glycan:has_monosaccharide	<wurcs:Monosaccharide>
        <SaccharideURI> glycan:has_component <ComponentURI> .
        <ComponentURI> a glycan:component .
        glycan:has_cardinality	integer .
      	glycan:has_monosaccharide	<wurcs:Monosaccharide> .
      }
    }

`<SaccharideURI>`と`<ComponentURI>`はもとの糖鎖のAccession番号から生成できます。

### Monosaccharide alias name
新しいGRAPHに、MsDBかWC-WFWから取得したalias nameをいれます。  
GRAPH `<http://rdf.glytoucan.org/ms/aliasname>`　をベースにする

#### MonosaccharideDBから取得場合：

GRAPH `<http://rdf.glytoucan.org/ms/aliasname/MonosaccharideDB>`

WURCSのResidue文字列でRDFを取得:
http://www.monosaccharidedb.org/rdf/monosaccharide.action?name=Aad211d2h-2a_2-6_5%2ANCC%2F3%3DO

MonosaccharideDBから取得したRDFをGRAPHに登録します。もしRDFに問題ありましたら、MonosaccharideDBに相談する必要があります。

_monosaccharideDB に接続できない場合、無視する_

#### WURCS2IUPACから取得場合：

  [Glycan Format Converter](https://bitbucket.org/glycosw/glycanformatconverter)

    INSERT {
      GRAPH <http://rdf.glytoucan.org/ms/aliasname/glycanformatconverter>
      {
        <Monosaccharide alias> a	glycan:monosaccharide_alias ;
        glycan:is_monosaccharide <wurcs:Monosaccharide> ;
        glycan:has_monosaccharide_notation_scheme glycan:monosaccharide_notation_scheme_iupac ;
        glycan:has_alias_name "Gal-ol" .
      }

[最初の設計書](/system/composition_aglycon)

[G00052MO](composition_sample)のサンプル
