package portal.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import portal.dao.MaterialDao;
import portal.model.Material;

public class MemoFormServlet extends HttpServlet {

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

        Integer materialId = parseMaterialId(request.getParameter("materialId"));

        if (materialId == null) {
            request.setAttribute("errorMessage", "教材IDが正しくありません。");
            forwardToMaterials(request, response);
            return;
        }

        MaterialDao materialDao = new MaterialDao();

        try {
            Material material = materialDao.findById(materialId);

            if (material == null) {
                request.setAttribute("errorMessage", "指定された教材が見つかりません。");
                forwardToMaterials(request, response);
                return;
            }

            request.setAttribute("material", material);

        } catch (SQLException e) {
            request.setAttribute("errorMessage", "教材情報の取得に失敗しました。");
            request.setAttribute("errorDetail", e.getMessage());
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/memoForm.jsp");
        dispatcher.forward(request, response);
    }

    private Integer parseMaterialId(String materialIdText) {
        try {
            return Integer.valueOf(materialIdText);
        } catch (NumberFormatException e) {
            return null;
        }
    }

    private void forwardToMaterials(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/materials");
        dispatcher.forward(request, response);
    }
}
