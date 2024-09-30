package com.dao;

import com.entities.Booking;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Bookingdao {
    private Connection con;

    public Bookingdao(Connection con) {
        this.con = con; // Use the connection passed from the servlet
    }

    public int saveBooking(Booking booking) {
        int bookingId = -1;
        try {
            String query = "INSERT INTO booking(userId, shipping_address, total_amount, bookingType, bookingDate) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);

            pstmt.setInt(1, booking.getUserId());
            pstmt.setString(2, booking.getShipping_address());
            pstmt.setDouble(3, booking.getTotal_amount());
            pstmt.setString(4, booking.getBookingType());
            pstmt.setTimestamp(5, new java.sql.Timestamp(booking.getBookingDate().getTime()));

            int affectedRows = pstmt.executeUpdate();

            if (affectedRows > 0) {
                // Retrieve generated booking ID
                ResultSet rs = pstmt.getGeneratedKeys();
                if (rs.next()) {
                    bookingId = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // DO NOT close the connection here
        return bookingId;
    }
}
