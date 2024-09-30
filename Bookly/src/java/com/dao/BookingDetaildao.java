package com.dao;

import com.entities.BookingDetail;
import java.sql.*;

public class BookingDetaildao {

    private Connection con;

    public BookingDetaildao(Connection con) {
        this.con = con;
    }

    public boolean saveBookingDetail(BookingDetail bookingDetail) {
        boolean isSaved = false;
        PreparedStatement ps = null; // Declare outside try
        try {
            String query = "INSERT INTO booking_detail (book_id, bookingId) VALUES (?, ?)";
            ps = con.prepareStatement(query);
            ps.setInt(1, bookingDetail.getBook_id());
            ps.setInt(2, bookingDetail.getBookingId());

            int result = ps.executeUpdate();
            if (result > 0) {
                isSaved = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close(); // Close PreparedStatement
                }
                // Don't close the connection here to allow further operations
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return isSaved;
    }
}