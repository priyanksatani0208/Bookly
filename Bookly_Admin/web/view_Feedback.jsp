<%@page import="com.entities.Feedback"%>
<%@page import="com.dao.Feedbackdao"%>
<%@page import="com.entities.User"%>
<%@page import="com.dao.Userdao"%>
<%@page import="com.entities.Books"%>
<%@page import="com.dao.Booksdao"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="java.util.List"%>
<%@page errorPage="error_400.jsp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%
    Userdao userDao = new Userdao(ConnectionProvider.getConnection());
    Booksdao booksdao = new Booksdao(ConnectionProvider.getConnection());
    Feedbackdao feedbackDao = new Feedbackdao(ConnectionProvider.getConnection());
%>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>View Feedback</title>
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
                                        <h3>View Feedback</h3>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="dashboard_breadcam text-end">
                                        <p><a href="index">Dashboard</a> <i class="fas fa-caret-right"></i>View Feedback</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="QA_section">
                            <div class="white_box_tittle list_header">
                                <!--                                <div class="box_right d-flex lms_block">
                                                                    <div class="add_button ms-2">
                                                                        <a href="add_feedback.jsp" class="btn_1" style="margin-left: 900%;">Add New Feedback</a>               
                                                                    </div>
                                                                </div>-->
                            </div>

                            <div class="QA_table mb_30 table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Feedback ID</th>
                                            <th>Rating</th>
                                            <th>Review</th>
                                            <th>Customer Name</th>
                                            <th>Book Name</th>
                                            <th>Feedback Date</th>                                         

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

                                            List<Feedback> feedbackList = feedbackDao.getFeedbacksByPage(start, total);

                                            for (Feedback feedback : feedbackList) {
                                                User user = userDao.getUserById(feedback.getFeed_cust_id());
                                                Books book = booksdao.getCategoryById(feedback.getFeed_bookId());
                                        %>
                                        <tr>
                                            <td><%= feedback.getFeed_id()%></td>
                                            <td><%= feedback.getFeed_rating()%></td>
                                            <td><%= feedback.getFeed_review()%></td>
                                            <td><%=  user.getUName() %></td>
                                            <td><%= book.getBookName()%></td>
                                            <td>
                                                <%
                                                    Date feedbackDate = feedback.getFeed_date();
                                                    SimpleDateFormat dateFormat = new SimpleDateFormat("dd - MM - yyyy");
                                                    String formattedDate = feedbackDate != null ? dateFormat.format(feedbackDate) : "N/A";
                                                %>
                                                <%= formattedDate%>
                                            </td>

                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                                     <!-- Pagination -->
                            <!-- Pagination -->
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                    <li class="page-item <%= pageid == 1 ? "disabled" : ""%>">
                                        <a class="page-link" href="view_Feedback.jsp?page=<%= pageid - 1%>">Previous</a>
                                    </li>
                                    <%
                                        int numberOfRecords = feedbackDao.getTotalFeedback(); // This should return the total number of bookings
                                        int numberOfPages = (int) Math.ceil(numberOfRecords / (double) total);
                                        for (int i = 1; i <= numberOfPages; i++) {
                                    %>
                                    <li class="page-item <%= pageid == i ? "active" : ""%>">
                                        <a class="page-link" href="view_Feedback.jsp?page=<%= i%>"><%= i%></a>
                                    </li>
                                    <%
                                        }
                                    %>
                                    <li class="page-item <%= pageid == numberOfPages ? "disabled" : ""%>">
                                        <a class="page-link" href="view_Feedback.jsp?page=<%= pageid + 1%>">Next</a>
                                    </li>
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
