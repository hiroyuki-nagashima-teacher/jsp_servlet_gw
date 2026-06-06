<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 
    解説: 固定テンプレート（HTML）とスクリプトレットのJavaコードを細かく分断させて繰り返し出力を表現しています。
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>テンプレートと Java の組み合わせ</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>固定テンプレートと Java の組み合わせ</h1>
        
        <h2>for文による繰り返しリスト出力</h2>
        <ul>
        <%
            // for文の開始
            for (int i = 1; i <= 5; i++) {
        %>
            <!-- この部分は繰り返し出力されるHTML固定テンプレートです -->
            <li>項目番号: <strong><%= i %></strong></li>
        <%
            } // for文の閉じカッコ
        %>
        </ul>
        
        <p class="muted">このようにスクリプトレットのブロックを分断することで、HTML構造の中にJavaのループや条件分岐を織り交ぜてダイナミックなマークアップを生成できます。</p>
    </div>
</body>
</html>
