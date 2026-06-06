<%--
  解説: forwardCheck.jsp は RequestDispatcher#forward を使って別ページへ遷移します。
  ここでは "target.jsp"（実際には basicPage.jsp）へフォワードしています。
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>Forward テスト</title>
</head>
<body>
    <h1>Forward テストページ</h1>
    <p>このページはサーバ側で <code>forward</code> され、実際に表示されるのは別ページです。</p>
    <%-- フォワード先を指定（basicPage.jsp） --%>
    <% request.getRequestDispatcher("basicPage.jsp").forward(request, response); %>
</body>
</html>
