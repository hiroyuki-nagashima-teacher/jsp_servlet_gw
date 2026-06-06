<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 
    解説: 暗黙オブジェクト session からオブジェクトを取り出して表示します。
--%>
<%
    // セッションから属性を取得
    String loginUser = (String) session.getAttribute("loginUser");
    if (loginUser == null) {
        loginUser = "セッション情報はありません（未ログイン）";
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>セッション表示 - 暗黙オブジェクト</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>セッション取得 (session)</h1>
        
        <h2>セッションデータの読み出し結果</h2>
        <div class="alert-box alert-info">
            <p><strong>loginUser:</strong> <code><%= loginUser %></code></p>
        </div>

        <h2>テスト用リンク</h2>
        <ul>
            <li><a href="sessionSave.jsp">セッションに再保存する (sessionSave.jsp)</a></li>
            <li><a href="sessionShow.jsp">このページをリロードする</a></li>
        </ul>
        
        <p class="muted">この表示は、別のページ（sessionSave.jsp）で保存したデータを、セッションを通じて引き継いで表示しています。</p>
    </div>
</body>
</html>
