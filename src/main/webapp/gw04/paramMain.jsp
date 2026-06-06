<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 
    解説: jsp:include の内側で jsp:param を使い、呼び出し先ページへ値を渡しています。
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>jsp:paramの確認</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>jsp:paramの確認</h1>
        
        <h2>パラメータの引き渡し</h2>
        <p><strong>[paramMain.jsp]</strong> から、パラメータ <code>userName=Yamada</code> と <code>message=Hello</code> を渡してインクルードします。</p>

        <div style="border: 2px dashed var(--primary); padding: 1.5rem; border-radius: 8px; margin: 1rem 0;">
            <jsp:include page="paramTarget.jsp">
                <jsp:param name="userName" value="Yamada" />
                <jsp:param name="message" value="Hello" />
            </jsp:include>
        </div>
        
        <p class="muted">jsp:paramアクションタグは、jsp:include または jsp:forward のタグ内でのみ動作し、遷移先へリクエストパラメータを追加で引き渡します。</p>
    </div>
</body>
</html>
