<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:requestEncoding value="UTF-8" />

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>DB処理判断結果</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container">
    <h1>DB処理判断結果</h1>

    <h2>1. 送信された入力値</h2>
    <table>
        <tr>
            <th>項目</th>
            <th>値</th>
        </tr>
        <tr>
            <td>処理名</td>
            <td>${param.processName}</td>
        </tr>
        <tr>
            <td>処理種別</td>
            <td>${param.processType}</td>
        </tr>
        <tr>
            <td>SQLの複雑さ</td>
            <td>${param.sqlLevel}</td>
        </tr>
        <tr>
            <td>備考</td>
            <td><c:out value="${param.note}" /></td>
        </tr>
    </table>

    <h2>2. 処理種別に応じたタグ判断</h2>
    <div class="alert-info">
        <c:choose>
            <c:when test="${param.processType == 'select'}">
                SELECTなので、sql:queryを使う可能性があります。
            </c:when>
            <c:when test="${param.processType == 'insert'}">
                INSERTなので、sql:updateを使う可能性があります。
            </c:when>
            <c:when test="${param.processType == 'update'}">
                UPDATEなので、sql:updateを使う可能性があります。
            </c:when>
            <c:when test="${param.processType == 'delete'}">
                DELETEなので、sql:updateを使う可能性があります。
            </c:when>
            <c:otherwise>
                処理種別を確認してください。
            </c:otherwise>
        </c:choose>
    </div>

    <h2>3. Databaseタグの役割</h2>
    <table>
        <tr>
            <th>Databaseタグ</th>
            <th>役割</th>
        </tr>
        <tr>
            <td>sql:setDataSource</td>
            <td>JSPから使うデータソースを用意する</td>
        </tr>
        <tr>
            <td>sql:query</td>
            <td>SELECT文を実行する</td>
        </tr>
        <tr>
            <td>sql:update</td>
            <td>INSERT、UPDATE、DELETEなどを実行する</td>
        </tr>
        <tr>
            <td>sql:param</td>
            <td>SQLの?に値を渡す</td>
        </tr>
    </table>

    <h2>4. Databaseタグのコード例</h2>
    
    <h3>sql:setDataSourceの例</h3>
    <pre>
&lt;%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %&gt;

&lt;sql:setDataSource var="db" dataSource="jdbc/sample" /&gt;
    </pre>

    <h3>sql:queryの例</h3>
    <pre>
&lt;sql:query var="result" dataSource="${db}"&gt;
    SELECT id, name, email FROM address
&lt;/sql:query&gt;
    </pre>

    <h3>sql:paramを使ったSELECTの例</h3>
    <pre>
&lt;sql:query var="result" dataSource="${db}"&gt;
    SELECT id, name, email FROM address WHERE id = ?
    &lt;sql:param value="${param.id}" /&gt;
&lt;/sql:query&gt;
    </pre>

    <h3>sql:updateの例</h3>
    <pre>
&lt;sql:update dataSource="${db}"&gt;
    INSERT INTO address (name, email) VALUES (?, ?)
    &lt;sql:param value="${param.name}" /&gt;
    &lt;sql:param value="${param.email}" /&gt;
&lt;/sql:update&gt;
    </pre>

    <h2>5. JSPにDB処理を書く場合の注意点</h2>
    <ul>
        <li>JSPは基本的に画面表示を担当する場所である。</li>
        <li>SQLをJSPに直接書くと、画面とDB処理が混ざる。</li>
        <li>同じSQLを複数画面で再利用しづらい。</li>
        <li>更新処理をJSPに書くと、エラー処理や確認処理が複雑になりやすい。</li>
        <li>実務ではDAOやServiceなどに分ける方が保守しやすい。</li>
    </ul>

    <p style="margin-top: 2rem;">
        <a href="dbCheckForm.jsp" style="color: #2563eb; text-decoration: none; font-weight: 600;">← フォームに戻る</a>
    </p>
</div>
</body>
</html>
