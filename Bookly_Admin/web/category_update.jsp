<%@page import="com.entities.Category"%>
<%@page import="com.dao.Categorydao"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Get the category ID from the request
    int catId = Integer.parseInt(request.getParameter("catId"));
    
    // Fetch the category details from the database
    Categorydao categorydao = new Categorydao(ConnectionProvider.getConnection());
    Category category = categorydao.getCategoryById(catId);
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Update Category</title>
    <link rel="stylesheet" href="css/bootstrap1.min.css" />
    <link rel="stylesheet" href="css/style1.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>

<body class="crm_body_bg">

    <!-- Header -->
    <%@include file="header.jsp" %>
    <!-- Header End -->

    <!-- Main Content -->
    <div class="main_content_iner">
        <div class="container-fluid p-0">
            <div class="row justify-content-center">
                <div class="col-12">
                    <div class="QA_section">
                        <div class="white_box_tittle list_header d-flex align-items-center justify-content-between">
                            <h4>Update Category</h4>
                        </div>
                        <div class="QA_table mb_30">
                            <form action="UpdateCategoryServlet" method="POST" enctype="multipart/form-data">
                                <div class="row">
                                    <input type="hidden" name="catId" value="<%= category.getCatId() %>">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="categoryName">Category Name</label>
                                            <input type="text" class="form-control" id="categoryName" name="catName" value="<%= category.getCatName() %>" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="categoryImg">Category Image</label>
                                            <input type="file" class="form-control" id="categoryImg" name="catImg"required>
                                            <br>
                                            <img src="category_img/<%= category.getCatImg() %>" alt="Category Image" style="width: 100px; height: auto;">
                                        </div>
                                    </div>
                                    <div class="col-12 text-center">
                                        <br><br><button type="submit" class="btn btn-primary">Update</button>
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
            swal('Category updated successfully', '', 'success');
        } else if (msg === 'e') {
            swal('Error', 'An error occurred', 'error');
        }
    </script>
    
    <script src="js/jquery1-3.4.1.min.js"></script>
    <script src="js/bootstrap1.min.js"></script>

</body>

</html>
