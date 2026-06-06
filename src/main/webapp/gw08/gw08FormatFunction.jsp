<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
request.setAttribute("today", new Date());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GW08 Formatting・Functions確認</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container">

<h1>GW08 Formatting・Functions確認</h1>

<h2>1. 表示用データの準備</h2>

<c:set var="price" value="1234567" />
<c:set var="taxRate" value="0.1" />
<c:set var="text" value="JSP and Servlet" />
<c:set var="csvText" value="Java,JSP,Servlet,Database" />

<table border="1">
    <tr>
        <th>変数名</th>
        <th>値</th>
    </tr>
    <tr>
        <td>price</td>
        <td>${price}</td>
    </tr>
    <tr>
        <td>taxRate</td>
        <td>${taxRate}</td>
    </tr>
    <tr>
        <td>text</td>
        <td>${text}</td>
    </tr>
    <tr>
        <td>csvText</td>
        <td>${csvText}</td>
    </tr>
</table>

<h2>2. fmt:formatNumberで数値を整形する</h2>

<fmt:setLocale value="ja_JP" />

<table border="1">
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

<h2>3. fmt:formatDateで日付を整形する</h2>

<table border="1">
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

<h2>4. Functionsタグで文字列処理を行う</h2>

<c:set var="words" value="${fn:split(csvText, ',')}" />

<table border="1">
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
        <td>csvTextを分割して結合</td>
        <td>fn:split + fn:join</td>
        <td>${fn:join(words, " / ")}</td>
    </tr>
</table>

<h2>5. fn:splitの結果をc:forEachで一覧表示する</h2>

<table border="1">
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

<h2>6. 確認メモ</h2>

<ul>
    <li>fmt:formatNumberは、数値、通貨、パーセントなどを表示用に整えるために使います。</li>
    <li>fmt:formatDateは、日付や日時を表示用に整えるために使います。</li>
    <li>fmt:setLocaleは、ロケールを指定して表示形式に影響を与えるために使います。</li>
    <li>Functionsタグは、ELの中で文字列処理を行うために使います。</li>
    <li>fn:splitで分割した結果は、c:forEachと組み合わせて一覧表示できます。</li>
</ul>

</div>
</body>
</html>
