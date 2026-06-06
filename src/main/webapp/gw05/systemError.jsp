<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 
    pageディレクティブのisErrorPage属性:
    この属性を "true" に設定することで、このJSPが「エラーページ（例外処理用）」として機能するようになります。
    isErrorPage="true" にした場合のみ、エラー情報を格納した暗黙オブジェクト「exception」が使用可能になります。
--%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>システムエラー - Q04</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1 style="color: var(--danger); border-bottom-color: #fca5a5; background: linear-gradient(135deg, #ef4444, #f97316); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">システムエラーが発生しました</h1>
        <p style="font-weight: 500;">時間をおいて再度お試しください。</p>
        
        <div class="error-box">
            <h3 style="margin-top: 0; color: #991b1b;">エラー詳細（開発者向け確認用情報）</h3>
            
            <!-- 
                exception暗黙オブジェクト:
                エラーが発生した元のページから引き継がれた例外クラス（Throwable）が入っています。
                直接アクセスされた場合など、例外がない状況（null）でも安全に表示できるよう、
                三項演算子 (exception != null ? ... : ...) でnull判定を行って出力しています。
            -->
            <p><strong>例外クラス:</strong> <code><%= exception != null ? exception.getClass().getName() : "null" %></code></p>
            <p><strong>メッセージ:</strong> <code><%= exception != null ? exception.getMessage() : "null" %></code></p>
        </div>
        
        <p class="muted">このエラーページは isErrorPage="true" ディレクティブと exception 暗黙オブジェクトを使用して作成されています。</p>
    </div>
</body>
</html>