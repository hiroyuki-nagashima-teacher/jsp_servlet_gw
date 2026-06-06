<%--
  解説: UserBean を使用したサンプルページです。
  JSP の <jsp:useBean> タグで bean を生成し、EL でプロパティを表示します。
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>JavaBean の使用例</title>
</head>
<body>
    <h1>JavaBean (UserBean) のサンプル</h1>
    <%-- Bean がスコープに存在しなければ新規作成 --%>
    <jsp:useBean id="user" class="gw04.bean.UserBean" scope="request">
        <%-- 初期化パラメータを設定 --%>
        <jsp:setProperty name="user" property="name" value="山田花子" />
        <jsp:setProperty name="user" property="age" value="28" />
        <jsp:setProperty name="user" property="role" value="開発者" />
    </jsp:useBean>
    <p>名前: ${user.name}</p>
    <p>年齢: ${user.age}</p>
    <p>ロール: ${user.role}</p>
    <p><a href="basicPage.jsp">トップへ戻る</a></p>
</body>
</html>
