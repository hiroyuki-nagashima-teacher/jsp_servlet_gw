<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 
    pageディレクティブのerrorPage属性:
    このページ内で未キャッチの例外（エラー）が発生した際に、
    自動的に遷移（フォワード）させるエラーハンドラーページのパスを指定します。
--%>
<%@ page errorPage="systemError.jsp" %>
<%
    /* 商品価格と個数を表す変数を用意します */
    int price = 1000;
    int count = 0;
    
    /* 
       意図的に0による割り算（1000 / 0）を発生させます。
       Javaでは整数を0で割ると ArithmeticException がスローされるため、
       この時点で即座に上記の「systemError.jsp」に処理が遷移します。
    */
    int total = price / count;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>価格計算ページ - Q04</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>価格計算ページ</h1>
        <%-- 例外が発生するため、以下の出力処理は実行されません --%>
        <p>計算結果: <%= total %>円</p>
    </div>
</body>
</html>
