<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>研修ポータルmini ログイン</title>
</head>
<body>

<h1>研修ポータルmini</h1>
<h2>ログイン</h2>

<p>ユーザーIDとパスワードを入力してください。</p>

<p>
    ${requestScope.guideMessage}
</p>

<p style="color:red;">
    ${requestScope.errorMessage}
</p>

<form action="login" method="post">
    <p>
        ユーザーID:
        <input type="text" name="userId" value="${requestScope.inputUserId}">
    </p>

    <p>
        パスワード:
        <input type="password" name="password">
    </p>

    <p>
        所属部署:
        <input type="text" name="department" value="${requestScope.inputDepartment}">
    </p>

    <p>
        <input type="submit" value="ログイン">
    </p>
</form>

<hr>

<p>動作確認用の入力値</p>
<ul>
    <li>ユーザーID:admin</li>
    <li>パスワード:password</li>
</ul>

<p>
    <a href="portal/start">ハンズオン1のServletへ戻る</a>
</p>

</body>
</html>
