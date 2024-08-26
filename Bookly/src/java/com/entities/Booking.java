package com.entities;

import java.util.Date;


public class Booking {
    private int bookingId;
    private int catId;
    private int bookId;
    private int userId;
    private String bookingType ;

    public Booking() {
    }

    public Booking(int bookingId, int catId, int bookId, int userId, String bookingType) {
        this.bookingId = bookingId;
        this.catId = catId;
        this.bookId = bookId;
        this.userId = userId;
        this.bookingType = bookingType;
    }

    public Booking(int catId, int bookId, int userId, String bookingType) {
        this.catId = catId;
        this.bookId = bookId;
        this.userId = userId;
        this.bookingType = bookingType;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
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

    public String getBookingType() {
        return bookingType;
    }

    public void setBookingType(String bookingType) {
        this.bookingType = bookingType;
    }
    
    
    
}
