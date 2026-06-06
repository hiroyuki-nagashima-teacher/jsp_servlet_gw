<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 
    解説: jsp:forwardアクションタグを使い、リクエスト処理を転送しています。
          このページ自体の出力はバッファクリアされて破棄され、転送先のみの出力が表示されます。
--%>
<jsp:forward page="forwardTarget.jsp" />
