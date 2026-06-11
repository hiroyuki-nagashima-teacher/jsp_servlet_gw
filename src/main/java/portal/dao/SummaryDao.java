package portal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import portal.model.PortalSummary;
import portal.model.SummaryItem;
import portal.util.DbUtil;

public class SummaryDao {

    public PortalSummary findPortalSummary() throws SQLException {
        createMemoTableIfNeeded();

        int materialCount = countMaterials();
        int categoryCount = countCategories();
        int memoCount = countMemos();
        String latestMemoDateTime = findLatestMemoDateTime();
        double averageMemoCount = 0.0;

        if (materialCount > 0) {
            averageMemoCount = Math.round(((double) memoCount / materialCount) * 10.0) / 10.0;
        }

        return new PortalSummary(
                materialCount,
                categoryCount,
                memoCount,
                latestMemoDateTime,
                averageMemoCount
        );
    }

    public List<SummaryItem> findCategorySummaryList() throws SQLException {
        List<SummaryItem> summaryItems = new ArrayList<>();

        String sql = "SELECT category, COUNT(*) AS material_count "
                + "FROM materials "
                + "GROUP BY category "
                + "ORDER BY category";

        try (
                Connection connection = DbUtil.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery()
        ) {
            while (resultSet.next()) {
                summaryItems.add(new SummaryItem(
                        resultSet.getString("category"),
                        resultSet.getInt("material_count")
                ));
            }
        }

        return summaryItems;
    }

    public List<SummaryItem> findDifficultySummaryList() throws SQLException {
        List<SummaryItem> summaryItems = new ArrayList<>();

        String sql = "SELECT difficulty, COUNT(*) AS material_count "
                + "FROM materials "
                + "GROUP BY difficulty "
                + "ORDER BY difficulty";

        try (
                Connection connection = DbUtil.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery()
        ) {
            while (resultSet.next()) {
                summaryItems.add(new SummaryItem(
                        resultSet.getString("difficulty"),
                        resultSet.getInt("material_count")
                ));
            }
        }

        return summaryItems;
    }

    private int countMaterials() throws SQLException {
        return countBySql("SELECT COUNT(*) AS count_value FROM materials");
    }

    private int countCategories() throws SQLException {
        return countBySql("SELECT COUNT(DISTINCT category) AS count_value FROM materials");
    }

    private int countMemos() throws SQLException {
        return countBySql("SELECT COUNT(*) AS count_value FROM learning_memos");
    }

    private int countBySql(String sql) throws SQLException {
        try (
                Connection connection = DbUtil.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery()
        ) {
            if (resultSet.next()) {
                return resultSet.getInt("count_value");
            }
        }

        return 0;
    }

    private String findLatestMemoDateTime() throws SQLException {
        String sql = "SELECT MAX(created_at) AS latest_memo_date_time "
                + "FROM learning_memos";

        try (
                Connection connection = DbUtil.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery()
        ) {
            if (resultSet.next()) {
                LocalDateTime latestMemoDateTime = resultSet.getObject("latest_memo_date_time", LocalDateTime.class);

                if (latestMemoDateTime != null) {
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy年MM月dd日 HH時mm分ss秒");
                    return latestMemoDateTime.format(formatter);
                }
            }
        }

        return "未登録";
    }

    private void createMemoTableIfNeeded() throws SQLException {
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
