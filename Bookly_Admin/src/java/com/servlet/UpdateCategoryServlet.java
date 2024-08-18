package com.servlet;

import com.dao.Categorydao;
import com.entities.Category;
import com.helper.ConnectionProvider;
import com.helper.Helper;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;

/**
 *
 * @author Priyank
 */
@MultipartConfig
public class UpdateCategoryServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateCategoryServlet</title>");
            out.println("</head>");
            out.println("<body>");
            
             // Fetch form data
            int catId = Integer.parseInt(request.getParameter("catId"));
            String catName = request.getParameter("catName");
            Part part = request.getPart("catImg");
            String catImg = part.getSubmittedFileName();

            // Get the existing category details
            Categorydao categorydao = new Categorydao(ConnectionProvider.getConnection());
            Category existingCategory = categorydao.getCategoryById(catId);

            // Check if a new image was uploaded
            if (catImg.isEmpty()) {
                catImg = existingCategory.getCatImg();  // Use the old image if no new image was uploaded
            } else {
                String path = getServletContext().getRealPath("/") + "category_img" + File.separator + catImg;
                Helper.saveFile(part.getInputStream(), path);  // Save the new image file
            }

            // Update the category details
            Category category = new Category(catId, catName, catImg);
            if (categorydao.updateCategory(category)) {                
                response.sendRedirect("categories?msg=s");
            } else {
                response.sendRedirect("categories?msg=e");
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
