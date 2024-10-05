/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import com.dao.Bookingdao;
import com.entities.Booking;
import com.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Priyank
 */
@WebServlet(name = "CancelOrderServlet", urlPatterns = {"/CancelOrderServlet"})
public class CancelOrderServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CancelOrderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            int bookingId = Integer.parseInt(request.getParameter("bookingId"));

            Bookingdao bookingDao = new Bookingdao(ConnectionProvider.getConnection());
            Booking booking = bookingDao.getBookingById(bookingId); // Fetch booking details

            if (booking != null && booking.isBookingStatus()) {
                // Update booking status to canceled
                boolean bookingStatus = false;  // Canceled status
                boolean deliverStatus = false;   // Canceled delivery status

                // Call the updateBooking method with the new status
                boolean isUpdated = bookingDao.updateBooking(bookingId, bookingStatus, deliverStatus);

                // Also update the user_status column
                boolean isCancelled = bookingDao.cancelBooking(bookingId);

                // Check if both updates were successful
                if (isUpdated && isCancelled) {
                    response.sendRedirect("view_order.jsp");
                } else {
                    response.sendRedirect("view_order.jsp");
                }
            } else {
                response.sendRedirect("view_order.jsp");
            }

            out.println("</body>");
            out.println("</html>");
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
