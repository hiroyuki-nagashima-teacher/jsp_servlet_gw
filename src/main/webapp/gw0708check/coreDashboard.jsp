<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String[] subjects = {"JSP基礎", "フォーム処理", "リクエスト情報", "JSTL/EL"};
request.setAttribute("subjects", subjects);

java.util.Map<String, String> unitMap = new java.util.LinkedHashMap<>();
unitMap.put("form", "フォーム入力");
unitMap.put("query", "クエリ情報");
unitMap.put("header", "ヘッダ情報");
unitMap.put("jstl", "JSTL/EL");
request.setAttribute("unitMap", unitMap);
%>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>Q01: JSTL Coreタグ確認ダッシュボード</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container">
    <h1>JSTL Coreタグ確認ダッシュボード</h1>

    <!-- データ準備 (c:set) -->
    <c:set var="userName" value="山田" />
    <c:set var="courseName" value="JSP・Servlet基礎" />
    <c:set var="score" value="76" />
    <c:set var="login" value="true" />

    <h2>1. 基本情報</h2>
    <table>
        <tr>
            <th>表示項目</th>
            <th>表示結果</th>
        </tr>
        <tr>
            <td>受講者名 (c:out)</td>
            <td><c:out value="${userName}" /></td>
        </tr>
        <tr>
            <td>コース名 (EL)</td>
            <td>${courseName}</td>
        </tr>
        <tr>
            <td>点数 (EL)</td>
            <td>${score} 点</td>
        </tr>
        <tr>
            <td>点数+5 (EL計算)</td>
            <td>${score + 5} 点</td>
        </tr>
    </table>

    <h2>2. ログイン状態</h2>
    <div class="alert-info">
        <c:if test="${login}">
            ログイン中です。
        </c:if>
    </div>

    <h2>3. 合否判定</h2>
    <div class="alert-info">
        <c:if test="${score >= 60}">
            合格です。
        </c:if>
    </div>

    <h2>4. 評価表示</h2>
    <p>
        <strong>
            <c:choose>
                <c:when test="${score >= 80}">
                    評価:A
                </c:when>
                <c:when test="${score >= 60}">
                    評価:B
                </c:when>
                <c:otherwise>
                    評価:C
                </c:otherwise>
            </c:choose>
        </strong>
    </p>

    <h2>5. 受講単元一覧</h2>
    <table>
        <tr>
            <th>番号</th>
            <th>単元名</th>
        </tr>
        <c:forEach var="subject" items="${subjects}" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${subject}</td>
            </tr>
        </c:forEach>
    </table>

    <h2>6. Map列挙 (unitMap)</h2>
    <table>
        <tr>
            <th>キー</th>
            <th>表示名</th>
        </tr>
        <c:forEach var="entry" items="${unitMap}">
            <tr>
                <td>${entry.key}</td>
                <td>${entry.value}</td>
            </tr>
        </c:forEach>
    </table>

    <h2>7. c:removeの確認</h2>
    <c:set var="message" value="一時メッセージです。" />
    <p>削除前の値: <code>${message}</code></p>
    
    <c:remove var="message" />
    <p>削除後の値: <code>${message}</code></p>
</div>
</body>
</html>
