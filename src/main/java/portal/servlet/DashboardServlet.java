package portal.servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import portal.model.LoginUser;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null) {
            request.setAttribute("errorMessage", "ログインしてからアクセスしてください。");

            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
            dispatcher.forward(request, response);
            return;
        }

        LoginUser loginUser = (LoginUser) session.getAttribute("loginUser");

        if (loginUser == null) {
            request.setAttribute("errorMessage", "ログインしてからアクセスしてください。");

            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
            dispatcher.forward(request, response);
            return;
        }

        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy年MM月dd日 HH時mm分ss秒");
        String accessTime = now.format(formatter);
        String sessionId = session.getId();

        request.setAttribute("loginMessage", "ログイン後トップ画面です。");
        request.setAttribute("pageTitle", "ログイン後トップ");
        request.setAttribute("accessTime", accessTime);
        request.setAttribute("nextStudy", "次はJDBCで教材一覧を表示します。");
        request.setAttribute("notice", "ログインユーザー情報はsessionから取得しています。");
        request.setAttribute("sessionId", sessionId);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/dashboard.jsp");
        dispatcher.forward(request, response);
    }
}
