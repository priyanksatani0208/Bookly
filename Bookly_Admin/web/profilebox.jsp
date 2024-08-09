<%@page import="com.entities.Admin"%>
<%@page import="java.sql.*" %>
<%
    Admin a = (Admin)session.getAttribute("currentAdmin");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Directory</title>
    <link rel="icon" href="img/logo.png" type="image/png">

    <!-- CSS links -->
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
    <link rel="stylesheet" href="css/colors/default.css" id="colorSkinCSS">
</head>

<body class="crm_body_bg">
    <!-- Header -->
    <%@include file="header.jsp" %>

    <div class="main_content_iner">
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-12">
                    <div class="dashboard_header mb_50">
                        <div class="row">
                            <div class="col-lg-6">
                                <!-- Title can be added here if needed -->
                            </div>
                            <!-- Breadcrumb can be added here if needed -->
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="white_box mb_30">
                        <div class="box_header">
                            <div class="main-title">
                                <h3 class="mb-0">Profile</h3>
                            </div>
                        </div>
                        <div class="profile_box_1">
                            <div class="profile-cover-image">
                                <img src="img/back_admin.jpg" alt="Profile Cover">
                            </div>
                            <div class="profile-picture">
                                <img src="img/admin.jpg" alt="Profile Picture">
                            </div>
                            <div class="profile-content">
                                <h1><%= a.getAdmin_name() %></h1>
                                <p><%= a.getAdmin_email() %></p>
                                <div class="socials">
                                    <a href="#"><i class="fab fa-instagram"></i></a>
                                    <a href="#"><i class="fab fa-github"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer_part">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="footer_iner text-center">
                            <p>2020 &copy; Influence - Designed by <a href="#"><i class="ti-heart"></i></a> <a href="#">Dashboard</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="CHAT_MESSAGE_POPUPBOX">
            <div class="CHAT_POPUP_HEADER">
                <div class="MSEESAGE_CHATBOX_CLOSE">
                    <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M7.09939 5.98831L11.772 10.661C12.076 10.965 12.076 11.4564 11.772 11.7603C11.468 12.0643 10.9766 12.0643 10.6726 11.7603L5.99994 7.08762L1.32737 11.7603C1.02329 12.0643 0.532002 12.0643 0.228062 11.7603C-0.0760207 11.4564 -0.0760207 10.965 0.228062 10.661L4.90063 5.98831L0.228062 1.3156C-0.0760207 1.01166 -0.0760207 0.520226 0.228062 0.216286C0.379534 0.0646715 0.578697 -0.0114918 0.777717 -0.0114918C0.976738 -0.0114918 1.17576 0.0646715 1.32737 0.216286L5.99994 4.889L10.6726 0.216286C10.8243 0.0646715 11.0233 -0.0114918 11.2223 -0.0114918C11.4213 -0.0114918 11.6203 0.0646715 11.772 0.216286C12.076 0.520226 12.076 1.01166 11.772 1.3156L7.09939 5.98831Z" fill="white" />
                    </svg>
                </div>
                <h3>Chat with us</h3>
                <div class="Chat_Listed_member">
                    <ul>
                        <li><a href="#"><div class="member_thumb"><img src="img/staf/1.png" alt="Member 1"></div></a></li>
                        <li><a href="#"><div class="member_thumb"><img src="img/staf/2.png" alt="Member 2"></div></a></li>
                        <li><a href="#"><div class="member_thumb"><img src="img/staf/3.png" alt="Member 3"></div></a></li>
                        <li><a href="#"><div class="member_thumb"><img src="img/staf/4.png" alt="Member 4"></div></a></li>
                        <li><a href="#"><div class="member_thumb"><img src="img/staf/5.png" alt="Member 5"></div></a></li>
                        <li><a href="#"><div class="member_thumb"><div class="more_member_count"><span>90+</span></div></div></a></li>
                    </ul>
                </div>
            </div>
            <div class="CHAT_POPUP_BODY">
                <p class="mesaged_send_date">Sunday, 12 January</p>
                <div class="CHATING_SENDER">
                    <div class="SMS_thumb"><img src="img/staf/1.png" alt="Sender"></div>
                    <div class="SEND_SMS_VIEW"><p>Hi! Welcome. How can I help you?</p></div>
                </div>
                <div class="CHATING_SENDER CHATING_RECEIVER">
                    <div class="SEND_SMS_VIEW"><p>Hello</p></div>
                    <div class="SMS_thumb"><img src="img/staf/1.png" alt="Receiver"></div>
                </div>
            </div>
            <div class="CHAT_POPUP_BOTTOM">
                <div class="chat_input_box d-flex align-items-center">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Write your message" aria-label="Recipient's username" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn" type="button">
                                <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M18.7821 3.21895C14.4908 -1.07281 7.50882 -1.07281 3.2183 3.21792C-1.07304 7.50864 -1.07263 14.4908 3.21872 18.7824C7.50882 23.0729 14.4908 23.0729 18.7817 18.7815C23.0726 14.4908 23.0724 7.50906 18.7821 3.21895ZM17.5813 17.5815C13.9525 21.2103 8.0474 21.2103 4.41891 17.5815C0.789725 13.9525 0.789725 8.04728 4.41891 4.4183C8.04779 0.789934 13.9527 0.789934 17.5813 4.4183C21.2105 8.04728 21.2105 13.9525 17.5813 17.5815Z" fill="#001"/>
                                    <path d="M15.857 11.7088H12.2766V8.1283C12.2766 7.6935 11.918 7.33484 11.4829 7.33484C11.048 7.33484 10.6893 7.6935 10.6893 8.1283V11.7088H7.10891C6.67409 11.7088 6.31543 12.0674 6.31543 12.5025C6.31543 12.9373 6.67409 13.296 7.10891 13.296H10.6893V16.8765C10.6893 17.3113 11.048 17.67 11.4829 17.67C11.918 17.67 12.2766 17.3113 12.2766 16.8765V13.296H15.857C16.2918 13.296 16.6505 12.9373 16.6505 12.5025C16.6505 12.0674 16.2918 11.7088 15.857 11.7088Z" fill="#001"/>
                                </svg>
                            </button>
                        </div>
                    </div>
                    <div class="fileUpload">
                        <a href="#"><i class="fa fa-paperclip"></i></a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Scroll to top -->
        <div id="back-top"><a title="Go to Top" href="#"><i class="ti-angle-up"></i></a></div>

        <!-- JS scripts -->
        <script src="js/jquery1-3.4.1.min.js"></script>
        <script src="js/popper1.min.js"></script>
        <script src="js/bootstrap1.min.js"></script>
        <script src="js/metisMenu.js"></script>
        <script src="vendors/count_up/jquery.waypoints.min.js"></script>
        <script src="vendors/chartlist/Chart.min.js"></script>
        <script src="vendors/count_up/jquery.counterup.min.js"></script>
        <script src="vendors/niceselect/js/jquery.nice-select.min.js"></script>
        <script src="vendors/owl_carousel/js/owl.carousel.min.js"></script>
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
        <script src="vendors/am_chart/amcharts.js"></script>
        <script src="vendors/scroll/perfect-scrollbar.min.js"></script>
        <script src="vendors/scroll/scrollable-custom.js"></script>
        <script src="vendors/vectormap-home/vectormap-2.0.2.min.js"></script>
        <script src="vendors/vectormap-home/vectormap-world-mill-en.js"></script>
        <script src="vendors/apex_chart/apex-chart2.js"></script>
        <script src="vendors/apex_chart/apex_dashboard.js"></script>
        <script src="vendors/echarts/echarts.min.js"></script>
        <script src="vendors/chart_am/core.js"></script>
        <script src="vendors/chart_am/charts.js"></script>
        <script src="vendors/chart_am/animated.js"></script>
        <script src="vendors/chart_am/kelly.js"></script>
        <script src="vendors/chart_am/chart-custom.js"></script>
        <script src="js/custom.js"></script>
    </div>
</body>

</html>
