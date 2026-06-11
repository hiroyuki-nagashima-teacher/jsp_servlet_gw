package portal.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
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
import portal.util.DbUtil;

@WebServlet("/db-check")
public class DbConnectCheckServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("loginUser") == null) {
            request.setAttribute("errorMessage", "ログインしてからアクセスしてください。");

            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
            dispatcher.forward(request, response);
            return;
        }

        LoginUser loginUser = (LoginUser) session.getAttribute("loginUser");

        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy年MM月dd日 HH時mm分ss秒");
        String checkTime = now.format(formatter);

        request.setAttribute("loginUser", loginUser);
        request.setAttribute("checkTime", checkTime);
        request.setAttribute("jndiName", "java:/comp/env/jdbc/mysql");

        try (Connection connection = DbUtil.getConnection()) {
            request.setAttribute("success", true);
            request.setAttribute("message", "DB接続に成功しました。");
            request.setAttribute("connectionClass", connection.getClass().getName());
        } catch (SQLException e) {
            request.setAttribute("success", false);
            request.setAttribute("message", "DB接続に失敗しました。");
            request.setAttribute("errorMessage", e.getMessage());
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/dbCheck.jsp");
        dispatcher.forward(request, response);
    }
}
