<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    /*
       【Javaコメント】
       リクエストに関連するスキーム、ポート、URI、およびURLなどの情報を取得します。
    */
    String scheme = request.getScheme();
    String serverName = request.getServerName();
    int serverPort = request.getServerPort();
    String method = request.getMethod();
    String protocol = request.getProtocol();
    String requestURI = request.getRequestURI();
    StringBuffer requestURL = request.getRequestURL();
    String contextPath = request.getContextPath();
    String servletPath = request.getServletPath();
    String queryString = request.getQueryString();
    String remoteAddr = request.getRemoteAddr();
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>リクエストパス情報表示 - GW06</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>リクエストパス情報表示</h1>
        
        <div class="card">
            <h2>パス・メソッド情報の取得結果</h2>
            <table>
                <thead>
                    <tr>
                        <th style="width: 30%;">取得項目</th>
                        <th style="width: 35%;">使用するメソッド</th>
                        <th>値 (取得結果)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><strong>スキーム</strong></td>
                        <td><code>request.getScheme()</code></td>
                        <td><span class="badge badge-neutral"><%= scheme %></span></td>
                    </tr>
                    <tr>
                        <td><strong>サーバ名</strong></td>
                        <td><code>request.getServerName()</code></td>
                        <td><%= serverName %></td>
                    </tr>
                    <tr>
                        <td><strong>ポート番号</strong></td>
                        <td><code>request.getServerPort()</code></td>
                        <td><%= serverPort %></td>
                    </tr>
                    <tr>
                        <td><strong>HTTPメソッド</strong></td>
                        <td><code>request.getMethod()</code></td>
                        <td><span class="badge badge-success"><%= method %></span></td>
                    </tr>
                    <tr>
                        <td><strong>プロトコル</strong></td>
                        <td><code>request.getProtocol()</code></td>
                        <td><%= protocol %></td>
                    </tr>
                    <tr class="highlight-row" style="background-color: #f5f3ff;">
                        <td><strong>リクエストURI</strong></td>
                        <td><code>request.getRequestURI()</code></td>
                        <td style="color: #7c3aed;"><%= requestURI %></td>
                    </tr>
                    <tr class="highlight-row" style="background-color: #f5f3ff;">
                        <td><strong>リクエストURL</strong></td>
                        <td><code>request.getRequestURL()</code></td>
                        <td style="color: #4f46e5; word-break: break-all;"><%= requestURL %></td>
                    </tr>
                    <tr>
                        <td><strong>コンテキストパス</strong></td>
                        <td><code>request.getContextPath()</code></td>
                        <td><span style="font-family: monospace; font-weight: 600;"><%= contextPath %></span></td>
                    </tr>
                    <tr>
                        <td><strong>サーブレットパス</strong></td>
                        <td><code>request.getServletPath()</code></td>
                        <td><span style="font-family: monospace; font-weight: 600;"><%= servletPath %></span></td>
                    </tr>
                    <tr>
                        <td><strong>クエリ文字列</strong></td>
                        <td><code>request.getQueryString()</code></td>
                        <td style="word-break: break-all; color: #b45309;"><%= (queryString != null) ? queryString : "<span class='badge badge-neutral'>なし</span>" %></td>
                    </tr>
                    <tr>
                        <td><strong>クライアントIP</strong></td>
                        <td><code>request.getRemoteAddr()</code></td>
                        <td><span class="badge badge-info"><%= remoteAddr %></span></td>
                    </tr>
                </tbody>
            </table>
            
            <p class="muted" style="text-align: left;">
                <strong>💡 観察ポイント:</strong><br>
                - <code>getRequestURL()</code> は<strong>プロトコルからポート、URIまですべてを含むフルパス</strong>を取得します（※戻り値は <code>StringBuffer</code>）。<br>
                - <code>getRequestURI()</code> はドメインやポートを除いた<strong>サーバー内でのリソースパス</strong>を取得します。<br>
                - <code>getContextPath()</code> は<strong>Webアプリケーションの配備ディレクトリ（Webコンテキスト名）</strong>を表し、通常は <code>/プロジェクト名</code> になります。<br>
                - <code>getServletPath()</code> はコンテキスト配下での<strong>JSPやサーブレット自体のパス</strong>を表します。
            </p>
        </div>
        
        <div class="actions">
            <a href="headerInfo.jsp" class="nav-link">← ヘッダ情報表示ページへ</a>
            <a href="queryForm.jsp" class="nav-link">クエリ情報フォームへ →</a>
        </div>
    </div>
</body>
</html>
