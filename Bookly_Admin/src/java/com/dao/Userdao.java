package com.dao;

import com.entities.Category;
import com.entities.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

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

    // Function to send booking confirmation email
    public static void sendOrderDeliveryConfirmationEmail(String recipientEmail, String userName) {
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
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Order Delivery Confirmation - Bookly");

            // Set the email content (HTML)
            String htmlContent = "<body style=\"margin: 0; padding: 0; font-family: Arial, sans-serif; background-color: #f4f4f4;\">\n"
                    + "    <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\" style=\"background-color: #f4f4f4; padding: 20px;\">\n"
                    + "        <tr>\n"
                    + "            <td align=\"center\">\n"
                    + "                <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"600\" style=\"background-color: #ffffff; border-radius: 10px; padding: 20px;\">\n"
                    + "                    <tr>\n"
                    + "                        <td align=\"center\" style=\"padding-bottom: 20px;\">\n"
                    + "                            <h1 style=\"color: #333; font-size: 24px;\">Delivery Confirmed</h1>\n"
                    + "                        </td>\n"
                    + "                    </tr>\n"
                    + "                    <tr>\n"
                    + "                        <td align=\"center\" style=\"padding-bottom: 10px;\">\n"
                    + "                            <p style=\"font-size: 18px; color: #666;\">Dear " + userName + ",</p>\n"
                    + "                            <p style=\"font-size: 18px; color: #666;\">Your order has been successfully delivered!</p>\n"
                    + "                        </td>\n"
                    + "                    </tr>\n"
                    + "                    <tr>\n"
                    + "                        <td align=\"center\" style=\"padding-bottom: 20px;\">\n"
                    + "                            <p style=\"font-size: 16px; color: #666;\">Thank you for shopping with us.</p>\n"
                    + "                        </td>\n"
                    + "                    </tr>\n"
                    + "                    <tr>\n"
                    + "                        <td align=\"center\" style=\"padding-top: 20px;\">\n"
                    + "                            <p style=\"font-size: 14px; color: #999;\">Best Regards,<br>Your Bookly Team</p>\n"
                    + "                        </td>\n"
                    + "                    </tr>\n"
                    + "                </table>\n"
                    + "            </td>\n"
                    + "        </tr>\n"
                    + "    </table>\n"
                    + "</body>";

            message.setContent(htmlContent, "text/html");

            // Send the email
            Transport.send(message);
            System.out.println("Order delivery confirmation email sent successfully!");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    // Method to get user details by bookingId
    public User getUserByBookingId(int bookingId) {
        User user = null;
        try {
            String query = "SELECT u.* FROM users u "
                    + "JOIN booking_detail bd ON u.uId = bd.userId "
                    + // Adjust the join condition based on your schema
                    "WHERE bd.bookingId = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, bookingId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setuId(rs.getInt("uId"));
                user.setUName(rs.getString("UName"));
                user.setUemail(rs.getString("uemail"));
                // Populate other user details as needed
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
