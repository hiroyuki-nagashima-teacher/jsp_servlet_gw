<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 
    解説: jsp:paramで渡された値を受信し、JSPの式（<%= %>）で出力しています。
          （共通条件「EL式は使用しない」に対応し、request暗黙オブジェクトから取得しています）
--%>
<div class="alert-box alert-info" style="margin: 0;">
    <p style="margin: 0; font-size: 0.8rem; font-weight: bold; color: var(--info);">[paramTarget.jsp 内で受信した結果]</p>
    <p><strong>userName:</strong> <code><%= request.getParameter("userName") %></code></p>
    <p><strong>message:</strong> <code><%= request.getParameter("message") %></code></p>
</div>
