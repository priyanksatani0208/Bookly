package com.dao;

import com.entities.BookingDetail;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
    
    public List<BookingDetail> getBookingDetailsByBookingId(int bookingId) {
        List<BookingDetail> details = new ArrayList<>();
        String query = "SELECT * FROM booking_detail WHERE bookingId = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, bookingId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BookingDetail detail = new BookingDetail();
                detail.setId(rs.getInt("id"));
                detail.setBook_id(rs.getInt("book_id"));
                detail.setBookingId(rs.getInt("bookingId"));
                details.add(detail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return details;
    }
}
