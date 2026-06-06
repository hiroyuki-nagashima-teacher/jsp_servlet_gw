<%--
  解説: 商品一覧ページです。リンクをクリックすると productParts.jsp へ productId パラメータを渡して詳細を表示します。
  pageディレクティブでUTF-8 を指定しています。
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>商品一覧</title>
    <style>
        table {border-collapse: collapse; width: 60%; margin: auto;}
        th, td {border: 1px solid #444; padding: 8px; text-align: left;}
        th {background: #f0f0f0;}
    </style>
</head>
<body>
    <h1 style="text-align:center;">商品一覧</h1>
    <table>
        <tr><th>ID</th><th>商品名</th><th>価格</th></tr>
        <%-- 静的にサンプルデータを用意 --%>
        <tr>
            <td>1</td>
            <td><a href="productParts.jsp?productId=1">高級ノートPC</a></td>
            <td>150,000円</td>
        </tr>
        <tr>
            <td>2</td>
            <td><a href="productParts.jsp?productId=2">ワイヤレスマウス</a></td>
            <td>4,500円</td>
        </tr>
        <tr>
            <td>3</td>
            <td><a href="productParts.jsp?productId=3">USB-C ハブ</a></td>
            <td>7,800円</td>
        </tr>
    </table>
</body>
</html>
