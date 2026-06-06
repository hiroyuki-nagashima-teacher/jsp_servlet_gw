<%--
  解説: 管理者専用ページです。クエリパラメータ `role=admin` が渡された場合にのみ内容を表示し、
  それ以外はアクセス拒否メッセージを出します。
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>管理者ページ</title>
    <style>
        body {font-family: Arial, sans-serif; background:#f9f9f9; padding:20px;}
        .admin {color:#006600;}
        .denied {color:#990000;}
    </style>
</head>
<body>
    <% String role = request.getParameter("role"); %>
    <h1>管理者ページ</h1>
    <% if ("admin".equalsIgnoreCase(role)) { %>
        <p class="admin">ようこそ、管理者様。機密情報がここに表示されます。</p>
        <ul>
            <li>ユーザー統計</li>
            <li>システム設定</li>
            <li>ログ閲覧</li>
        </ul>
    <% } else { %>
        <p class="denied">アクセス権がありません。管理者としてログインしてください。</p>
    <% } %>
    <p><a href="basicPage.jsp">トップへ戻る</a></p>
</body>
</html>
