<%--
  解説: カスタムタグ "hello" を使用したサンプルページです。
  taglibディレクティブで /WEB-INF/tlds/sample.tld を参照し、
  HelloTag が出力する文字列を表示します。
--%>
<%@ taglib uri="/WEB-INF/tlds/sample.tld" prefix="custom" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>カスタムタグサンプル</title>
</head>
<body>
    <h1>カスタムタグ HelloTag の使用例</h1>
    <p>下記はカスタムタグが出力したメッセージです：</p>
    <custom:hello />
</body>
</html>
