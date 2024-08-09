package com.dao;

import com.entities.Books;
import com.entities.Category;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Booksdao {

    private Connection con;

    public Booksdao(Connection con) {
        this.con = con;
    }

    //books add in database 
    public boolean insertBooks(Books books) {
        boolean success = false;
        try {
            String query = "INSERT INTO books(catId,bookName,bookAuthor,bookEdition,bookPublisher,bookPrice,bookDiscount,bookLength,BookLanguage,BookTopic,bookDescription,bookImg) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, books.getCatId());
            ps.setString(2, books.getBookName());
            ps.setString(3, books.getBookAuthor());
            ps.setString(4, books.getBookEdition());
            ps.setString(5, books.getBookPublisher());
            ps.setInt(6, books.getBookPrice());
            ps.setInt(7, books.getBookDiscount());
            ps.setString(8, books.getBookLength());
            ps.setString(9, books.getBookLanguage());
            ps.setString(10, books.getBookTopic());
            ps.setString(11, books.getBookDescription());
            ps.setString(12, books.getBookImg());

            ps.executeUpdate();
            success = true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }

    // Method to fetch all categories
    public List<Books> getAllbooks() {
        List<Books> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM books";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int bookId = rs.getInt("bookId");
                int catId = rs.getInt("catId");
                String bookname = rs.getString("bookName");
                String bookAuthor = rs.getString("bookAuthor");
                String bookEdition = rs.getString("bookEdition");
                String bookPublisher = rs.getString("bookPublisher");
                int bookPrice = rs.getInt("bookPrice");
                int bookDiscount = rs.getInt("bookDiscount");
                String bookLength = rs.getString("bookLength");
                String BookLanguage = rs.getString("BookLanguage");
                String BookTopic = rs.getString("BookTopic");
                String bookDescription = rs.getString("bookDescription");
                String bookImg = rs.getString("bookImg");

                Books books = new Books(bookId, catId, bookname, bookAuthor, bookEdition, bookPublisher, bookPrice, bookDiscount, bookLength, BookLanguage, BookTopic, bookDescription, bookImg);
                list.add(books);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    //fethch Book Id
    public Books getCategoryById(int bookId) {
        Books books = null;
        try {
            String query = "SELECT * FROM books WHERE bookId=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, bookId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                books = new Books(
                        rs.getInt("bookId"), // Use commas to separate arguments
                        rs.getInt("catId"),
                        rs.getString("bookName"),
                        rs.getString("bookAuthor"),
                        rs.getString("bookEdition"),
                        rs.getString("bookPublisher"),
                        rs.getInt("bookPrice"),
                        rs.getInt("bookDiscount"),
                        rs.getString("bookLength"),
                        rs.getString("BookLanguage"),
                        rs.getString("BookTopic"),
                        rs.getString("bookDescription"),
                        rs.getString("bookImg")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }

     // Method to update book details in the database
    public boolean updateBook(Books books) {
        boolean success = false;
        try {
            String query = "UPDATE books SET catId=?, bookName=?, bookAuthor=?, bookEdition=?, bookPublisher=?, bookPrice=?, bookDiscount=?, bookLength=?, BookLanguage=?, BookTopic=?, bookDescription=?, bookImg=? WHERE bookId=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, books.getCatId());
            ps.setString(2, books.getBookName());
            ps.setString(3, books.getBookAuthor());
            ps.setString(4, books.getBookEdition());
            ps.setString(5, books.getBookPublisher());
            ps.setInt(6, books.getBookPrice());
            ps.setInt(7, books.getBookDiscount());
            ps.setString(8, books.getBookLength());
            ps.setString(9, books.getBookLanguage());
            ps.setString(10, books.getBookTopic());
            ps.setString(11, books.getBookDescription());
            ps.setString(12, books.getBookImg());
            ps.setInt(13, books.getBookId());

            ps.executeUpdate();
            success = true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }
}
