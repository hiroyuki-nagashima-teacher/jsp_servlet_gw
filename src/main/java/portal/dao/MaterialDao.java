package portal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import portal.model.Material;
import portal.util.DbUtil;

public class MaterialDao {

    public List<Material> findAll() throws SQLException {
        List<Material> materials = new ArrayList<>();

        String sql = "SELECT material_id, title, category, difficulty, description, display_order "
                + "FROM materials "
                + "ORDER BY display_order, material_id";

        try (
                Connection connection = DbUtil.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery()
        ) {
            while (resultSet.next()) {
                Material material = mapToMaterial(resultSet);
                materials.add(material);
            }
        }

        return materials;
    }

    public List<Material> findByCategory(String category) throws SQLException {
        List<Material> materials = new ArrayList<>();

        String sql = "SELECT material_id, title, category, difficulty, description, display_order "
                + "FROM materials "
                + "WHERE category = ? "
                + "ORDER BY display_order, material_id";

        try (
                Connection connection = DbUtil.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setString(1, category);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Material material = mapToMaterial(resultSet);
                    materials.add(material);
                }
            }
        }

        return materials;
    }

    public List<Material> findByDifficulty(String difficulty) throws SQLException {
        List<Material> materials = new ArrayList<>();

        String sql = "SELECT material_id, title, category, difficulty, description, display_order "
                + "FROM materials "
                + "WHERE difficulty = ? "
                + "ORDER BY display_order, material_id";

        try (
                Connection connection = DbUtil.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setString(1, difficulty);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Material material = mapToMaterial(resultSet);
                    materials.add(material);
                }
            }
        }

        return materials;
    }

    public Material findById(int materialId) throws SQLException {
        String sql = "SELECT material_id, title, category, difficulty, description, display_order "
                + "FROM materials "
                + "WHERE material_id = ?";

        try (
                Connection connection = DbUtil.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setInt(1, materialId);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return mapToMaterial(resultSet);
                }
            }
        }

        return null;
    }

    public List<String> findCategories() throws SQLException {
        List<String> categories = new ArrayList<>();

        String sql = "SELECT DISTINCT category "
                + "FROM materials "
                + "ORDER BY category";

        try (
                Connection connection = DbUtil.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery()
        ) {
            while (resultSet.next()) {
                String category = resultSet.getString("category");
                categories.add(category);
            }
        }

        return categories;
    }

    public List<String> findDifficulties() throws SQLException {
        List<String> difficulties = new ArrayList<>();

        String sql = "SELECT DISTINCT difficulty "
                + "FROM materials "
                + "ORDER BY difficulty";

        try (
                Connection connection = DbUtil.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery()
        ) {
            while (resultSet.next()) {
                String difficulty = resultSet.getString("difficulty");
                difficulties.add(difficulty);
            }
        }

        return difficulties;
    }

    public int countAll() throws SQLException {
        String sql = "SELECT COUNT(*) AS material_count "
                + "FROM materials";

        try (
                Connection connection = DbUtil.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery()
        ) {
            if (resultSet.next()) {
                return resultSet.getInt("material_count");
            }
        }

        return 0;
    }

    public int countByCategory(String category) throws SQLException {
        String sql = "SELECT COUNT(*) AS material_count "
                + "FROM materials "
                + "WHERE category = ?";

        try (
                Connection connection = DbUtil.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setString(1, category);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("material_count");
                }
            }
        }

        return 0;
    }

    public int countCategories() throws SQLException {
        String sql = "SELECT COUNT(DISTINCT category) AS category_count "
                + "FROM materials";

        try (
                Connection connection = DbUtil.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery()
        ) {
            if (resultSet.next()) {
                return resultSet.getInt("category_count");
            }
        }

        return 0;
    }

    private Material mapToMaterial(ResultSet resultSet) throws SQLException {
        int materialId = resultSet.getInt("material_id");
        String title = resultSet.getString("title");
        String category = resultSet.getString("category");
        String difficulty = resultSet.getString("difficulty");
        String description = resultSet.getString("description");
        int displayOrder = resultSet.getInt("display_order");
        int memoCount = 0;

        return new Material(
                materialId,
                title,
                category,
                difficulty,
                description,
                displayOrder,
                memoCount
        );
    }
}
