<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    /*
       request.getParameter("score"):
       URLパラメータ (scoreCheck.jsp?score=80 など) の値を文字列として取得します。
    */
    String scoreStr = request.getParameter("score");
    boolean isPass = false; // 合格フラグ
    
    // 値が送信されているか（nullおよび空文字チェック）を確認します
    if (scoreStr != null && !scoreStr.trim().isEmpty()) {
        try {
            // 文字列を数値型(int)に変換し、60点以上かどうかを判定します
            int score = Integer.parseInt(scoreStr.trim());
            if (score >= 60) {
                isPass = true; // 60点以上なら合格フラグをtrueにする
            }
        } catch (NumberFormatException e) {
            /* 数値以外の文字（"abc"など）が送られてきた場合は変換エラーになり、不合格(false)扱いにします */
        }
    }
    
    /* 
       jsp:forward アクションタグ:
       サーバー内部で別のJSPにリクエスト処理を完全に転送（フォワード）します。
       - ブラウザのURL表示は変わりません。
       - フォワードより前にHTML（スペースや改行を含む）を出力すると、バッファエラーになるため、
         このファイルには転送用ロジックのみを記述し、不要なHTMLタグは一切書かないようにします。
    */
    if (isPass) {
%>
<jsp:forward page="passPage.jsp" />
<%
    } else {
%>
<jsp:forward page="failPage.jsp" />
<%
    }
%>
