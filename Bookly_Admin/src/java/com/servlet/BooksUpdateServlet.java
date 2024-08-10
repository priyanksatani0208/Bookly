/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import com.dao.Booksdao;
import com.entities.Books;
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
public class BooksUpdateServlet extends HttpServlet {

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
            out.println("<title>Servlet BooksUpdateServlet</title>");
            out.println("</head>");
            out.println("<body>");
            
            //fetch data
            int bookId = Integer.parseInt(request.getParameter("bookId"));
            int catId = Integer.parseInt(request.getParameter("catId"));
            String bookName = request.getParameter("bookName");
            String bookAuthor = request.getParameter("bookAuthor");
            String bookEdition = request.getParameter("bookEdition");
            String bookPublisher = request.getParameter("bookPublisher");
            int bookPrice = Integer.parseInt(request.getParameter("bookPrice"));
            int bookDiscount = Integer.parseInt(request.getParameter("bookDiscount"));
            String bookLength = request.getParameter("bookLength");
            String bookLanguage = request.getParameter("bookLanguage");
            String bookTopic = request.getParameter("bookTopic");
            String bookDescription = request.getParameter("bookDescription");
            Part part = request.getPart("bookImg");
            String bookImg = part.getSubmittedFileName();
            
            Booksdao booksdao = new Booksdao(ConnectionProvider.getConnection());
            Books existingBooks  = booksdao.getCategoryById(bookId);
            
            
            // Check if a new image was uploaded
            if (bookImg.isEmpty()) {
                bookImg = existingBooks.getBookImg();  // Use the old image if no new image was uploaded
            } else {
                String path = getServletContext().getRealPath("/") + "books_img" + File.separator + bookImg;
                Helper.saveFile(part.getInputStream(), path);  // Save the new image file
            }
            
            //add data(column - name)
            Books books = new Books(bookId, catId, bookName, bookAuthor, bookEdition, bookPublisher, bookPrice, bookDiscount, bookLength, bookLanguage, bookTopic, bookDescription, bookImg);
            if(booksdao.updateBook(books)){
                
                response.sendRedirect("books?msg=s");
                out.println("<script>swal('Update Successfully..', '', 'success');</script>");
                
            } else {
                out.println("<script>swal('Error', 'please try agin...', 'error');</script>");
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
