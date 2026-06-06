<%--
  解説: 商品詳細部品情報ページです。productId パラメータを受け取り、対応する部品リストを表示します。
  本サンプルでは static データを使用しています。
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>商品詳細</title>
    <style>
        table {border-collapse: collapse; width: 50%; margin: auto;}
        th, td {border: 1px solid #555; padding: 8px;}
        th {background: #e0e0e0;}
    </style>
</head>
<body>
    <h1 style="text-align:center;">商品詳細（部品情報）</h1>
    <% String productId = request.getParameter("productId"); %>
    <p>選択された商品 ID: <strong><%= productId != null ? productId : "未指定" %></strong></p>
    <% if ("1".equals(productId)) { %>
        <table>
            <tr><th>部品名</th><th>価格</th></tr>
            <tr><td>CPU</td><td>80,000円</td></tr>
            <tr><td>ディスプレイ</td><td>30,000円</td></tr>
            <tr><td>バッテリー</td><td>15,000円</td></tr>
        </table>
    <% } else if ("2".equals(productId)) { %>
        <table>
            <tr><th>部品名</th><th>価格</th></tr>
            <tr><td>ボタン</td><td>500円</td></tr>
            <tr><td>センサー</td><td>1,200円</td></tr>
        </table>
    <% } else if ("3".equals(productId)) { %>
        <table>
            <tr><th>部品名</th><th>価格</th></tr>
            <tr><td>HDMI ポート</td><td>800円</td></tr>
            <tr><td>USB ポート</td><td>600円</td></tr>
        </table>
    <% } else { %>
        <p>商品情報が見つかりません。</p>
    <% } %>
    <p style="text-align:center;"><a href="productMain.jsp">一覧に戻る</a></p>
</body>
</html>
