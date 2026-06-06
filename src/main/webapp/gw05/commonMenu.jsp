<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 
    共通メニュー部品:
    ヘッダーやメニューなど、複数のページで使い回す共通HTML部品です。
    個別のJSPごとに文字化けを防ぐために contentType と pageEncoding を指定しておきます。
--%>
<div class="menu-box" style="border: 2px dashed var(--info); padding: 1rem; border-radius: 8px; margin-bottom: 1.5rem;">
    <p style="margin: 0 0 0.5rem 0; font-size: 0.8rem; color: var(--info); font-weight: bold;">[commonMenu.jsp から取り込み]</p>
    <h3 style="margin-top: 0;">共通メニュー</h3>
    <ul class="menu-list" style="margin-bottom: 0; border-bottom: none; padding-bottom: 0;">
        <li><a href="#" class="menu-item">トップ</a></li>
        <li><a href="#" class="menu-item">研修内容</a></li>
        <li><a href="#" class="menu-item">演習問題</a></li>
        <li><a href="#" class="menu-item">提出方法</a></li>
    </ul>
</div>
