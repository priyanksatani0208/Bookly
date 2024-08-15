<%@page import="com.dao.Feedbackdao"%>
<%@page import="com.dao.Contactdao"%>
<%@page import="com.dao.Categorydao"%>
<%@page import="com.dao.Userdao"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.dao.Booksdao"%>
<%@page errorPage="error_400.jsp" %>

<!DOCTYPE html>
<html lang="zxx">

    <!-- Mirrored from demo.dashboardpack.com/directory-html/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 13 Jul 2024 17:02:43 GMT -->
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

        <link rel="stylesheet" href="vendors/datepicker/date-picker.css" />

        <link rel="stylesheet" href="vendors/datatable/css/jquery.dataTables.min.css" />
        <link rel="stylesheet" href="vendors/datatable/css/responsive.dataTables.min.css" />
        <link rel="stylesheet" href="vendors/datatable/css/buttons.dataTables.min.css" />

        <link rel="stylesheet" href="vendors/text_editor/summernote-bs4.css" />

        <link rel="stylesheet" href="vendors/morris/morris.css">

        <link rel="stylesheet" href="vendors/material_icon/material-icons.css" />

        <link rel="stylesheet" href="css/metisMenu.css">

        <link rel="stylesheet" href="css/style1.css" />
        <link rel="stylesheet" href="css/colors/default.css" id="colorSkinCSS">
        <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>-->
    </head>
    <body class="crm_body_bg">


        <!--header start-->

        <%@include file="header.jsp" %>
        <!--header start End -->

        <div class="main_content_iner">
            <div class="container-fluid p-0">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="dashboard_header mb_50">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="dashboard_header_title">
                                        <h3> Report Box</h3>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="dashboard_breadcam text-end">
                                        <p><a href="index">Dashboard</a> <i class="fas fa-caret-right"></i> Report Box</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <%
                    
                        Userdao userdao = new Userdao(ConnectionProvider.getConnection());
                        Categorydao categorydao = new Categorydao(ConnectionProvider.getConnection());
                        Booksdao  booksdao = new Booksdao(ConnectionProvider.getConnection());
                        Contactdao contactdao = new Contactdao(ConnectionProvider.getConnection());
                        Feedbackdao feedbackdao = new Feedbackdao(ConnectionProvider.getConnection());

                        int total_user = userdao.getTotalUser();
                        int total_category = categorydao.getTotalCategory();
                        int total_book = booksdao.getTotalBooks();
                        int total_contact = contactdao.getTotalContact();
                        int total_feedback = feedbackdao.getTotalFeedback();
                    %>

                    <!-- Widget Charts -->
                    
                    <div class="col-md-4">
                        <div class="card mb-3 widget-chart">
                            <div class="icon-wrapper rounded-circle">
                                <div class="icon-wrapper-bg bg-danger"></div>
                                <i class="ti-settings text-danger"></i>
                            </div>
                            <div class="widget-numbers"><span><%= total_user %></span></div>
                            <div class="widget-subheading">Total Customer</div>
<!--                            <div class="widget-description text-primary">
                                <span class="pr-1">54.1%</span>
                                <i class="fa fa-angle-up"></i>
                            </div>-->
                        </div>
                    </div>
                            
                     <div class="col-md-4">
                        <div class="card mb-3 widget-chart">
                            <div class="icon-wrapper rounded-circle">
                                <div class="icon-wrapper-bg bg-info"></div>
                                <i class="ti-settings text-info"></i>
                            </div>
                            <div class="widget-numbers"><span><%= total_category %></span></div>
                            <div class="widget-subheading">Total Categoies</div>
<!--                            <div class="widget-description text-info">
                                <i class="fa fa-arrow-right"></i>
                                <span class="ps-1">175.5%</span>
                            </div>-->
                        </div>
                    </div>
                    
                    <div class="col-md-4">
                        <div class="card mb-3 widget-chart">
                            <div class="icon-wrapper rounded-circle">
                                <div class="icon-wrapper-bg bg-primary"></div>
                                <i class="ti-settings text-primary"></i>
                            </div>
                            <div class="widget-numbers"><span><%= total_book %></span></div>
                            <div class="widget-subheading">Total Books</div>
