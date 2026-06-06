<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 
    【JSPコメント】 
    このファイルはアクセス確認とコメントの書き分けを目的としています。
    JSPコメント（パーセントとハイフンで囲まれた形式）はサーバーで翻訳される時に消去されるため、
    ブラウザの「ソース表示」には一切表示されません（最も安全な非表示コメントです）。
--%>
<%
    /* 
       【Javaコメント】 
       Javaの処理ブロック内のコメントです。
       保存時の自動整形で改行が詰められてもバグが起きないよう、ブロックコメント（スラッシュとアスタリスク）を使用しています。
       これはJavaソースコード（サーブレット）には残りますが、ブラウザに届くHTMLには一切含まれません。
    */
    
    // request暗黙オブジェクトを使用して、URLパラメータから "visitor" の値を取得します。
    String visitor = request.getParameter("visitor");
    if (visitor == null || visitor.trim().isEmpty()) {
        visitor = "匿名ユーザー"; // 値がない場合はデフォルト値にします
    }
    
    // session暗黙オブジェクトを使用して、アクセス回数の維持とカウントアップを行います。
    Integer count = (Integer) session.getAttribute("accessCount");
    if (count == null) {
        count = 1; // 初めてのアクセスの場合は 1 に設定
    } else {
        count = count + 1; // 2回目以降は現在の回数に 1 を足す
    }
    // 更新したアクセス回数をセッションに保存します
    session.setAttribute("accessCount", count);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>アクセス確認 - Q10</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>アクセス確認</h1>
        
        <!-- 
            【HTMLコメント】
            HTML部分に記述するコメントです。
            サーバー側では処理されずそのままブラウザへ送信されるため、
            ブラウザで「ページのソースを表示」すると、このコメントが丸見えになります。
        -->
        <h2>アクセス情報</h2>
        <table>
            <tr>
                <th style="width: 30%;">項目</th>
                <th>表示内容</th>
            </tr>
            <tr>
                <td><strong>利用者名</strong></td>
                <td><%= visitor %></td>
            </tr>
            <tr>
                <td><strong>アクセス回数</strong></td>
                <td><%= count %>回目</td>
            </tr>
        </table>
        
        <div style="border: 1px solid var(--border); padding: 1rem; border-radius: 8px; background-color: #fafafa; margin: 1.5rem 0;">
            <%
                /* 【Javaコメント】 out暗黙オブジェクトを使って、HTMLの要素を直接出力します */
                out.print("<p style=\"margin:0; font-weight: 500; color: var(--success);\">[out暗黙オブジェクトからの出力] アクセスを記録しました。</p>");
            %>
        </div>
        
        <p>このページではrequest、out、sessionを使用しています。</p>
        
        <div class="nav-links">
            <a href="accessCheck.jsp?visitor=Sato" class="btn">visitor=Sato でアクセス</a>
            <a href="accessCheck.jsp" class="btn" style="background-color: var(--text-muted);">匿名でアクセス</a>
        </div>
        
        <p class="muted">JSPコメント、Javaコメント、HTMLコメントのソースコード上の違いをWebブラウザの「開発者ツール（ソース表示）」から確認してみてください。</p>
    </div>
</body>
</html>

