package com.dao;

import com.entities.User;
import java.sql.*;
import java.util.Date;
import java.util.Random;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class Userdao {

    private final Connection con;

    public Userdao(Connection con) {
        this.con = con;
    }

    // Method to insert User into the database
    public boolean saveInsert(User user) {
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

        } catch (SQLException e) {
            // Log the exception (consider using a logging framework)
            e.printStackTrace();
        }

        return success;
    }

    // Method to retrieve a user by email and password
    public User getUserByEmailAndPassword(String uemail, String upassword) {
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
    public boolean updateProfile(User user) {
        boolean f = false;

        try {
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
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    // Method to update user password
    public boolean updatePassword(int userId, String newPassword) {
        boolean f = false;

        try {
            String query = "UPDATE user SET upassword = ? WHERE uId = ?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, newPassword);
            ps.setInt(2, userId);

            ps.executeUpdate();

            f = true;

        } catch (SQLException e) {
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
                    if (savedOtp != null && savedOtp.equals(enteredOtp)
                            && (new Date().getTime() - otpDate.getTime() <= 600000)) {
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

    //sending email    
    public static void sendEmail(String recipientEmail,String userName, int otp) {
        // SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");  // Change as needed
        properties.put("mail.smtp.port", "587");

        // Sender's email credentials
        final String senderEmail = "priyanksatani0208@gmail.com";  // Replace with your email
        final String password = "ysev xwab hvqz xokx";  // Replace with your email password

        // Create a session with an authenticator
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, password);
            }
        });

        try {
            // Create a new email message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipients(
                    Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Welcome to Bookly!");

            // Set the email content (HTML)
            String htmlContent = "<body style=\"margin: 0; padding: 0; font-family: Arial, sans-serif; background-color: #f4f4f4;\">\n"
                    + "    <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\" style=\"background-color: #f4f4f4; padding: 20px;\">\n"
                    + "        <tr>\n"
                    + "            <td align=\"center\">\n"
                    + "                <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"600\" style=\"background-color: #ffffff; border-radius: 10px; padding: 20px;\">\n"
                    + "                    <tr>\n"
                    + "                        <td align=\"center\" style=\"padding-bottom: 20px;\">\n"
                    + "                            <h1 style=\"color: #333; font-size: 24px;\">Book Order Verification</h1>\n"
                    + "                        </td>\n"
                    + "                    </tr>\n"
                    + "                    <tr>\n"
                    + "                        <td align=\"center\" style=\"padding-bottom: 10px;\">\n"
                    + "                            <p style=\"font-size: 18px; color: #666;\">Hi "+ userName +",</p>\n"
                    + "                            <p style=\"font-size: 18px; color: #666;\">Thank you for placing an order for the following book:</p>\n"
                    + "                        </td>\n"
                    + "                    </tr>\n"
                    + "                    <tr>\n"
                    + "                        <td align=\"center\" style=\"padding-bottom: 20px;\">\n"
                    + "                            <p style=\"font-size: 18px; color: #666;\">To confirm your order, please use the OTP below:</p>\n"
                    + "                        </td>\n"
                    + "                    </tr>\n"
                    + "                    <tr>\n"
                    + "                        <td align=\"center\" style=\"padding: 20px;\">\n"
                    + "                            <div style=\"display: inline-block; background-color: #333; color: #ffffff; font-size: 24px; font-weight: bold; padding: 10px 20px; border-radius: 5px;\">\n"
                    + "                                "+ otp +"\n"
                    + "                            </div>\n"
                    + "                        </td>\n"
                    + "                    </tr>\n"
                    + "                    <tr>\n"
                    + "                        <td align=\"center\" style=\"padding-top: 20px;\">\n"
                    + "                            <p style=\"font-size: 16px; color: #666;\">This OTP is valid for 10 minutes. Please do not share it with anyone.</p>\n"
                    + "                        </td>\n"
                    + "                    </tr>\n"
                    + "                    <tr>\n"
                    + "                        <td align=\"center\" style=\"padding-top: 20px;\">\n"
                    + "                            <p style=\"font-size: 14px; color: #999;\">If you didn't request this, please ignore this email.</p>\n"
                    + "                        </td>\n"
                    + "                    </tr>\n"
                    + "                    <tr>\n"
                    + "                        <td align=\"center\" style=\"padding-top: 20px;\">\n"
                    + "                            <p style=\"font-size: 14px; color: #999;\">Thank you for choosing Bookly!</p>\n"
                    + "                        </td>\n"
                    + "                    </tr>\n"
                    + "                </table>\n"
                    + "            </td>\n"
                    + "        </tr>\n"
                    + "    </table>\n"
                    + "</body>";

            // If you're using a file for the HTML template, read the file and pass the content as a string
            message.setContent(htmlContent, "text/html");

            // Send the email
            Transport.send(message);
            System.out.println("Email sent successfully!");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

}
