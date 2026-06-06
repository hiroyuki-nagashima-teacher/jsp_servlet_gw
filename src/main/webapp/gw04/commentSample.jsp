<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 
    解説: JSPコメント、Javaコメント、HTMLコメントの書き方と、出力結果（ブラウザ側ソース）の差異を確認します。
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSPコメントの比較確認</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>JSPコメントの比較確認</h1>
        
        <%-- 1. これはJSPコメントです。サーバー側で取り除かれるため、ブラウザには絶対に送信されません。 --%>

        <%
            // 2. これはJavaの単一行コメントです。サーブレットソース内にのみ残ります。
            /* 
               3. これはJavaの複数行コメントです。
               これもブラウザ側には送信されません。
            */
            int number = 10;
        %>

        <!-- 4. これはHTMLコメントです。この記述はブラウザ側の「ページのソース表示」に残ります。 -->

        <h2>各コメントの比較特徴</h2>
        <table>
            <tr>
                <th>コメント名</th>
                <th>構文</th>
                <th>ブラウザ側ソースに</th>
                <th>主な用途</th>
            </tr>
            <tr>
                <td><strong>JSPコメント</strong></td>
                <td><code>&lt;%-- コメント --%&gt;</code></td>
                <td style="color: var(--danger); font-weight: bold;">残らない</td>
                <td>JSP全体の解説や機密情報・開発メモなど</td>
            </tr>
            <tr>
                <td><strong>Javaコメント</strong></td>
                <td><code>// コメント</code></td>
                <td style="color: var(--danger); font-weight: bold;">残らない</td>
                <td>スクリプトレット内のロジックの解説</td>
            </tr>
            <tr>
                <td><strong>HTMLコメント</strong></td>
                <td><code>&lt;!-- コメント --&gt;</code></td>
                <td style="color: var(--success); font-weight: bold;">残る</td>
                <td>HTMLデザインや構造に対する一般的な目印など</td>
            </tr>
        </table>

        <div class="alert-box alert-warning">
            <p><strong>動作確認方法:</strong> ブラウザでこのページを表示した状態で「ページのソースを表示」を実行し、上記の <code>JSPコメント</code> や <code>Javaコメント</code> が消えており、 <code>HTMLコメント</code> だけが見えることを確認してください。</p>
        </div>

        <p class="muted">JSPコメントは最も安全なコメント化の手段です。秘密情報などがブラウザから流出するのを完全に防止できます。</p>
    </div>
</body>
</html>
