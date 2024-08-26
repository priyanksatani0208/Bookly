<%@page import="com.entities.Books"%>
<%@page import="com.dao.Categorydao"%>
<%@page import="com.entities.Category"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.dao.Booksdao"%>
<%@page import="java.util.List"%>
<%@page errorPage="error_400.jsp" %>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Books</title>
        <link rel="icon" href="img/logo.png" type="image/png">
        <link rel="stylesheet" href="css/bootstrap1.min.css" />
        <link rel="stylesheet" href="vendors/themefy_icon/themify-icons.css" />
        <link rel="stylesheet" href="vendors/swiper_slider/css/swiper.min.css" />
        <link rel="stylesheet" href="vendors/select2/css/select2.min.css" />
        <link rel="stylesheet" href="vendors/niceselect/css/nice-select.css" />
        <link rel="stylesheet" href="vendors/owl_carousel/css/owl.carousel.css" />
        <link rel="stylesheet" href="vendors/gijgo/gijgo.min.css" />
        <link rel="stylesheet" href="vendors/font_awesome/css/all.min.css" />
        <link rel="stylesheet" href="vendors/tagsinput/tagsinput.css" />      
        <link rel="stylesheet" href="css/style1.css" />
        <link rel="stylesheet" href="css/style2.css" />
        <link rel="stylesheet" href="css/colors/default.css" id="colorSkinCSS">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <style>

        </style>

    </head>

    <body class="crm_body_bg">

        <!--header start-->
        <%@include file="header.jsp" %>
        <!--header end-->

        <div class="main_content_iner ">
            <div class="container-fluid p-0">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="dashboard_header mb_50">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="dashboard_header_title">
                                        <h3>Books Table</h3>
                                    </div>
                                </div>
                                <div class="col-lg-6">

                                    <div class="dashboard_breadcam text-end">
                                        <p><a href="index">Dashboard</a> <i class="fas fa-caret-right"></i>Books</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="QA_section">
                            <div class="white_box_tittle list_header">
                                <div class="box_right d-flex lms_block" >
                                    <input type="text" id="searchInput" placeholder="Search by name, author, or topic" class="form-control">
                                    <div class="add_button">
                                        <a href="add_books" class="btn_1"style="margin-left: 730%;">Add New</a>
                                    </div>
                                </div>
                            </div>

                            <div class="QA_table mb_30 table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Book-Id</th>
                                            <th>Category-name</th>
                                            <th>Book Name</th>
                                            <th>Book Author</th>
                                            <th>Book Edition</th>
                                            <th>Book Publisher</th>
                                            <th>Book Price</th>
                                            <th>Book Discount</th>
                                            <th>Book Pages</th>
                                            <th>Book Language</th>
                                            <th>Book Topic</th>
                                            <th>Book Description</th>
                                            <th>Book Img</th>
                                            <th>Update</th>
                                            <th>delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%                                          
                                            int pageid = 1;
                                            int total = 10; // Records per page
                                            if (request.getParameter("page") != null) {
                                                pageid = Integer.parseInt(request.getParameter("page"));
                                            }
                                            int start = (pageid - 1) * total;

                                            Booksdao booksdao = new Booksdao(ConnectionProvider.getConnection());
                                            Categorydao categorydao = new Categorydao(ConnectionProvider.getConnection());
                                            List<Books> list = booksdao.getBooksByPage(start, total);
                                            for (Books c : list) {

                                                // Fetch the category name based on the category ID
                                                String categoryName = categorydao.getCategoryNameById(c.getCatId());
                                        %>
                                        <tr>
                                            <td><%= c.getBookId()%></td>
                                            <td><%= categoryName%></td>
                                            <td><%= c.getBookName()%></td>
                                            <td><%= c.getBookAuthor()%></td>
                                            <td><%= c.getBookEdition()%></td>
                                            <td><%= c.getBookPublisher()%></td>
                                            <td><%= c.getBookPrice()%></td>
                                            <td><%= c.getBookDiscount()%></td>
                                            <td><%= c.getBookLength()%></td>
                                            <td><%= c.getBookLanguage()%></td>
                                            <td><%= c.getBookTopic()%></td>
                                            <td>
                                                <div class="book-description">
                                                    <%= c.getBookDescription().substring(0, 50)%>...
                                                    <span class="more-text" style="display: none;"><%= c.getBookDescription().substring(100)%></span>
                                                    <a href="javascript:void(0);" class="read-more-link">Read more</a>
                                                </div>
                                            </td>                                                                                       
                                            <td><img src="books_img/<%= c.getBookImg()%>" alt="Book Image" width="50"></td>
                                            <td><a href="book_update.jsp?bookId=<%= c.getBookId()%>" class="status_btn">Update</a></td>                                
                                            <td><a href="DeleteBookServlet?bookId=<%=c.getBookId()%>" class="status_btn1">Delete</a></td>
                                        </tr>          
                                        <%
                                            }
                                        %>
                                    </tbody>

                                </table>             
                            </div>

                            <!--pagination button-->        
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                    <li class="page-item"><a class="page-link" href="books.jsp?page=<%= pageid - 1%>">Previous</a></li>
                                        <%
                                            int numberOfRecords = booksdao.getBooksByPage(start, total).size();
                                            int numberOfPages = (int) Math.ceil(numberOfRecords / (double) total);
                                            for (int i = 1; i <= numberOfPages; i++) {
                                        %>
                                    <li class="page-item"><a class="page-link" href="books.jsp?page=<%= i%>"><%= i%></a></li>
                                        <%
                                            }
                                        %>
                                    <li class="page-item"><a class="page-link" href="books.jsp?page=<%= pageid + 1%>">Next</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--footer start-->
        <%@include file="footer.jsp" %>
        <!--footer end-->

        <script src="js/jquery1-3.4.1.min.js"></script>
        <script src="js/popper1.min.js"></script>
        <script src="js/bootstrap1.min.js"></script>
        <script src="js/metisMenu.js"></script>
        <script src="vendors/count_up/jquery.waypoints.min.js"></script>
        <script src="vendors/chartlist/Chart.min.js"></script>
        <script src="vendors/count_up/jquery.counterup.min.js"></script>
        <script src="vendors/swiper_slider/js/swiper.min.js"></script>
        <script src="vendors/niceselect/js/jquery.nice-select.min.js"></script>
        <script src="vendors/owl_carousel/js/owl.carousel.min.js"></script>
        <script src="vendors/gijgo/gijgo.min.js"></script>       
        <script src="js/chart.min.js"></script>
        <script src="vendors/progressbar/jquery.barfiller.js"></script>
        <script src="vendors/tagsinput/tagsinput.js"></script>
        <script src="vendors/text_editor/summernote-bs4.js"></script>
        <script src="vendors/apex_chart/apexcharts.js"></script>
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
//Bookes added code
            var msg = getUrlParameter('msg');
            if (msg === 'abc')
            {
                document.write("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'><\/script><script>Swal.fire({icon: 'success', title: 'Book are Added Successfully..', toast: true, position: 'top-end', showConfirmButton: false, timer: 3000, timerProgressBar: true, didOpen: (toast) => {toast.onmouseenter = Swal.stopTimer; toast.onmouseleave = Swal.resumeTimer;}});<\/script>");
            } else if (msg === 'def')
            {
                document.write("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'><\/script><script>Swal.fire({icon: 'error', title: 'Error', text: 'An error occurred', toast: true, position: 'top-end', showConfirmButton: false, timer: 3000, timerProgressBar: true, didOpen: (toast) => {toast.onmouseenter = Swal.stopTimer; toast.onmouseleave = Swal.resumeTimer;}});<\/script>");
            }

