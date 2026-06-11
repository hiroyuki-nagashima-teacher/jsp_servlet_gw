package portal.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import portal.util.DbUtil;

public class DbInfoServlet extends HttpServlet {

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

        try (Connection connection = DbUtil.getConnection()) {
            DatabaseMetaData databaseMetaData = connection.getMetaData();

            request.setAttribute("databaseProductName", databaseMetaData.getDatabaseProductName());
            request.setAttribute("databaseProductVersion", databaseMetaData.getDatabaseProductVersion());
            request.setAttribute("driverName", databaseMetaData.getDriverName());
            request.setAttribute("driverVersion", databaseMetaData.getDriverVersion());
            request.setAttribute("databaseUrl", databaseMetaData.getURL());
            request.setAttribute("databaseUserName", databaseMetaData.getUserName());

            List<String> tableNames = findTableNames(databaseMetaData, connection.getCatalog());
            request.setAttribute("tableNames", tableNames);
            request.setAttribute("tableCount", tableNames.size());

            List<Map<String, String>> columnInfoList = findMaterialColumnInfo(connection);
            request.setAttribute("columnInfoList", columnInfoList);
            request.setAttribute("columnCount", columnInfoList.size());

        } catch (SQLException e) {
            request.setAttribute("errorMessage", "DB情報の取得に失敗しました。");
            request.setAttribute("errorDetail", e.getMessage());
            request.setAttribute("tableCount", 0);
            request.setAttribute("columnCount", 0);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/dbInfo.jsp");
        dispatcher.forward(request, response);
    }

    private List<String> findTableNames(DatabaseMetaData databaseMetaData, String catalog) throws SQLException {
        List<String> tableNames = new ArrayList<>();

        try (ResultSet tables = databaseMetaData.getTables(catalog, null, "%", new String[] { "TABLE" })) {
            while (tables.next()) {
                tableNames.add(tables.getString("TABLE_NAME"));
            }
        }

        return tableNames;
    }

    private List<Map<String, String>> findMaterialColumnInfo(Connection connection) throws SQLException {
        List<Map<String, String>> columnInfoList = new ArrayList<>();

        try (Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM materials LIMIT 0")) {

            ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
            int columnCount = resultSetMetaData.getColumnCount();

            for (int i = 1; i <= columnCount; i++) {
                Map<String, String> columnInfo = new LinkedHashMap<>();
                columnInfo.put("columnIndex", String.valueOf(i));
                columnInfo.put("columnLabel", resultSetMetaData.getColumnLabel(i));
                columnInfo.put("columnName", resultSetMetaData.getColumnName(i));
                columnInfo.put("columnTypeName", resultSetMetaData.getColumnTypeName(i));
                columnInfo.put("columnClassName", resultSetMetaData.getColumnClassName(i));
                columnInfo.put("columnDisplaySize", String.valueOf(resultSetMetaData.getColumnDisplaySize(i)));
                columnInfoList.add(columnInfo);
            }
        }

        return columnInfoList;
    }
}
