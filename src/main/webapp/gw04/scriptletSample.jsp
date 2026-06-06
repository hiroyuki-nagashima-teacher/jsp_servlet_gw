<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 
    解説: スクリプトレット（<% %>）の中に通常のJava命令（ローカル変数の宣言、繰り返し処理）を記述しています。
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSPスクリプトレットの確認</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>JSPスクリプトレットの確認</h1>
        
        <h2>ローカル変数と処理（1から10までの合計）</h2>
        <%
            // スクリプトレット内に通常のJavaプログラムを記述
            int total = 0;
            for (int i = 1; i <= 10; i++) {
                total += i;
            }
        %>
        
        <div class="alert-box alert-success">
            <p><strong>1から10までの合計値:</strong> <code><%= total %></code></p>
        </div>

        <p class="muted">スクリプトレット（<code>&lt;% %&gt;</code>）内の変数は、サーブレットの <code>_jspService()</code> メソッド内のローカル変数として翻訳されます。そのため、リクエスト間で共有されることはありません。</p>
    </div>
</body>
</html>
