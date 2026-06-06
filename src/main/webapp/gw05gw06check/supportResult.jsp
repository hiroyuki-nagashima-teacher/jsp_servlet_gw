<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<%
    // POST送信された日本語データが文字化けしないように設定
    request.setCharacterEncoding("UTF-8");

    // フォーム入力値の取得
    String userName = request.getParameter("userName");
    String userMail = request.getParameter("userMail");
    String supportType = request.getParameter("supportType");
    String priority = request.getParameter("priority");
    String message = request.getParameter("message");

    /*
     * 1. 代表的なHTTPヘッダ情報
     *    User-Agent: ブラウザやOSの種類
     *    Referer: 直前に閲覧していた遷移元のURL
     *    Accept-Language: ブラウザが希望する言語設定
     *    Host: 接続先のサーバー名とポート番号
     */
    String userAgent = request.getHeader("User-Agent");
    String referer = request.getHeader("Referer");
    String acceptLanguage = request.getHeader("Accept-Language");
    String host = request.getHeader("Host");
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
    <title>サポート問い合わせ受付結果</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h1>サポート問い合わせ受付結果</h1>
        
        <h2>問い合わせ内容</h2>
        <table>
            <tr>
                <th>お名前</th>
                <td><%= escapeHtml(userName) %></td>
            </tr>
            <tr>
                <th>メールアドレス</th>
                <td><%= escapeHtml(userMail) %></td>
            </tr>
            <tr>
                <th>問い合わせ種別</th>
                <td><%= escapeHtml(supportType) %></td>
            </tr>
            <tr>
                <th>緊急度</th>
                <td><%= escapeHtml(priority) %></td>
            </tr>
            <tr>
                <th>問い合わせ内容</th>
                <td><%= escapeHtml(message).replace("\n", "<br>") %></td>
            </tr>
        </table>
        
        <h2>代表的なヘッダ情報</h2>
        <table>
            <tr>
                <th>User-Agent</th>
                <td><%= escapeHtml(userAgent) %></td>
            </tr>
            <tr>
                <th>Referer</th>
                <td><%= escapeHtml(referer) %></td>
            </tr>
            <tr>
                <th>Accept-Language</th>
                <td><%= escapeHtml(acceptLanguage) %></td>
            </tr>
            <tr>
                <th>Host</th>
                <td><%= escapeHtml(host) %></td>
            </tr>
        </table>
        
        <h2>すべてのヘッダ情報一覧</h2>
        <table>
            <thead>
                <tr>
                    <th>ヘッダ名</th>
                    <th>値</th>
                </tr>
            </thead>
            <tbody>
                <%
                    /*
                     * 2. 全ヘッダの動的ループ処理
                     *    request.getHeaderNames() で全ヘッダ名を取得し、
                     *    Enumerationループを用いて各ヘッダの値を動的に取り出して表示します。
                     */
                    Enumeration<String> headerNames = request.getHeaderNames();
                    if (headerNames != null) {
                        while (headerNames.hasMoreElements()) {
                            String headerName = headerNames.nextElement();
                            String headerValue = request.getHeader(headerName);
                %>
                <tr>
                    <th><%= escapeHtml(headerName) %></th>
                    <td style="word-break: break-all;"><%= escapeHtml(headerValue) %></td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
        
        <a href="supportForm.jsp" class="nav-link">← 問い合わせフォームに戻る</a>
    </div>
</body>
</html>