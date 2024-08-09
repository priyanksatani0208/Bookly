package com.servlet;

import com.dao.Userdao;
import com.entities.User;
import com.helper.ConnectionProvider;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ChangePasswordServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangePasswordServlet</title>");
            out.println("</head>");
            out.println("<body>");
            
            
            String currentPassword = request.getParameter("currentPassword");
            String newPassword = request.getParameter("newPassword");
            String confirmNewPassword = request.getParameter("confirmNewPassword");
            
             Userdao userdao = new Userdao(ConnectionProvider.getConnection());
           
             HttpSession hs = request.getSession();
             User user = (User)hs.getAttribute("currentUser");
            
             if(newPassword.equals(confirmNewPassword))
             {
                 if(user != null && user.getUpassword().equals(currentPassword))
                 {
                     boolean isPasswordChange = userdao.updatePassword(user.getuId(), newPassword);
                     
                     if(isPasswordChange)
                     {
                         user.setUpassword(newPassword);
                         
                         out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js' integrity='sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==' crossorigin='anonymous' referrerpolicy='no-referrer'></script>");
                         out.println("<script>swal('Password Change Successfully..', '', 'success')</script>");
              
                     }
                     else
                     {
                         out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js' integrity='sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==' crossorigin='anonymous' referrerpolicy='no-referrer'></script>");
                         out.println("<script>swal('Password Change fail..', '', 'error')</script>");
              
                     }
                 }
                 else
                 {
                      out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js' integrity='sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==' crossorigin='anonymous' referrerpolicy='no-referrer'></script>");
                      out.println("<script>swal('Current password is incorrect..', '', 'error')</script>");
              
                 }
             }
             else
             {
                 out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js' integrity='sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==' crossorigin='anonymous' referrerpolicy='no-referrer'></script>");
                 out.println("<script>swal('New passwords do not match...', '', 'error')</script>");
              
             }
           
            RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
            rd.include(request, response);

            
            
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
