<%--
  解説: エラーを意図的に送出し、errorPage.jsp へフォワードさせるテストページです。
  pageディレクティブでUTF-8 と contentType を指定し、errorPage を指定しています。
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" errorPage="errorPage.jsp" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>エラーテストページ</title>
</head>
<body>
    <h1>エラーテストページ</h1>
    <p>下のボタンをクリックすると例外が発生し、errorPage.jsp へ遷移します。</p>
    <form method="post">
        <button type="submit" name="trigger" value="true">エラーを発生させる</button>
    </form>
    <%-- ボタンがクリックされたら例外を投げる --%>
    <% if ("true".equals(request.getParameter("trigger"))) { %>
        <% throw new RuntimeException("意図的に発生させた例外です"); %>
    <% } %>
</body>
</html>
