<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>不合格ページ - Q07</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1 style="background: linear-gradient(135deg, #ef4444, #dc2626); -webkit-background-clip: text; -webkit-text-fill-color: transparent; border-bottom-color: #fca5a5;">不合格ページ</h1>
        
        <div style="background-color: #fef2f2; border-left: 4px solid var(--danger); padding: 1.5rem; border-radius: 8px; margin: 1.5rem 0;">
            <p style="font-size: 1.2rem; font-weight: bold; color: #991b1b; margin: 0;">基準点に達していません。</p>
        </div>
        
        <!-- テストを切り替えやすくするためのナビゲーションリンク -->
        <div class="nav-links">
            <a href="scoreCheck.jsp?score=80" class="btn">合格テスト (80点)</a>
            <a href="scoreCheck.jsp?score=abc" class="btn" style="background-color: var(--text-muted);">例外テスト (abc)</a>
        </div>
        
        <p class="muted">このページは、scoreCheck.jspから jsp:forward によって呼び出されました。</p>
    </div>
</body>
</html>
