<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.entities.Category"%>
<%@page import="com.entities.Books"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.Categorydao"%>
<%@page import="com.dao.Booksdao"%>
<%@page errorPage="error_400.jsp" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Update Book</title>
        <link rel="stylesheet" href="css/bootstrap1.min.css" />
        <link rel="stylesheet" href="css/style1.css" />
    </head>

    <body class="crm_body_bg">

        <!-- Header -->
        <%@include file="header.jsp" %>
        <!-- Header End -->

        <!-- Main Content -->
        <div class="main_content_iner ">
            <div class="container-fluid p-0">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="QA_section">
                            <div class="white_box_tittle list_header d-flex align-items-center justify-content-between">
                                <h4>Update Book</h4>
                            </div>
                            <div class="QA_table mb_30">
                                <%
                                    // Retrieve the book details from the database using the book ID
                                    int bookId = Integer.parseInt(request.getParameter("bookId"));
                                    Booksdao booksdao = new Booksdao(ConnectionProvider.getConnection());
                                    Books book = booksdao.getCategoryById(bookId);

                                    
                                %>
                                <form action="BooksUpdateServlet" method="POST" enctype="multipart/form-data">
                                    <input type="hidden" name="bookId" value="<%= book.getBookId() %>">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="category">Category</label>
                                                <select class="form-control" id="category" name="catId" required>
                                                    <option>Select Category</option>
                                                    <%                                                 
                                                        Categorydao categorydao = new Categorydao(ConnectionProvider.getConnection());
                                                        List<Category> list = categorydao.getAllCategories();
                                                        for (Category c : list) {
                                                    %>        
                                                    <option value="<%= c.getCatId()%>" <%= book.getCatId() == c.getCatId() ? "selected" : "" %>><%= c.getCatName()%></option>                                                   
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="bookName">Book Name</label>
                                                <input type="text" class="form-control" id="bookName" name="bookName" value="<%= book.getBookName() %>" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="bookAuthor">Author</label>
                                                <input type="text" class="form-control" id="bookAuthor" name="bookAuthor" value="<%= book.getBookAuthor() %>" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="bookEdition">Edition</label>
                                                <input type="text" class="form-control" id="bookEdition" name="bookEdition" value="<%= book.getBookEdition() %>" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="bookPublisher">Publisher</label>
                                                <input type="text" class="form-control" id="bookPublisher" name="bookPublisher" value="<%= book.getBookPublisher() %>" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="bookPrice">Price</label>
                                                <input type="text" class="form-control" id="bookPrice" name="bookPrice" value="<%= book.getBookPrice() %>" required>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="bookDiscount">Discount</label>
                                                <input type="text" class="form-control" id="bookDiscount" name="bookDiscount" value="<%= book.getBookDiscount() %>">
                                            </div>
                                            <div class="form-group">
                                                <label for="bookLength">Length</label>
                                                <input type="text" class="form-control" id="bookLength" name="bookLength" value="<%= book.getBookLength() %>" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="bookLanguage">Language</label>
                                                <input type="text" class="form-control" id="bookLanguage" name="bookLanguage" value="<%= book.getBookLanguage() %>" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="bookTopic">Topic</label>
                                                <input type="text" class="form-control" id="bookTopic" name="bookTopic" value="<%= book.getBookTopic() %>" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="bookDescription">Description</label>
                                                <textarea class="form-control" id="bookDescription" name="bookDescription" rows="2" required><%= book.getBookDescription() %></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="bookImg">Upload Image</label>
                                                <input type="file" class="form-control" id="bookImg" name="bookImg">
                                                <br>
                                                <img src="books_img/<%= book.getBookImg() %>" alt="Book Image" width="100">
                                            </div>
                                        </div>
                                        <div class="col-12 text-center">
                                            <br><br><button type="button" onclick="window.history.back()" class="btn btn-primary">Cancel</button> <button type="submit" class="btn btn-success">Update</button>
                                            
                                        </div>
                                    </div>
                                </form>
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <%@include file="footer.jsp" %>
        <!-- Footer End -->

        <script src="js/jquery1-3.4.1.min.js"></script>
        <script src="js/bootstrap1.min.js"></script>
        <script src="js/custom.js"></script>
        

        <script src="js/jquery1-3.4.1.min.js"></script>
        <script src="js/bootstrap1.min.js"></script>
    </body>
</html>
