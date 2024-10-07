package com.entities;

import java.time.LocalDateTime;
import java.util.Date;

public class Feedback {
    private int feed_id;
    private int feed_rating;
    private String feed_review;
    private int cust_id;
    private int bookId;
    private LocalDateTime feed_date;

    public Feedback(int feed_id, int feed_rating, String feed_review, int cust_id, int bookId, LocalDateTime feed_date) {
        this.feed_id = feed_id;
        this.feed_rating = feed_rating;
        this.feed_review = feed_review;
        this.cust_id = cust_id;
        this.bookId = bookId;
        this.feed_date = feed_date;
    }

    public Feedback(int feed_rating, String feed_review, int cust_id, int bookId, LocalDateTime feed_date) {
        this.feed_rating = feed_rating;
        this.feed_review = feed_review;
        this.cust_id = cust_id;
        this.bookId = bookId;
        this.feed_date = feed_date;
    }

    public int getFeed_id() {
        return feed_id;
    }

    public void setFeed_id(int feed_id) {
        this.feed_id = feed_id;
    }

    public int getFeed_rating() {
        return feed_rating;
    }

    public void setFeed_rating(int feed_rating) {
        this.feed_rating = feed_rating;
    }

    public String getFeed_review() {
        return feed_review;
    }

    public void setFeed_review(String feed_review) {
        this.feed_review = feed_review;
    }

    public int getCust_id() {
        return cust_id;
    }

    public void setCust_id(int cust_id) {
        this.cust_id = cust_id;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public LocalDateTime getFeed_date() {
        return feed_date;
    }

    public void setFeed_date(LocalDateTime feed_date) {
        this.feed_date = feed_date;
    }
    
    
}
