<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--
    【解説】
    ・pageディレクティブで文字コード「UTF-8」を設定し、日本語の文字化けを防ぎます。
--%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>研修参加登録フォーム</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h1>研修参加登録フォーム</h1>
        <%--
            ・action: 送信先のJSPファイルを指定。
            ・method="post": データをURLに露出させず、HTTPリクエストのボディに乗せて送る安全な送信方式。
        --%>
        <form action="participantResult.jsp" method="post">
            <div class="form-group">
                <%-- name属性の値（participantName）が、受信側でデータを取り出すキーになります --%>
                <label for="participantName" class="form-label">氏名</label>
                <input type="text" id="participantName" name="participantName" required>
            </div>
            
            <div class="form-group">
                <label for="employeeNo" class="form-label">社員番号</label>
                <input type="text" id="employeeNo" name="employeeNo" required>
            </div>
            
            <div class="form-group">
                <%-- type="password" で入力文字を隠します --%>
                <label for="password" class="form-label">確認用パスワード</label>
                <input type="password" id="password" name="password" required>
            </div>
            
            <div class="form-group">
                <%-- 同一のname属性（joinType）を指定することで、グループ内で1つしか選択できないよう制御します --%>
                <label class="form-label">参加方法</label>
                <div class="radio-group">
                    <label class="radio-item">
                        <input type="radio" name="joinType" value="classroom" checked> 会場受講 (classroom)
                    </label>
                    <label class="radio-item">
                        <input type="radio" name="joinType" value="online"> オンライン (online)
                    </label>
                    <label class="radio-item">
                        <input type="radio" name="joinType" value="recording"> 録画視聴 (recording)
                    </label>
                </div>
            </div>
            
            <div class="form-group">
                <%-- 複数選択可能なチェックボックス。受信側では配列として取り出します --%>
                <label class="checkbox-group-label" class="form-label">受講したい単元（複数選択可）</label>
                <div class="checkbox-group">
                    <label class="checkbox-item">
                        <input type="checkbox" name="units" value="form"> フォーム (form)
                    </label>
                    <label class="checkbox-item">
                        <input type="checkbox" name="units" value="query"> クエリ情報 (query)
                    </label>
                    <label class="checkbox-item">
                        <input type="checkbox" name="units" value="header"> ヘッダ情報 (header)
                    </label>
                    <label class="checkbox-item">
                        <input type="checkbox" name="units" value="path"> パス情報 (path)
                    </label>
                    <label class="checkbox-item">
                        <input type="checkbox" name="units" value="encoding"> エンコーディング (encoding)
                    </label>
                </div>
            </div>
            
            <div class="form-group">
                <label for="understanding" class="form-label">現在の理解度</label>
                <select id="understanding" name="understanding">
                    <option value="low">低 (low)</option>
                    <option value="middle" selected>中 (middle)</option>
                    <option value="high">高 (high)</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="comment" class="form-label">連絡事項</label>
                <textarea id="comment" name="comment" placeholder="連絡事項等があれば入力してください"></textarea>
            </div>
            
            <button type="submit" class="btn-submit">登録内容を確認</button>
        </form>
    </div>
</body>
</html>