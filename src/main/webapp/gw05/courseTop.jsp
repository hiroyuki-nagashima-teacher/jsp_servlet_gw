<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSP研修トップ - Q03</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <!-- 
            includeディレクティブ (include file="..."):
            静的インクルード。コンパイル時に対象 of ファイル（commonMenu.jsp）の
            ソースコードをそのままこの位置に埋め込み、1つの大きなファイルとしてビルドします。
        -->
        <%@ include file="commonMenu.jsp" %>
        
        <div style="border: 2px solid var(--primary); padding: 1.5rem; border-radius: 8px; margin: 1.5rem 0;">
            <p style="margin: 0 0 0.5rem 0; font-size: 0.8rem; color: var(--primary); font-weight: bold;">[courseTop.jsp の本文]</p>
            <h1>JSP研修トップ</h1>
            <p>このページでは、JSPの基本構文を確認します。</p>
        </div>
        
        <!-- 
            静的インクルードを用いて、共通の注意書き（commonNotice.jsp）を取り込みます。
        -->
        <%@ include file="commonNotice.jsp" %>
    </div>
</body>
</html>
