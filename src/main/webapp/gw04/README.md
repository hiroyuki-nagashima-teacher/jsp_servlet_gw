# GW04: JSP基本構文・チE��レクチE��ブ�Eアクションタグ・スクリプティング要素

こ�Eフォルダには「JSP基本構文・チE��レクチE��ブ�Eアクションタグ・スクリプティング要素」�E課題を実裁E��ぁEJSP と忁E��なサポ�Eトファイルを�E置してぁE��す、E吁E��ァイルの冒頭に **解説コメンチE* を記述し、�Eイントや注意点を説明してぁE��す、E
### 配置
- **JSP**: `src/main/webapp/gw04/`
- **Java クラス**:
  - 独自タグ: `src/main/java/gw04/tag/HelloTag.java`
  - JavaBeans: `src/main/java/gw04/bean/UserBean.java`
- **TLD**: `src/main/webapp/WEB-INF/tlds/sample.tld`

### ファイル一覧
| ファイル | 冁E�� |
|---|---|
| `pageDirectiveSample.jsp` | 作業2 pageチE��レクチE��ブとLocalDateTimeインポ�EチE|
| `commonHeader.jsp` | 作業2 共通�EチE��ー�E�静皁E��ンクルード用�E�E|
| `commonFooter.jsp` | 作業2 共通フチE��ー�E�静皁E��ンクルード用�E�E|
| `includeDirectiveSample.jsp` | 作業2 includeチE��レクチE��ブによるヘッダー・フッター結合 |
| `tldSample.jsp` | 作業3 独自タグ `sample:hello` の使用侁E|
| `includeMain.jsp` | 作業4 `jsp:include` による動的インクルード（メイン�E�E|
| `includeParts.jsp` | 作業4 `jsp:include` で取り込まれる部品E|
| `forwardMain.jsp` | 作業4 `jsp:forward` による転送E��メイン�E�E|
| `forwardTarget.jsp` | 作業4 `jsp:forward` の転送�EターゲチE�� |
| `paramMain.jsp` | 作業4 `jsp:param` を使った値の転送E��メイン�E�E|
| `paramTarget.jsp` | 作業4 `jsp:param` で渡された値の受信表示 |
| `beanSample.jsp` | 作業4 JavaBeans操佁E(`jsp:useBean` 筁E の確誁E|
| `declarationSample.jsp` | 作業5 宣言 (`<%! %>`) を用ぁE��変数とメソチE��定義 |
| `scriptletSample.jsp` | 作業5 スクリプトレチE�� (`<% %>`) を用ぁE��合計計箁E|
| `expressionSample.jsp` | 作業5 弁E(`<%= %>`) による変数出劁E|
| `templateSample.jsp` | 作業5 HTML固定テンプレートとスクリプトレチE��の繰り返し処琁E|
| `outSample.jsp` | 作業6 暗黙オブジェクチE`out` の使用侁E|
| `requestSample.jsp` | 作業6 暗黙オブジェクチE`request` によるパラメータ取征E|
| `sessionSave.jsp` | 作業6 暗黙オブジェクチE`session` への値の保孁E|
| `sessionShow.jsp` | 作業6 暗黙オブジェクチE`session` からの値の取得�E表示 |
| `commentSample.jsp` | 作業7 JSP/Java/HTML吁E��コメント�E出力差異検証 |

吁EJSP は UTF-8 を�E示し、文字化け防止のため `pageEncoding="UTF-8"` を指定してぁE��す、E
### 吁EJSP の検証用 URL

| ファイル | URL |
|---|---|
| `pageDirectiveSample.jsp` | [http://localhost:8080/jsp_servlet_gw/gw04/pageDirectiveSample.jsp](http://localhost:8080/jsp_servlet_gw/gw04/pageDirectiveSample.jsp) |
| `includeDirectiveSample.jsp` | [http://localhost:8080/jsp_servlet_gw/gw04/includeDirectiveSample.jsp](http://localhost:8080/jsp_servlet_gw/gw04/includeDirectiveSample.jsp) |
| `tldSample.jsp` | [http://localhost:8080/jsp_servlet_gw/gw04/tldSample.jsp](http://localhost:8080/jsp_servlet_gw/gw04/tldSample.jsp) |
| `includeMain.jsp` | [http://localhost:8080/jsp_servlet_gw/gw04/includeMain.jsp](http://localhost:8080/jsp_servlet_gw/gw04/includeMain.jsp) |
| `forwardMain.jsp` | [http://localhost:8080/jsp_servlet_gw/gw04/forwardMain.jsp](http://localhost:8080/jsp_servlet_gw/gw04/forwardMain.jsp) |
| `paramMain.jsp` | [http://localhost:8080/jsp_servlet_gw/gw04/paramMain.jsp](http://localhost:8080/jsp_servlet_gw/gw04/paramMain.jsp) |
| `beanSample.jsp` | [http://localhost:8080/jsp_servlet_gw/gw04/beanSample.jsp](http://localhost:8080/jsp_servlet_gw/gw04/beanSample.jsp) |
| `declarationSample.jsp` | [http://localhost:8080/jsp_servlet_gw/gw04/declarationSample.jsp](http://localhost:8080/jsp_servlet_gw/gw04/declarationSample.jsp) |
| `scriptletSample.jsp` | [http://localhost:8080/jsp_servlet_gw/gw04/scriptletSample.jsp](http://localhost:8080/jsp_servlet_gw/gw04/scriptletSample.jsp) |
| `expressionSample.jsp` | [http://localhost:8080/jsp_servlet_gw/gw04/expressionSample.jsp](http://localhost:8080/jsp_servlet_gw/gw04/expressionSample.jsp) |
| `templateSample.jsp` | [http://localhost:8080/jsp_servlet_gw/gw04/templateSample.jsp](http://localhost:8080/jsp_servlet_gw/gw04/templateSample.jsp) |
| `outSample.jsp` | [http://localhost:8080/jsp_servlet_gw/gw04/outSample.jsp](http://localhost:8080/jsp_servlet_gw/gw04/outSample.jsp) |
| `requestSample.jsp` | [http://localhost:8080/jsp_servlet_gw/gw04/requestSample.jsp?name=Yamada](http://localhost:8080/jsp_servlet_gw/gw04/requestSample.jsp?name=Yamada) |
| `sessionSave.jsp` | [http://localhost:8080/jsp_servlet_gw/gw04/sessionSave.jsp](http://localhost:8080/jsp_servlet_gw/gw04/sessionSave.jsp) |
| `sessionShow.jsp` | [http://localhost:8080/jsp_servlet_gw/gw04/sessionShow.jsp](http://localhost:8080/jsp_servlet_gw/gw04/sessionShow.jsp) |
| `commentSample.jsp` | [http://localhost:8080/jsp_servlet_gw/gw04/commentSample.jsp](http://localhost:8080/jsp_servlet_gw/gw04/commentSample.jsp) |

※ `forwardMain.jsp` にアクセスすると、�E動的に `forwardTarget.jsp` へ転送されます、E※ Tomcat のコンチE��ストパスぁE`jsp_servlet_gw` チE��レクトリ直下にマッピングされてぁE��前提です。実際の環墁E��合わせてパスを調整してください、E
