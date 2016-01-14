---
title: Graphic Relation Viewer
authors:
- Keiko Tokunaga
date: 2015-12-17
reviewers:
- Nobuyuki Aoki
layout: paging
categories: [relation, graphical]
---

糖鎖構造間の関係性を可視化したツール
------------
糖鎖構造における他の糖鎖構造との関係性（モチーフ構造、アイソマー構造など）を描画したツール。
このツールでは、現時点で計算されている糖鎖構造間の関係性を一目で確認することができる。

![Glytoucan Graphical Interface](/images/manual/graphical-relation-viewer-G00028MO.png)

＊メニューバー
  - 指定した糖鎖のGlycan IDを表示
  - All Data: 現時点で表示できる全ての糖鎖構造間の関係性を表示（現在のページ）
  - Return: 指定した糖鎖のエントリーページに戻る

＊可視化エリア
  - 表示について
    現在は、指定した糖鎖の構造が持つ motif構造と linkage isomer構造を表示できる
    ・１つも関係性に関するデータが存在しなかった場合
      各関係性の項目で"None"と表示される
    ・関係性に関するデータが存在する場合
      指定した糖鎖に関係している糖鎖構造が画像で表示される
  - 可視化ツールで使用できる機能
    ・ノードの格納と表示（親ノードのワンクリック）
    ・画像の拡大（マウスオーバー）
    ・Glycan IDの表示（マウスオーバー）
    ・Glycan IDのコピー（右クリック→Copy this glycan IDを選択）
    ・指定した糖鎖を中心とした糖鎖構造間の関係性の再描画（右クリック→Center on this glycan）
    ・指定した糖鎖のエントリーページを表示（右クリック→Open this glycan's entry page）
      → 新しいタブで指定したページを表示する
    ・指定した糖鎖の画像を表示（右クリック→Show this glycan image）
      → 新しいタブで指定した糖鎖の画像のページを表示する。移動したページでは、糖鎖の画像を保存することが出来る。

＊アクセス方法
![Glytoucan Graphical Interface Results](/images/manual/glycan-entry-G00028MO.png)
GlyTouCanの糖鎖のエントリーページの"Relation Data"の欄にある、"visualyzation Tool"をクリックすると本ツールのページに移動する。
