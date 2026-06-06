<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--
    【解説】
    ・本ページはGET送信を利用する「検索フォーム」です。
--%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>教材検索ページ</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h1>教材検索ページ</h1>
        <%--
            【GET送信の特徴】
            ・method="get":
              送信データをURLの末尾にクエリ文字列（?キー=値&キー=値...）として付与して送信します。
              - 特徴: 検索結果URLのブックマークや他者への共有が可能。
              - 注意: パスワード等の機密性の高い情報には使用できません（POSTを使用します）。
        --%>
        <form action="materialSearchResult.jsp" method="get">
            <div class="form-group">
                <label for="keyword" class="form-label">検索キーワード</label>
                <input type="text" id="keyword" name="keyword" placeholder="検索キーワードを入力してください">
            </div>
            
            <div class="form-group">
                <label for="category" class="form-label">教材カテゴリ</label>
                <select id="category" name="category">
                    <option value="jsp" selected>JSP</option>
                    <option value="servlet">Servlet</option>
                    <option value="database">Database</option>
                    <option value="html">HTML</option>
                </select>
            </div>
            
            <div class="form-group">
                <label class="form-label">並び順</label>
                <div class="radio-group">
                    <label class="radio-item">
                        <input type="radio" name="order" value="title" checked> タイトル順 (title)
                    </label>
                    <label class="radio-item">
                        <input type="radio" name="order" value="level"> 難易度順 (level)
                    </label>
                    <label class="radio-item">
                        <input type="radio" name="order" value="new"> 新着順 (new)
                    </label>
                </div>
            </div>
            
            <div class="form-group">
                <label for="limit" class="form-label">表示件数</label>
                <select id="limit" name="limit">
                    <option value="10" selected>10件</option>
                    <option value="20">20件</option>
                    <option value="50">50件</option>
                </select>
            </div>
            
            <button type="submit" class="btn-submit">教材を検索</button>
        </form>
    </div>
</body>
</html>