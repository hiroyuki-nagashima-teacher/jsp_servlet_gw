<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 
    pageディレクティブのimport属性:
    Javaのクラスをインポートして、JSP内で短いクラス名で使えるようにします。
    ここでは、日付を取得する LocalDateTime と、日付をフォーマットする DateTimeFormatter をインポートしています。
--%>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%
    /* スクリプトレット: Javaのプログラムを記述するブロックです */
    
    // 現在日時を取得します
    LocalDateTime now = LocalDateTime.now();
    
    // 日本語形式の表示パターンを定義します (例: 2026年06月02日 09時15分30秒)
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy年MM月dd日 HH時mm分ss秒");
    
    // 現在日時を指定したパターンで整形して文字列型(String)に変換します
    String formattedDate = now.format(formatter);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>受付日時確認 - Q02</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>受付日時確認</h1>
        
        <h2>受付日時</h2>
        <p style="font-size: 1.5rem; font-weight: 600; color: var(--primary); margin: 1.5rem 0;">
            <%-- 式: 変数の値や戻り値を画面に出力します。末尾にセミコロン「;」は不要です --%>
            <%= formattedDate %>
        </p>
        
        <p>この時刻に受付処理を行いました。</p>
        
        <h2>使用したJavaクラス</h2>
        <ul>
            <li><code>java.time.LocalDateTime</code></li>
            <li><code>java.time.format.DateTimeFormatter</code></li>
        </ul>
        
        <p class="muted">このページはJSPのスクリプトレットと式を利用して動作しています。</p>
    </div>
</body>
</html>
