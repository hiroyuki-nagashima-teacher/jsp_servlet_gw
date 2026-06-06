<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>お知らせページ - Q06</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>お知らせページ</h1>
        
        <%-- 
            jsp:include アクションタグ:
            動的インクルード。リクエストの実行時に、別のJSP部品（noticeParts.jsp）を処理した結果を
            この位置に埋め込みます。静的インクルード（<%@ include %>）とは異なり、
            子要素として <jsp:param> を使って呼び出し先にデータを送ることができます。
            
            ※ <jsp:include> タグの内部（直下）には、コメント等の余計な要素を挟まずに、
               直接 <jsp:param> タグを記述する必要があります（文法上の仕様です）。
        --%>
        <jsp:include page="noticeParts.jsp">
            <jsp:param name="title" value="提出期限のお知らせ" />
            <jsp:param name="message" value="本日17時までに課題を提出してください。" />
            <jsp:param name="level" value="high" />
        </jsp:include>
        
        <p style="margin-top: 1.5rem; font-weight: 500;">以上がお知らせ内容です。</p>
        
        <p class="muted">このページは jsp:include と jsp:param アクションタグを使用して動的にお知らせ部品を読み込んでいます。</p>
    </div>
</body>
</html>

