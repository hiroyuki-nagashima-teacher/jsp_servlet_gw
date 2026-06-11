package portal.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import portal.dao.SummaryDao;

public class SummaryServlet extends HttpServlet {

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

        SummaryDao summaryDao = new SummaryDao();

        try {
            request.setAttribute("portalSummary", summaryDao.findPortalSummary());
            request.setAttribute("categorySummaryList", summaryDao.findCategorySummaryList());
            request.setAttribute("difficultySummaryList", summaryDao.findDifficultySummaryList());

        } catch (SQLException e) {
            request.setAttribute("errorMessage", "学習状況サマリーの取得に失敗しました。");
            request.setAttribute("errorDetail", e.getMessage());
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/summary.jsp");
        dispatcher.forward(request, response);
    }
}
