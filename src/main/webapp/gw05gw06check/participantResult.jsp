<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    /*
     * 1. POST送信時の文字コード設定
     *    日本語の文字化けを防ぐため、getParameter等の呼び出しの「前」に必ず記述します。
     */
    request.setCharacterEncoding("UTF-8");

    // 単一パラメータの取得 (String型)
    String participantName = request.getParameter("participantName");
    String employeeNo = request.getParameter("employeeNo");
    String password = request.getParameter("password");
    String joinType = request.getParameter("joinType");
    
    /*
     * 2. 複数選択パラメータ（チェックボックス等）の取得
     *    同一のname属性で複数の値を取得するため、getParameterValues()を使い、配列（String[]）として取得します。
     */
    String[] units = request.getParameterValues("units");
    
    String understanding = request.getParameter("understanding");
    String comment = request.getParameter("comment");
%>
<%!
    /*
     * 3. HTMLエスケープ処理 (XSS対策)
     *    タグ文字「<」「>」や「&」などを文字実体参照に変換し、ブラウザによる悪意あるスクリプトの実行を防ぎます。
     */
    private String escapeHtml(String val) {
        if (val == null) return "";
        return val.replace("&", "&amp;")
                  .replace("<", "&lt;")
                  .replace(">", "&gt;")
                  .replace("\"", "&quot;")
                  .replace("'", "&#39;");
    }
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>研修参加登録内容</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h1>研修参加登録内容</h1>
        <p class="description">登録内容を確認しました。</p>
        
        <table>
            <tr>
                <th>氏名</th>
                <td><%= escapeHtml(participantName) %></td>
            </tr>
            <tr>
                <th>社員番号</th>
                <td><%= escapeHtml(employeeNo) %></td>
            </tr>
            <tr>
                <th>確認用パスワード</th>
                <td><%= escapeHtml(password) %></td>
            </tr>
            <tr>
                <th>参加方法</th>
                <td><%= escapeHtml(joinType) %></td>
            </tr>
            <tr>
                <th>受講したい単元</th>
                <td>
                    <%--
                        4. チェックボックス未選択時 (null) の安全処理
                           未選択の場合、配列が null となり、そのままループ処理を行うとエラー（NullPointerException）になります。
                           必ず null判定 を行い、安全にハンドリングをします。
                    --%>
                    <% if (units == null || units.length == 0) { %>
                        選択なし
                    <% } else { %>
                        <ul class="list-style">
                            <% for (String unit : units) { %>
                                <li><%= escapeHtml(unit) %></li>
                            <% } %>
                        </ul>
                    <% } %>
                </td>
            </tr>
            <tr>
                <th>現在の理解度</th>
                <td><%= escapeHtml(understanding) %></td>
            </tr>
            <tr>
                <th>連絡事項</th>
                <td><%= escapeHtml(comment).replace("\n", "<br>") %></td>
            </tr>
        </table>
        
        <a href="participantForm.jsp" class="nav-link">← 登録フォームに戻る</a>
    </div>
</body>
</html>