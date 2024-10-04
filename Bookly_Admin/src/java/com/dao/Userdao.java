package com.dao;

import com.entities.Category;
import com.entities.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Userdao {

    private final Connection con;

    public Userdao(Connection con) {
        this.con = con;
    }

    // Method to fetch all User
    public List<User> getUsersByPage(int start, int total) {
        List<User> users = new ArrayList<>();
        try {
            String query = "SELECT * FROM user LIMIT ?, ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, start);
            ps.setInt(2, total);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("uid");
                String name = rs.getString("uName");
                String email = rs.getString("uemail");
                int phone = rs.getInt("uPhone");
                String gender = rs.getString("ugender");
                String Address = rs.getString("uAddress");
                String about = rs.getString("uabout");
                String profile = rs.getString("uProfile");

                User user = new User(id, name, email, phone, gender, Address, about, profile, about);
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    
     //total User method
    public int getTotalUser() {
        int totalUser = 0;
        try {
            String query = "SELECT COUNT(*) AS total FROM user";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                totalUser = rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalUser;
    }
    
     // Method to get user details by userId
    public User getUserById(int userId) {
        User user = null;
        try {
            String query = "SELECT * FROM user WHERE uId = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setuId(rs.getInt("uId"));
                user.setUName(rs.getString("UName"));
                user.setUemail(rs.getString("uemail"));
             
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
