<%--
  解説: エラーハンドリング用ページです。errorTest.jsp から転送されます。
  pageディレクティブでUTF-8 と contentType を指定し、errorPage を設定しません。
--%>
<%@ page isErrorPage="true" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>エラーページ</title>
</head>
<body>
    <h1>エラーが発生しました</h1>
    <p>例外メッセージ: <%= exception.getMessage() %></p>
    <p>スタックトレース:</p>
    <pre><%= exception %></pre>
    <a href="basicPage.jsp">トップに戻る</a>
</body>
</html>
