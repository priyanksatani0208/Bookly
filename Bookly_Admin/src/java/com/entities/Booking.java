
package com.entities;

import java.time.LocalDateTime;


public class Booking {
    private int bookingId;
    private int bookId;
    private int userId;
    private String shipping_address;
    private int total_amount;
    private LocalDateTime bookingDate;
    private String BookingType;
    private boolean booking_satatus;

    public Booking() {
    }

    
    public Booking(int bookingId, int bookId, int userId, String shipping_address, int total_amount, LocalDateTime bookingDate, String BookingType) {
        this.bookingId = bookingId;
        this.bookId = bookId;
        this.userId = userId;
        this.shipping_address = shipping_address;
        this.total_amount = total_amount;
        this.bookingDate = bookingDate;
        this.BookingType = BookingType;
        
    }

    public Booking(int bookId, int userId, String shipping_address, int total_amount, LocalDateTime bookingDate, String BookingType) {
        this.bookId = bookId;
        this.userId = userId;
        this.shipping_address = shipping_address;
        this.total_amount = total_amount;
        this.bookingDate = bookingDate;
        this.BookingType = BookingType;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getShipping_address() {
        return shipping_address;
    }

    public void setShipping_address(String shipping_address) {
        this.shipping_address = shipping_address;
    }

    public int getTotal_amount() {
        return total_amount;
    }

    public void setTotal_amount(int total_amount) {
        this.total_amount = total_amount;
    }

    public LocalDateTime getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(LocalDateTime bookingDate) {
        this.bookingDate = bookingDate;
    }

    public String getBookingType() {
        return BookingType;
    }

    public void setBookingType(String BookingType) {
        this.BookingType = BookingType;
    }

    public boolean isBooking_satatus() {
        return booking_satatus;
    }

    public void setBooking_satatus(boolean booking_satatus) {
        this.booking_satatus = booking_satatus;
    }
    
    
    
}