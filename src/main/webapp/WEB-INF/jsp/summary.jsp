<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="portal.model.SummaryItem" %>
<%
List<SummaryItem> categorySummaryList =
        (List<SummaryItem>) request.getAttribute("categorySummaryList");
List<SummaryItem> difficultySummaryList =
        (List<SummaryItem>) request.getAttribute("difficultySummaryList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学習状況サマリー</title>
</head>
<body>

<h1>研修ポータルmini</h1>
<h2>学習状況サマリー</h2>

<p style="color:red;">
    ${requestScope.errorMessage}
</p>

<p style="color:red;">
    ${requestScope.errorDetail}
</p>

<h2>全体サマリー</h2>

<table border="1">
    <tr>
        <th>項目</th>
        <th>値</th>
    </tr>
    <tr>
        <td>教材総数</td>
        <td>${requestScope.portalSummary.materialCount}件</td>
    </tr>
    <tr>
        <td>カテゴリ数</td>
        <td>${requestScope.portalSummary.categoryCount}件</td>
    </tr>
    <tr>
        <td>登録済みメモ数</td>
        <td>${requestScope.portalSummary.memoCount}件</td>
    </tr>
    <tr>
        <td>最新メモ登録日時</td>
        <td>${requestScope.portalSummary.latestMemoDateTime}</td>
    </tr>
    <tr>
        <td>教材1件あたりの平均メモ数</td>
        <td>${requestScope.portalSummary.averageMemoCount}件</td>
    </tr>
</table>

<h2>カテゴリ別教材数</h2>

<%
if (categorySummaryList == null || categorySummaryList.isEmpty()) {
%>
    <p>カテゴリ別教材数を表示できません。</p>
<%
} else {
%>
    <table border="1">
        <tr>
            <th>カテゴリ</th>
            <th>教材数</th>
        </tr>
<%
    for (SummaryItem item : categorySummaryList) {
%>
        <tr>
            <td><%= item.getLabel() %></td>
            <td><%= item.getCount() %>件</td>
        </tr>
<%
    }
%>
    </table>
<%
}
%>

<h2>難易度別教材数</h2>

<%
if (difficultySummaryList == null || difficultySummaryList.isEmpty()) {
%>
    <p>難易度別教材数を表示できません。</p>
<%
} else {
%>
    <table border="1">
        <tr>
            <th>難易度</th>
            <th>教材数</th>
        </tr>
<%
    for (SummaryItem item : difficultySummaryList) {
%>
        <tr>
            <td><%= item.getLabel() %></td>
            <td><%= item.getCount() %>件</td>
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
    <a href="materials">教材一覧へ戻る</a>
</p>

<p>
    <a href="db-info">DB情報確認へ移動する</a>
</p>

</body>
</html>
