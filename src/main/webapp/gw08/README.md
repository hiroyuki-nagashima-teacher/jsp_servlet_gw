# GW08：JSTL周辺タグと使う/使わない判断

## 1. 目的

このグループワークでは、JSTLのCoreタグ以外の周辺機能（Formattingタグ、Functionsタグ、Databaseタグ）を確認します。
タグの使い方を暗記するだけでなく、**「JSPにどこまで処理を書いてよいのか」**というJSPの責務と切り分けについて理解することを目的とします。

---

## 2. ディレクトリ構成

本ディレクトリ（`webapp/gw08/`）には以下のファイルが配置されています。

| ファイル名 | 役割 |
| --- | --- |
| [gw08FormatFunction.jsp](file:///c:/pleiades/2026-03/workspace/jsp_servlet_gw/src/main/webapp/gw08/gw08FormatFunction.jsp) | FormattingタグとFunctionsタグの動作確認用JSP。 |
| [gw08EncodingDbCheck.jsp](file:///c:/pleiades/2026-03/workspace/jsp_servlet_gw/src/main/webapp/gw08/gw08EncodingDbCheck.jsp) | `fmt:requestEncoding` による文字コード指定とDatabaseタグの注意点確認用JSP。 |
| [gw08_report.md](file:///c:/pleiades/2026-03/workspace/jsp_servlet_gw/src/main/webapp/gw08/gw08_report.md) | グループワーク課題に対する「観察表」「判断表」「役割整理表」「発表メモ」をまとめた成果物レポート。 |
| [css/style.css](file:///c:/pleiades/2026-03/workspace/jsp_servlet_gw/src/main/webapp/gw08/css/style.css) | 他のグループワーク課題のスタイルに合わせた、モダンなデザインを適用するスタイルシート。 |

---

## 3. 実行URL例

Tomcat起動後、ブラウザから以下のURLにアクセスして動作を確認します。

* **Formatting・Functions確認**
  `http://localhost:8080/sample/gw08/gw08FormatFunction.jsp`
* **文字コード・Databaseタグ確認**
  `http://localhost:8080/sample/gw08/gw08EncodingDbCheck.jsp`

※ コンテキストパス（プロジェクト名）が `sample` の場合の例です。環境に応じて変更してください。

---

## 4. 最終確認事項

グループワークのまとめとして、以下の内容を説明できるように整理しています。

* **Formattingタグ**：数値、通貨、パーセント、日付などを画面表示用に整形するときに使用する。
* **Functionsタグ**：EL式の中で文字列の長さ取得、検索、置換、分割、結合などを行うときに使用する。
* **Databaseタグ**：JSPからSQL実行やDB更新も行えるが、実務では画面表示とDB処理が混ざり保守性や再利用性が低下するため、使用は避けるべきである。
* **責務の分離**：JSPは表示を担当する場所であることを意識し、DB処理や複雑な業務処理はサーブレット、DAO、Serviceなどに切り分ける判断が重要である。
