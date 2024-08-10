<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entities.Category"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.dao.Categorydao"%>
<%@page errorPage="error_400.jsp" %>
<%
    int pageid = 1;
    int total = 10; // Records per page
    if (request.getParameter("page") != null) {
        pageid = Integer.parseInt(request.getParameter("page"));
    }
    int start = (pageid - 1) * total;

    Categorydao categorydao = new Categorydao(ConnectionProvider.getConnection());
    List<Category> list = categorydao.getCategoriesWithPagination(start, total);
%>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <!-- Include your existing head content -->
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    </head>
    <body class="crm_body_bg">

        <!--header start-->
        <%@include file="header.jsp" %>
        <!--header end-->

        <div class="main_content_iner ">
            <div class="container-fluid p-0">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <!-- Dashboard header -->
                    </div>

                    <div class="col-12">
                        <div class="QA_section">
                            <div class="white_box_tittle list_header">                       
                                <div class="box_right d-flex lms_block">                            
                                    <div class="add_button ms-2">
                                        <a href="add_categories" class="btn_1" style="margin-left: 900%;">Add New</a>               
                                    </div>
                                </div>
                            </div>

                            <div class="QA_table mb_30 table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">Category Id</th>
                                            <th scope="col">Category Name</th>
                                            <th scope="col">Category Image</th>
                                            <th scope="col">Category Update</th>
                                            <th scope="col">Category Delete</th>                                  
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%                                 
                                              for (Category c : list) {
                                        %>
                                        <tr>
                                            <td><%= c.getCatId()%></td>
                                            <td><%= c.getCatName()%></td>
                                            <td><img src="category_img/<%= c.getCatImg()%>" alt="Category Image"></td>
                                            <td><a href="category_update.jsp?catId=<%= c.getCatId()%>" class="status_btn">Update</a></td>                               
                                            <td><a href="#" class="status_btn1">Delete</a></td>                                
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>

                                <nav aria-label="Page navigation example">
                                    <br> <ul class="pagination">
                                        <li class="page-item"><a class="page-link" href="categories.jsp?page=<%= pageid - 1%>">Previous</a></li>
                                            <%
                                                int numberOfRecords = categorydao.getCategoriesWithPagination(start, total).size();
                                                int numberOfPages = (int) Math.ceil(numberOfRecords / (double) total);
                                                for (int i = 1; i <= numberOfPages; i++) {
                                            %>
                                        <li class="page-item"><a class="page-link" href="categories.jsp?page=<%= i%>"><%= i%></a></li>
                                            <%
                                                }
                                            %>
                                        <li class="page-item"><a class="page-link" href="categories.jsp?page=<%= pageid + 1%>">Next</a></li>
                                    </ul>
                                </nav>
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
        <!-- Include your existing scripts -->
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

    </body>
</html>
