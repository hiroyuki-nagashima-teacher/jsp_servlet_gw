<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    /*
       【Javaコメント】
       リクエストからGET送信された各パラメータを取得します。
       文字化けを防ぐため、JSPディレクティブでUTF-8を指定しています。
    */
    String keyword = request.getParameter("keyword");
    String category = request.getParameter("category");
    String level = request.getParameter("level");

    /* クエリ文字列全体（URLの「?」以降の部分）を取得します */
    String queryString = request.getQueryString();
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>クエリ情報表示結果 - GW06</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>クエリ情報表示結果</h1>
        
        <div class="card">
            <h2>取得したクエリパラメータ</h2>
            <table>
                <thead>
                    <tr>
                        <th style="width: 40%;">取得項目 (メソッド)</th>
                        <th>値 (表示内容)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><strong>キーワード (getParameter)</strong></td>
                        <td><%= (keyword != null) ? keyword : "<span class='badge badge-neutral'>未指定</span>" %></td>
                    </tr>
                    <tr>
                        <td><strong>カテゴリ (getParameter)</strong></td>
                        <td><%= (category != null) ? category : "<span class='badge badge-neutral'>未指定</span>" %></td>
                    </tr>
                    <tr>
                        <td><strong>レベル (getParameter)</strong></td>
                        <td>
                            <% if ("beginner".equals(level)) { %>
                                <span class="badge badge-success">初級 (beginner)</span>
                            <% } else if ("middle".equals(level)) { %>
                                <span class="badge badge-info">中級 (middle)</span>
                            <% } else if ("advanced".equals(level)) { %>
                                <span class="badge badge-warning">上級 (advanced)</span>
                            <% } else { %>
                                <span class="badge badge-neutral"><%= (level != null) ? level : "未指定" %></span>
                            <% } %>
                        </td>
                    </tr>
                    <tr class="highlight-row">
                        <td><strong>クエリ文字列全体 (getQueryString)</strong></td>
                        <td style="word-break: break-all; color: #7c3aed;"><%= (queryString != null) ? queryString : "なし" %></td>
                    </tr>
                </tbody>
            </table>
            
            <p class="muted">※ <code>getQueryString()</code> はURLの「?」以降の文字列全体を未デコード（エンコードされた状態）のまま取得します。</p>
            
            <div style="margin-top: 2rem;">
                <a href="queryForm.jsp" class="btn btn-secondary">フォームに戻る</a>
            </div>
        </div>
    </div>
</body>
</html>
