<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sample" uri="http://example.com/tags/sample" %>
<%-- 
    解説: taglibディレクティブを使い、TLDに紐付けられた独自タグ（sample:hello）を利用しています。
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>TLDサンプルの確認</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>TLDサンプルの確認（独自タグ）</h1>
        
        <h2>1. 属性未指定（デフォルト）</h2>
        <div class="alert-box alert-info">
            <p><strong>実行結果:</strong> <sample:hello /></p>
        </div>

        <h2>2. name属性を指定</h2>
        <div class="alert-box alert-info">
            <p><strong>実行結果:</strong> <sample:hello name="山田" /></p>
        </div>

        <h2>タグ連携の詳細構造</h2>
        <table>
            <tr>
                <th>項目</th>
                <th>設定値</th>
            </tr>
            <tr>
                <td>JSP接頭辞 (prefix)</td>
                <td><code>sample</code></td>
            </tr>
            <tr>
                <td>JSPタグ名</td>
                <td><code>hello</code></td>
            </tr>
            <tr>
                <td>TLDファイルの配置場所</td>
                <td><code>/WEB-INF/tlds/sample.tld</code></td>
            </tr>
            <tr>
                <td>対応Javaクラス</td>
                <td><code>gw04.tag.HelloTag</code></td>
            </tr>
        </table>
        
        <p class="muted">このページでは、JSPのカスタムタグ機能とTLD（タグライブラリ記述子）の設定により、Javaクラスの処理がHTML出力として呼び出されています。</p>
    </div>
</body>
</html>
