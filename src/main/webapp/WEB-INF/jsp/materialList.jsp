<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="portal.model.Material" %>
<%
List<Material> materials = (List<Material>) request.getAttribute("materials");
List<String> categories = (List<String>) request.getAttribute("categories");
String selectedCategory = (String) request.getAttribute("selectedCategory");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>教材一覧</title>
</head>
<body>

<h1>研修ポータルmini</h1>
<h2>${requestScope.pageTitle}</h2>

<p style="color:red;">
    ${requestScope.errorMessage}
</p>

<p style="color:blue;">
    ${requestScope.completeMessage}
</p>

<p>
    エラー詳細:${requestScope.errorDetail}
</p>

<h2>検索条件</h2>

<p>
    現在の検索条件:${requestScope.searchCondition}
</p>

<p>
    教材件数:${requestScope.materialCount}
</p>

<p>
    カテゴリ件数:${requestScope.categoryCount}
</p>

<p>
    登録した教材ID:${requestScope.registeredMaterialId}
</p>

<h2>カテゴリ絞り込み</h2>

<form action="materials" method="get">
    <select name="category">
        <option value="">全件</option>
<%
if (categories != null) {
    for (String category : categories) {
        String selected = "";
        if (category.equals(selectedCategory)) {
            selected = "selected";
        }
%>
        <option value="<%= category %>" <%= selected %>><%= category %></option>
<%
    }
}
%>
    </select>
    <input type="submit" value="カテゴリで絞り込み">
</form>

<%
if (materials == null || materials.isEmpty()) {
%>
    <p>表示できる教材がありません。</p>
<%
} else {
%>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>タイトル</th>
            <th>カテゴリ</th>
            <th>難易度</th>
            <th>説明</th>
            <th>表示順</th>
            <th>メモ数</th>
            <th>操作</th>
        </tr>

<%
    for (Material material : materials) {
%>
        <tr>
            <td><%= material.getMaterialId() %></td>
            <td><%= material.getTitle() %></td>
            <td><%= material.getCategory() %></td>
            <td><%= material.getDifficulty() %></td>
            <td><%= material.getDescription() %></td>
            <td><%= material.getDisplayOrder() %></td>
            <td><%= material.getMemoCount() %></td>
            <td>
                <a href="memo-form?materialId=<%= material.getMaterialId() %>">メモ登録</a>
            </td>
        </tr>
<%
    }
%>
    </table>
<%
}
%>

<p>
    <a href="dashboard">トップ画面へ戻る</a>
</p>

<p>
    <a href="logout">ログアウトする</a>
</p>

</body>
</html>
