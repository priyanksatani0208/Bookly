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
    public List<User> getAllUser()
    {
        List<User> users = new ArrayList<>();
        try {
            String query = "SELECT * FROM user";
            PreparedStatement ps = con.prepareStatement(query);
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
        
    
}
