package com.entities;

import java.util.Date;

public class Booking {
    private int bookingId;
    private int userId;
    private String shipping_address;
    private double total_amount; 
    private String bookingType;
    private Date bookingDate;

    public Booking() {}

    public Booking(int userId, String shipping_address, double total_amount, String bookingType, Date bookingDate) {
        this.userId = userId;
        this.shipping_address = shipping_address;
        this.total_amount = total_amount;
        this.bookingType = bookingType;
        this.bookingDate = bookingDate;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
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

    public double getTotal_amount() {
        return total_amount;
    }

    public void setTotal_amount(double total_amount) {
        this.total_amount = total_amount;
    }

    public String getBookingType() {
        return bookingType;
    }

    public void setBookingType(String bookingType) {
        this.bookingType = bookingType;
    }

    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }
}
