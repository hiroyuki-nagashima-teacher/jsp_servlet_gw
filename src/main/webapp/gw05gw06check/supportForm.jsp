<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--
    【解説】
    ・本画面は、ユーザーから問い合わせを受け付けるサポート用フォーム画面です。
    ・送信メソッドにはPOST（method="post"）を指定しています。
--%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>サポート問い合わせフォーム</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h1>サポート問い合わせフォーム</h1>
        <p class="description">このフォームから送信すると、送信内容とブラウザ情報を確認できます。</p>
        
        <form action="supportResult.jsp" method="post">
            <div class="form-group">
                <label for="userName" class="form-label">名前</label>
                <input type="text" id="userName" name="userName" required>
            </div>
            
            <div class="form-group">
                <label for="userMail" class="form-label">メールアドレス</label>
                <input type="text" id="userMail" name="userMail" required>
            </div>
            
            <div class="form-group">
                <label for="supportType" class="form-label">問い合わせ種別</label>
                <select id="supportType" name="supportType">
                    <option value="login" selected>ログインについて (login)</option>
                    <option value="screen">画面表示について (screen)</option>
                    <option value="submit">送信エラーについて (submit)</option>
                    <option value="other">その他 (other)</option>
                </select>
            </div>
            
            <div class="form-group">
                <label class="form-label">緊急度</label>
                <div class="radio-group">
                    <label class="radio-item">
                        <input type="radio" name="priority" value="low"> 低 (low)
                    </label>
                    <label class="radio-item">
                        <input type="radio" name="priority" value="normal" checked> 普通 (normal)
                    </label>
                    <label class="radio-item">
                        <input type="radio" name="priority" value="high"> 高 (high)
                    </label>
                </div>
            </div>
            
            <div class="form-group">
                <label for="message" class="form-label">問い合わせ内容</label>
                <textarea id="message" name="message" required placeholder="具体的な内容を記述してください"></textarea>
            </div>
            
            <button type="submit" class="btn-submit">問い合わせを送信</button>
        </form>
    </div>
</body>
</html>