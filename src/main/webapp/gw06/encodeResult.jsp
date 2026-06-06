<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    /*
       【Javaコメント】
       getParameterメソッドは、サーブレットコンテナ(Tomcat)により自動的にデコードされた後の文字列を取得します。
    */
    String keyword = request.getParameter("keyword");
    
    /* getQueryStringメソッドは、デコード前の生のURLパラメータ文字列をそのまま取得します。 */
    String queryString = request.getQueryString();
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>URLデコード結果 - GW06</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>URLデコード結果</h1>
        
        <div class="card">
            <h2>取得したクエリ情報</h2>
            <table>
                <thead>
                    <tr>
                        <th style="width: 45%;">取得項目 (メソッド)</th>
                        <th>値 (表示結果)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><strong>自動デコードされた値 (getParameter)</strong></td>
                        <td><span style="font-size: 1.1rem; font-weight: 600; color: #10b981;"><%= (keyword != null) ? keyword : "なし" %></span></td>
                    </tr>
                    <tr class="highlight-row">
                        <td><strong>エンコード状態の文字列 (getQueryString)</strong></td>
                        <td style="word-break: break-all; color: #7c3aed; font-family: monospace;"><%= (queryString != null) ? queryString : "なし" %></td>
                    </tr>
                </tbody>
            </table>
            
            <p class="muted" style="text-align: left;">
                <strong>💡 観察ポイント:</strong><br>
                - <code>request.getParameter("keyword")</code> の結果は、元の日本語やスペースに<strong>自動でデコード（復元）</strong>されています。<br>
                - <code>request.getQueryString()</code> の結果は、デコードされずブラウザから送信された<strong>エンコードされた状態のまま</strong>になっています。
            </p>
            
            <div style="margin-top: 2rem;">
                <a href="encodeLink.jsp" class="btn btn-secondary">エンコードページに戻る</a>
            </div>
        </div>
    </div>
</body>
</html>
