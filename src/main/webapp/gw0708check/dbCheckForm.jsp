<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>DB処理判断フォーム</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container">
    <h1>DB処理判断フォーム</h1>

    <form action="dbCheckResult.jsp" method="post">
        <div class="form-group">
            <label for="processName" class="form-label">処理名</label>
            <input type="text" id="processName" name="processName" placeholder="例: ユーザー情報取得" required>
        </div>

        <div class="form-group">
            <label class="form-label">処理種別</label>
            <div class="radio-group">
                <label class="radio-item">
                    <input type="radio" name="processType" value="select" checked> SELECT
                </label>
                <label class="radio-item">
                    <input type="radio" name="processType" value="insert"> INSERT
                </label>
                <label class="radio-item">
                    <input type="radio" name="processType" value="update"> UPDATE
                </label>
                <label class="radio-item">
                    <input type="radio" name="processType" value="delete"> DELETE
                </label>
            </div>
        </div>

        <div class="form-group">
            <label for="sqlLevel" class="form-label">SQLの複雑さ</label>
            <select id="sqlLevel" name="sqlLevel">
                <option value="simple">簡単 (simple)</option>
                <option value="normal" selected>普通 (normal)</option>
                <option value="complex">複雑 (complex)</option>
            </select>
        </div>

        <div class="form-group">
            <label for="note" class="form-label">備考</label>
            <textarea id="note" name="note" rows="4" placeholder="備考等を入力してください"></textarea>
        </div>

        <div class="form-group">
            <input type="submit" value="判断結果を表示">
        </div>
    </form>
</div>
</body>
</html>
