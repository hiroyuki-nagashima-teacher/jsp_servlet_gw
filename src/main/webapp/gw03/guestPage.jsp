<%--
  解説: ゲストユーザー用ページです。role パラメータが "guest" のときにのみ内容を表示し、
  それ以外はアクセス拒否メッセージを出します。
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>ゲストページ</title>
    <style>
        body {font-family: Helvetica, sans-serif; background:#fafafa; padding:20px;}
        .guest {color:#003366;}
        .denied {color:#aa0000;}
    </style>
</head>
<body>
    <% String role = request.getParameter("role"); %>
    <h1>ゲストページ</h1>
    <% if ("guest".equalsIgnoreCase(role)) { %>
        <p class="guest">ようこそ、ゲスト様。閲覧可能な情報を表示します。</p>
        <ul>
            <li>公開記事一覧</li>
            <li>お問い合わせ</li>
        </ul>
    <% } else { %>
        <p class="denied">このページはゲスト専用です。role=guest を付与してアクセスしてください。</p>
    <% } %>
    <p><a href="basicPage.jsp">トップへ戻る</a></p>
</body>
</html>
