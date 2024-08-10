<%@page import="com.entities.Contact"%>
<%@page import="com.dao.Contactdao"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="java.util.List"%>
<%@page import="java.lang.Math"%>
<%@page errorPage="error_400.jsp" %>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Contact Management</title>
        <link rel="icon" href="img/logo.png" type="image/png">
        <!-- Include your CSS files here -->
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

        <div class="main_content_iner">
            <div class="container-fluid p-0">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="dashboard_header mb_50">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="dashboard_header_title">
                                        <h3>Contact Management</h3>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="dashboard_breadcam text-end">
                                        <p><a href="index">Dashboard</a> <i class="fas fa-caret-right"></i> Contacts</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="QA_section">
                            <div class="QA_table mb_30 table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Contact ID</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Email</th>
                                            <th>Phone</th>
                                            <th>Message</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%            
                                            int page1 = 1;
                                            int recordsPerPage1 = 10;
                                            if (request.getParameter("page1") != null) {
                                                page1 = Integer.parseInt(request.getParameter("page1"));
                                            }

                                            int start = (page1 - 1) * recordsPerPage1;
                                            Contactdao contactdao = new Contactdao(ConnectionProvider.getConnection());
                                            List<Contact> contactList = contactdao.getContactsByPage(start, recordsPerPage1);
                                            int totalRecords = contactdao.getContactCount();
                                            int totalPage1s = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage1);

                                            for (Contact c : contactList) {
                                        %>
                                        <tr>
                                            <!-- Table content -->
                                            <td><%= c.getContId()%></td>
                                            <td><%= c.getContFname()%></td>
                                            <td><%= c.getContLname()%></td>
                                            <td><%= c.getContEmail()%></td>
                                            <td><%= c.getContPhone()%></td>
                                            <td><%= c.getContMessage()%></td>
                                            <td><a href="contact_delete.jsp?id=<%= c.getContId()%>" class="status_btn1">Delete</a></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>

                            <!-- Pagination controls -->
                            <!-- Pagination controls -->
                            <nav aria-label="Page1 navigation example" style="margin-bottom: 50px;">
                                <ul class="pagination justify-content-center">
                                    <% if (page1 > 1) {%>
                                    <li class="page1-item">
                                        <a class="page1-link btn btn-primary" href="?page1=<%= page1 - 1%>">Previous</a>
                                    </li>
                                    <% } %>

                                    <% for (int i = 1; i <= totalPage1s; i++) {%>
                                    <li class="page1-item <%= (i == page1) ? "active" : ""%>">
                                        <a class="page1-link btn <%= (i == page1) ? "btn-success" : "btn-outline-primary"%>" href="?page1=<%= i%>"><%= i%></a>
                                    </li>
                                    <% } %>

                                    <% if (page1 < totalPage1s) {%>
                                    <li class="page1-item">
                                        <a class="page1-link btn btn-primary" href="?page1=<%= page1 + 1%>">Next</a>
                                    </li>
                                    <% }%>
                                </ul>
                            </nav>

                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>


    <!-- Include your JS files here -->
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#pagination-container').on('click', '.page1-link', function (e) {
                e.preventDefault();
                var page = $(this).data('page');

                $.ajax({
                    url: 'contact_management.jsp',
                    type: 'GET',
                    data: {page1: page},
                    success: function (response) {
                        // Update the table content and pagination controls
                        var newContent = $(response).find('.QA_section').html();
                        $('.QA_section').html(newContent);

                        var newPagination = $(response).find('#pagination-container').html();
                        $('#pagination-container').html(newPagination);
                    },
                    error: function (xhr, status, error) {
                        console.error('Error fetching page:', status, error);
                    }
                });
            });
        });
    </script>



</body>

</html>
