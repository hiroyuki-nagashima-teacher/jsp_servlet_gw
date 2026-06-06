<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%!
    /* 
       宣言:
       サーブレットクラスの「メンバ変数（フィールド）」や「メソッド」を定義するブロックです。
       ここで定義した変数やメソッドは、ページ内のどのスクリプトレットからでも呼び出せます。
    */
    
    // 在庫数から在庫状態の文字列を判定して返すメソッド
    public String getStockStatus(int stock) {
        if (stock == 0) {
            return "在庫なし";
        } else if (stock >= 1 && stock <= 5) {
            return "残りわずか";
        } else {
            return "在庫あり";
        }
    }
    
    // 在庫数に応じてバッジの色分けCSSクラス名を返す補助メソッド
    public String getStockBadgeClass(int stock) {
        if (stock == 0) {
            return "badge-high"; // 赤色バッジ
        } else if (stock >= 1 && stock <= 5) {
            return "badge-middle"; // 黄色バッジ
        } else {
            return "badge-low"; // 緑色バッジ
        }
    }
%>
<%
    /* スクリプトレット内での処理と変数の用意 */
    
    // 商品名、価格、在庫数をそれぞれ配列として用意します
    String[] productNames = {"キーボード", "マウス", "モニター", "USBメモリ", "Webカメラ"};
    int[] prices = {3000, 1500, 24000, 1200, 4500};
    int[] stocks = {12, 0, 5, 30, 2};
    
    // 合計金額を累積するための変数
    int totalPrice = 0;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>商品一覧表 - Q09</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>商品一覧表</h1>
        
        <h2>商品一覧</h2>
        <table>
            <tr>
                <th>商品名</th>
                <th>価格</th>
                <th>在庫数</th>
                <th>在庫状態</th>
            </tr>
            <%
                /* 
                   スクリプトレットと固定テンプレートを組み合わせてループ処理します。
                   forループの開始括弧「{」と、終了括弧「}」をスクリプトレットで分割し、
                   ループ内のHTML行を繰り返し出力させます。
                */
                for (int i = 0; i < productNames.length; i++) {
                    totalPrice += prices[i]; // 各商品の価格を合計金額に足していきます
            %>
            <tr>
                <td><%= productNames[i] %></td>
                <td><%= prices[i] %>円</td>
                <td><%= stocks[i] %></td>
                <td>
                    <%-- 宣言で定義したメソッドを呼び出し、値を取得・表示します --%>
                    <span class="badge <%= getStockBadgeClass(stocks[i]) %>">
                        <%= getStockStatus(stocks[i]) %>
                    </span>
                </td>
            </tr>
            <%
                } // ここでループが終了します
            %>
        </table>
        
        <div style="margin-top: 1.5rem; text-align: right; font-size: 1.25rem; font-weight: bold;">
            価格合計: <span style="color: var(--primary); font-size: 1.5rem;"><%= totalPrice %></span>円
        </div>
        
        <p class="muted">このページは、宣言でのメソッド定義、スクリプトレットでのループ処理、式での変数値の出力、およびHTML固定テンプレートを組み合わせて作成しています。</p>
    </div>
</body>
</html>
