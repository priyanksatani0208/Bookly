<%@page import="com.helper.ConnectionProvider"%>
<%@page import="java.io.*"%>
<%@page import="com.dao.Bookingdao"%>
<%@page import="com.dao.BookingDetaildao"%>
<%@page import="com.dao.Booksdao"%>
<%@page import="com.entities.Booking"%>
<%@page import="com.entities.BookingDetail"%>
<%@page import="com.entities.Books"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itextpdf.text.*"%>
<%@page import="com.itextpdf.text.pdf.*"%>

<%
    // Get the booking ID from the request
    String bookingIdParam = request.getParameter("bookingId");
    int bookingId = Integer.parseInt(bookingIdParam);

    // Create DAO objects
    Bookingdao bookingDao = new Bookingdao(ConnectionProvider.getConnection());
    BookingDetaildao bookingDetailDao = new BookingDetaildao(ConnectionProvider.getConnection());
    Booksdao booksdao = new Booksdao(ConnectionProvider.getConnection());

    // Fetch the booking details
    Booking booking = bookingDao.getBookingById(bookingId);
    List<BookingDetail> bookingDetails = bookingDetailDao.getBookingDetailsByBookingId(bookingId);

    // Create a PDF document
    Document document = new Document();
    response.setContentType("application/pdf");
    response.setHeader("Content-Disposition", "attachment; filename=invoice_" + bookingId + ".pdf");

    try {
        PdfWriter.getInstance(document, response.getOutputStream());
        document.open();

        // Add content to the PDF
        document.add(new Paragraph("Invoice"));
        document.add(new Paragraph("Booking ID: " + booking.getBookingId()));
        document.add(new Paragraph("Booking Date: " + new SimpleDateFormat("dd/MM/yyyy").format(booking.getBookingDate())));
        document.add(new Paragraph("Total Amount: ?" + booking.getTotal_amount()));
        document.add(new Paragraph("Booking Status: " + (booking.isBookingStatus() ? "Confirmed" : "Pending")));
        document.add(new Paragraph("Delivery Status: " + (booking.isDeliverStatus() ? "Delivered" : "On the Way")));

        // Add book details
        document.add(new Paragraph("Book Details:"));
        PdfPTable table = new PdfPTable(4); // 4 columns
        table.addCell("Book Name");
        table.addCell("Book Price");
        table.addCell("Quantity");
        table.addCell("Total Price");

//        for (BookingDetail detail : bookingDetails) {
//            Books book = booksdao.getBookById(detail.getBook_id());
//            table.addCell(book.getBookName());
//            table.addCell("?" + book.getBookPrice());
//            table.addCell(String.valueOf(detail.getQuantity()));
//            table.addCell("?" + detail.getTotalPrice());
//        }

        document.add(table);
        document.close();

    } catch (DocumentException e) {
        e.printStackTrace();
    }
%>
