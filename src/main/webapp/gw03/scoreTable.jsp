<%--
  解説: スコアテーブルを表示するサンプルです。JSTL は使用せず、スクリプトレットで
  ArrayList<Integer> を作成し、for ループでテーブル行を出力します。
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>スコアテーブル</title>
    <style>
        table {border-collapse: collapse; width: 40%; margin: auto;}
        th, td {border: 1px solid #333; padding: 8px; text-align: center;}
        th {background: #ddd;}
    </style>
</head>
<body>
    <h1 style="text-align:center;">スコアテーブル</h1>
    <%-- スコアリスト作成 --%>
    <%
        List<Integer> scores = new ArrayList<>();
        scores.add(85);
        scores.add(92);
        scores.add(76);
        scores.add(64);
        scores.add(100);
    %>
    <table>
        <tr><th>順位</th><th>スコア</th></tr>
        <% for (int i = 0; i < scores.size(); i++) { %>
            <tr>
                <td><%= i + 1 %></td>
                <td><%= scores.get(i) %></td>
            </tr>
        <% } %>
    </table>
    <p style="text-align:center;"><a href="basicPage.jsp">トップへ戻る</a></p>
</body>
</html>
