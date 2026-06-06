<%--
  解説: 現在日時を表示するページです。pageディレクティブでUTF-8とcontentTypeを指定し、
  importディレクティブでjava.timeクラスをインポートしています。
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>現在日時の確認</title>
</head>
<body>
    <h1>現在日時の確認</h1>
    <%-- スクリプトレットで現在日時を取得 --%>
    <% LocalDateTime now = LocalDateTime.now();
       DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
    %>
    <p>現在日時: <%= fmt.format(now) %></p>
    <p>java.time.LocalDateTimeを使用しています。</p>
</body>
</html>
