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
import portal.dao.MemoDao;
import portal.model.Material;

public class MemoRegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("loginUser") == null) {
            request.setAttribute("errorMessage", "ログインしてからアクセスしてください。");

            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
            dispatcher.forward(request, response);
            return;
        }

        Integer materialId = parseMaterialId(request.getParameter("materialId"));
        String memoText = request.getParameter("memoText");

        if (materialId == null) {
            request.setAttribute("errorMessage", "教材IDが正しくありません。");
            forwardToMaterials(request, response);
            return;
        }

        if (memoText == null || memoText.trim().isEmpty()) {
            request.setAttribute("errorMessage", "学習メモを入力してください。");
            request.setAttribute("inputMemoText", memoText);
            forwardToMemoForm(request, response, materialId);
            return;
        }

        try {
            MemoDao memoDao = new MemoDao();
            memoDao.insert(materialId, memoText.trim());

            request.setAttribute("completeMessage", "学習メモを登録しました。");
            request.setAttribute("registeredMaterialId", materialId);
            forwardToMaterials(request, response);

        } catch (SQLException e) {
            request.setAttribute("errorMessage", "学習メモの登録に失敗しました。");
            request.setAttribute("errorDetail", e.getMessage());
            request.setAttribute("inputMemoText", memoText);
            forwardToMemoForm(request, response, materialId);
        }
    }

    private Integer parseMaterialId(String materialIdText) {
        try {
            return Integer.valueOf(materialIdText);
        } catch (NumberFormatException e) {
            return null;
        }
    }

    private void forwardToMemoForm(HttpServletRequest request, HttpServletResponse response, int materialId)
            throws ServletException, IOException {
        try {
            MaterialDao materialDao = new MaterialDao();
            Material material = materialDao.findById(materialId);
            request.setAttribute("material", material);
        } catch (SQLException e) {
            request.setAttribute("errorDetail", e.getMessage());
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/memoForm.jsp");
        dispatcher.forward(request, response);
    }

    private void forwardToMaterials(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/materials");
        dispatcher.forward(request, response);
    }
}
