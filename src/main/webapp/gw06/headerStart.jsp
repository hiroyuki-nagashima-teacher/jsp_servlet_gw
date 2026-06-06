<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>ヘッダ確認開始ページ - GW06</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>ヘッダ確認開始ページ</h1>
        
        <div class="card" style="text-align: center;">
            <h2>ヘッダ情報取得テスト</h2>
            <p style="margin-bottom: 2rem; text-align: left; line-height: 1.6;">
                ブラウザが送信するリクエストヘッダ（<code>Referer</code> など）を確認します。<br>
                直接URLを入力して遷移すると <code>Referer</code>（リンク元の情報）は空になりますが、
                以下のボタンリンクをクリックして遷移すると、この開始ページのURLが <code>Referer</code> に記録されます。
            </p>
            
            <a href="headerInfo.jsp" class="btn">ヘッダ情報を確認する (headerInfo.jspへ)</a>
        </div>
        
        <div class="actions">
            <a href="encodeLink.jsp" class="nav-link">← URLエンコード確認ページへ</a>
            <a href="pathInfo.jsp" class="nav-link">リクエストパス情報ページへ →</a>
        </div>
    </div>
</body>
</html>
