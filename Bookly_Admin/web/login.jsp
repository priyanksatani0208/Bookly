<%@page errorPage="error_400.jsp" %>
<!DOCTYPE html>
<html lang="en">

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
    <link rel="stylesheet" href="css/colors/default.css" id="colorSkinCSS">

    <link rel="stylesheet" href="css/login_css.css"/>
    
</head>

<body class="crm_body_bg">
    
    

    <div class="centered-login-container">
        <div class="login-box">
           
            <div class="modal-content cs_modal">
                <div class="modal-header justify-content-center theme_bg_1">
                    <h5 class="modal-title text_white">Log in</h5>
                </div>
                <div class="modal-body">
                    <form action="LoginServlet" method="post">
                        <div class="form-group">
                            <input type="text" class="form-control" name="admin_email" placeholder="Enter your email">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" name="admin_password" placeholder="Password">
                        </div>
                        <button type="submit" class="btn btn-primary btn-login">Log in</button>
                        <p><a href="http://localhost:8080/Bookly/index.jsp">&rarr;&nbsp;  Back To User-Side</a></p>
                    </form>
                </div>
                
            </div>
        </div>
    </div>

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
