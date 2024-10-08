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
    <title>View Customer</title>
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
                                    <h3>View Customer</h3>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="dashboard_breadcam text-end">
                                    <p><a href="index.jsp">Dashboard</a> <i class="fas fa-caret-right"></i>View Customer</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12">
                    <div class="QA_section">
                        <div class="white_box_tittle list_header">
                            <div class="box_right d-flex lms_block">
                                <input type="text" id="searchInput" placeholder="Search by Name or Email" class="form-control">
                            </div>
                        </div>

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
                                        int pageid = 1;
                                        int total = 5; // Records per page
                                        if (request.getParameter("page") != null) {
                                            pageid = Integer.parseInt(request.getParameter("page"));
                                        }
                                        int start = (pageid - 1) * total;

                                        Userdao userDao = new Userdao(ConnectionProvider.getConnection());
                                        List<User> userList = userDao.getUsersByPage(start, total);
                                        for (User u : userList) {
                                    %>
                                    <tr>
                                        <td><%= u.getuId()%></td>
                                        <td><%= u.getUName()%></td>
                                        <td><%= u.getUemail()%></td>
                                        <td><%= u.getuPhone()%></td>
                                        <td><%= u.getUgender()%></td>
                                        <td><%= u.getuAddress()%></td>
                                        <td><%= u.getUabout()%></td>
                                        <td><img src="http://localhost:8080/Bookly/user_image/<%= u.getuProfile()%>" alt="Profile" width="50"></td>
                                        <td><a href="UserServlet?action=delete&uid=<%= u.getuId()%>" class="status_btn1">Delete</a></td> 
                                    </tr>          
                                    <%
                                        }
                                    %>
                                </tbody>                                    
                            </table>
                        </div>
                                
                         <!-- Pagination -->
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <li class="page-item <%= pageid == 1 ? "disabled" : "" %>">
                            <a class="page-link" href="view_customer.jsp?page=<%= pageid - 1 %>">Previous</a>
                        </li>
                        <%
                            int numberOfRecords = userDao.getTotalUser(); // This should return the total number of customers
                            int numberOfPages = (int) Math.ceil(numberOfRecords / (double) total);
                            for (int i = 1; i <= numberOfPages; i++) {
                        %>
                        <li class="page-item <%= pageid == i ? "active" : "" %>">
                            <a class="page-link" href="view_customer.jsp?page=<%= i %>"><%= i %></a>
                        </li>
                        <%
                            }
                        %>
                        <li class="page-item <%= pageid == numberOfPages ? "disabled" : "" %>">
                            <a class="page-link" href="view_customer.jsp?page=<%= pageid + 1 %>">Next</a>
                        </li>
                    </ul>
                </nav>
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

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var searchInput = document.getElementById('searchInput');
            var table = document.querySelector('.QA_table table tbody');
            var rows = table.querySelectorAll('tr');

            searchInput.addEventListener('keyup', function () {
                var filter = searchInput.value.toLowerCase();

                rows.forEach(function (row) {
                    var name = row.querySelector('td:nth-child(2)').textContent.toLowerCase();
                    var email = row.querySelector('td:nth-child(3)').textContent.toLowerCase();

                    if (name.includes(filter) || email.includes(filter)) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';
                    }
                });
            });
        });
    </script>

</body>

</html>
