<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 
    解説: jsp:forwardで転送されたリクエストを処理するターゲットページです。
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>フォワード先の確認</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>フォワード先の確認</h1>
        
        <div class="alert-box alert-success">
            <h3>転送成功</h3>
            <p><strong>[forwardTarget.jsp]</strong> 転送先のページが表示されています。</p>
        </div>

        <h2>URLを確認してください</h2>
        <p>ブラウザのURL欄は <code>forwardMain.jsp</code> のまま変わっていないことに注目してください（サーバー側での内部転送のため）。</p>
        
        <p class="muted">jsp:forwardアクションタグは、サーバー内部でフォワード先へ制御を移し、呼び出し元のJSP出力バッファをクリアして転送先のみのHTMLを出力します。</p>
    </div>
</body>
</html>
