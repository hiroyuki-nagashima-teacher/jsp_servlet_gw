<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>クエリ情報フォーム - GW06</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>クエリ情報フォーム</h1>
        
        <div class="card">
            <h2>検索条件の指定</h2>
            <form action="queryResult.jsp" method="get">
                
                <div class="form-group">
                    <label for="keyword">キーワード</label>
                    <input type="text" id="keyword" name="keyword" placeholder="例: JSP, サーブレット" required>
                </div>
                
                <div class="form-group">
                    <label for="category">カテゴリ</label>
                    <select id="category" name="category">
                        <option value="jsp">JSP</option>
                        <option value="servlet">Servlet</option>
                        <option value="html">HTML</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label>レベル</label>
                    <div class="radio-group">
                        <label class="radio-option">
                            <input type="radio" name="level" value="beginner" checked>
                            初級 (beginner)
                        </label>
                        <label class="radio-option">
                            <input type="radio" name="level" value="middle">
                            中級 (middle)
                        </label>
                        <label class="radio-option">
                            <input type="radio" name="level" value="advanced">
                            上級 (advanced)
                        </label>
                    </div>
                </div>
                
                <div style="margin-top: 2rem;">
                    <button type="submit" class="btn">検索 (GET送信)</button>
                </div>
            </form>
        </div>
        
        <div class="actions">
            <a href="pathInfo.jsp" class="nav-link">← パス情報確認ページへ</a>
            <a href="encodeLink.jsp" class="nav-link">URLエンコード確認ページへ →</a>
        </div>
    </div>
</body>
</html>
