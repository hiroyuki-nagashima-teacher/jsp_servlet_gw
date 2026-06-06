<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Enumeration" %>
<%
    /*
       【Javaコメント】
       個別に指定された代表的なヘッダ情報を取得します。
    */
    String userAgent = request.getHeader("User-Agent");
    String referer = request.getHeader("Referer");
    String acceptLanguage = request.getHeader("Accept-Language");
    String host = request.getHeader("Host");

    /* すべてのヘッダ名を取得するための Enumeration オブジェクトを取得します */
    Enumeration<String> headerNames = request.getHeaderNames();
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>ヘッダ情報表示結果 - GW06</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>ヘッダ情報表示結果</h1>
        
        <!-- 主要ヘッダのハイライト表示 -->
        <div class="card">
            <h2>主要ヘッダの確認</h2>
            <table>
                <thead>
                    <tr>
                        <th style="width: 35%;">ヘッダ名</th>
                        <th style="width: 40%;">取得値</th>
                        <th>ヘッダの意味</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="highlight-row" style="background-color: #f0fdf4;">
                        <td><strong>User-Agent</strong></td>
                        <td style="word-break: break-all; font-size: 0.9rem; color: #065f46;"><%= (userAgent != null) ? userAgent : "未設定" %></td>
                        <td>ブラウザの種類やOSのバージョン情報</td>
                    </tr>
                    <tr class="highlight-row" style="background-color: #eff6ff;">
                        <td><strong>Referer</strong></td>
                        <td style="word-break: break-all; font-size: 0.9rem; color: #1e40af;"><%= (referer != null) ? referer : "<span class='badge badge-warning'>取得不可（直接入力など）</span>" %></td>
                        <td>現在アクセスしているページの「リンク元」URL</td>
                    </tr>
                    <tr class="highlight-row" style="background-color: #fffbeb;">
                        <td><strong>Accept-Language</strong></td>
                        <td style="word-break: break-all; font-size: 0.9rem; color: #92400e;"><%= (acceptLanguage != null) ? acceptLanguage : "未設定" %></td>
                        <td>ブラウザが優先して受け入れたい言語設定</td>
                    </tr>
                    <tr class="highlight-row" style="background-color: #f8fafc;">
                        <td><strong>Host</strong></td>
                        <td style="word-break: break-all; font-size: 0.9rem; color: #334155;"><%= (host != null) ? host : "未設定" %></td>
                        <td>リクエスト送信先のホスト名（サーバー名）とポート番号</td>
                    </tr>
                </tbody>
            </table>
        </div>
        
        <!-- 全ヘッダの動的一覧表示 -->
        <div class="card">
            <h2>すべてのリクエストヘッダ一覧 (getHeaderNames)</h2>
            <p class="muted" style="text-align: left; margin-bottom: 1rem;">
                ※ ブラウザがTomcatサーバーに送信したすべてのリクエストヘッダを動的に展開して出力しています。
            </p>
            <table>
                <thead>
                    <tr>
                        <th style="width: 40%;">ヘッダ名</th>
                        <th>値 (ヘッダの内容)</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (headerNames != null) {
                            while (headerNames.hasMoreElements()) {
                                String name = headerNames.nextElement();
                                String val = request.getHeader(name);
                    %>
                                <tr>
                                    <td><code><%= name %></code></td>
                                    <td style="word-break: break-all;"><%= val %></td>
                                </tr>
                    <%
                            }
                        } else {
                    %>
                            <tr>
                                <td colspan="2">ヘッダ情報を取得できませんでした。</td>
                            </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            
            <div style="margin-top: 2rem;">
                <a href="headerStart.jsp" class="btn btn-secondary">開始ページに戻る</a>
            </div>
        </div>
    </div>
</body>
</html>
