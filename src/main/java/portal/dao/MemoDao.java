package portal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import portal.util.DbUtil;

public class MemoDao {

    public int insert(int materialId, String memoText) throws SQLException {
        createTableIfNeeded();

        String sql = "INSERT INTO learning_memos (material_id, memo_text, created_at) "
                + "VALUES (?, ?, NOW())";

        try (
                Connection connection = DbUtil.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setInt(1, materialId);
            statement.setString(2, memoText);
            return statement.executeUpdate();
        }
    }

    private void createTableIfNeeded() throws SQLException {
        String sql = "CREATE TABLE IF NOT EXISTS learning_memos ("
                + "memo_id INT AUTO_INCREMENT PRIMARY KEY, "
                + "material_id INT NOT NULL, "
                + "memo_text TEXT NOT NULL, "
                + "created_at DATETIME NOT NULL, "
                + "INDEX idx_learning_memos_material_id (material_id)"
                + ")";

        try (
                Connection connection = DbUtil.getConnection();
                Statement statement = connection.createStatement()
        ) {
            statement.executeUpdate(sql);
        }
    }
}
