<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 
    解説: 宣言（<%! %>）を用いて、JSP（サーブレット変換後クラス）のフィールド変数およびメソッドを定義しています。
--%>
<%!
    // フィールド変数の定義（複数リクエスト間で共有されるため注意が必要）
    private int globalCount = 0;

    // メソッドの定義
    private int add(int a, int b) {
        return a + b;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSP宣言（declaration）の確認</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>JSP宣言（declaration）の確認</h1>
        
        <h2>メソッド定義の実行</h2>
        <div class="alert-box alert-info">
            <p><strong>メソッド実行結果 (add(3, 5)):</strong> <code><%= add(3, 5) %></code></p>
        </div>

        <h2>フィールド変数の表示とインクリメント</h2>
        <%
            // スクリプトレットでインクリメント
            globalCount++;
        %>
        <div class="alert-box alert-warning">
            <p><strong>現在のアクセス回数 (globalCount):</strong> <code><%= globalCount %></code> 回目</p>
            <p style="font-size: 0.85rem; margin-top: 0.5rem; color: #451a03;">※ ページをリロードすると値が増えます。この変数はサーブレットのメンバ変数としてメモリ上に保持されます。</p>
        </div>

        <p class="muted">宣言（<code>&lt;%! %&gt;</code>）で定義された変数やメソッドは、サーブレットのインスタンスメンバ（またはクラスメンバ）として翻訳され、リクエスト間で共有されます。</p>
    </div>
</body>
</html>
