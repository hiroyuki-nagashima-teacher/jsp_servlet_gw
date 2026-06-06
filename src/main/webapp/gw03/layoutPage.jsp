<%--
  解説: layoutPage.jsp は include ディレクティブでヘッダー・フッターを組み込みます。
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>レイアウトページ</title>
</head>
<body>
    <%@ include file="commonHeader.jsp" %>
    <h3>本文</h3>
    <p>この部分はlayoutPage.jspの本文です。</p>
    <%@ include file="commonFooter.jsp" %>
</body>
</html>
