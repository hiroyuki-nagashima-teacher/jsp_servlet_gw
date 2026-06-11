<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB接続確認</title>
</head>
<body>

<h1>DB接続確認</h1>

<p>${requestScope.message}</p>

<table border="1">
    <tr>
        <th>項目</th>
        <th>値</th>
    </tr>
    <tr>
        <td>確認時刻</td>
        <td>${requestScope.checkTime}</td>
    </tr>
    <tr>
        <td>ログインユーザー</td>
        <td>${requestScope.loginUser.userName}</td>
    </tr>
    <tr>
        <td>JNDI名</td>
        <td>${requestScope.jndiName}</td>
    </tr>
    <tr>
        <td>接続成功</td>
        <td>${requestScope.success}</td>
    </tr>
    <tr>
        <td>Connectionクラス</td>
        <td>${requestScope.connectionClass}</td>
    </tr>
    <tr>
        <td>エラー内容</td>
        <td>${requestScope.errorMessage}</td>
    </tr>
</table>

<h2>接続に失敗した場合は、以下を確認してください。</h2>

<ul>
    <li>JDBCドライバが配置されているか。</li>
    <li>context.xmlのnameがjdbc/mysqlになっているか。</li>
    <li>DbUtilのJNDI名がjava:/comp/env/jdbc/mysqlになっているか。</li>
    <li>DBサーバが起動しているか。</li>
    <li>training_portalデータベースが存在するか。</li>
    <li>sampleuserに権限があるか。</li>
    <li>context.xmlのユーザー名、パスワードが正しいか。</li>
    <li>Tomcatを再起動したか。</li>
</ul>

<p>
    <a href="dashboard">トップ画面へ戻る</a>
</p>

<p>
    <a href="logout">ログアウトする</a>
</p>

</body>
</html>
