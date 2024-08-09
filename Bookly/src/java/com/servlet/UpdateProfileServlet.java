package com.servlet;

import com.dao.Userdao;
import com.entities.User;
import com.helper.ConnectionProvider;
import com.helper.Helper;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;

@MultipartConfig
public class UpdateProfileServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateProfileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            
            Part part = request.getPart("uProfile");
            String uProfile = part.getSubmittedFileName();
            
           
                        
            String uName = request.getParameter("uName");
            String uemail = request.getParameter("uemail");
            int uPhone = Integer.parseInt(request.getParameter("uPhone"));
            String ugender = request.getParameter("ugender");
            String uAddress = request.getParameter("uAddress");
            String uabout = request.getParameter("uabout");
            
             //get the user from the session
            
            HttpSession hs = request.getSession();
            User user = (User)hs.getAttribute("currentUser");
            
            user.setuProfile(uProfile);
            user.setUName(uName);
            user.setUemail(uemail);
            user.setuPhone(uPhone);
            user.setUgender(ugender);
            user.setuAddress(uAddress);
            user.setUabout(uabout);
            
            //old profile pic 
            String oldProfile = user.getuProfile();          
                      
            // update data
            
            Userdao userdao = new Userdao(ConnectionProvider.getConnection());
            boolean ans = userdao.updateProfile(user);
            
            if(ans)
            {
                //old Profile delete path
                String path1 = getServletContext().getRealPath("/") + "user_image" + File.separator +  oldProfile;
                Helper.deleteFile(path1);
                System.out.println(path1);
                
                //New Profile Update  path 
                String path = getServletContext().getRealPath("/") + "user_image" + File.separator +  user.getuProfile();
              
                
                
                if(Helper.saveFile(part.getInputStream(), path))
                {
                    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js' integrity='sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==' crossorigin='anonymous' referrerpolicy='no-referrer'></script>");
                    out.println("<script>swal('Profile Updated Successfully..', '', 'success')</script>");

                    RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
                    rd.include(request, response);
                }
            }
            else
            {
                out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js' integrity='sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==' crossorigin='anonymous' referrerpolicy='no-referrer'></script>");
                out.println("<script>swal('Profile Not Updated...', '', 'error')</script>");
              
                RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
                rd.include(request, response);
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
