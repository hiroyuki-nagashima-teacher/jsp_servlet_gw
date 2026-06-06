<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>合格ページ - Q07</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1 style="background: linear-gradient(135deg, #10b981, #059669); -webkit-background-clip: text; -webkit-text-fill-color: transparent; border-bottom-color: #a7f3d0;">合格ページ</h1>
        
        <div style="background-color: #ecfdf5; border-left: 4px solid var(--success); padding: 1.5rem; border-radius: 8px; margin: 1.5rem 0;">
            <p style="font-size: 1.2rem; font-weight: bold; color: #065f46; margin: 0;">基準点に達しています。</p>
        </div>
        
        <!-- テストを切り替えやすくするためのナビゲーションリンク -->
        <div class="nav-links">
            <a href="scoreCheck.jsp?score=59" class="btn" style="background-color: var(--text-muted);">不合格テスト (59点)</a>
            <a href="scoreCheck.jsp" class="btn" style="background-color: var(--text-muted);">未指定テスト</a>
        </div>
        
        <p class="muted">このページは、scoreCheck.jspから jsp:forward によって呼び出されました。</p>
    </div>
</body>
</html>
