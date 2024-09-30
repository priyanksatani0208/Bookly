package com.dao;

import com.entities.BookingDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BookingDetaildao {
    private Connection con;

    public BookingDetaildao(Connection con) {
        this.con = con; // Use the connection passed from the servlet
    }

    public boolean saveBookingDetail(BookingDetail bookingDetail) {
        boolean success = false;
        try {
            String query = "INSERT INTO booking_detail(book_id, bookingId) VALUES (?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, bookingDetail.getBook_id());
            pstmt.setInt(2, bookingDetail.getBookingId());

            int affectedRows = pstmt.executeUpdate();
            if (affectedRows > 0) {
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // DO NOT close the connection here
        return success;
    }
}
