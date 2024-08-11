package com.entities;

import java.util.Date;

public class Feedback {
    private int feed_id;
    private int feed_rating;
    private String feed_review;
    private int feed_cust_id;
    private int feed_bookId;
    private Date feed_date;

    public Feedback() {
    }

    public Feedback(int feed_id, int feed_rating, String feed_review, int feed_cust_id, int feed_bookId, Date feed_date) {
        this.feed_id = feed_id;
        this.feed_rating = feed_rating;
        this.feed_review = feed_review;
        this.feed_cust_id = feed_cust_id;
        this.feed_bookId = feed_bookId;
        this.feed_date = feed_date;
    }

    public Feedback(int feed_rating, String feed_review, int feed_cust_id, int feed_bookId, Date feed_date) {
        this.feed_rating = feed_rating;
        this.feed_review = feed_review;
        this.feed_cust_id = feed_cust_id;
        this.feed_bookId = feed_bookId;
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

    public int getFeed_cust_id() {
        return feed_cust_id;
    }

    public void setFeed_cust_id(int feed_cust_id) {
        this.feed_cust_id = feed_cust_id;
    }

    public int getFeed_bookId() {
        return feed_bookId;
    }

    public void setFeed_bookId(int feed_bookId) {
        this.feed_bookId = feed_bookId;
    }

    public Date getFeed_date() {
        return feed_date;
    }

    public void setFeed_date(Date feed_date) {
        this.feed_date = feed_date;
    }
}
