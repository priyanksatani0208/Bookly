<%@page import="com.entities.Books"%>
<%@page import="com.dao.Categorydao"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.dao.Booksdao"%>
<%@page import="java.util.List"%>
<%@page errorPage="error_400.jsp" %>
<!DOCTYPE html>
<html lang="zxx">

    <!-- Mirrored from demo.dashboardpack.com/directory-html/data_table.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 13 Jul 2024 17:04:20 GMT -->
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Directory</title>
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
        <link rel="stylesheet" href="vendors/datatable/css/jquery.dataTables.min.css" />
        <link rel="stylesheet" href="vendors/datatable/css/responsive.dataTables.min.css" />
        <link rel="stylesheet" href="vendors/datatable/css/buttons.dataTables.min.css" />
        <link rel="stylesheet" href="vendors/text_editor/summernote-bs4.css" />
        <link rel="stylesheet" href="vendors/morris/morris.css">
        <link rel="stylesheet" href="vendors/material_icon/material-icons.css" />
        <link rel="stylesheet" href="css/metisMenu.css">
        <link rel="stylesheet" href="css/style1.css" />
        <link rel="stylesheet" href="css/style2.css" />
        <link rel="stylesheet" href="css/colors/default.css" id="colorSkinCSS">

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

                                <div class="box_right d-flex lms_block">
                                    <div class="add_button ms-2">
                                        <a href="add_books" class="btn_1" style="margin-left: 900%;">Add New</a>               
                                    </div>
                                </div>
                            </div>

                            <div class="QA_table mb_30 table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Book-Id</th>
                                            <th>Category-Id</th>
                                            <th>Book Name</th>
                                            <th>Book Author</th>
                                            <th>Book Edition</th>
                                            <th>Book Publisher</th>
                                            <th>Book Price</th>
                                            <th>Book Length</th>
                                            <th>Book Language</th>
                                            <th>Book Topic</th>
                                            <th>Book Description</th>
                                            <th>Book Img</th>
                                            <th>Update</th>
                                            <th>delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%  //fetch data 
                                            Booksdao booksdao = new Booksdao(ConnectionProvider.getConnection());
                                            List<Books> list = booksdao.getAllbooks();
                                            for (Books c : list) {
                                        %>
                                        <tr>
                                            <td><%= c.getBookId()%></td>
                                            <td><%= c.getCatId()%></td>
                                            <td><%= c.getBookName()%></td>
                                            <td><%= c.getBookAuthor()%></td>
                                            <td><%= c.getBookEdition()%></td>
                                            <td><%= c.getBookPublisher()%></td>
                                            <td><%= c.getBookPrice() %></td>
                                            <td><%= c.getBookLength()%></td>
                                            <td><%= c.getBookLanguage()%></td>
                                            <td><%= c.getBookTopic()%></td>
                                            <td><%= c.getBookDescription()%></td>                                                                                       
                                            <td><img src="books_img/<%= c.getBookImg()%>" alt="Book 1" width="50"></td>
                                            <td><a href="category_update.jsp" class="status_btn">Update</a></td>                                
                                            <td><a href="#" class="status_btn1">Delete</a></td> 
                                        </tr>          
                                        <%
                                            }
                                        %>
                                        <!-- Additional rows as needed -->
                                    </tbody>
                                </table>
                            </div>
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
        <script src="vendors/datatable/js/jquery.dataTables.min.js"></script>
        <script src="vendors/datatable/js/dataTables.responsive.min.js"></script>
        <script src="vendors/datatable/js/dataTables.buttons.min.js"></script>
        <script src="vendors/datatable/js/buttons.flash.min.js"></script>
        <script src="vendors/datatable/js/jszip.min.js"></script>
        <script src="vendors/datatable/js/pdfmake.min.js"></script>
        <script src="vendors/datatable/js/vfs_fonts.js"></script>
        <script src="vendors/datatable/js/buttons.html5.min.js"></script>
        <script src="vendors/datatable/js/buttons.print.min.js"></script>
        <script src="js/chart.min.js"></script>
        <script src="vendors/progressbar/jquery.barfiller.js"></script>
        <script src="vendors/tagsinput/tagsinput.js"></script>
        <script src="vendors/text_editor/summernote-bs4.js"></script>
        <script src="vendors/apex_chart/apexcharts.js"></script>
        <script src="js/custom.js"></script>

    </body>

</html>
