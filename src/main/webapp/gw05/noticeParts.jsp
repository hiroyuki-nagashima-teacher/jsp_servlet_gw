<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    /*
       request暗黙オブジェクト:
       jsp:param で送信されたデータは、遷移先のページで
       通常のクエリパラメータと同様に request.getParameter("キー名") で取得できます。
    */
    String title = request.getParameter("title");
    String message = request.getParameter("message");
    String level = request.getParameter("level");
    
    // 表示用ラベルとスタイル用CSSクラスの初期化
    String levelDisplay = "未分類";
    String badgeClass = "badge-none";
    
    // 送信されてきた level の値に応じて表示を振り分けます
    if ("high".equals(level)) {
        levelDisplay = "重要";
        badgeClass = "badge-high";
    } else if ("middle".equals(level)) {
        levelDisplay = "通常";
        badgeClass = "badge-middle";
    } else if ("low".equals(level)) {
        levelDisplay = "参考";
        badgeClass = "badge-low";
    }
%>
<div class="notice-parts-box" style="border: 1px solid var(--border); padding: 1.5rem; border-radius: 8px; background-color: #fafafa;">
    <p style="margin: 0 0 0.5rem 0; font-size: 0.8rem; color: var(--text-muted); font-weight: bold;">[noticeParts.jsp からの出力]</p>
    <table style="margin: 0; box-shadow: none;">
        <tr>
            <th style="width: 25%;">項目</th>
            <th>表示例</th>
        </tr>
        <tr>
            <td><strong>タイトル</strong></td>
            <td><%= title != null ? title : "" %></td>
        </tr>
        <tr>
            <td><strong>本文</strong></td>
            <td><%= message != null ? message : "" %></td>
        </tr>
        <tr>
            <td><strong>重要度</strong></td>
            <td>
                <%-- 受け取った重要度の値に応じてスタイルを適用したスパンを表示します --%>
                <span class="badge <%= badgeClass %>"><%= levelDisplay %></span>
            </td>
        </tr>
    </table>
</div>
