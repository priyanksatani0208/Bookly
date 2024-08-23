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
    <link href="css/profile_css.css" rel="stylesheet" type="text/css" />
    
    <style>
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
        .button-container button {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px;
        }
        .button-container button.cancel {
            background-color: #f44336; /* Red */
        }
    </style>
</head>

<body>
    <!-- Start: Header Section -->
        <%@include file="header.jsp" %>
    <!-- End: Header Section -->
    
    <!-- Start: Page Banner -->
    <section class="page-banner services-banner">
        <div class="container">
            <div class="banner-header">
                <h2>Profile</h2>
                <span class="underline center"></span>
            </div>
            <div class="breadcrumb">
                <ul>
                    <li><a href="index-2.html">Home</a></li>
                    <li>Profile</li>
                </ul>
            </div>
        </div>
    </section>
    <!-- End: Page Banner -->
    
   <!-- Start: Profile Section -->
    <div class="profile-main">
        <div class="profile-container">
            <h2 id="heading">User Profile</h2>
            <div class="profile-row">
                <img src="user_image/<%= user.getuProfile() %>" alt="Profile Image" />
            </div>
             <div class="form-group">
                 <center> <a href="change_password.jsp"><h5><u>Change Password</u></h5></a></center>
            </div>
            <div class="profile-row">
                <label for="uName">Full Name</label>
                <div class="profile-value"><%= user.getUName() %></div>
            </div>
            <div class="profile-row">
                <label for="uemail">Email</label>
                <div class="profile-value"><%= user.getUemail() %></div>
            </div>
            <div class="profile-row">
                <label for="uPhone">Phone</label>
                <div class="profile-value"><%= user.getuPhone() %></div>
            </div>
            <div class="profile-row">
                <label for="ugender">Gender</label>
                <div class="profile-value"><%= user.getUgender() %></div>
            </div>
            <div class="profile-row">
                <label for="uAddress">Address</label>
                <div class="profile-value"><%= user.getuAddress() %></div>
            </div>
            <div class="profile-row">
                <label for="uabout">About</label>
                <div class="profile-value"><%= user.getUabout() %></div>
            </div>
            <!-- Button Container -->
            <div class="button-container">
                <button onclick="location.href='editProfile.jsp'">EDIT</button>
            </div>
        </div>
    </div>
    <!-- End: Profile Section -->
    
    <br><br><br><br><br><br><br><br><br><br>
    
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
