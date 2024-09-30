<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.sun.jdi.connect.spi.Connection"%>
<%@page import="com.dao.Categorydao"%>
<%@page import="com.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bookly</title>
        <style>

            /* Ensure the logo container doesn't have padding/margin pushing it down */
            .navbar-header {
                padding: 0;
                margin: 0;
            }

            /* Target the image directly */
            #Logo {
                display: block;
                margin: -65px auto;
                position: relative;
                top: -5px; /* Adjust this value to move the image upwards */
            }

            
          
        /* Align the navbar-collapse to the right */
        .navbar-collapse {
            float: right; /* Aligns the navigation menu to the right */
        }

        /* Optional: Adjust margin/padding for better alignment */
        .navbar-nav {
            margin-right: 0;
            padding-right: 0;
        }

        .navbar-nav > li {
            margin-left: -5px; /* Add space between menu items if needed */
        }
        </style>
    </head>
    <body>
        <!-- Start: Header Section -->
        <header id="header-v1" class="navbar-wrapper">
            <div class="container">
                <div class="row">
                    <nav class="navbar navbar-default">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="navbar-header">
                                    <div class="navbar-brand">

                                        <a href="index.jsp">
                                            <img src="images/Bookly Logo.png" alt="LIBRARIA"  id="Logo"/>
                                        </a>

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-9">
                                
                                <!-- Header Topbar -->
                                <div class="header-topbar hidden-sm hidden-xs">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="topbar-info">
                                                <a href="tel:+61-3-8376-6284">&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-phone"></i>+91-75730 - 95864</a>
                                                <span>/</span>
                                                <a href="mailto:support@libraria.com"><i class="fa fa-envelope"></i>support@bookly.com</a>
                                            </div>
                                        </div>
                                        <%
                                            User u = (User) session.getAttribute("currentUser");

                                            if (u == null) {
                                        %>
                                        <div class="col-sm-6">
                                            <div class="topbar-links">
                                                <a href="sign-in.jsp"><i class="fa fa-lock"></i>Login / Register</a>
                                               
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%
                                } else {
                                %>
                                <div class="col-sm-6">
                                    <div class="topbar-links">
                                        <a href="profile.jsp"><i class="fa fa-user"></i>Profile</a>&nbsp;&nbsp;
                                        <a href="LogoutServlet"><i class="fa fa-sign-out"></i>Logout</a>
                                        
                                        
                                      
                                        <span>|</span>
                                        <div class="header-cart dropdown">
                                            <a  href="cart_booking.jsp"><i class="fa fa-shopping-cart"></i></a>                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                        <div class="navbar-collapse hidden-sm hidden-xs">
                            <ul class="nav navbar-nav">
                                <li class="dropdown active">
                                    <a data-toggle="dropdown" class="dropdown-toggle disabled" href="index.jsp">Home</a>
                                </li>
                                <li class="dropdown">
                                    <a data-toggle="dropdown" class="dropdown-toggle disabled" href="books-media-gird-view-v2.jsp">Books</a>
                                   
                                </li>
                                <li class="dropdown">
                                    <a data-toggle="dropdown" class="dropdown-toggle disabled" href="news-events-list-view.jsp">Events</a>
                                    
                                </li>
                                <li class="dropdown">
                                    <a data-toggle="dropdown" class="dropdown-toggle disabled" href="blog.jsp">Blog</a>
                                    
                                </li>
                                <li><a href="services.jsp">Services</a></li>
                                <li><a href="contact.jsp">Contact</a></li>
                                <li><a href="#">View Order</a></li>
                            </ul>
                        </div>
                </div>
            </div>
        </nav>
    </div>
</div>
</header>
<!-- End: Header Section -->
</body>
</html>
