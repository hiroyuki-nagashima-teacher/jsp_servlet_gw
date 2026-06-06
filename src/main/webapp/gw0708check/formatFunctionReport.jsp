<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
request.setAttribute("today", new java.util.Date());
%>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>Q02: 表示整形・文字列処理レポート</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container">
    <h1>表示整形・文字列処理レポート</h1>

    <!-- データ準備 -->
    <c:set var="price" value="1234567" />
    <c:set var="taxRate" value="0.1" />
    <c:set var="text" value="JSP and Servlet" />
    <c:set var="csvText" value="Java,JSP,Servlet,Database" />

    <h2>1. 数値の整形・パーセント表示</h2>
    <fmt:setLocale value="ja_JP" />
    <table>
        <tr>
            <th>表示内容</th>
            <th>使用タグ</th>
            <th>表示結果</th>
        </tr>
        <tr>
            <td>通常の数値</td>
            <td>fmt:formatNumber type="number"</td>
            <td><fmt:formatNumber value="${price}" type="number" /></td>
        </tr>
        <tr>
            <td>通貨</td>
            <td>fmt:formatNumber type="currency"</td>
            <td><fmt:formatNumber value="${price}" type="currency" /></td>
        </tr>
        <tr>
            <td>パーセント</td>
            <td>fmt:formatNumber type="percent"</td>
            <td><fmt:formatNumber value="${taxRate}" type="percent" /></td>
        </tr>
    </table>

    <h2>2. 日付表示</h2>
    <table>
        <tr>
            <th>表示内容</th>
            <th>使用タグ</th>
            <th>表示結果</th>
        </tr>
        <tr>
            <td>現在日時</td>
            <td>fmt:formatDate</td>
            <td><fmt:formatDate value="${today}" pattern="yyyy年MM月dd日 HH時mm分ss秒" /></td>
        </tr>
    </table>

    <h2>3. 文字列処理 (Functionsタグ)</h2>
    <c:set var="words" value="${fn:split(csvText, ',')}" />
    <table>
        <tr>
            <th>処理内容</th>
            <th>使用関数</th>
            <th>結果</th>
        </tr>
        <tr>
            <td>textの文字数</td>
            <td>fn:length</td>
            <td>${fn:length(text)}</td>
        </tr>
        <tr>
            <td>textにJSPが含まれるか</td>
            <td>fn:contains</td>
            <td>${fn:contains(text, "JSP")}</td>
        </tr>
        <tr>
            <td>JSPをJakarta Server Pagesに置換</td>
            <td>fn:replace</td>
            <td>${fn:replace(text, "JSP", "Jakarta Server Pages")}</td>
        </tr>
        <tr>
            <td>csvTextをカンマで分割して「 / 」で結合</td>
            <td>fn:split + fn:join</td>
            <td>${fn:join(words, " / ")}</td>
        </tr>
    </table>

    <h2>4. 分割結果の一覧表示 (fn:splitの結果をループ)</h2>
    <table>
        <tr>
            <th>番号</th>
            <th>値</th>
        </tr>
        <c:forEach var="word" items="${words}" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${word}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
