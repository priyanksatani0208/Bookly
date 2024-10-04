<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.Categorydao"%>
<%@page errorPage="error_400.jsp" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Add Book </title>
        <link rel="stylesheet" href="css/bootstrap1.min.css" />
        <link rel="stylesheet" href="css/style1.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

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
                                <h4>Add New Book</h4>

                            </div>
                            <div class="QA_table mb_30">
                                <form action="BooksServlet" method="POST" enctype="multipart/form-data">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="category">Category</label>
                                                <select class="form-control" id="category" name="catId" required>
                                                    <option>Select Category</option>
                                                    <%                                               
                                                        //fetch data 
                                                        Categorydao categorydao = new Categorydao(ConnectionProvider.getConnection());
                                                        List<Category> list = categorydao.getAllCategories();
                                                        for (Category c : list) {
                                                    %>        
                                                    <option value="<%= c.getCatId()%>"><%= c.getCatName()%></option>                                                   
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="bookName">Book Name</label>
                                                <input type="text" class="form-control" id="bookName" name="bookName" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="bookAuthor">Author</label>
                                                <input type="text" class="form-control" id="bookAuthor" name="bookAuthor" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="bookEdition">Edition</label>
                                                <input type="text" class="form-control" id="bookEdition" name="bookEdition" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="bookPublisher">Publisher</label>
                                                <input type="text" class="form-control" id="bookPublisher" name="bookPublisher" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="bookPublisher">Price</label>
                                                <input type="text" class="form-control" id="bookPublisher" name="bookPrice" required>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="bookLength">Discount</label>
                                                <input type="text" class="form-control" id="bookLength" name="bookDiscount">
                                            </div>
                                            <div class="form-group">
                                                <label for="bookLength">Pages</label>
                                                <input type="text" class="form-control" id="bookLength" name="bookLength" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="bookLanguage">Language</label>
                                                <input type="text" class="form-control" id="bookLanguage" name="bookLanguage" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="bookTopic">Topic</label>
                                                <input type="text" class="form-control" id="bookTopic" name="bookTopic" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="bookDescription">Description</label>
                                                <textarea class="form-control" id="bookDescription" name="bookDescription" rows="2" required></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="bookImg">Upload Image</label>
                                                <input type="file" class="form-control" id="bookImg" name="bookImg" required>
                                            </div>
                                        </div>
                                        <div class="col-12 text-center">
                                            <br><br><button type="button" onclick="window.history.back()" class="btn btn-primary">Cancel</button> <button type="submit" class="btn btn-primary">Submit</button>
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
        <script>
            // Function to get URL parameter
            function getUrlParameter(name) {
                name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
                var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
                var results = regex.exec(location.search);
                return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
            }

            // Check for the 'msg' parameter and show alert if it exists
            var msg = getUrlParameter('msg');
            if (msg === 's') {
                swal('Books are Add Successfully', '', 'success');
            } else if (msg === 'e') {
                swal('Error', 'An error occurred', 'error');
            }
        </script>

        <script src="js/jquery1-3.4.1.min.js"></script>
        <script src="js/bootstrap1.min.js"></script>
    </body>
</html>
