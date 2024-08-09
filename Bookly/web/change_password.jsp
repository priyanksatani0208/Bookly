<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.entities.User" %>
<%
   User user = (User)session.getAttribute("currentUser");
%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <!-- Meta -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1">
    
    <!-- Title -->
    <title>Bookly</title>
    
    <!-- Favicon -->
    <link href="images/favicon.ico" rel="icon" type="image/x-icon" />
    
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i%7CLato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    
    <!-- Mobile Menu -->
    <link href="css/mmenu.css" rel="stylesheet" type="text/css" />
    <link href="css/mmenu.positioning.css" rel="stylesheet" type="text/css" />
    
    <!-- Stylesheet -->
    <link href="style.css" rel="stylesheet" type="text/css" />
    <link href="css/change_password.css" rel="stylesheet" type="text/css" />
    
</head>

<body>
    <!-- Start: Header Section -->
    <%@include file="header.jsp" %>
    <!-- End: Header Section -->
    
    <!-- Start: Page Banner -->
    <section class="page-banner services-banner">
        <div class="container">
            <div class="banner-header">
                <h2>Change Password</h2>
                <span class="underline center"></span>
            </div>
            <div class="breadcrumb">
                <ul>
                    <li><a href="index-2.html">Home</a></li>
                    <li>Change Password</li>
                </ul>
            </div>
        </div>
    </section>
    <!-- End: Page Banner -->
    
    <!-- Start: Change Password Section -->
    <div class="profile-main">
        <div class="profile-container">
            <form class="form-container" action="ChangePasswordServlet" method="post">
                <h2 id="heading">Change Password</h2>
                <div class="form-group">
                    <label for="currentPassword">Current Password</label>
                    <input type="password" id="currentPassword" name="currentPassword" required>
                </div>
                <div class="form-group">
                    <label for="newPassword">New Password</label>
                    <input type="password" id="newPassword" name="newPassword" required>
                </div>
                <div class="form-group">
                    <label for="confirmNewPassword">Confirm New Password</label>
                    <input type="password" id="confirmNewPassword" name="confirmNewPassword" required>
                </div>
                
                <div class="form-group">
                    <button type="submit">SAVE</button>
                    <button type="button" class="cancel" onclick="location.href='profile.jsp'">CANCEL</button>
                </div>
                
            </form>
        </div>
    </div>
    <!-- End: Change Password Section -->
    
    <!-- Start: Social Network -->
        <%@include file="followUs.jsp" %>
    <!-- End: Social Network -->
    
    <!-- Start: Footer -->
    <%@include file="footer.jsp" %>
    <!-- End: Footer -->
    
    <!-- jQuery Latest Version 1.x -->
    <script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
    
    <!-- jQuery UI -->
    <script type="text/javascript" src="js/jquery-ui.min.js"></script>
    
    <!-- jQuery Easing -->
    <script type="text/javascript" src="js/jquery.easing.1.3.js"></script>

    <!-- Bootstrap -->
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    
    <!-- Mobile Menu -->
    <script type="text/javascript" src="js/mmenu.min.js"></script>
    
    <!-- Harvey - State manager for media queries -->
    <script type="text/javascript" src="js/harvey.min.js"></script>
    
    <!-- Waypoints - Load Elements on View -->
    <script type="text/javascript" src="js/waypoints.min.js"></script>

    <!-- Facts Counter -->
    <script type="text/javascript" src="js/facts.counter.min.js"></script>

    <!-- MixItUp - Category Filter -->
    <script type="text/javascript" src="js/mixitup.min.js"></script>

    <!-- Owl Carousel -->
    <script type="text/javascript" src="js/owl.carousel.min.js"></script>
    
    <!-- Accordion -->
    <script type="text/javascript" src="js/accordion.min.js"></script>
    
    <!-- Responsive Tabs -->
    <script type="text/javascript" src="js/responsive.tabs.min.js"></script>
    
    <!-- Responsive Table -->
    <script type="text/javascript" src="js/responsive.table.min.js"></script>
    
    <!-- Masonry -->
    <script type="text/javascript" src="js/masonry.min.js"></script>
    
    <!-- Carousel Swipe -->
    <script type="text/javascript" src="js/carousel.swipe.min.js"></script>
    
    <!-- bxSlider -->
    <script type="text/javascript" src="js/bxslider.min.js"></script>
    
    <!-- Custom Scripts -->
    <script type="text/javascript" src="js/main.js"></script>
</body>
</html>
