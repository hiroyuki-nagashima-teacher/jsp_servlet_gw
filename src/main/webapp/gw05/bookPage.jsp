<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 
    jsp:useBean アクションタグ:
    指定されたJavaBeansクラスのインスタンスを取得または生成します。
    - id: JSP内でこのBeanオブジェクトを識別する変数名
    - class: 対象のJavaBeansクラスの完全修飾クラス名
    - scope: Beanオブジェクトの有効範囲 (page = このページが終了するまで)
--%>
<jsp:useBean id="book" class="gw05.bean.BookBean" scope="page" />

<%-- 
    jsp:setProperty アクションタグ:
    Beanオブジェクトのプロパティ（setterメソッド）に値を設定します。
    - name: 対象のBeanのID (useBeanタグで定義したidと一致させます)
    - property: 値を設定するプロパティ名 (対応するsetterメソッドが呼び出されます)
    - value: 設定する値の文字列
--%>
<jsp:setProperty name="book" property="title" value="JSP入門" />
<jsp:setProperty name="book" property="author" value="研修チーム" />
<jsp:setProperty name="book" property="price" value="2500" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>書籍情報表示 - Q08</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>書籍情報表示</h1>
        
        <h2>書籍詳細</h2>
        <table>
            <tr>
                <th style="width: 30%;">項目</th>
                <th>表示内容</th>
            </tr>
            <tr>
                <td><strong>書籍名</strong></td>
                <td>
                    <%-- 
                        jsp:getProperty アクションタグ:
                        Beanオブジェクトのプロパティ（getterメソッド）から値を取得し、
                        そのまま画面のこの位置に出力します。
                    --%>
                    <jsp:getProperty name="book" property="title" />
                </td>
            </tr>
            <tr>
                <td><strong>著者</strong></td>
                <td><jsp:getProperty name="book" property="author" /></td>
            </tr>
            <tr>
                <td><strong>価格</strong></td>
                <td><jsp:getProperty name="book" property="price" />円</td>
            </tr>
        </table>
        
        <p class="muted">このページでは jsp:useBean, jsp:setProperty, jsp:getProperty を使ってJavaBeansクラスと連携しています。</p>
    </div>
</body>
</html>
