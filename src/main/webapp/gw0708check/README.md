# GW07・GW08確認問題：JSTL/EL・Coreタグ・Formattingタグ・Functionsタグ・Databaseタグ

## 1. 目的

本ディレクトリ（`webapp/gw0708check/`）は、GW07およびGW08で学習したJSTL（Coreタグ、Formattingタグ、Functionsタグ、Databaseタグ）およびEL式についての理解を深めるための確認問題用プログラムです。

---

## 2. ディレクトリ構成

| ファイル名 | 役割 |
| --- | --- |
| [coreDashboard.jsp](file:///c:/pleiades/2026-03/workspace/jsp_servlet_gw/src/main/webapp/gw0708check/coreDashboard.jsp) | Q01：JSTL Coreタグ確認ダッシュボード。配列やMapの繰り返し出力、条件分岐や値の削除などの確認。 |
| [formatFunctionReport.jsp](file:///c:/pleiades/2026-03/workspace/jsp_servlet_gw/src/main/webapp/gw0708check/formatFunctionReport.jsp) | Q02：表示整形・文字列処理レポート。数値のフォーマットやロケール指定、日付の表示、文字列の置換・分割・結合などの確認。 |
| [dbCheckForm.jsp](file:///c:/pleiades/2026-03/workspace/jsp_servlet_gw/src/main/webapp/gw0708check/dbCheckForm.jsp) | Q03：DB処理判断フォーム。処理名、処理種別、SQLの複雑さを送信するための入力フォーム。 |
| [dbCheckResult.jsp](file:///c:/pleiades/2026-03/workspace/jsp_servlet_gw/src/main/webapp/gw0708check/dbCheckResult.jsp) | Q03：DB処理の判断結果表示ページ。POSTされた値の受信と文字化け対策、処理種別に応じたDatabaseタグの選定、およびJSPにDB処理を書く際のリスク確認。 |
| [css/style.css](file:///c:/pleiades/2026-03/workspace/jsp_servlet_gw/src/main/webapp/gw0708check/css/style.css) | 画面を美しく表示するための共通スタイルシート（モダンなレイアウトとフォーム要素の装飾）。 |

---

## 3. 実行URL例

Tomcat起動後、ブラウザから以下のURLにアクセスして動作を確認します。

* **Q01：Coreタグ確認ダッシュボード**
  `http://localhost:8080/sample/gw0708check/coreDashboard.jsp`
* **Q02：表示整形・文字列処理レポート**
  `http://localhost:8080/sample/gw0708check/formatFunctionReport.jsp`
* **Q03：DB処理判断フォーム（ここから入力してResultへ送信します）**
  `http://localhost:8080/sample/gw0708check/dbCheckForm.jsp`

※ コンテキストパス（プロジェクト名）が `sample` の場合の例です。環境に応じて変更してください。
