<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学習メモ登録</title>
</head>
<body>

<h1>研修ポータルmini</h1>
<h2>学習メモ登録</h2>

<p style="color:red;">
    ${requestScope.errorMessage}
</p>

<p>
    エラー詳細:${requestScope.errorDetail}
</p>

<table border="1">
    <tr>
        <th>項目</th>
        <th>値</th>
    </tr>
    <tr>
        <td>教材ID</td>
        <td>${requestScope.material.materialId}</td>
    </tr>
    <tr>
        <td>教材名</td>
        <td>${requestScope.material.title}</td>
    </tr>
    <tr>
        <td>カテゴリ</td>
        <td>${requestScope.material.category}</td>
    </tr>
    <tr>
        <td>難易度</td>
        <td>${requestScope.material.difficulty}</td>
    </tr>
</table>

<form action="memo-register" method="post">
    <input type="hidden" name="materialId" value="${requestScope.material.materialId}">

    <p>
        学習メモ:
    </p>

    <p>
        <textarea name="memoText" rows="6" cols="60">${requestScope.inputMemoText}</textarea>
    </p>

    <p>
        <input type="submit" value="登録">
    </p>
</form>

<p>
    <a href="materials">教材一覧へ戻る</a>
</p>

</body>
</html>
