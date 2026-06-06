<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 
    pageディレクティブ: 
    JSPページ全体の設定を行います。
    - contentType: ブラウザへ返すMIMEタイプと文字コードを指定し、日本語の文字化けを防ぎます。
    - pageEncoding: JSPファイル自身の保存文字コード(UTF-8)を指定します。
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSP研修案内 - Q01</title>
    <!-- 共通のスタイルシートを読み込み、モダンなデザインを適用します -->
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>JSP研修案内</h1>
        
        <h2>研修情報</h2>
        <!-- 箇条書きや表を用いて、研修情報を整理して分かりやすく表示します -->
        <table>
            <tr>
                <th>項目</th>
                <th>表示内容</th>
            </tr>
            <tr>
                <td><strong>研修名</strong></td>
                <td>JSP基礎研修</td>
            </tr>
            <tr>
                <td><strong>対象者</strong></td>
                <td>Webアプリケーション初学者</td>
            </tr>
            <tr>
                <td><strong>学習内容</strong></td>
                <td>JSP基本構文、ディレクティブ、アクションタグ</td>
            </tr>
            <tr>
                <td><strong>注意事項</strong></td>
                <td>サンプルコードを写すだけでなく、役割を理解すること</td>
            </tr>
        </table>
        
        <p class="muted">このページはJSPで作成されています。</p>
    </div>
</body>
</html>
