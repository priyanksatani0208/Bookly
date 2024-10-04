package com.dao;

import com.entities.Booking;
import com.entities.BookingDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Bookingdao {

    private Connection con;

    public Bookingdao(Connection con) {
        this.con = con;
    }

    // Method to get booking details with pagination
   public List<Booking> getBookingsByPage(int start, int total) {
        List<Booking> bookingList = new ArrayList<>();
        try {
            String query = "SELECT * FROM booking LIMIT ?, ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, start);
            pstmt.setInt(2, total);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("bookingId"));
                booking.setUserId(rs.getInt("userId"));
                booking.setShipping_address(rs.getString("shipping_address"));
                booking.setTotal_amount(rs.getInt("total_amount"));
                booking.setBookingDate(rs.getTimestamp("bookingDate").toLocalDateTime());
                booking.setBookingType(rs.getString("bookingType"));
                booking.setBookingStatus(rs.getInt("booking_status") == 1); // Corrected status logic

                bookingList.add(booking);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bookingList;
    }
   
    // Method to get booking details by bookingId
    public List<BookingDetail> getBookingDetailsByBookingId(int bookingId) {
        List<BookingDetail> bookingDetailList = new ArrayList<>();
        try {
            String query = "SELECT * FROM booking_detail WHERE bookingId = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, bookingId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                BookingDetail bookingDetail = new BookingDetail();
                bookingDetail.setBook_id(rs.getInt("book_Id"));  // Corrected setter
                bookingDetail.setBookingId(rs.getInt("bookingId"));

                // Adding bookingDetail to the list
                bookingDetailList.add(bookingDetail);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bookingDetailList;
    }

    // Method to get the total number of bookings
    public int getTotalBookings() {
        int count = 0;
        try {
            String query = "SELECT COUNT(*) FROM booking";
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
}
