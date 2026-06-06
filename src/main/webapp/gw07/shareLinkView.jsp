<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    /*
     * 1. 自動デコードの仕組み:
     *    `request.getParameter()` を使用した時点で、Webコンテナが自動的にURLパラメータを元の文字列にデコード（復元）します。
     */
    String title = request.getParameter("title");
    String category = request.getParameter("category");
    String returnUrl = request.getParameter("returnUrl");

    /*
     * 2. 生のクエリ文字列との比較:
     *    `request.getQueryString()` はデコードされる前の「生のエンコード済み文字列」を取得します。
     */
    String queryString = request.getQueryString();
%>
<%!
    /* HTMLエスケープ処理用のメソッド */
    private String escapeHtml(String val) {
        if (val == null) return "";
        return val.replace("&", "&amp;")
                  .replace("<", "&lt;")
                  .replace(">", "&gt;")
                  .replace("\"", "&quot;")
                  .replace("'", "&#39;");
    }
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>共有リンク内容確認</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h1>共有リンク内容確認</h1>
        <p class="description">request.getParameterではデコード後の値を取得できます。</p>
        
        <h2>クエリ文字列情報</h2>
        <table>
            <tr>
                <th>クエリ文字列全体（未デコード）</th>
                <td style="word-break: break-all;"><code><%= escapeHtml(queryString) %></code></td>
            </tr>
        </table>
        
        <h2>デコードされたパラメータ</h2>
        <table>
            <tr>
                <th>タイトル (title)</th>
                <td><%= escapeHtml(title) %></td>
            </tr>
            <tr>
                <th>カテゴリ (category)</th>
                <td><%= escapeHtml(category) %></td>
            </tr>
            <tr>
                <th>戻り先URL (returnUrl)</th>
                <td><%= escapeHtml(returnUrl) %></td>
            </tr>
        </table>
        
        <a href="shareLinkCreate.jsp" class="nav-link">← 共有リンク作成ページに戻る</a>
    </div>
</body>
</html>