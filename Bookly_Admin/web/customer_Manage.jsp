<%@page import="com.dao.Userdao"%>
<%@page import="com.entities.User"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="java.util.List"%>
<%@page errorPage="error_400.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>User Management</title>
    <link rel="stylesheet" href="css/bootstrap1.min.css">
    <link rel="stylesheet" href="css/style2.css">
    <link rel="stylesheet" href="vendors/font_awesome/css/all.min.css">
    <link rel="stylesheet" href="vendors/datatable/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="vendors/datatable/css/responsive.dataTables.min.css">
</head>

<body class="crm_body_bg">

    <!-- Header -->
    <%@include file="header.jsp" %>
    <!-- Header End -->

    <div class="main_content_iner ">
        <div class="container-fluid p-0">
            <div class="row justify-content-center">
                <div class="col-12">
                    <div class="dashboard_header mb_50">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="dashboard_header_title">
                                    <h3>Customer Management</h3>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="dashboard_breadcam text-end">
                                    <p><a href="index.jsp">Dashboard</a> <i class="fas fa-caret-right"></i> Users</p>
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
                                        <th>User ID</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>Gender</th>
                                        <th>Address</th>
                                        <th>About</th>
                                        <th>Profile Picture</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%  
                                        Userdao userDao = new Userdao(ConnectionProvider.getConnection());
                                        List<User> userList = userDao.getAllUser();
                                        for (User u : userList) {
                                    %>
                                    <tr>
                                        <td><%= u.getuId() %></td>
                                        <td><%= u.getUName() %></td>
                                        <td><%= u.getUemail() %></td>
                                        <td><%= u.getuPhone() %></td>
                                        <td><%= u.getUgender() %></td>
                                        <td><%= u.getuAddress() %></td>
                                        <td><%= u.getUabout() %></td>
                                        <td><img src="http://localhost:8080/Bookly/user_image/<%= u.getuProfile() %>" alt="Profile" width="50"></td>
                                        <td><a href="UserServlet?action=delete&uid=<%= u.getuId()%>" class="status_btn1">Delete</a></td> 
                                    </tr>          
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <%@include file="footer.jsp" %>
    <!-- Footer End -->

    <script src="js/jquery1-3.4.1.min.js"></script>
    <script src="js/bootstrap1.min.js"></script>
    <script src="js/custom.js"></script>
</body>

</html>
