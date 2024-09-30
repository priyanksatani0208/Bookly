package com.dao;

import com.entities.Booking;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

public class Bookingdao{
    
    private Connection con;

    public Bookingdao(Connection con) {
        this.con = con;
    }   
    
    
    public int saveBooking(Booking booking) {
    int bookingId = 0;
    try {
        String query = "INSERT INTO booking (userId, shipping_address, total_amount, bookingType, bookingDate) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        ps.setInt(1, booking.getUserId());
        ps.setString(2, booking.getShipping_address());
        ps.setDouble(3, booking.getTotal_amount());
        ps.setString(4, booking.getBookingType());

        // Convert java.util.Date to java.sql.Date
        java.sql.Date sqlDate = new java.sql.Date(booking.getBookingDate().getTime());
        ps.setDate(5, sqlDate);

        int result = ps.executeUpdate();

        if (result > 0) {
            var rs = ps.getGeneratedKeys();
            if (rs.next()) {
                bookingId = rs.getInt(1);  // Retrieve the generated booking ID
            }
        }

        ps.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    return bookingId;
}

}
