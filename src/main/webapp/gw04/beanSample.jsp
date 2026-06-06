<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 
    解説: jsp:useBean, jsp:setProperty, jsp:getProperty を使って JavaBeans オブジェクトを操作します。
--%>
<jsp:useBean id="user" class="gw04.bean.UserBean" scope="page" />

<!-- JavaBeansプロパティに値を設定 -->
<jsp:setProperty name="user" property="name" value="Yamada" />
<jsp:setProperty name="user" property="age" value="25" />
<jsp:setProperty name="user" property="role" value="Developer" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JavaBeansアクションタグの確認</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>JavaBeansアクションタグの確認</h1>
        
        <h2>Beanプロパティの出力 (jsp:getProperty)</h2>
        <table>
            <tr>
                <th>プロパティ</th>
                <th>設定値 (アクション出力)</th>
            </tr>
            <tr>
                <td><strong>name</strong></td>
                <td><jsp:getProperty name="user" property="name" /></td>
            </tr>
            <tr>
                <td><strong>age</strong></td>
                <td><jsp:getProperty name="user" property="age" /></td>
            </tr>
            <tr>
                <td><strong>role</strong></td>
                <td><jsp:getProperty name="user" property="role" /></td>
            </tr>
        </table>

        <h2>使用したアクションタグ一覧</h2>
        <ul>
            <li><code>&lt;jsp:useBean&gt;</code> - クラスのインスタンス生成/取得</li>
            <li><code>&lt;jsp:setProperty&gt;</code> - setterメソッドの呼び出し</li>
            <li><code>&lt;jsp:getProperty&gt;</code> - getterメソッドの呼び出しと出力</li>
        </ul>
        
        <p class="muted">このページでは、JavaBeans（UserBean）とJSP標準のアクションタグを組み合わせ、Javaソースコードを書かずにデータの操作と出力を行っています。</p>
    </div>
</body>
</html>
