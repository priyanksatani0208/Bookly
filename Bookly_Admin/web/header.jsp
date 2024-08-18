<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.entities.Admin"%>
<%@page import="java.sql.*" %>
<%
    Admin b = (Admin) session.getAttribute("currentAdmin");
    String currentPage = request.getRequestURI(); // Get the current page URI
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/clock.css" />
        
        
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="sidebar">
            <!--<div class="logo d-flex justify-content-between">-->
            
            <br><center><h3>Admin Panel</h3></center><hr><br>
              
<!--                <div class="sidebar_close_icon d-lg-none">
                    <i class="ti-close"></i>
                </div>-->
            <!--</div>-->

            <ul id="sidebar_menu">
                <li class="<%= currentPage.contains("index") ? "mm-active" : ""%>">
                    <a class="" href="index" aria-expanded="false">
                        <img src="img/menu-icon/dashboard.svg" alt>
                        <span>Dashboard</span>
                    </a>
                </li>

                <li class="<%= currentPage.contains("categories") ? "mm-active" : ""%>">
                    <a href="categories" aria-expanded="false">
                        <img src="img/menu-icon/categories.svg" alt>
                        <span>CateGories</span>
                    </a>
                </li> 

                <li class="<%= currentPage.contains("books") ? "mm-active" : ""%>">
                    <a href="books" aria-expanded="false">
                        <img src="img/menu-icon/book.svg" alt>
                        <span>Books</span>
                    </a>
                </li>

                <li class="<%= currentPage.contains("view_customer.jsp") ? "mm-active" : ""%>">
                    <a href="view_customer.jsp" aria-expanded="false">
                        <img src="img/menu-icon/customer.svg" alt>
                        <span>View Customer</span>
                    </a>
                </li>
                
                 <li class="<%= currentPage.contains("#") ? "mm-active" : ""%>">
                    <a href="#" aria-expanded="false">
                        <img src="img/menu-icon/booking.svg" alt>
                        <span>View Booking</span>
                    </a>
                </li>

                <li class="<%= currentPage.contains("view_contact.jsp") ? "mm-active" : ""%>">
                    <a href="view_contact.jsp" aria-expanded="false">
                        <img src="img/menu-icon/contact.svg" alt>
                        <span>View Contact</span>
                    </a>
                </li>

                <li class="<%= currentPage.contains("view_Feedback.jsp") ? "mm-active" : ""%>">
                    <a href="view_Feedback.jsp" aria-expanded="false">
                        <img src="img/menu-icon/feedback.svg" alt>
                        <span>View Feedback</span>
                    </a>
                </li>
               

                <li class="<%= currentPage.contains("change_password.jsp") ? "mm-active" : ""%>">
                    <a href="change_password.jsp" aria-expanded="false">
                        <img src="img/menu-icon/change-password.svg" alt>
                        <span>Change Password</span>
                    </a>
                </li>

                <li>
                    <a href="LogoutServlet" aria-expanded="false">
                        <img src="img/menu-icon/logout.svg" alt>
                        <span>Logout</span>
                    </a>
                </li>
            </ul>
        </nav>


        <section class="main_content dashboard_part">
            <div class="container-fluid g-0">
                <div class="row">
                    <div class="col-lg-12 p-0">
                        <div class="header_iner d-flex justify-content-between align-items-center">
                            <div class="sidebar_icon d-lg-none">
                                <i class="ti-menu"></i>
                            </div>

                            <div class="serach_field-area">
<!--                                <div class="search_inner">
                                    blank

                                </div>-->
                                
                            </div>


                            <div class="header_right d-flex justify-content-between align-items-center">
                                <div class="profile_info">                                            
                                    <!-- Digital Clock -->
                                    <div id="MyClockDisplay" class="clock"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>





</body>
<script>
    function showTime() {
        var date = new Date();
        var h = date.getHours();
        var m = date.getMinutes();
        var s = date.getSeconds();
        var session = "AM";

        if (h == 0) {
            h = 12;
        }
        if (h > 12) {
            h = h - 12;
            session = "PM";
        }

        h = (h < 10) ? "0" + h : h;
        m = (m < 10) ? "0" + m : m;
        s = (s < 10) ? "0" + s : s;

        var time = h + ":" + m + ":" + s + " " + session;
        document.getElementById("MyClockDisplay").innerText = time;
        document.getElementById("MyClockDisplay").textContent = time;

        setTimeout(showTime, 1000);
    }

    showTime();

</script>
</html>
