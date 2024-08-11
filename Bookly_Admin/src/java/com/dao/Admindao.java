package com.dao;
import com.entities.Admin;
import java.sql.*;

public class Admindao {

    private final Connection con;

    public Admindao(Connection con) {
        this.con = con;
    }
    
    // Method to retrieve a admin by email and password
    public Admin getAdminByEmailAndPassword(String email, String password) {
        Admin admin = null;
        String query = "SELECT * FROM admin WHERE admin_email = ? AND admin_password = ?";
        
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, email);
            ps.setString(2, password);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    admin = new Admin();
                    admin.setAdmin_id(rs.getInt("admin_id"));
                    admin.setAdmin_name(rs.getString("admin_name"));
                    admin.setAdmin_email(rs.getString("admin_email"));
                    admin.setAdmin_password(rs.getString("admin_password"));
                }
            }
        } catch (SQLException e) {
            // Log the exception (consider using a logging framework)
            e.printStackTrace();
        }
        
        return admin;
    }
    
    // Method to update user password
    public boolean updatePassword(int admin_id, String newPassword) 
    {
        boolean f = false;

        try  
        {
            String query = "UPDATE admin SET admin_password = ? WHERE admin_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, newPassword);
            ps.setInt(2, admin_id);
            
            ps.executeUpdate();
           
            f = true;
            
        } 
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        return f;
    }        
    
}
