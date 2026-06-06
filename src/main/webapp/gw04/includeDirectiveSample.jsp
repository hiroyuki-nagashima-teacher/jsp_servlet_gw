<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 
    解説: includeディレクティブを使って、別JSPファイルを静的（翻訳時）に取り込んでいます。
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>includeディレクティブの確認</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <!-- 共通ヘッダーを取り込む -->
        <%@ include file="commonHeader.jsp" %>

        <main style="border: 2px solid var(--primary); padding: 1.5rem; border-radius: 8px; margin: 1rem 0;">
            <p style="margin: 0 0 0.5rem 0; font-size: 0.8rem; color: var(--primary); font-weight: bold;">[includeDirectiveSample.jsp の本文]</p>
            <h1>includeディレクティブの確認</h1>
            <p>この部分はincludeDirectiveSample.jspの本文です。ヘッダーとフッターは別ファイルから静的（コンパイル時）に結合されます。</p>
        </main>

        <!-- 共通フッターを取り込む -->
        <%@ include file="commonFooter.jsp" %>
    </div>
</body>
</html>
