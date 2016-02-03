---
title: 糖鎖のコンポジション
layout: default
---

糖鎖を登録する際、構造を分析して関連しているデータをRDF化しています。糖鎖構造コンポーネント（単糖、残基、リンケージ）のRDF形式を説明します。

### <a name="#ProcessFlow"></a>処理フロー

[UML Diagram](https://docs.google.com/drawings/d/1v-16pyyEfKjUKKhSV1cda53AbRoQd0AVF0BW17k6TC8/edit)

1. 糖鎖が登録されると、まずWURCSシーケンスに変換します。
1. Accession numberが付く（単糖、糖鎖どちらも）
1. [WurcsRDFのMSライブラリー](https://bitbucket.org/glycosw/wurcsrdf)が単糖と構造データのRDF生成します。
1. 単糖かどうかを判定します。
  2. WURCSの文字列に対して前方一致で判定（”WURCS=2.0/1,1,0/”）
1. 単糖であれば[単糖の登録](#RegisteringMonosaccharides)、糖鎖であればに[糖鎖の登録](#RegisteringSaccharide)に移動
  1. この場合、単糖であれば、Componentを作成していません。（Cardinalityは１）

#### <a name="#RegisteringMonosaccharides"></a>単糖の登録

単糖（WURCS-MS-RDFに入っている）をGlyTouCanに登録
1. 単糖はglycan:saccharideのサブクラス、glycan:monosaccharideタイプを付けする
1. [monosaccharideタイプ別のReadableNameを取得](#ReadableName)
   1. 取得する方法
      * monosaccharideDB http://www.monosaccharidedb.org/remote_access.action#conversion
      * glycanformatconverter https://bitbucket.org/glycosw/glycanformatconverter
  1. monosaccharide_aliasにインサート、glycan:monosaccharideにリンク

#### <a name="#RegisteringSaccharides"></a>糖鎖の登録

1.  糖鎖に含まれている[単糖](#residues)をループして[ResidueGenerator](#ResidueGenerator)(残基?)を実行します：
  1. [単糖のWURCSを取得・生成](#MonosaccharideWurcs)
  1. [単糖を糖鎖として登録](#RegisteringMonosaccharides) (最初の[処理フロー](#ProcessFlow)に戻る)
      1. 登録した単糖のAccession numberを取得
  1. Componentの作成
      1. 糖鎖に登録された単糖のAcc#をひも付ける
  1. [Cardinality](#Cardinality)の計算
      1. どのタイプに絞る？
  1. [Top Page](http://glytoucan.org)の[単糖数](#TopNumbers)

### 関係しているRDF
```
    <glycan:Saccharide>
      a	glycan:Saccharide #or
      glycan:has_component	<glycan:Component>

    <glycan:Monosaccharide>
        a glycan:Monosaccharide #Saccharideのサブクラス
        sio:has-component-part <wurcs:Monosaccharide>
        glycan:has_alias	<glycan:MonosaccharideAlias>

    <glycan:Component>
    	a	glycan:Component
    	glycan:has_cardinality	integer

      # 今までのMonosaccharideSparqlを再利用
    	glycan:has_monosaccharide	<glycan:monosaccharide>

    <wurcs:Monosaccharide>
      a wurcs:Monosaccharide ;
      wurcs:has_basetype <http://rdf.glycoinfo.org/glycan/wurcs/2.0/Basetype/u2122h_2%2ANCC%2F3%3DO> ;
      wurcs:has_MOD	<http://rdf.glycoinfo.org/glycan/wurcs/2.0/MOD/1-5>
      wurcs:has_MOD ; <http://rdf.glycoinfo.org/glycan/wurcs/2.0/MOD/2%2ANCC%2F3%3DO>
      wurcs:has_SC ; <http://rdf.glycoinfo.org/glycan/wurcs/2.0/SkeletonCode/a2122h>
      wurcs:has_anomeric_position	1 ;
      wurcs:has_anomeric_symbol "x"^^<http://www.w3.org/2001/XMLSchema#string> ;
      wurcs:has_ring <http://rdf.glycoinfo.org/glycan/wurcs/2.0/MOD/1-5> .
    	is_type1 true/false
    	glycan:has_alias	<glycan:MonosaccharideAliasURI>
      sio:is-component-part-of	    <glycan:MonosaccharideURI>

    <glycan:MonosaccharideAlias>
    	a	glycan:monosaccharide_alias
      glycan:is_monosaccharide <glycan:Monosaccharide> ;
    	glycan:has_monosaccharide_notation_scheme glycan:monosaccharide_notation_scheme_carbbank
    	glycan:has_alias_name "Gal-ol"

    <glycan:MonosaccharideAlias>
      a glycan:monosaccharide_alias
      glycan:is_monosaccharide <glycan:Monosaccharide> ;
    	glycan:has_monosaccharide_notation_scheme glycan:monosaccharide_notation_scheme_iupac ;
    	glycan:has_alias_name "Gal-ol" .
```

### WURCS MSが生成する単糖のRDF

[WURCS-MS-RDF](https://bitbucket.org/glycosw/wurcsrdf)のライブラリーにある、WURCSシーケンスら単糖データの[新しいRDF](https://bitbucket.org/glycosw/wurcsrdf/issues/1)を生成。

```
<wurcs:Monosaccharide>
  a wurcs:Monosaccharide ;
  wurcs:has_basetype <http://rdf.glycoinfo.org/glycan/wurcs/2.0/Basetype/u2122h_2%2ANCC%2F3%3DO> ;
  wurcs:has_MOD	<http://rdf.glycoinfo.org/glycan/wurcs/2.0/MOD/1-5>
  wurcs:has_MOD ; <http://rdf.glycoinfo.org/glycan/wurcs/2.0/MOD/2%2ANCC%2F3%3DO>
  wurcs:has_SC ; <http://rdf.glycoinfo.org/glycan/wurcs/2.0/SkeletonCode/a2122h>
  wurcs:has_anomeric_position	1 ;
  wurcs:has_anomeric_symbol "x"^^<http://www.w3.org/2001/XMLSchema#string> ;
  wurcs:has_ring <http://rdf.glycoinfo.org/glycan/wurcs/2.0/MOD/1-5> .
  is_type1 true/false

```

`<wurcs:Monosaccharide>` URIのサンプル

    <http://rdf.glycoinfo.org/glycan/wurcs/2.0/Monosaccharide/Aad211d2h-2a_2-6_5%2ANCC%2F3%3DO>

### バッチ更新

大量の構造データ（アップロード、[GlyTouCanクライアント](http://github.com/glytoucan/client)）の場合、[バッチプロセス](http://code.glytoucan.org/batch)を実行して更新できます。

コンポーネントと単糖は同様に更新されます。

[詳細は開発者用のドキュメント](http://nexus.glycoinfo.org/content/sites/project/glytoucan/batch/apidocs/index.html)に記載されています。

### <a name="ResidueGenerator"></a>ResidueGenerator

単糖と関連しているコンポーネントのRDFを作成します。

単糖を取得するSPARQL[設計中](https://bitbucket.org/glycosw/wurcsrdf/issues/1)
:

    SELECT ?monosaccharide
    WHERE {
	    ?monosaccharide a wurcs:Monosaccharide
#    	?monosaccharide noc:is_type	2
#    	?monosaccharide noc:is_modified	false
      ?monosaccharide noc:wurcs_sequence	?sequence
    }

[Sample](http://beta.ts.glytoucan.org/sparql?default-graph-uri=&query=PREFIX+wurcs%3A+%3Chttp%3A%2F%2Fwww.glycoinfo.org%2Fglyco%2Fowl%2Fwurcs%23%3E%0D%0ASELECT+distinct+%3Fmono%0D%0A++++++++++++++++FROM+%3Chttp%3A%2F%2Frdf.glytoucan.org%2Fwurcs%2Fms%3E%0D%0A++++++++++++++++WHERE%7B%0D%0A%3Fmono+a+wurcs%3AMonosaccharide+.%0D%0A%7D%0D%0Alimit+100&format=text%2Fhtml&timeout=0&debug=on)

#### 各単糖を登録

上記のwurcs:MonosaccharideのURIから、残機データを生成：

    http://rdf.glycoinfo.org/glycan/wurcs/2.0/Monosaccharide/Aad211d2h-2a_2-6_5%2ANCC%2F3%3DO

の

    http://rdf.glycoinfo.org/glycan/wurcs/2.0/Monosaccharide/

部分をカット

    Aad211d2h-2a_2-6_5%2ANCC%2F3%3DO

WURCSをs生成

    WURCS=2.0/1,1,0/Aad211d2h

単糖情報から、単糖のWURCSを取得して、GlycoRDF:Monosaccharideとして登録します。（Saccharideのサブクラス）

`a Monosaccharide`をつけて、登録処理おわりましたら、Accession＃を取得できます。

    String id = glycanProcedure.register("monosaccharide WURCS string");

Accession＃から、上記`glycan:Monosaccharide`と連携します。

### <a name="Cardinality"></a>Cardinalityの計算

どのタイプでフィルター？

    SELECT ?monosaccharide count(distinct ?residue) as ?cardinality
    WHERE　｛
      ?SaccharideURI a glycan:saccharide .
      ?monosaccharide a wurcs:Monosaccharide .
      ?monosaccharide noc:is_type	2 .
      #?monosaccharide noc:is_modified	false
      #?monosaccharide noc:wurcs_sequence	?sequence
    ｝

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
新しいGRAPHに、MsDBかWC-WFWから取得したalias nameをインサート。  
GRAPH `<http://rdf.glytoucan.org/ms/aliasname>`　をベースにする

#### MonosaccharideDBから取得場合：

GRAPH `<http://rdf.glytoucan.org/ms/aliasname/MonosaccharideDB>`

WURCSのResidue文字列でRDFを取得:
[http://www.monosaccharidedb.org/rdf/monosaccharide.action?name=Aad211d2h-2a_2-6_5%2ANCC%2F3%3DO](http://www.monosaccharidedb.org/rdf/monosaccharide.action?name=Aad211d2h-2a_2-6_5%2ANCC%2F3%3DO)

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
#### <a name="LinkingToWurcsRdf"></a>Monosaccharide情報をｗurcsのMS（新しいオントロジー？）と連携します。
```
      GlycoRDF:monosaccharide 	sio:has-component-part	wurcs:Monosaccharide
      wurcs:Monosaccharide	sio:is-component-part-of	GlycoRDF:monosaccharide
```

[最初の設計書](/system/composition_aglycon)

[Lewis Y G00052MO](composition_sample)のサンプル

[Glycan Entry](/system/metadata/)で単糖と他のデータを表示する。
