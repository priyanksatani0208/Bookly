package com.servlet;

import com.dao.BookingDetaildao;
import com.dao.Bookingdao;
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
import java.sql.*;

public class CartBookingServlet extends HttpServlet {

   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    Connection con = null; // Declare connection here
    try (PrintWriter out = response.getWriter()) {
        con = ConnectionProvider.getConnection(); // Get the connection once
        

         int uid = Integer.parseInt(request.getParameter("uID"));
            String[] bookIdParams = request.getParameterValues("bookId");
            List<Integer> bookIdList = new ArrayList<>(); // Changed from Long to Integer

            if (bookIdParams != null) {
                for (String bookIdParam : bookIdParams) {
                    bookIdList.add(Integer.parseInt(bookIdParam)); // Changed from Long to Integer
                }
            }

            String bookingType = request.getParameter("bookingType");
            String shippingAddress = request.getParameter("shippingAddress");
            double totalAmount = Double.parseDouble(request.getParameter("total_amount"));

            // Get the current date and time for the booking
            Date bookingDate = new Date();
            
           

//            // Create a new Booking object and set the bookingDate
            Booking booking = new Booking(uid, shippingAddress, totalAmount, bookingType, bookingDate);

//            // Insert the booking into the database using DAO and get the generated booking ID
            Bookingdao bookingdao = new Bookingdao(ConnectionProvider.getConnection());
            int bookingId = bookingdao.saveBooking(booking);  // Corrected this line

            if (bookingId > 0) {
                // Save booking details
                BookingDetaildao bookingDetaildao = new BookingDetaildao(ConnectionProvider.getConnection());

                for (Integer bookId : bookIdList) {
                    BookingDetail bookingDetail = new BookingDetail(bookId, bookingId);
                    bookingDetaildao.saveBookingDetail(bookingDetail);
                }

                // Redirect to success page
                response.sendRedirect("otp.jsp");
            } else {
                // Handle failure
                response.sendRedirect("404.jsp");
            }
    }
}



    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
