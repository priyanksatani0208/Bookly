<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.entities.Admin"%>
<%@page import="java.sql.*" %>
<%
    Admin b = (Admin)session.getAttribute("currentAdmin");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="sidebar">
                <div class="logo d-flex justify-content-between">
                    <a href="index">                      
                         <h3>Admin Panel</h3>
                    </a>
                      <div class="sidebar_close_icon d-lg-none">
                        <i class="ti-close"></i>
                      </div>
                </div>

                <ul id="sidebar_menu">
                        <li class="mm-active">
                            <a class="" href="index" aria-expanded="false">
                                <img src="img/menu-icon/dashboard.svg" alt>
                                    <span>Dashboard</span>
                            </a>
                        </li>

                        <li class="">
                            <a href="categories" aria-expanded="false">
                                <img src="img/menu-icon/categories.svg" alt>
                                    <span>CateGories</span>
                            </a>
                        </li>
                        
                        <li class="">
                            <a href="books" aria-expanded="false">
                                <img src="img/menu-icon/book.svg" alt>
                                    <span>Books</span>
                            </a>
                        </li>
                                                                       
                        <li class="">
                            <a href="customer_Manage.jsp" aria-expanded="false">
                                <img src="img/menu-icon/customer.svg" alt>
                                    <span>Customer Manage</span>
                            </a>
                        </li>
                        
                        <li class="">
                            <a href="contact_Manage.jsp" aria-expanded="false">
                                <img src="img/menu-icon/contact.svg" alt>
                                    <span>Contact Manage</span>
                            </a>
                        </li>
                        
                        <li class="">
                            <a href="manage_Feedback.jsp" aria-expanded="false">
                                <img src="img/menu-icon/feedback.svg" alt>
                                    <span>Feedback Manage</span>
                            </a>
                        </li>
                        
                         <li class="">
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
            <div class="col-lg-12 p-0 ">
                <div class="header_iner d-flex justify-content-between align-items-center">
                    <div class="sidebar_icon d-lg-none">
                        <i class="ti-menu"></i>
                    </div>

                    <div class="serach_field-area">
                        <div class="search_inner">

                            <form action="#">
                                <div class="search_field">
                                    <!--<input type="text" placeholder="Search here...">-->
                                </div>
                                <!--<button type="submit"> <img src="img/icon/icon_search.svg" alt> </button>-->
                            </form>
                        </div>
                    </div>
                    
                    <div class="header_right d-flex justify-content-between align-items-center">
                        <div class="profile_info">
                            <img src="img/admin.jpg" alt="#">

                            <div class="profile_info_iner">
                                <div class="profile_author_name">
                                   
                                </div>

                                <div class="profile_info_details">
                                    <a href="profile">My Profile </a>
                                    <a href="LogoutServlet">Log Out </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
  </body>
</html>
