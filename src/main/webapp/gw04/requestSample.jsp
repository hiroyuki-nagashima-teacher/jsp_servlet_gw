<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 
    解説: 暗黙オブジェクト request (HttpServletRequest) を使い、クエリパラメータを取得します。
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>暗黙オブジェクト request の確認</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>暗黙オブジェクト request の確認</h1>
        
        <%
            // requestからクエリパラメータを取得
            String name = request.getParameter("name");
            if (name == null || name.isEmpty()) {
                name = "ゲスト（未指定）";
            }
        %>
        
        <h2>リクエストパラメータの表示</h2>
        <div class="alert-box alert-info">
            <p><strong>取得された name パラメータ:</strong> <code><%= name %></code></p>
        </div>

        <div class="alert-box alert-warning">
            <p>URLの末尾に <code>?name=任意の名前</code> を付けてリロードしてみてください。取得結果が変化します。</p>
        </div>

        <h2>検証リンク</h2>
        <ul>
            <li><a href="requestSample.jsp?name=Yamada">nameにYamadaを指定してアクセス</a></li>
            <li><a href="requestSample.jsp?name=Sato">nameにSatoを指定してアクセス</a></li>
        </ul>
        
        <p class="muted">requestはクライアントから送られた各種リクエスト情報（パラメータ、ヘッダー、URI等）を保持する暗黙オブジェクトです。</p>
    </div>
</body>
</html>
