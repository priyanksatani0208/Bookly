package com.dao;

import com.entities.User;
import java.sql.*;

public class Userdao {
    
      private final Connection con;

    public Userdao(Connection con) {
        this.con = con;
    }
        
     // Method to insert User into the database
    
    public boolean saveInsert(User user)
    {
        boolean success = false;
        
        String qry = "insert into user(uName,uemail,uPhone,ugender,uAddress,uabout,uProfile,upassword) values(?,?,?,?,?,?,?,?)";
        
        try (PreparedStatement ps = this.con.prepareStatement(qry)) {
            ps.setString(1, user.getUName());
            ps.setString(2, user.getUemail());
            ps.setInt(3, user.getuPhone());
            ps.setString(4, user.getUgender());
            ps.setString(5, user.getuAddress());
            ps.setString(6, user.getUabout());
            ps.setString(7, user.getuProfile());    
            ps.setString(8, user.getUpassword());
            
            ps.executeUpdate();
            success = true;
            
        }
        catch (SQLException e)
        {
            // Log the exception (consider using a logging framework)
            e.printStackTrace();
        }
         
        return success;
    }
    
    
    // Method to retrieve a user by email and password
    public User getUserByEmailAndPassword(String uemail, String upassword) 
    {
        User user = null;
        String query = "SELECT * FROM user WHERE uemail = ? AND upassword = ?";
        
        try (PreparedStatement ps = con.prepareStatement(query)) {
           ps.setString(1, uemail);
           ps.setString(2, upassword);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    
                   user.setuId(rs.getInt("uId"));
                   user.setUName(rs.getString("uName"));
                   user.setUemail(rs.getString("uemail"));
                   user.setuPhone(rs.getInt("uPhone"));
                   user.setUgender(rs.getString("ugender"));
                   user.setuAddress(rs.getString("uAddress"));
                   user.setUabout(rs.getString("uabout"));
                   user.setuProfile(rs.getString("uProfile"));                  
                   user.setUpassword(rs.getString("upassword"));
                    
                }
            }
        } catch (SQLException e) {
            // Log the exception (consider using a logging framework)
            e.printStackTrace();
        }
        
        return user;
    }
    
    public boolean updateProfile(User user)
    {
        boolean f = false;
        
        try
        {
            String qry = "update user set uName = ? ,uemail = ? , uPhone = ? , ugender = ? ,uAddress = ?,uabout = ? ,uProfile = ? where uId = ?";      
        
        
            PreparedStatement ps = this.con.prepareStatement(qry);
            
            ps.setString(1, user.getUName());
            ps.setString(2, user.getUemail());
            ps.setInt(3, user.getuPhone());
            ps.setString(4, user.getUgender());
            ps.setString(5, user.getuAddress());
            ps.setString(6, user.getUabout());
            ps.setString(7, user.getuProfile());
            ps.setInt(8, user.getuId());
            
            ps.executeUpdate();
            f = true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    
    // Method to update user password
    public boolean updatePassword(int userId, String newPassword) 
    {
        boolean f = false;

        try  
        {
            String query = "UPDATE user SET upassword = ? WHERE uId = ?";
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, newPassword);
            ps.setInt(2, userId);
            
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
