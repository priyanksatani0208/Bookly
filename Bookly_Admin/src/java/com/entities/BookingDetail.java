package com.entities;


public class BookingDetail {
        
    private int id;
    private int book_id;
    private int book_quntity;

    public int getBook_quntity() {
        return book_quntity;
    }

    public void setBook_quntity(int book_quntity) {
        this.book_quntity = book_quntity;
    }
    private int bookingId;

    public BookingDetail() {
    }   
    
    public BookingDetail(int id, int book_id, int bookingId) {
        this.id = id;
        this.book_id = book_id;
        this.bookingId = bookingId;
    }

    public BookingDetail(int book_id, int bookingId) {
        this.book_id = book_id;
        this.bookingId = bookingId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }
    
}
