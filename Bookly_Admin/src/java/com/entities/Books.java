
package com.entities;


public class Books {
    private int bookId;
    private int catId;
    private String bookName;
    private String bookAuthor;
    private String bookEdition;
    private String bookPublisher;
    private int bookPrice;    
    private int bookDiscount;    
    private String bookLength;
    private String BookLanguage;
    private String BookTopic;
    private String bookDescription;
    private String bookImg;

    public Books() {
    }

    public Books(int bookId, int catId, String bookName, String bookAuthor, String bookEdition, String bookPublisher, int bookPrice, int bookDiscount, String bookLength, String BookLanguage, String BookTopic, String bookDescription, String bookImg) {
        this.bookId = bookId;
        this.catId = catId;
        this.bookName = bookName;
        this.bookAuthor = bookAuthor;
        this.bookEdition = bookEdition;
        this.bookPublisher = bookPublisher;
        this.bookPrice = bookPrice;
        this.bookDiscount = bookDiscount;
        this.bookLength = bookLength;
        this.BookLanguage = BookLanguage;
        this.BookTopic = BookTopic;
        this.bookDescription = bookDescription;
        this.bookImg = bookImg;
    }

    public Books(int catId, String bookName, String bookAuthor, String bookEdition, String bookPublisher, int bookPrice, int bookDiscount, String bookLength, String BookLanguage, String BookTopic, String bookDescription, String bookImg) {
        this.catId = catId;
        this.bookName = bookName;
        this.bookAuthor = bookAuthor;
        this.bookEdition = bookEdition;
        this.bookPublisher = bookPublisher;
        this.bookPrice = bookPrice;
        this.bookDiscount = bookDiscount;
        this.bookLength = bookLength;
        this.BookLanguage = BookLanguage;
        this.BookTopic = BookTopic;
        this.bookDescription = bookDescription;
        this.bookImg = bookImg;
    }

    public int getBookDiscount() {
        return bookDiscount;
    }

    public void setBookDiscount(int bookDiscount) {
        this.bookDiscount = bookDiscount;
    }
   

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public String getBookEdition() {
        return bookEdition;
    }

    public void setBookEdition(String bookEdition) {
        this.bookEdition = bookEdition;
    }

    public String getBookPublisher() {
        return bookPublisher;
    }

    public void setBookPublisher(String bookPublisher) {
        this.bookPublisher = bookPublisher;
    }

    public int getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(int bookPrice) {
        this.bookPrice = bookPrice;
    }    

    public String getBookLength() {
        return bookLength;
    }

    public void setBookLength(String bookLength) {
        this.bookLength = bookLength;
    }

    public String getBookLanguage() {
        return BookLanguage;
    }

    public void setBookLanguage(String BookLanguage) {
        this.BookLanguage = BookLanguage;
    }

    public String getBookTopic() {
        return BookTopic;
    }

    public void setBookTopic(String BookTopic) {
        this.BookTopic = BookTopic;
    }

    public String getBookDescription() {
        return bookDescription;
    }

    public void setBookDescription(String bookDescription) {
        this.bookDescription = bookDescription;
    }

    public String getBookImg() {
        return bookImg;
    }

    public void setBookImg(String bookImg) {
        this.bookImg = bookImg;
    }
    
    
}