<!--                            <div class="widget-description text-success">
                                <i class="fa fa-angle-up"></i>
                                <span class="ps-1"><span>176%</span></span>
                            </div>-->
                        </div>
                    </div>
                            
                    <div class="col-md-4">
                        <div class="card mb-3 widget-chart">
                            <div class="icon-wrapper rounded-circle">
                                <div class="icon-wrapper-bg bg-success"></div>
                                <i class="ti-settings text-warning"></i>
                            </div>
                            <div class="widget-numbers"><span><%= total_book %></span></div>
                            <div class="widget-subheading">Total Booking</div>
<!--                            <div class="widget-description text-success">
                                <i class="fa fa-angle-up"></i>
                                <span class="ps-1"><span>176%</span></span>
                            </div>-->
                        </div>
                    </div>
                            
                    <div class="col-md-4">
                        <div class="card mb-3 widget-chart">
                            <div class="icon-wrapper rounded-circle">
                                <div class="icon-wrapper-bg bg-info"></div>
                                <i class="ti-settings text-danger"></i>
                            </div>
                            <div class="widget-numbers"><span><%= total_contact %></span></div>
                            <div class="widget-subheading">Total Contact</div>
<!--                            <div class="widget-description text-success">
                                <i class="fa fa-angle-up"></i>
                                <span class="ps-1"><span>176%</span></span>
                            </div>-->
                        </div>
                    </div>
                            
                     <div class="col-md-4">
                        <div class="card mb-3 widget-chart">
                            <div class="icon-wrapper rounded-circle">
                                <div class="icon-wrapper-bg bg-warning"></div>
                                <i class="ti-settings text-dark"></i>
                            </div>
                            <div class="widget-numbers"><span><%= total_feedback %></span></div>
                            <div class="widget-subheading">Total FeedBack</div>
<!--                            <div class="widget-description text-success">
                                <i class="fa fa-angle-up"></i>
                                <span class="ps-1"><span>176%</span></span>
                            </div>-->
                        </div>
                    </div>

                    

                   
                </div>
            </div>
        </div>


        <!--footer start-->

        <%@include file="footer.jsp" %>

        <!--footer end -->

    </section>

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

    <script src="vendors/datepicker/datepicker.js"></script>
    <script src="vendors/datepicker/datepicker.en.js"></script>
    <script src="vendors/datepicker/datepicker.custom.js"></script>
    <script src="js/chart.min.js"></script>

    <script src="vendors/progressbar/jquery.barfiller.js"></script>

    <script src="vendors/tagsinput/tagsinput.js"></script>

    <script src="vendors/text_editor/summernote-bs4.js"></script>
    <script src="vendors/am_chart/amcharts.js"></script>
    <script src="vendors/apex_chart/apexcharts.js"></script>
    <script src="vendors/apex_chart/apex_realestate.js"></script>

    <script src="vendors/chart_am/core.js"></script>
    <script src="vendors/chart_am/charts.js"></script>
    <script src="vendors/chart_am/animated.js"></script>
    <script src="vendors/chart_am/kelly.js"></script>
    <script src="vendors/chart_am/chart-custom.js"></script>

    <script src="js/custom.js"></script>
    <script src="vendors/apex_chart/bar_active_1.js"></script>
    <script src="vendors/apex_chart/apex_chart_list.js"></script>
</body>

<!--<script>
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
        swal('Login Successfully', 'Welcome to Bookly Admin', 'success');
    } else if (msg === 'e') {
        swal('Error', 'An error occurred', 'error');
    }
</script>-->

<script src="js/jquery1-3.4.1.min.js"></script>
<script src="js/bootstrap1.min.js"></script>

<!-- Mirrored from demo.dashboardpack.com/directory-html/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 13 Jul 2024 17:03:34 GMT -->
</html>
