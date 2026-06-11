<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>研修ポータルmini トップ</title>
</head>
<body>

<h1>研修ポータルmini</h1>
<h2>トップ画面</h2>

<p>${requestScope.loginMessage}</p>

<table border="1">
    <tr>
        <th>項目</th>
        <th>値</th>
    </tr>
    <tr>
        <td>ユーザーID</td>
        <td>${sessionScope.loginUser.userId}</td>
    </tr>
    <tr>
        <td>表示名</td>
        <td>${sessionScope.loginUser.userName}</td>
    </tr>
    <tr>
        <td>所属部署</td>
        <td>${sessionScope.loginUser.department}</td>
    </tr>
    <tr>
        <td>現在の画面</td>
        <td>${requestScope.pageTitle}</td>
    </tr>
    <tr>
        <td>アクセス日時</td>
        <td>${requestScope.accessTime}</td>
    </tr>
    <tr>
        <td>次の学習内容</td>
        <td>${requestScope.nextStudy}</td>
    </tr>
    <tr>
        <td>補足</td>
        <td>${requestScope.notice}</td>
    </tr>
    <tr>
        <td>ログイン回数</td>
        <td>${sessionScope.loginCount}</td>
    </tr>
    <tr>
        <td>セッションID</td>
        <td>${requestScope.sessionId}</td>
    </tr>
</table>

<h2>メニュー</h2>

<ul>
    <li><a href="db-check">DB接続を確認する</a></li>
    <li><a href="db-info">DB情報を確認する</a></li>
    <li><a href="materials">教材一覧を見る</a></li>
    <li><a href="materials">学習メモを登録する</a></li>
    <li><a href="summary">学習状況サマリーを見る</a></li>
    <li><a href="logout">ログアウトする</a></li>
</ul>

<hr>

<p>
    <a href="login">ログイン画面へ戻る</a>
</p>

</body>
</html>
