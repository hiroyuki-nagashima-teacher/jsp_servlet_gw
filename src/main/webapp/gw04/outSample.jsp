<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 
    解説: 暗黙オブジェクト out（JspWriter）を使って、JSPファイルから直接文字列を出力します。
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>暗黙オブジェクト out の確認</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>暗黙オブジェクト out の確認</h1>
        
        <h2>out による出力テスト</h2>
        <div class="alert-box alert-info">
            <%
                out.print("out.print() でこの文字列を出力しました。");
                out.println("<br>");
                out.println("out.println() を使って出力した文字列です。");
            %>
        </div>

        <h2>JspWriterと暗黙オブジェクト</h2>
        <p>JSPのスクリプトレット内では、変数宣言なしで <code>out</code> というJspWriterインスタンスを利用できます。</p>
        
        <p class="muted">式（<code>&lt;%= %&gt;</code>）も内部的にはこの <code>out.print()</code> に置き換えられて実行されています。</p>
    </div>
</body>
</html>
