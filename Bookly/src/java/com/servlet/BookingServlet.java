package com.servlet;

import com.dao.BookingDetaildao;
import com.dao.Bookingdao;
import com.dao.Userdao;
import com.entities.Booking;
import com.entities.BookingDetail;
import com.entities.User;
import com.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.sql.Connection;
import java.sql.SQLException;
import javax.mail.Session;

public class BookingServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        Connection con = null; // Declare connection here
        try (PrintWriter out = response.getWriter()) {

            // Get the HttpSession object and retrieve the logged-in user
            HttpSession session = request.getSession(false);  // Get the existing session without creating a new one
            if (session != null) {
                User user = (User) session.getAttribute("currentUser");  // Assume "currentUser" is the session attribute set during login
               
                if (user != null) {
                    // Get the user ID and other necessary details from the User object
                    int uid = user.getuId();
                    String userName = user.getUName();
                    String userEmail = user.getUemail();

                 
                    // Get a single connection at the start
                    con = ConnectionProvider.getConnection();
                    con.setAutoCommit(false);  // Begin transaction

                    // Retrieve form parameters for the booking
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

                    //fetch the array type quantity
                    String[] bookQuantities = request.getParameterValues("quantity[]");

                    if (bookingId > 0 && bookQuantities != null) {
                        // Save booking details using the same connection
                        BookingDetaildao bookingDetaildao = new BookingDetaildao(con);
                        
                        List<Integer> bookIdList = new ArrayList<>(); // List to hold book IDs

                        // Check if request contains multiple book IDs (for cart)
                        String[] bookIdParams = request.getParameterValues("bookId[]");

                        if (bookIdParams != null) {
                            
                            // Case for multiple books (cart)
                            for (int i = 0; i < bookIdParams.length; i++) {
                                int bookId = Integer.parseInt(bookIdParams[i]); // Convert bookId to integer
                                int quantity = Integer.parseInt(bookQuantities[i]); // Convert quantity to integer

                                // Save booking details with the corresponding bookId and quantity
                                BookingDetail bookingDetail = new BookingDetail(bookId, bookingId, quantity);
                                bookingDetaildao.saveBookingDetail(bookingDetail);
                            }
                        } else {
                            // Case for a single book (buy)
                            int bookId = Integer.parseInt(request.getParameter("bookId"));
                            int quantity = Integer.parseInt(request.getParameter("quantity")); // For single book

                            // Save booking details for single book
                            BookingDetail bookingDetail = new BookingDetail(bookId, bookingId, quantity);
                            bookingDetaildao.saveBookingDetail(bookingDetail);
                        }

                        // Continue with OTP generation and the rest of the flow
                        Userdao userdao = new Userdao(con);
                        int generatedOtp = userdao.generateOTP();  // Generate OTP
                        
                        // Send OTP to the user's email
                        userdao.sendEmail(userEmail, userName, generatedOtp);

                        // Save OTP to the user table
                        boolean otpSaved = userdao.saveOtp(uid, generatedOtp);

                        if (otpSaved) {
                            // Commit the transaction if everything is successful
                            con.commit();
                            con.setAutoCommit(true);  // Reset auto-commit

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
                } else {
                    // If no user is in session, redirect to login page
                    response.sendRedirect("login.jsp");
                }
            } else {
                // If no session exists, redirect to login page
                response.sendRedirect("login.jsp");
            }

        } catch (Exception e) {
            if (con != null) {
                try {
                    con.rollback();  // Rollback transaction on exception
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
        processRequest(request, response);
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
