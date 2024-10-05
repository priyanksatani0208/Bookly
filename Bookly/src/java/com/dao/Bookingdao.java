package com.dao;

import com.entities.Booking;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, status);  // 1 for confirmed booking
            ps.setInt(2, userId);
            ps.executeUpdate();
            result = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    //booking by user
    public List<Booking> getBookingsByUser(int userId) {
        List<Booking> bookings = new ArrayList<>();
        String query = "SELECT * FROM booking WHERE userId = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("bookingId"));
                booking.setUserId(rs.getInt("userId"));
                booking.setShipping_address(rs.getString("shipping_address"));
                booking.setTotal_amount(rs.getDouble("total_amount"));
                booking.setBookingType(rs.getString("bookingType"));
                booking.setBookingDate(rs.getDate("bookingDate"));
                booking.setBookingStatus(rs.getBoolean("booking_status"));
                booking.setDeliverStatus(rs.getBoolean("deliver_status"));
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    // Method to get booking by ID
    public Booking getBookingById(int bookingId) {
        Booking booking = null;
        try {
            String query = "SELECT * FROM booking WHERE bookingId = ?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setInt(1, bookingId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                // Assuming the Booking class has the corresponding fields
                booking = new Booking();
                booking.setBookingId(rs.getInt("bookingId"));
                booking.setUserId(rs.getInt("userId")); // Assuming you have userId in bookings table
                booking.setBookingDate(rs.getTimestamp("bookingDate"));
                booking.setTotal_amount(rs.getDouble("total_amount"));
                booking.setBookingStatus(rs.getBoolean("booking_status"));
                booking.setDeliverStatus(rs.getBoolean("deliver_status"));
                booking.setUser_status(rs.getBoolean("user_status"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return booking;
    }

    //cancelBooking
    public boolean cancelBooking(int bookingId) {
        String sql = "UPDATE booking SET user_status = 'Cancelled' WHERE bookingId = ?";
        try (PreparedStatement ps = this.con.prepareStatement(sql)) {
            ps.setInt(1, bookingId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    //update Booking
    public boolean updateBooking(int bookingId, boolean bookingStatus, boolean deliverStatus) {
        boolean updated = false;
        try {
            String query = "UPDATE booking SET booking_status = ?,deliver_status = ? WHERE bookingID = ?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setBoolean(1, bookingStatus);
            pstmt.setBoolean(2, deliverStatus);
            pstmt.setInt(3, bookingId);
            int rows = pstmt.executeUpdate();
            updated = (rows > 0);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return updated;
    }

}
