<%@page import="com.entities.User"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.entities.BookingDetail" %>
<%@page import="com.entities.Booking" %>
<%@page import="com.dao.BookingDetaildao" %>
<%@page import="com.dao.Bookingdao" %>
<%@page import="com.dao.Booksdao" %>
<%@page import="com.entities.Books" %>
<%@page import="java.util.List" %>
<%@page import="java.text.SimpleDateFormat" %>

<%
    // Set content type and disposition
    response.setContentType("text/html");
    response.setHeader("Content-Disposition", "attachment; filename=invoice.html");

    User user = (User) session.getAttribute("currentUser");
    int bookingId = Integer.parseInt(request.getParameter("bookingId"));

    // DAO initialization
    Bookingdao bookingDao = new Bookingdao(ConnectionProvider.getConnection());
    BookingDetaildao bookingDetailDao = new BookingDetaildao(ConnectionProvider.getConnection());
    Booksdao booksDao = new Booksdao(ConnectionProvider.getConnection());

    Booking booking = bookingDao.getBookingById(bookingId);
    List<BookingDetail> bookingDetails = bookingDetailDao.getBookingDetailsByBookingId(bookingId);

    // Format the booking date
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    String formattedDate = sdf.format(booking.getBookingDate());

    // Calculate total price and quantity
    double totalPrice = 0;
    int totalQuantity = 0;
    for (BookingDetail detail : bookingDetails) {
        Books book = booksDao.getBookById(detail.getBook_id());
        totalQuantity += detail.getBook_quantity();
        totalPrice += book.getBookPrice() * detail.getBook_quantity();
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bookly Invoice - Booking ID: <%= bookingId%></title>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f8f9fa;
            }
            .invoice-container {
                width: 210mm;
                max-width: 100%;
                padding: 20mm;
                margin: 20px auto;
                border: 1px solid #ddd;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            /* Header section */
            .header-section {
                display: flex;
                justify-content: space-between;
                border-bottom: 1px dashed #000;
                padding-bottom: 20px;
            }
            .company-info h1 {
                font-size: 2.5em;
                margin: 0;
            }
            .company-info p {
                margin: 5px 0;
                font-size: 1.2em;
            }
            .invoice-info {
                text-align: right;
                font-size: 1.2em;
            }
            .invoice-info p {
                margin: 5px 0;
            }
            /* Customer and Sender details */
            .details-section {
                display: flex;
                justify-content: space-between;
                margin-top: 20px;
                margin-bottom: 30px;
            }
            .details-section .sender-info {
                font-size: 1.1em;
            }
            .details-section .customer-info {
                text-align: right;
                font-size: 1.1em;
            }
            /* Order Summary */
            .order-summary {
                margin-top: 30px;
            }
            .order-summary table {
                width: 100%;
                border-collapse: collapse;
            }
            .order-summary th, .order-summary td {
                padding: 12px;
                border: 1px solid #ddd;
            }
            .order-summary th {
                background-color: #f4f4f4;
            }
            /* Total Section */
            .total-section {
                text-align: right;
                margin-top: 20px;
                font-size: 1.3em;
            }
            .footer {
                text-align: center;
                margin-top: 50px;
                font-size: 0.9em;
                color: #777;
            }
        </style>
    </head>
    <body>

        <div class="invoice-container">
            <!-- Company Info and Invoice Info -->
            <div class="header-section">
                <div class="company-info">
                    <h1>Bookly</h1>
                    <p>123 Book Street, Knowledge City</p>
                    <p>Email: support@bookly.com</p>
                </div>
                <div class="invoice-info">
                    <p><strong>Booking ID:</strong> <%= bookingId%></p>
                    <p><strong>Date:</strong> <%= formattedDate%></p>
                </div>
            </div>

            <!-- Sender and Customer Details -->
            <div class="details-section">
                <div class="sender-info">
                    <p><strong>Sender:</strong> Bookly</p>
                </div>
                <div class="customer-info">
                    <p><strong>Customer Name:</strong> <%= user.getUName()%></p>
                    <p><strong>Email:</strong> <%= user.getUemail()%></p>
                    <p><strong>Phone:</strong> <%= user.getuPhone()%></p>
                    <p><strong>Address:</strong> <%= user.getuAddress()%></p>
                </div>
            </div>

            <!-- Order Summary -->
            <div class="order-summary">
                <h3>Order Summary</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Book Name</th>
                            <th>Quantity</th>
                            <th>Price per Book (&#8377;)</th>
                            <th>Total Price (&#8377;)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (BookingDetail detail : bookingDetails) {
                                Books book = booksDao.getBookById(detail.getBook_id());
                        %>
                        <tr>
                            <td><%= book.getBookName()%></td>
                            <td><%= detail.getBook_quantity()%></td>
                            <td>&#8377;<%= book.getBookPrice()%></td>
                            <td>&#8377;<%= book.getBookPrice() * detail.getBook_quantity()%></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>

            <!-- Total -->
            <div class="total-section">
                <p><strong>Total Quantity:</strong> <%= totalQuantity%></p>
                <p><strong>Total Price:</strong> &#8377;<%= totalPrice%></p>
            </div>

            <!-- Footer -->
            <div class="footer">
                <p>Thank you for shopping with Bookly!</p>
            </div>
        </div>

    </body>
</html>
