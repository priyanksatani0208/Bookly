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
    public List<Category> getCategoriesWithPagination(int start, int total) {
        List<Category> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM category LIMIT ?, ?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setInt(1, start);
            pstmt.setInt(2, total);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Category c = new Category();
                c.setCatId(rs.getInt("catId"));
                c.setCatName(rs.getString("catName"));
                c.setCatImg(rs.getString("catImg"));
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Method to fetch all categories
    public List<Category> getAllCategories() {
        List<Category> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM category ";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Category c = new Category();
                c.setCatId(rs.getInt("catId"));
                c.setCatName(rs.getString("catName"));
                c.setCatImg(rs.getString("catImg"));
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
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

    // Method to delete a category by ID
    public boolean deleteCategory(int catId) {
        boolean deleted = false;
        try {
            String query = "DELETE FROM category WHERE catId=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, catId);
            ps.executeUpdate();
            deleted = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return deleted;
    }
    
     //total Category method
    public int getTotalCategory() {
        int totalCategory = 0;
        try {
            String query = "SELECT COUNT(*) AS total FROM category";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                totalCategory = rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalCategory;
    }
    
    //category name fetch 
    public String getCategoryNameById(int catId) {
    String categoryName = "";
    try {
        String query = "SELECT catName FROM category WHERE catId=?";
        PreparedStatement pstmt = this.con.prepareStatement(query);
        pstmt.setInt(1, catId);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            categoryName = rs.getString("catName");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return categoryName;
}


}
