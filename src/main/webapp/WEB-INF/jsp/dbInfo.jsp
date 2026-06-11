<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%
List<String> tableNames = (List<String>) request.getAttribute("tableNames");
List<Map<String, String>> columnInfoList =
        (List<Map<String, String>>) request.getAttribute("columnInfoList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB情報確認</title>
</head>
<body>

<h1>研修ポータルmini</h1>
<h2>DB情報確認</h2>

<p style="color:red;">
    ${requestScope.errorMessage}
</p>

<p style="color:red;">
    ${requestScope.errorDetail}
</p>

<h2>DatabaseMetaDataで取得した情報</h2>

<table border="1">
    <tr>
        <th>項目</th>
        <th>値</th>
    </tr>
    <tr>
        <td>DB製品名</td>
        <td>${requestScope.databaseProductName}</td>
    </tr>
    <tr>
        <td>DB製品バージョン</td>
        <td>${requestScope.databaseProductVersion}</td>
    </tr>
    <tr>
        <td>JDBCドライバ名</td>
        <td>${requestScope.driverName}</td>
    </tr>
    <tr>
        <td>JDBCドライババージョン</td>
        <td>${requestScope.driverVersion}</td>
    </tr>
    <tr>
        <td>接続URL</td>
        <td>${requestScope.databaseUrl}</td>
    </tr>
    <tr>
        <td>接続ユーザー名</td>
        <td>${requestScope.databaseUserName}</td>
    </tr>
</table>

<h2>テーブル一覧</h2>

<p>
    テーブル数:${requestScope.tableCount}
</p>

<%
if (tableNames == null || tableNames.isEmpty()) {
%>
    <p>テーブル情報を取得できませんでした。</p>
<%
} else {
%>
    <ul>
<%
    for (String tableName : tableNames) {
%>
        <li><%= tableName %></li>
<%
    }
%>
    </ul>
<%
}
%>

<h2>ResultSetMetaDataで取得したmaterials検索結果の列情報</h2>

<p>
    SELECT結果の列数:${requestScope.columnCount}
</p>

<%
if (columnInfoList == null || columnInfoList.isEmpty()) {
%>
    <p>列情報を取得できませんでした。</p>
<%
} else {
%>
    <table border="1">
        <tr>
            <th>列番号</th>
            <th>列ラベル</th>
            <th>列名</th>
            <th>DB上の型名</th>
            <th>Java側のクラス名</th>
            <th>列表示サイズ</th>
        </tr>
<%
    for (Map<String, String> columnInfo : columnInfoList) {
%>
        <tr>
            <td><%= columnInfo.get("columnIndex") %></td>
            <td><%= columnInfo.get("columnLabel") %></td>
            <td><%= columnInfo.get("columnName") %></td>
            <td><%= columnInfo.get("columnTypeName") %></td>
            <td><%= columnInfo.get("columnClassName") %></td>
            <td><%= columnInfo.get("columnDisplaySize") %></td>
        </tr>
<%
    }
%>
    </table>
<%
}
%>

<h2>注意点</h2>

<ul>
    <li>この画面は学習用、または管理者向けの確認画面です。</li>
    <li>接続URLや接続ユーザー名は、一般利用者に見せる情報ではありません。</li>
    <li>実務では、必要な管理者だけが見られるように権限管理を行います。</li>
</ul>

<p>
    <a href="dashboard">トップ画面へ戻る</a>
</p>

<p>
    <a href="materials">教材一覧へ戻る</a>
</p>

</body>
</html>
