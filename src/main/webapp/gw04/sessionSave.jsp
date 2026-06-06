<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 
    解説: 暗黙オブジェクト session (HttpSession) を用いてセッション領域にオブジェクトを保存します。
--%>
<%
    // セッションに属性を保存
    session.setAttribute("loginUser", "Yamada");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>セッション保存 - 暗黙オブジェクト</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>セッション保存 (session)</h1>
        
        <div class="alert-box alert-success">
            <p>セッション領域に <strong>loginUser = "Yamada"</strong> を保存しました。</p>
        </div>

        <h2>次の確認ステップ</h2>
        <p>以下のリンクをクリックして、セッションから情報を取り出せるか確認してください。</p>
        <p><a href="sessionShow.jsp" class="btn">セッションから取得する (sessionShow.jsp)</a></p>
        
        <p class="muted">session暗黙オブジェクトは、同一のブラウザからの複数リクエストにまたがる状態やデータを一時的に維持するために利用されます。</p>
    </div>
</body>
</html>
