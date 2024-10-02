package com.dao;

import com.entities.User;
import java.sql.*;
import java.util.Date;
import java.util.Random;

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
    
    //update profile
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
    
    // Save the OTP and the timestamp in the user's record
    public boolean saveOtp(int userId, int otp) {
        boolean result = false;
        String query = "UPDATE user SET otp = ?, otp_date = ? WHERE uId = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, otp);
            ps.setTimestamp(2, new Timestamp(new Date().getTime()));  // Save current time as OTP timestamp
            ps.setInt(3, userId);
            ps.executeUpdate();
            result = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    // Fetch the OTP and validate
    public boolean validateOtp(int userId, String enteredOtp) {
        boolean valid = false;
        String query = "SELECT otp, otp_date FROM user WHERE uId = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String savedOtp = rs.getString("otp");
                    Timestamp otpDate = rs.getTimestamp("otp_date");

                    // Check if the OTP is correct and valid within 10 minutes (600000 ms)
                    if (savedOtp != null && savedOtp.equals(enteredOtp) &&
                        (new Date().getTime() - otpDate.getTime() <= 600000)) {
                        valid = true;
                        
                        System.out.println("step - 1");
                        // If OTP is valid, set OTP and OTP date to null
                        clearOtp(userId);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return valid;
    }

    // Clear OTP after successful validation
    public void clearOtp(int userId) {
        String query = "UPDATE user SET otp = NULL, otp_date = NULL WHERE uId = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, userId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    // Method to generate OTP
    public int generateOTP() {
        Random random = new Random();
        int otp = 1000 + random.nextInt(9000); // Generates a 4-digit OTP
        return otp;
    }
        
    
}
