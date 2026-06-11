package portal.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/portal/start")
public class FirstServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html; charset=UTF-8");

        String method = request.getMethod();
        String requestUri = request.getRequestURI();
        StringBuffer requestUrl = request.getRequestURL();
        String contextPath = request.getContextPath();
        String servletPath = request.getServletPath();

        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta charset=\"UTF-8\">");
        out.println("<title>研修ポータルmini</title>");
        out.println("</head>");
        out.println("<body>");

        out.println("<h1>研修ポータルmini</h1>");
        out.println("<p>FirstServletから表示しています。</p>");
        out.println("<p>Servletはサーバ側で実行されるJavaプログラムです。</p>");

        out.println("<h2>今回のハンズオン</h2>");
        out.println("<p>ハンズオン1:Servletで最初の応答を返す</p>");

        out.println("<h2>リクエスト情報</h2>");
        out.println("<table border=\"1\">");
        out.println("<tr>");
        out.println("<th>項目</th>");
        out.println("<th>取得結果</th>");
        out.println("</tr>");

        out.println("<tr>");
        out.println("<td>HTTPメソッド</td>");
        out.println("<td>" + method + "</td>");
        out.println("</tr>");

        out.println("<tr>");
        out.println("<td>リクエストURI</td>");
        out.println("<td>" + requestUri + "</td>");
        out.println("</tr>");

        out.println("<tr>");
        out.println("<td>リクエストURL</td>");
        out.println("<td>" + requestUrl + "</td>");
        out.println("</tr>");

        out.println("<tr>");
        out.println("<td>コンテキストパス</td>");
        out.println("<td>" + contextPath + "</td>");
        out.println("</tr>");

        out.println("<tr>");
        out.println("<td>サーブレットパス</td>");
        out.println("<td>" + servletPath + "</td>");
        out.println("</tr>");

        out.println("</table>");

        out.println("<h2>次に作る予定の機能</h2>");
        out.println("<p>次のハンズオンでは、ログイン画面からServletを呼び出します。</p>");

        out.println("</body>");
        out.println("</html>");
    }
}
