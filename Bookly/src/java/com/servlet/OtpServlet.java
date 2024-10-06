package com.servlet;

import com.dao.Bookingdao;
import com.dao.Userdao;
import com.entities.User;
import com.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

public class OtpServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        Connection con = null;
        try (PrintWriter out = response.getWriter()) {
            // Get OTP inputs from the request
            int userId = Integer.parseInt(request.getParameter("uid"));
            String enteredOtp = request.getParameter("otp1") + request.getParameter("otp2")
                    + request.getParameter("otp3") + request.getParameter("otp4");

            System.out.println(enteredOtp);
            // Establish the connection
            con = ConnectionProvider.getConnection();
            Userdao userDao = new Userdao(con);

            // Validate OTP
            boolean isOtpValid = userDao.validateOtp(userId, enteredOtp);

            System.out.println(isOtpValid);
            if (isOtpValid) {
                // OTP is valid, update booking status
                Bookingdao bookingDao = new Bookingdao(con);
                bookingDao.updateBookingStatus(userId, 1); // Set booking status to 1 (confirmed)

                // Fetch user details from the session
                HttpSession session = request.getSession();
                User user = (User) session.getAttribute("currentUser");  // Retrieve user object from the session

                // Send order confirmation email using session details
                if (user != null) {
                    Userdao.sendBookingConfirmationEmail(user.getUemail(), user.getUName()); // Send email without book name
                }

                response.sendRedirect("thanks.jsp");  // Redirect to thank you page
            } else {
                // OTP is invalid, redirect to OTP page with an error
                response.sendRedirect("otp.jsp?error=invalid");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("404.jsp");
        }
    }

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
}
