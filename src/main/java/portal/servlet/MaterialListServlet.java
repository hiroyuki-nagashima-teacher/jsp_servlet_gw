package portal.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import portal.dao.MaterialDao;
import portal.model.Material;

@WebServlet("/materials")
public class MaterialListServlet extends HttpServlet {

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

        String category = request.getParameter("category");
        MaterialDao materialDao = new MaterialDao();

        try {
            List<String> categories = materialDao.findCategories();
            List<Material> materials;
            int materialCount;
            String searchCondition;
            int categoryCount = materialDao.countCategories();

            if (category != null && !category.isEmpty()) {
                materials = materialDao.findByCategory(category);
                materialCount = materialDao.countByCategory(category);
                searchCondition = "カテゴリ=" + category;
            } else {
                materials = materialDao.findAll();
                materialCount = materialDao.countAll();
                searchCondition = "全件";
            }

            request.setAttribute("materials", materials);
            request.setAttribute("categories", categories);
            request.setAttribute("materialCount", materialCount);
            request.setAttribute("categoryCount", categoryCount);
            request.setAttribute("selectedCategory", category);
            request.setAttribute("searchCondition", searchCondition);
            request.setAttribute("pageTitle", "教材一覧");

        } catch (SQLException e) {
            request.setAttribute("errorMessage", "教材一覧の取得に失敗しました。");
            request.setAttribute("errorDetail", e.getMessage());
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/materialList.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
