package com.entities;


public class BookingDetail {
        
    private int id;
    private int book_id;
    private int book_quantity;
    private int bookingId;

    public BookingDetail() {
    }   
    
    public BookingDetail(int id, int book_id, int bookingId,int book_quantity) {
        this.id = id;
        this.book_id = book_id;
        this.book_quantity = book_quantity;
        this.bookingId = bookingId;
    }

    public BookingDetail(int book_id, int bookingId,int book_quantity) {
        this.book_id = book_id;
        this.book_quantity = book_quantity;
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

    public int getBook_quantity() {
        return book_quantity;
    }

    public void setBook_quantity(int book_quantity) {
        this.book_quantity = book_quantity;
    }
    
    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }
    
    
    
}
