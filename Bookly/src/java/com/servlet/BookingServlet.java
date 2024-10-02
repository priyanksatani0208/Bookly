package com.servlet;

import com.dao.BookingDetaildao;
import com.dao.Bookingdao;
import com.dao.Userdao;
import com.entities.Booking;
import com.entities.BookingDetail;
import com.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.sql.Connection;
import java.sql.SQLException;

public class BookingServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        Connection con = null; // Declare connection here
        try (PrintWriter out = response.getWriter()) {
            
            // Get a single connection at the start
            con = ConnectionProvider.getConnection();
            con.setAutoCommit(false); // Begin transaction

            // Retrieve form parameters
            int uid = Integer.parseInt(request.getParameter("uID"));
            String bookingType = request.getParameter("bookingType");
            String shippingAddress = request.getParameter("shippingAddress");
            double totalAmount = Double.parseDouble(request.getParameter("total_amount"));

            // Get the current date and time for the booking
            Date bookingDate = new Date();

            // Create a new Booking object
            Booking booking = new Booking(uid, shippingAddress, totalAmount, bookingType, bookingDate);

            // Insert the booking into the database using the same connection
            Bookingdao bookingdao = new Bookingdao(con);
            int bookingId = bookingdao.saveBooking(booking);  // Use the same connection

            if (bookingId > 0) {
                // Save booking details using the same connection
                BookingDetaildao bookingDetaildao = new BookingDetaildao(con);
                List<Integer> bookIdList = new ArrayList<>(); // List to hold book IDs

                // Check if request contains multiple book IDs (for cart)
                String[] bookIdParams = request.getParameterValues("bookId[]");
                if (bookIdParams != null) 
                {
                    // Case for multiple books (cart)
                    for (String bookIdParam : bookIdParams) 
                    {
                        bookIdList.add(Integer.parseInt(bookIdParam));
                    }
                } else {
                    // Case for a single book (buy)
                    int bookId = Integer.parseInt(request.getParameter("bookId"));
                    bookIdList.add(bookId);
                }

                // Insert all booking details
                for (Integer bookId : bookIdList) {
                    BookingDetail bookingDetail = new BookingDetail(bookId, bookingId);
                    bookingDetaildao.saveBookingDetail(bookingDetail);
                }

               // Generate OTP for user
                Userdao userdao = new Userdao(con);
                int generatedOtp = userdao.generateOTP(); // Generate OTP
                boolean otpSaved = userdao.saveOtp(uid, generatedOtp); // Save OTP to the user table

                if (otpSaved) {
                    // Commit transaction if everything is successful
                    con.commit();
                    con.setAutoCommit(true); // Reset auto-commit
                    
                    // Send OTP to the user via email or other methods
                    // For example: emailService.sendOtp(userEmail, generatedOtp);

                    // Redirect to OTP verification page
                    response.sendRedirect("otp.jsp");
                    
                } else {
                    // Handle failure by rolling back transaction
                    con.rollback();
                    response.sendRedirect("404.jsp");
                }
            } else {
                // Handle failure by rolling back transaction
                con.rollback();
                response.sendRedirect("404.jsp");
            }
        } catch (Exception e) {
            if (con != null) {
                try {
                    con.rollback(); // Rollback transaction on exception
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
            e.printStackTrace();
       
        }
    }

    // HTTP methods (GET and POST) calling processRequest()
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request , response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet handling both single and multiple book bookings";
    }
}
