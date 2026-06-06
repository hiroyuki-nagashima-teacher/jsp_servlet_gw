<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%-- 
    解説: pageディレクティブを使い、文字エンコードとJavaクラスのインポートを行っています。
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>pageディレクティブの確認</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>pageディレクティブの確認</h1>
        
        <h2>現在日時の取得</h2>
        <%
            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
            String formattedNow = now.format(formatter);
        %>
        
        <div class="alert-box alert-info">
            <p><strong>現在日時:</strong> <%= formattedNow %></p>
        </div>

        <h2>インポートしたJavaクラス</h2>
        <ul>
            <li><code>java.time.LocalDateTime</code></li>
            <li><code>java.time.format.DateTimeFormatter</code></li>
        </ul>

        <p class="muted">このページは、pageディレクティブによって文字コードが指定され、Javaクラスがインポートされています。</p>
    </div>
</body>
</html>
