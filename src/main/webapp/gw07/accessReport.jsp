<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    /*
     * 各種アクセス情報取得用メソッドの戻り値を一覧表示します。
     */
    String scheme = request.getScheme();
    String serverName = request.getServerName();
    int serverPort = request.getServerPort();
    String method = request.getMethod();
    String protocol = request.getProtocol();
    String requestURI = request.getRequestURI();
    
    // getRequestURL()はStringBufferを返すのでtoString()で文字列化します
    StringBuffer requestURLBuf = request.getRequestURL();
    String requestURL = (requestURLBuf != null) ? requestURLBuf.toString() : "";
    
    String contextPath = request.getContextPath();
    String servletPath = request.getServletPath();
    String queryString = request.getQueryString();
    String remoteAddr = request.getRemoteAddr();
    
    String userAgent = request.getHeader("User-Agent");
    String acceptLanguage = request.getHeader("Accept-Language");
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
    <title>アクセス診断レポート</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h1>アクセス診断レポート</h1>
        
        <h2>診断結果一覧</h2>
        <table>
            <tbody>
                <tr>
                    <th>スキーム (getScheme)</th>
                    <td><%= escapeHtml(scheme) %></td>
                </tr>
                <tr>
                    <th>サーバ名 (getServerName)</th>
                    <td><%= escapeHtml(serverName) %></td>
                </tr>
                <tr>
                    <th>ポート番号 (getServerPort)</th>
                    <td><%= serverPort %></td>
                </tr>
                <tr>
                    <th>HTTPメソッド (getMethod)</th>
                    <td><%= escapeHtml(method) %></td>
                </tr>
                <tr>
                    <th>プロトコル (getProtocol)</th>
                    <td><%= escapeHtml(protocol) %></td>
                </tr>
                <tr>
                    <th>リクエストURI (getRequestURI)</th>
                    <td><%= escapeHtml(requestURI) %></td>
                </tr>
                <tr>
                    <th>リクエストURL (getRequestURL)</th>
                    <td style="word-break: break-all;"><%= escapeHtml(requestURL) %></td>
                </tr>
                <tr>
                    <th>コンテキストパス (getContextPath)</th>
                    <td><%= escapeHtml(contextPath) %></td>
                </tr>
                <tr>
                    <th>サーブレットパス (getServletPath)</th>
                    <td><%= escapeHtml(servletPath) %></td>
                </tr>
                <tr>
                    <th>クエリ文字列 (getQueryString)</th>
                    <td><%= escapeHtml(queryString) %></td>
                </tr>
                <tr>
                    <th>クライアントIP (getRemoteAddr)</th>
                    <td><%= escapeHtml(remoteAddr) %></td>
                </tr>
                <tr>
                    <th>User-Agent</th>
                    <td style="word-break: break-all;"><%= escapeHtml(userAgent) %></td>
                </tr>
                <tr>
                    <th>Accept-Language</th>
                    <td><%= escapeHtml(acceptLanguage) %></td>
                </tr>
            </tbody>
        </table>
        
        <div class="memo-box">
            <h3 style="font-weight: 700; margin-bottom: 0.5rem; color: #b45309;">💡 診断メモ</h3>
            <dl>
                <dt>getRequestURL</dt>
                <dd>URL全体に近い情報を取得する</dd>
                
                <dt>getRequestURI</dt>
                <dd>ホスト名を含まないURI部分を取得する</dd>
                
                <dt>getContextPath</dt>
                <dd>Webアプリケーションのコンテキストパスを取得する</dd>
                
                <dt>getServletPath</dt>
                <dd>実行されたJSPへのパス部分を取得する</dd>
                
                <dt>getQueryString</dt>
                <dd>URLの?以降のクエリ文字列を取得する</dd>
            </dl>
        </div>
    </div>
</body>
</html>