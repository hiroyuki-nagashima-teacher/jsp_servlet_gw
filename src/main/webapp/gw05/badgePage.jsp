<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 
    taglibディレクティブ:
    自作したタグライブラリをこのJSPページ内で使用できるように宣言します。
    - uri: badge.tld内に定義されている <uri> (http://example.com/tags/badge) と一致させます。
    - prefix: タグを呼び出す際の接頭辞（名前空間のようなもの）を設定します。ここでは「badge」とします。
--%>
<%@ taglib prefix="badge" uri="http://example.com/tags/badge" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>独自タグのテスト - Q05</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>重要度バッジの独自タグ</h1>
        
        <h2>実行結果一覧</h2>
        <table>
            <tr>
                <th>使用するタグ</th>
                <th>表示結果</th>
            </tr>
            <tr>
                <!-- 
                    1. 属性値を指定しないパターン (<badge:level />)
                       LevelBadgeTagクラスの levelフィールドはnullとなり、
                       Java内の分岐で「重要度:未設定」バッジが出力されます。
                -->
                <td><code>&lt;badge:level /&gt;</code></td>
                <td><badge:level /></td>
            </tr>
            <tr>
                <!-- 
                    2. level属性に "high" を指定するパターン
                       LevelBadgeTagクラスの setLevel("high") が呼び出され、
                       Java内の分岐で赤色の「重要度:高」バッジが出力されます。
                -->
                <td><code>&lt;badge:level level="high" /&gt;</code></td>
                <td><badge:level level="high" /></td>
            </tr>
            <tr>
                <!-- 
                    3. level属性に "middle" を指定するパターン
                       LevelBadgeTagクラスの setLevel("middle") が呼び出され、
                       Java内の分岐で黄色の「重要度:中」バッジが出力されます。
                -->
                <td><code>&lt;badge:level level="middle" /&gt;</code></td>
                <td><badge:level level="middle" /></td>
            </tr>
            <tr>
                <!-- 
                    4. level属性に "low" を指定するパターン
                       LevelBadgeTagクラスの setLevel("low") が呼び出され、
                       Java内の分岐で緑色の「重要度:低」バッジが出力されます。
                -->
                <td><code>&lt;badge:level level="low" /&gt;</code></td>
                <td><badge:level level="low" /></td>
            </tr>
            <tr>
                <!-- 
                    5. 定義外の値を属性に指定するパターン
                       Java内の判定（high, middle, low以外）により、
                       デフォルトの「重要度:未設定」バッジが出力されます。
                -->
                <td><code>&lt;badge:level level="invalid" /&gt;</code></td>
                <td><badge:level level="invalid" /></td>
            </tr>
        </table>
        
        <p class="muted">このページは、独自に作成したJavaタグクラスおよびTLDファイル定義に基づくカスタムタグを利用しています。</p>
    </div>
</body>
</html>
