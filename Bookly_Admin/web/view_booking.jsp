<%@page import="com.entities.Books"%>
<%@page import="com.dao.Booksdao"%>
<%@page import="com.entities.User"%>
<%@page import="com.dao.Userdao"%>
<%@page import="com.dao.Bookingdao"%>
<%@page import="com.entities.Booking"%>
<%@page import="com.entities.BookingDetail"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="java.util.List"%>
<%@page errorPage="error_400.jsp" %>

<%
    Userdao userDao = new Userdao(ConnectionProvider.getConnection());
    Booksdao booksdao = new Booksdao(ConnectionProvider.getConnection());
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>View Booking</title>
        <link rel="stylesheet" href="css/bootstrap1.min.css">
        <link rel="stylesheet" href="css/style2.css">
        <link rel="stylesheet" href="vendors/font_awesome/css/all.min.css">
        <link rel="stylesheet" href="vendors/datatable/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="vendors/datatable/css/responsive.dataTables.min.css">
    </head>

    <body class="crm_body_bg">
        <%@include file="header.jsp" %>

        <div class="main_content_iner">
            <div class="container-fluid p-0">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="dashboard_header mb_50">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="dashboard_header_title">
                                        <h3>View Booking</h3>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="dashboard_breadcam text-end">
                                        <p><a href="index.jsp">Dashboard</a> <i class="fas fa-caret-right"></i> View Booking</p>
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
                                            <th>Booking ID</th>
                                            <th>User ID</th>
                                            <th>Book Names (Booking Detail)</th>
                                            <th>Shipping Address</th>
                                            <th>Total Amount</th>
                                            <th>Booking Date</th>
                                            <th>Booking Type</th>
                                            <th>Booking Status</th>
                                            <th>Deliver Status</th>             
                                            <th>Admin confirm</th>                                                        
                                          
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <%                                        int pageid = 1;
                                            int total = 5; // Records per page
                                            if (request.getParameter("page") != null) {
                                                pageid = Integer.parseInt(request.getParameter("page"));
                                            }
                                            int start = (pageid - 1) * total;

                                            Bookingdao bookingDao = new Bookingdao(ConnectionProvider.getConnection());
                                            List<Booking> bookingList = bookingDao.getBookingsByPage(start, total);

                                            for (Booking booking : bookingList) {
                                                User user = userDao.getUserById(booking.getUserId());
                                                if (booking.isBookingStatus()) {
                                                    List<BookingDetail> bookingDetails = bookingDao.getBookingDetailsByBookingId(booking.getBookingId());
                                        %>
                                        <tr>
                                            <td><%= booking.getBookingId()%></td>
                                            <td><%= user != null ? user.getUName() : "Unknown User"%></td>
                                            <td>
                                                <%
                                                    for (BookingDetail detail : bookingDetails) {
                                                        Books book = booksdao.getCategoryById(detail.getBook_id());
                                                        String bookName = book != null ? book.getBookName() : "Unknown Book";
                                                %>
                                                <%= bookName%><br>
                                                <% }%>
                                            </td>
                                            <td><%= booking.getShipping_address()%></td>
                                            <td><%= booking.getTotal_amount()%></td>
                                            <td><%= booking.getBookingDate()%></td>
                                            <td><%= booking.getBookingType()%></td>
                                            <td><%= booking.isBookingStatus() ? "Completed" : "Pending"%></td>
                                            <td><%= booking.isDeliverStatus() ? "Delivered" : "Pending" %></td>
                                           <td><a href="BookingServlet?action=confirmDelivery&bid=<%= booking.getBookingId() %>" class="status_btn1">Confirm Delivery</a></td>
                                             </tr>
                                        <%
                                                }
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                                    
                            <!-- Pagination -->
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                    <li class="page-item <%= pageid == 1 ? "disabled" : ""%>">
                                        <a class="page-link" href="view_booking.jsp?page=<%= pageid - 1%>">Previous</a>
                                    </li>
                                    <%
                                        int numberOfRecords = bookingDao.getTotalBookings(); // This should return the total number of bookings
                                        int numberOfPages = (int) Math.ceil(numberOfRecords / (double) total);
                                        for (int i = 1; i <= numberOfPages; i++) {
                                    %>
                                    <li class="page-item <%= pageid == i ? "active" : ""%>">
                                        <a class="page-link" href="view_booking.jsp?page=<%= i%>"><%= i%></a>
                                    </li>
                                    <%
                                        }
                                    %>
                                    <li class="page-item <%= pageid == numberOfPages ? "disabled" : ""%>">
                                        <a class="page-link" href="view_booking.jsp?page=<%= pageid + 1%>">Next</a>
                                    </li>
                                </ul>
                            </nav> 
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="footer.jsp" %>
        <script src="js/jquery1-3.4.1.min.js"></script>
        <script src="js/bootstrap1.min.js"></script>
        <script src="js/custom.js"></script>
    </body>

</html>
