<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.net.URLEncoder" %>
<%
    /*
       【Javaコメント】
       元の文字列には、URLで使用できない「スペース」や「/（スラッシュ）」、
       および日本語（マルチバイト文字）が含まれています。
    */
    String originalKeyword = "JSP サーブレット/入門";
    
    /* URLEncoder.encode を使用して、UTF-8でURLエンコードします */
    String encodedKeyword = URLEncoder.encode(originalKeyword, "UTF-8");
    
    /* 遷移先リンクURLを組み立てます */
    String linkUrl = "encodeResult.jsp?keyword=" + encodedKeyword;
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>URLエンコード確認 - GW06</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>URLエンコード確認</h1>
        
        <div class="card">
            <h2>エンコードの実行結果</h2>
            <table>
                <thead>
                    <tr>
                        <th style="width: 45%;">項目</th>
                        <th>値 (表示内容)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><strong>元の文字列 (未エンコード)</strong></td>
                        <td><span style="font-size: 1.1rem; font-weight: 600;"><%= originalKeyword %></span></td>
                    </tr>
                    <tr class="highlight-row">
                        <td><strong>エンコード後の文字列 (UTF-8)</strong></td>
                        <td style="word-break: break-all; color: #4f46e5; font-family: monospace; font-size: 1.1rem;">
                            <%= encodedKeyword %>
                        </td>
                    </tr>
                </tbody>
            </table>
            
            <p class="muted">
                ※ 半角スペースは「<code>+</code>」（または<code>%20</code>）、日本語や記号「<code>/</code>」は「<code>%16進数</code>」に変換されます。
            </p>
            
            <div style="margin-top: 2.5rem; text-align: center;">
                <p style="margin-bottom: 1rem; font-weight: 500;">
                    以下のリンクから、エンコードされたクエリ付きで結果表示ページへ移動します。
                </p>
                <a href="<%= linkUrl %>" class="btn">エンコードリンクをテスト (encodeResult.jspへ)</a>
            </div>
        </div>
        
        <div class="actions">
            <a href="queryForm.jsp" class="nav-link">← クエリ情報フォームへ</a>
            <a href="headerStart.jsp" class="nav-link">ヘッダ確認開始ページへ →</a>
        </div>
    </div>
</body>
</html>
