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
    
    //update the booking status after OTP validation
    public boolean updateBookingStatus(int userId, int status) {
    boolean result = false;
    String query = "UPDATE booking SET booking_status = ? WHERE userId = ?";
    try (PreparedStatement ps = con.prepareStatement(query)) 
    {
        ps.setInt(1, status);  // 1 for confirmed booking
        ps.setInt(2, userId);
        ps.executeUpdate();
        result = true;
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return result;
}

}