//update code
            var msg = getUrlParameter('msg');
            if (msg === 's')
            {
                document.write("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'><\/script><script>Swal.fire({icon: 'success', title: 'Book Update successfully', toast: true, position: 'top-end', showConfirmButton: false, timer: 3000, timerProgressBar: true, didOpen: (toast) => {toast.onmouseenter = Swal.stopTimer; toast.onmouseleave = Swal.resumeTimer;}});<\/script>");
            } else if (msg === 'e')
            {
                document.write("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'><\/script><script>Swal.fire({icon: 'error', title: 'Error', text: 'An error occurred', toast: true, position: 'top-end', showConfirmButton: false, timer: 3000, timerProgressBar: true, didOpen: (toast) => {toast.onmouseenter = Swal.stopTimer; toast.onmouseleave = Swal.resumeTimer;}});<\/script>");
            }



//delete code
            if (msg === 'ds')
            {
                document.write("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'><\/script><script>Swal.fire({icon: 'success', title: 'Book deleted successfully', toast: true, position: 'top-end', showConfirmButton: false, timer: 3000, timerProgressBar: true, didOpen: (toast) => {toast.onmouseenter = Swal.stopTimer; toast.onmouseleave = Swal.resumeTimer;}});<\/script>");
            } else if (msg === 'de')
            {
                document.write("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'><\/script><script>Swal.fire({icon: 'error', title: 'Error', text: 'An error occurred', toast: true, position: 'top-end', showConfirmButton: false, timer: 3000, timerProgressBar: true, didOpen: (toast) => {toast.onmouseenter = Swal.stopTimer; toast.onmouseleave = Swal.resumeTimer;}});<\/script>");
            }

//Table discription read more and read less..... script

            document.addEventListener('DOMContentLoaded', function () {
                var readMoreLinks = document.querySelectorAll('.read-more-link');

                readMoreLinks.forEach(function (link) {
                    link.addEventListener('click', function () {
                        var moreText = this.previousElementSibling;

                        if (moreText.style.display === 'none') {
                            moreText.style.display = 'inline';
                            this.innerText = 'Read less';
                        } else {
                            moreText.style.display = 'none';
                            this.innerText = 'Read more';
                        }
                    });
                });
            });


            //Filter by serching
            document.addEventListener('DOMContentLoaded', function () {
                var searchInput = document.getElementById('searchInput');
                var table = document.querySelector('.QA_table table tbody');
                var rows = table.querySelectorAll('tr');

                searchInput.addEventListener('keyup', function () {
                    var filter = searchInput.value.toLowerCase();

                    rows.forEach(function (row) {
                        var bookName = row.querySelector('td:nth-child(3)').textContent.toLowerCase();
                        var bookAuthor = row.querySelector('td:nth-child(4)').textContent.toLowerCase();
                        var bookTopic = row.querySelector('td:nth-child(11)').textContent.toLowerCase();

                        if (bookName.includes(filter) || bookAuthor.includes(filter) || bookTopic.includes(filter)) {
                            row.style.display = '';
                        } else {
                            row.style.display = 'none';
                        }
                    });
                });
            });

        </script>



    </script>
</html>
