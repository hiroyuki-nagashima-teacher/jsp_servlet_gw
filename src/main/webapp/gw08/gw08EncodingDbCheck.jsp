<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:requestEncoding value="UTF-8" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GW08 文字コード・Databaseタグ確認</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container">

<h1>GW08 文字コード・Databaseタグ確認</h1>

<h2>1. fmt:requestEncodingの確認フォーム</h2>

<form action="gw08EncodingDbCheck.jsp" method="post">
    <div class="form-group">
        <label for="userName" class="form-label">名前:</label>
        <input type="text" id="userName" name="userName">
    </div>

    <div class="form-group">
        <label for="message" class="form-label">メッセージ:</label>
        <textarea id="message" name="message" rows="4" cols="50"></textarea>
    </div>

    <div class="form-group">
        <input type="submit" value="送信">
    </div>
</form>

<hr>

<h2>2. 送信された値</h2>

<table border="1">
    <tr>
        <th>項目</th>
        <th>値</th>
    </tr>
    <tr>
        <td>名前</td>
        <td>${param.userName}</td>
    </tr>
    <tr>
        <td>メッセージ</td>
        <td><c:out value="${param.message}" /></td>
    </tr>
</table>

<p>このページでは、JSPの先頭付近でfmt:requestEncoding value="UTF-8"を指定しています。</p>
<p>fmt:requestEncodingは、POST送信された日本語を扱うための文字コード指定として使えます。</p>

<h2>3. Databaseタグのコード例</h2>

<p>この作業では、Databaseタグの実行は行いません。次のコード例を読み、何をしているかを整理します。</p>

<h3>sql:setDataSourceの例</h3>

<pre>
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

<h2>4. Databaseタグの確認メモ</h2>

<table border="1">
    <tr>
        <th>タグ</th>
        <th>役割</th>
        <th>注意点</th>
    </tr>
    <tr>
        <td>sql:setDataSource</td>
        <td>JSPから使うデータソースを用意する。</td>
        <td>DB接続情報をJSPに寄せすぎると管理しづらくなる。</td>
    </tr>
    <tr>
        <td>sql:query</td>
        <td>SELECT文を実行する。</td>
        <td>JSPにSQLを書くと、画面とDB処理が混ざる。</td>
    </tr>
    <tr>
        <td>sql:update</td>
        <td>INSERT、UPDATE、DELETEなどを実行する。</td>
        <td>更新処理をJSPに書くと、エラー処理や保守が難しくなりやすい。</td>
    </tr>
    <tr>
        <td>sql:param</td>
        <td>SQLの?に値を渡す。</td>
        <td>入力値をSQLに使う場合は、直接文字列連結しないことが重要。</td>
    </tr>
</table>

<h2>5. JSPにDB処理を書く場合の注意</h2>

<ul>
    <li>JSPは基本的に画面表示を担当する場所です。</li>
    <li>SQLをJSPに直接書くと、画面変更とDB処理の変更が混ざります。</li>
    <li>同じSQLを複数画面で使いたい場合、JSPに直接書くと再利用しづらくなります。</li>
    <li>登録、更新、削除などの処理は、エラー処理や確認処理も必要になります。</li>
    <li>実務では、DB処理はDAOやServiceなどに分ける方が保守しやすくなります。</li>
</ul>

</div>
</body>
</html>
