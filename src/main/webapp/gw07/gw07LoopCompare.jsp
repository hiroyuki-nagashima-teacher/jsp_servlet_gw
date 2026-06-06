<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ page import="java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    // スクリプトレットでテスト用データを用意し、リクエストスコープにセットします
    String userName = "佐藤";
    int score = 85;

    String[] products = {"キーボード", "マウス", "モニター", "USBメモリ"};

    Map<String, String> courseMap = new LinkedHashMap<String, String>();
    courseMap.put("java", "Java基礎");
    courseMap.put("jsp", "JSP基礎");
    courseMap.put("servlet", "Servlet基礎");
    courseMap.put("db", "データベース基礎");

    // JSTL/ELで参照できるようにリクエスト属性に登録します
    request.setAttribute("userName", userName);
    request.setAttribute("score", score);
    request.setAttribute("products", products);
    request.setAttribute("courseMap", courseMap);
%>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>GW07 繰り返しと比較</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h1>GW07 繰り返しと比較</h1>

        <h2>1. スクリプトレット版</h2>
        <%-- JavaコードをHTMLの中に混在させて記述する従来の方法です --%>
        <p>ユーザー名: <%= userName %></p>
        <p>点数: <%= score %></p>

        <% if (score >= 60) { %>
            <p>判定: <span style="color: #0284c7; font-weight: bold;">合格</span></p>
        <% } else { %>
            <p>判定: <span style="color: #ef4444; font-weight: bold;">不合格</span></p>
        <% } %>

        <table>
            <thead>
                <tr>
                    <th>番号</th>
                    <th>商品名</th>
                </tr>
            </thead>
            <tbody>
                <% for (int i = 0; i < products.length; i++) { %>
                    <tr>
                        <td><%= i + 1 %></td>
                        <td><%= products[i] %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>

        <hr>

        <h2>2. JSTL/EL版</h2>
        <%-- Javaコードを排除し、タグとEL式のみで記述する方法です。視認性が高く保守性に優れます --%>
        <p>ユーザー名: ${userName}</p>
        <p>点数: ${score}</p>

        <c:choose>
            <c:when test="${score >= 60}">
                <p>判定: <span style="color: #0284c7; font-weight: bold;">合格</span></p>
            </c:when>
            <c:otherwise>
                <p>判定: <span style="color: #ef4444; font-weight: bold;">不合格</span></p>
            </c:otherwise>
        </c:choose>

        <table>
            <thead>
                <tr>
                    <th>番号</th>
                    <th>商品名</th>
                </tr>
            </thead>
            <tbody>
                <%-- 
                    c:forEach で配列やリストの全要素をループ処理します。
                    varStatus="status" を指定すると、現在のループ状態（インデックスやカウント数）を取得できます。
                --%>
                <c:forEach var="product" items="${products}" varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td>${product}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <h2>3. Map列挙</h2>
        <table>
            <thead>
                <tr>
                    <th>キー</th>
                    <th>コース名</th>
                </tr>
            </thead>
            <tbody>
                <%-- 
                    Mapをループ処理すると、各要素は Map.Entry として扱われます。
                    entry.key でキー、entry.value で値を取得・出力できます。
                --%>
                <c:forEach var="entry" items="${courseMap}">
                    <tr>
                        <td><code>${entry.key}</code></td>
                        <td>${entry.value}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <h2>4. 比較メモ</h2>
        <table>
            <thead>
                <tr>
                    <th>処理</th>
                    <th>スクリプトレット版</th>
                    <th>JSTL/EL版</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>値の表示</th>
                    <td><code>&lt;%= 値 %&gt;</code></td>
                    <td><code>\${値}</code></td>
                </tr>
                <tr>
                    <th>条件分岐</th>
                    <td>if-else文</td>
                    <td><code>c:choose</code>、<code>c:when</code>、<code>c:otherwise</code></td>
                </tr>
                <tr>
                    <th>繰り返し</th>
                    <td>for文</td>
                    <td><code>c:forEach</code></td>
                </tr>
                <tr>
                    <th>番号表示</th>
                    <td><code>i + 1</code> (変数演算)</td>
                    <td><code>varStatus="status"</code> の <code>status.count</code></td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
