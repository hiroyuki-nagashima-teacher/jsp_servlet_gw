<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%-- 【解説】 ・taglibディレクティブ: JSTLのCoreタグライブラリを使用するため、接頭辞「c」をマッピングしています。 --%>
            <!DOCTYPE html>
            <html lang="ja">

            <head>
                <meta charset="UTF-8">
                <title>GW07 基本タグ確認</title>
                <link rel="stylesheet" href="css/style.css">
            </head>

            <body>
                <div class="container">
                    <h1>GW07 基本タグ確認</h1>

                    <h2>1. c:setで値を用意する</h2>
                    <%-- c:set は指定したスコープ（デフォルトはpage）に変数を設定します --%>
                        <c:set var="userName" value="山田" />
                        <c:set var="courseName" value="JSP基礎" />
                        <c:set var="score" value="72" />
                        <c:set var="login" value="true" />

                        <table>
                            <thead>
                                <tr>
                                    <th>項目</th>
                                    <th>表示方法</th>
                                    <th>表示結果</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>userName</td>
                                    <td>EL</td>
                                    <%-- ${変数名} でスコープ内の変数を直接参照・出力できます --%>
                                        <td>${userName}</td>
                                </tr>
                                <tr>
                                    <td>courseName</td>
                                    <td>c:out</td>
                                    <%-- c:out はHTMLエスケープを行いながら安全に出力します --%>
                                        <td>
                                            <c:out value="${courseName}" />
                                        </td>
                                </tr>
                                <tr>
                                    <td>score</td>
                                    <td>EL</td>
                                    <td>${score}</td>
                                </tr>
                                <tr>
                                    <td>score + 5</td>
                                    <td>ELの計算</td>
                                    <%-- EL式の中では演算子を使った計算も可能です --%>
                                        <td>${score + 5}</td>
                                </tr>
                            </tbody>
                        </table>

                        <h2>2. c:ifで単純な条件分岐を確認する</h2>
                        <p>点数: <strong>${score}</strong></p>

                        <%-- test属性の条件式が真 (true) の場合のみ、タグの内部を出力します --%>
                            <c:if test="${login}">
                                <p>ログイン中です。</p>
                            </c:if>

                            <c:if test="${score >= 60}">
                                <p>判定: <span style="color: #0284c7; font-weight: bold;">合格です。</span></p>
                            </c:if>

                            <c:if test="${score < 60}">
                                <p>判定: <span style="color: #ef4444; font-weight: bold;">不合格です。</span></p>
                            </c:if>

                            <h2>3. c:chooseで複数条件の分岐を確認する</h2>
                            <%-- c:choose は if - else if - else のような多方向分岐を実現します --%>
                                <c:choose>
                                    <c:when test="${score >= 80}">
                                        <p>評価: <strong>A</strong></p>
                                    </c:when>
                                    <c:when test="${score >= 60}">
                                        <p>評価: <strong>B</strong></p>
                                    </c:when>
                                    <c:otherwise>
                                        <p>評価: <strong>C</strong></p>
                                    </c:otherwise>
                                </c:choose>

                                <h2>4. c:removeで値を削除する</h2>
                                <c:set var="message" value="削除前のメッセージです。" />

                                <p>削除前のmessage:
                                    <c:out value="${message}" />
                                </p>

                                <%-- c:remove でスコープ内の変数を削除します --%>
                                    <c:remove var="message" />

                                    <p>削除後のmessage:
                                        <c:out value="${message}" />
                                    </p>

                                    <h2>5. 確認メモ</h2>
                                    <ul>
                                        <li><code>c:set</code> は、JSP内で使う値を設定（保存）するために使います。</li>
                                        <li><code>EL</code> (<code>&#36;{...}</code>) は、設定された値を簡潔に参照・出力するために使います。</li>
                                        <li><code>c:out</code> は、値にHTMLエスケープを施して安全に出力するために使います。</li>
                                        <li><code>c:if</code> は、1つの条件のみを判定するときに使います（elseはありません）。</li>
                                        <li><code>c:choose</code> は、複数の条件から1つを選んで処理するときに使います。</li>
                                        <li><code>c:remove</code> は、設定した変数をスコープから削除するときに使います。</li>
                                    </ul>
                </div>
            </body>

            </html>