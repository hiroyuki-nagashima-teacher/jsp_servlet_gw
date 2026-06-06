<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 
    解説: jsp:includeアクションタグを使用して、別部品ページを動的に取り込んでいます。
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>jsp:includeの確認</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>jsp:includeの確認</h1>
        
        <p><strong>[includeMain.jsp]</strong> 以下に部品（includeParts.jsp）を取り込みます（前）。</p>
        
        <div style="border: 2px dashed var(--info); padding: 1rem; border-radius: 8px; margin: 1rem 0;">
            <jsp:include page="includeParts.jsp" />
        </div>
        
        <p><strong>[includeMain.jsp]</strong> 取り込み後の処理です（後）。</p>
        
        <p class="muted">jsp:includeアクションタグは、リクエスト実行時に動的に対象ファイルを読み込んで結果をマージします。</p>
    </div>
</body>
</html>
