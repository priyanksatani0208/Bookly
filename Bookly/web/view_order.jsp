<%@page import="com.entities.Books"%>
<%@page import="com.dao.Booksdao"%>
<%@page import="com.entities.BookingDetail"%>
<%@page import="com.entities.Booking"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookingDetaildao"%>
<%@page import="com.dao.Bookingdao"%>
<%@page import="com.entities.User"%>
<%--<%@ page contentType="text/html;charset=UTF-8" %>--%>

<!DOCTYPE html>
<html lang="zxx">
    <head>
        <!-- Meta -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1">

        <!-- Title -->
        <title>View Orders - Bookly</title>

        <!-- Favicon -->
        <link href="images/favicon.ico" rel="icon" type="image/x-icon" />

        <!-- Fonts and Icons -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />

        <!-- Custom Stylesheets -->
        <link href="style.css" rel="stylesheet" type="text/css" />
        <link href="css/check_out_shop.css" type="text/css" rel="stylesheet" media="all">
        <link href="css/checkout.css" type="text/css" rel="stylesheet" media="all">
        <link href="css/check_out_style.css" type="text/css" rel="stylesheet" media="all">

        <!-- Google Fonts -->
        <link href="//fonts.googleapis.com/css?family=Merriweather+Sans:300,300i,400,400i,700,700i,800,800i" rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
    </head>

    <body>

        <!-- Start: Header Section -->
        <%@include file="header.jsp" %>
        <!-- End: Header Section -->

        <!-- Start: Page Banner -->
        <section class="page-banner services-banner">
            <div class="container">
                <div class="banner-header">
                    <h2>View Orders</h2>
                    <span class="underline center"></span>
                </div>
                <div class="breadcrumb">
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li>Dashboard</li>
                    </ul>
                </div>
            </div>
        </section>
        <!-- End: Page Banner -->

        <!-- Start: Order Table Section -->
        <div id="content" class="site-content">
            <div class="innerf-pages section">
                <div class="container">
                    <h2 style="text-align: center; color: black; margin: 10px -100px;">Your Orders</h2>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover">                         
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">Booking ID</th>
                                    <th scope="col">Book Name</th>
                                    <th scope="col">Book Price</th>
                                    <th scope="col">Booking Date</th>
                                    <th scope="col">Booking Status</th>
                                    <th scope="col">Delivery Status</th>
                                    <th scope="col">Total Amount</th>
                                    <th scope="col">Invoice</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%          // Assuming the same logic for fetching orders from the database
                                    User user = (User) session.getAttribute("currentUser");

                                    if (user != null) {
                                        // Create DAO objects
                                        Bookingdao bookingDao = new Bookingdao(ConnectionProvider.getConnection());
                                        BookingDetaildao bookingDetailDao = new BookingDetaildao(ConnectionProvider.getConnection());
                                        Booksdao booksdao = new Booksdao(ConnectionProvider.getConnection());

                                        // Fetch bookings for the user
                                        List<Booking> userBookings = bookingDao.getBookingsByUser(user.getuId());

                                        for (Booking booking : userBookings) {
                                            // Fetch details for each booking
                                            List<BookingDetail> bookingDetails = bookingDetailDao.getBookingDetailsByBookingId(booking.getBookingId());

                                            for (BookingDetail detail : bookingDetails) {
                                                Books book = booksdao.getBookById(detail.getBook_id());
                                %>
                                <tr>
                                    <td><%= booking.getBookingId()%></td>
                                    <td><%= book.getBookName()%></td>
                                    <td>&#8377;<%= book.getBookPrice()%></td>
                                    <%
                                        // Format booking date to "dd/MM/yyyy"
                                        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/yyyy");
                                        String formattedDate = sdf.format(booking.getBookingDate());
                                    %>
                                    <td><%= formattedDate%></td>
                                    <td><%= booking.isBookingStatus() ? "Confirmed" : "Pending"%></td>
                                    <td><%= booking.isDeliverStatus() ? "Delivered" : "On the Way"%></td>
                                    <td>&#8377;<%= booking.getTotal_amount()%></td>
                                    <td>
                                        <% if (booking.isDeliverStatus()) {%>
                                        <a href="downloadInvoice.jsp?bookingId=<%= booking.getBookingId()%>" class="btn btn-primary">Download</a>
                                        <% } else { %>
                                        After Deliver order then Generated Invoice
                                        <% } %>
                                    </td>
                                </tr>
                                <%
                                        } // End of bookingDetails loop
                                    } // End of userBookings loop
                                } else {
                                %>
                                <tr>
                                    <td colspan="8">No orders found.</td>
                                </tr>
                                <%
          } // End of user check
%>
                            </tbody>
                        </table>
                    </div>


                </div>
            </div>
        </div>
        <!-- End: Order Table Section -->

        <!-- Common Scripts -->
        <script src="js/jquery-2.2.3.min.js"></script>
        <script src="js/bootstrap.js"></script>

        <!-- Additional Plugins -->
        <script src="js/minicart.js"></script>
        <script src="js/SmoothScroll.min.js"></script>

        <!-- Start: Footer -->
        <%@include file="footer.jsp" %>
        <!-- End: Footer -->
    </body>
</html>
