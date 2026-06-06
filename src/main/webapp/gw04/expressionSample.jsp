<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 
    解説: 式（<%= %>）を用いて画面にJava変数の値を出力しています。式の末尾にセミコロン（;）は記述しません。
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSP式の確認</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>JSP式の確認（expression）</h1>
        
        <%
            String name = "Yamada";
            int score = 95;
        %>
        
        <h2>式の出力結果</h2>
        <div class="alert-box alert-info">
            <p>こんにちは、<strong><%= name %></strong> さん。</p>
            <p>あなたの得点は <strong><%= score %></strong> 点です。</p>
        </div>

        <div class="alert-box alert-warning">
            <p><strong>注意点:</strong> 式（<code>&lt;%= %&gt;</code>）の内部にはセミコロン（<code>;</code>）を記述しません。記述するとコンパイルエラーが発生します。</p>
        </div>

        <p class="muted">式は、サーブレット翻訳時に <code>out.print()</code> の引数として展開され、動的にブラウザへ送信されます。</p>
    </div>
</body>
</html>
