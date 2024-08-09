package com.dao;
import com.entities.Category;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Categorydao {
    private Connection con;

    public Categorydao(Connection con) {
        this.con = con;
    }
    
    //category add in database 
    public boolean insertCategory(Category category) {
    boolean success = false;
    try {
        String query = "INSERT INTO category (catName, catImg) VALUES (?, ?)";
        
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, category.getCatName());
        ps.setString(2, category.getCatImg());

        ps.executeUpdate();
        success = true;
        
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return success;
    }
    
    // Method to fetch all categories
    public List<Category> getAllCategories()
    {
        List<Category> categories = new ArrayList<>();
        try {
            String query = "SELECT * FROM category";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("catId");
                String name = rs.getString("catName");
                String img = rs.getString("catImg");

                Category category = new Category(id, name, img);
                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }
    
    //fethch Category Id
    public Category getCategoryById(int catId) {
        Category category = null;
        try {
            String query = "SELECT * FROM category WHERE catId=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, catId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                category = new Category(
                    rs.getInt("catId"),
                    rs.getString("catName"),
                    rs.getString("catImg")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return category;
    }

    //update Category
    public boolean updateCategory(Category category) {
        boolean updated = false;
        try {
            
            String query = "UPDATE category SET catName=?, catImg=? WHERE catId=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, category.getCatName());
            ps.setString(2, category.getCatImg());
            ps.setInt(3, category.getCatId());
            ps.executeUpdate();
            updated = true;
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return updated;
    }

}
