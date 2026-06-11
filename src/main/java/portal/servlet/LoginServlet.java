package portal.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import portal.model.LoginUser;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("guideMessage", "ユーザーIDとパスワードを入力してログインしてください。");

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String userId = request.getParameter("userId");
        String password = request.getParameter("password");
        String department = request.getParameter("department");

        if ((userId == null || userId.isEmpty()) && (password == null || password.isEmpty())) {
            request.setAttribute("errorMessage", "ユーザーIDとパスワードを入力してください。");
            request.setAttribute("inputUserId", userId);
            request.setAttribute("inputDepartment", department);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
            dispatcher.forward(request, response);
            return;
        }

        if (userId == null || userId.isEmpty()) {
            request.setAttribute("errorMessage", "ユーザーIDを入力してください。");
            request.setAttribute("inputUserId", userId);
            request.setAttribute("inputDepartment", department);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
            dispatcher.forward(request, response);
            return;
        }

        if (password == null || password.isEmpty()) {
            request.setAttribute("errorMessage", "パスワードを入力してください。");
            request.setAttribute("inputUserId", userId);
            request.setAttribute("inputDepartment", department);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
            dispatcher.forward(request, response);
            return;
        }

        boolean loginSuccess = false;

        if ("admin".equals(userId) && "password".equals(password)) {
            loginSuccess = true;
        }

        if (loginSuccess) {
            LoginUser loginUser = new LoginUser(userId, "管理者ユーザー", department);

            HttpSession session = request.getSession();
            session.setAttribute("loginUser", loginUser);

            Integer loginCount = (Integer) session.getAttribute("loginCount");

            if (loginCount == null) {
                loginCount = 1;
            } else {
                loginCount = loginCount + 1;
            }

            session.setAttribute("loginCount", loginCount);

            response.sendRedirect(request.getContextPath() + "/dashboard");
            return;
        }

        request.setAttribute("errorMessage", "ログイン情報が一致しません。もう一度入力してください。");
        request.setAttribute("inputUserId", userId);
        request.setAttribute("inputDepartment", department);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
        dispatcher.forward(request, response);
    }
}
