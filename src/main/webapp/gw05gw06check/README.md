# GW07: フォーム入力・文字コード・クエリ情報・ヘッダ情報・リクエスト情報

このフォルダには、GW07の確認問題であるQ01〜Q05の課題を実装したJSPと、デザインを統一するための共通CSSファイルを配置しています。

## 配置
* **JSP / CSS**: `src/main/webapp/gw05gw06check/`

## 初学者向け解説コメントの追加
各JSPファイルのソースコード冒頭および主要な実装箇所に、初学者向けの**解説コメント（JSPコメント `<%-- --%>` または Javaコメント `//`）**を記載しています。
以下の学習ポイントについて詳しく解説していますので、ソースコードを併せて確認してください。
1. **JSPディレクティブ**: `contentType` や `pageEncoding` による文字化け対策。
2. **送信メソッド (GET/POST) の特性**: 送信方式の違いによるデータの流れやセキュリティ上の注意点。
3. **パラメータ取得API**: `request.getParameter()`、複数値を取得する `request.getParameterValues()`、およびチェックボックス未選択時の `null` 安全処理。
4. **HTTPヘッダ情報**: `User-Agent` や `Referer` などの意味と、`request.getHeaderNames()` と `Enumeration` ループを用いた動的一覧化。
5. **リクエスト診断メソッド**: `getRequestURL()` や `getContextPath()` などの違い。
6. **XSS（クロスサイトスクリプティング）対策**: HTMLエスケープ処理の基礎。

---

## ファイル一覧

| ファイル名 | 役割 | 該当問題 |
|---|---|---|
| `participantForm.jsp` | 研修参加登録フォーム（POST送信・各種入力フォーム） | Q01 |
| `participantResult.jsp` | 登録内容を表示するページ（複数選択値の配列取得とnull処理） | Q01 |
| `materialSearch.jsp` | 教材検索フォーム（GET送信・各種検索フォーム） | Q02 |
| `materialSearchResult.jsp` | 検索条件を表示するページ（HTTPメソッド・クエリ文字列表示） | Q02 |
| `shareLinkCreate.jsp` | URLエンコード済み共有リンクを作成するページ（URLEncoder利用） | Q03 |
| `shareLinkView.jsp` | 共有リンクの内容を表示するページ（自動デコード値の確認） | Q03 |
| `supportForm.jsp` | サポート問い合わせフォーム（POST送信・複数行テキスト等） | Q04 |
| `supportResult.jsp` | 問い合わせ内容とアクセス環境を表示するページ（全ヘッダのループ処理） | Q04 |
| `accessReport.jsp` | アクセス情報を診断レポート形式で表示するページ（リクエスト関連メソッド） | Q05 |
| `css/style.css` | 全ページ共通 of モダンCSSスタイルシート | 共通 |

---

## 検証用 URL

各課題の動作確認は、以下のURLよりブラウザでアクセスしてください。

| 機能 | 検証用 URL |
|---|---|
| **Q01: 研修参加登録フォーム** | [http://localhost:8080/jsp_servlet_gw/gw05gw06check/participantForm.jsp](http://localhost:8080/jsp_servlet_gw/gw05gw06check/participantForm.jsp) |
| **Q02: 教材検索フォーム** | [http://localhost:8080/jsp_servlet_gw/gw05gw06check/materialSearch.jsp](http://localhost:8080/jsp_servlet_gw/gw05gw06check/materialSearch.jsp) |
| **Q03: 共有リンク作成ページ** | [http://localhost:8080/jsp_servlet_gw/gw05gw06check/shareLinkCreate.jsp](http://localhost:8080/jsp_servlet_gw/gw05gw06check/shareLinkCreate.jsp) |
| **Q04: サポート問い合わせフォーム** | [http://localhost:8080/jsp_servlet_gw/gw05gw06check/supportForm.jsp](http://localhost:8080/jsp_servlet_gw/gw05gw06check/supportForm.jsp) |
| **Q05: アクセス診断レポート** | [http://localhost:8080/jsp_servlet_gw/gw05gw06check/accessReport.jsp?mode=check&keyword=JSP](http://localhost:8080/jsp_servlet_gw/gw05gw06check/accessReport.jsp?mode=check&keyword=JSP) |

※ Tomcat のコンテキストパスが `jsp_servlet_gw` である前提です。実行環境に合わせてポート番号やパス部分を適宜調整してください。
