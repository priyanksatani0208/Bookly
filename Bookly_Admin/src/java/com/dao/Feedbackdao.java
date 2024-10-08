package com.dao;

import com.entities.Feedback;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Feedbackdao {

    private Connection con;

    public Feedbackdao(Connection con) {
        this.con = con;
    }

    // Method to fetch all Feedback by page
    public List<Feedback> getFeedbacksByPage(int start, int total) {
        List<Feedback> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM feedback LIMIT ?, ?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setInt(1, start);
            pstmt.setInt(2, total);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setFeed_id(rs.getInt("feed_id"));
                feedback.setFeed_rating(rs.getInt("feed_rating"));
                feedback.setFeed_review(rs.getString("feed_review"));
                feedback.setFeed_cust_id(rs.getInt("cust_id"));
                feedback.setFeed_bookId(rs.getInt("bookId"));
                feedback.setFeed_date(rs.getTimestamp("feed_date"));
                list.add(feedback);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

     //total Feedback method
    public int getTotalFeedback() {
        int totalfeedback = 0;
        try {
            String query = "SELECT COUNT(*) AS total FROM  feedback";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                totalfeedback = rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalfeedback;
    }
    
    
    
    
}
