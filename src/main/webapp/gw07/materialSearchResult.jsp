<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    /*
     * 1. request.getMethod(): HTTPリクエストメソッド（"GET" / "POST"）を取得。
     * 2. request.getQueryString(): URL末尾のクエリパラメータ文字列全体（生の文字列）を取得。
     * 3. request.getParameter(): クエリ文字列から指定キーの「値」を自動デコードして抽出。
     */
    String httpMethod = request.getMethod();
    String queryString = request.getQueryString();

    String keyword = request.getParameter("keyword");
    String category = request.getParameter("category");
    String order = request.getParameter("order");
    String limit = request.getParameter("limit");
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
    <title>教材検索条件確認</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h1>教材検索条件確認</h1>
        <p class="description">GET送信では、送信値がURLのクエリ情報として表示されます。</p>
        
        <h2>送信情報</h2>
        <table>
            <tr>
                <th>HTTPメソッド</th>
                <td><%= escapeHtml(httpMethod) %></td>
            </tr>
            <tr>
                <th>クエリ文字列全体</th>
                <td style="word-break: break-all;"><code><%= escapeHtml(queryString) %></code></td>
            </tr>
        </table>
        
        <h2>取得したパラメータ</h2>
        <table>
            <tr>
                <th>検索キーワード</th>
                <td><%= escapeHtml(keyword) %></td>
            </tr>
            <tr>
                <th>教材カテゴリ</th>
                <td><%= escapeHtml(category) %></td>
            </tr>
            <tr>
                <th>並び順</th>
                <td><%= escapeHtml(order) %></td>
            </tr>
            <tr>
                <th>表示件数</th>
                <td><%= escapeHtml(limit) %></td>
            </tr>
        </table>
        
        <a href="materialSearch.jsp" class="nav-link">← 検索フォームに戻る</a>
    </div>
</body>
</html>