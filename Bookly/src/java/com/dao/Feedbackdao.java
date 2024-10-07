package com.dao;

import com.entities.Feedback;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Feedbackdao {

    private final Connection con;

    public Feedbackdao(Connection con) {
        this.con = con;
    }

    
    // Method to add feedback to the database
public boolean addFeedback(Feedback feedback) {
    // SQL to insert feedback
    String sql = "INSERT INTO feedback (feed_rating, feed_review, cust_id, bookId, feed_date) VALUES (?, ?, ?, ?, ?)";
    
    try (PreparedStatement pstmt = this.con.prepareStatement(sql)) {
        // Setting parameters for the prepared statement
        pstmt.setInt(1, feedback.getFeed_rating());
        pstmt.setString(2, feedback.getFeed_review());
        pstmt.setInt(3, feedback.getCust_id());
        pstmt.setInt(4, feedback.getBookId());
        pstmt.setTimestamp(5, Timestamp.valueOf(feedback.getFeed_date())); // Convert LocalDateTime to SQL Timestamp

        // Debugging output
//        System.out.println("Inserting Feedback:");
//        System.out.println("Rating: " + feedback.getFeed_rating());
//        System.out.println("Review: " + feedback.getFeed_review());
//        System.out.println("Customer ID: " + feedback.getCust_id());
//        System.out.println("Book ID: " + feedback.getBookId());
//        System.out.println("Feedback Date: " + feedback.getFeed_date());

        // Execute the insert operation
        int affectedRows = pstmt.executeUpdate();
        
        // Return true if the insert was successful
        return affectedRows > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}

    // Method to retrieve feedback for a specific book
    public List<Feedback> getFeedbackByBookId(int bookId) {
        List<Feedback> feedbackList = new ArrayList<>();
        String sql = "SELECT * FROM feedback WHERE bookId = ? ORDER BY feed_date DESC";
        try (PreparedStatement pstmt = this.con.prepareStatement(sql)) {
            pstmt.setInt(1, bookId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Feedback feedback = new Feedback(
                        rs.getInt("feed_id"),
                        rs.getInt("feed_rating"),
                        rs.getString("feed_review"),
                        rs.getInt("cust_id"),
                        rs.getInt("bookId"),
                        rs.getTimestamp("feed_date").toLocalDateTime() // Convert to LocalDateTime
                );
                feedbackList.add(feedback);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return feedbackList;
    }
}
