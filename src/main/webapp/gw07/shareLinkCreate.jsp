<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%
    // 変数定義
    String title = "JSP 入門/フォーム編";
    String category = "研修 資料";
    String returnUrl = "/menu/list.jsp?type=web&level=beginner";

    /*
     * 1. URLエンコード (URLEncoder.encode)
     *    日本語、空白、記号（/, ?, & 等）を安全な%XX形式に変換し、URLパラメータとして扱えるようにします。
     */
    String encodedTitle = URLEncoder.encode(title, "UTF-8");
    String encodedCategory = URLEncoder.encode(category, "UTF-8");
    String encodedReturnUrl = URLEncoder.encode(returnUrl, "UTF-8");

    // クエリ情報を連結してリンク先URLを構築
    String shareUrl = "shareLinkView.jsp?title=" + encodedTitle 
                    + "&category=" + encodedCategory 
                    + "&returnUrl=" + encodedReturnUrl;
%>
<%!
    /* HTMLエスケープ処理用のメソッド */
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
    <title>共有リンク作成ページ</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h1>共有リンク作成ページ</h1>
        
        <h2>元の値とURLエンコード後の値</h2>
        <table>
            <thead>
                <tr>
                    <th>項目</th>
                    <th>エンコード前の値</th>
                    <th>エンコード後の値</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>タイトル</th>
                    <td><%= escapeHtml(title) %></td>
                    <td><code><%= escapeHtml(encodedTitle) %></code></td>
                </tr>
                <tr>
                    <th>カテゴリ</th>
                    <td><%= escapeHtml(category) %></td>
                    <td><code><%= escapeHtml(encodedCategory) %></code></td>
                </tr>
                <tr>
                    <th>戻り先URL</th>
                    <td><%= escapeHtml(returnUrl) %></td>
                    <td><code><%= escapeHtml(encodedReturnUrl) %></code></td>
                </tr>
            </tbody>
        </table>
        
        <h2>作成された共有リンク</h2>
        <p>
            <a href="<%= shareUrl %>" class="btn-submit" style="display: inline-block; text-align: center; text-decoration: none; width: auto; padding: 0.85rem 2rem;">
                共有リンクを確認 (shareLinkView.jspへ)
            </a>
        </p>
        <p style="margin-top: 1rem; font-size: 0.85rem; color: var(--text-muted);">
            リンク先URL:<br>
            <code style="word-break: break-all;"><%= escapeHtml(shareUrl) %></code>
        </p>
    </div>
</body>
</html>