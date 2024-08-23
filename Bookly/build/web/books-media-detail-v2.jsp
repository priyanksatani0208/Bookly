<%@page import="java.util.List"%>
<%@page import="com.entities.Books"%>
<%@page import="com.dao.Booksdao"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="java.sql.SQLException"%>
<%
    // Get the book ID from the request
    String bookIdParam = request.getParameter("bookId");
    Books book = null;

    if (bookIdParam != null && !bookIdParam.isEmpty()) {
        int bookId = Integer.parseInt(bookIdParam);
        Booksdao booksDao = new Booksdao(ConnectionProvider.getConnection());
        
        try {
            book = booksDao.getCategoryById(bookId);
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception
            response.sendRedirect("error.jsp"); // Redirect to an error page if something goes wrong
        }
    } else {
        response.sendRedirect("error.jsp"); // Redirect to an error page if the bookId is missing
    }
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

        <!-- Responsive Table -->
        <link rel="stylesheet" type="text/css" href="css/responsivetable.css" />

        <!-- Stylesheet -->
        <link href="style.css" rel="stylesheet" type="text/css" />

      

    </head>

    <body>

        <!-- Start: Header Section -->
            <%@include file="header.jsp" %>
        <!-- End: Header Section -->

        <!-- Start: Page Banner -->
        <section class="page-banner services-banner">
            <div class="container">
                <div class="banner-header">
                    <h2>Our Books</h2>
                    <span class="underline center"></span>
                    <p class="lead">Proin ac eros pellentesque dolor pharetra tempo.</p>
                </div>
                <div class="breadcrumb">
                    <ul>
                        <li><a href="index-2.html">Home</a></li>
                        <li>Our Books</li>
                    </ul>
                </div>
            </div>
        </section>
        <!-- End: Page Banner -->

        <!-- Start: Products Section -->
        <div id="content" class="site-content">
            <div id="primary" class="content-area">
                <main id="main" class="site-main">
                    <div class="booksmedia-detail-main">
                        <div class="container">
                            <div class="row">
                                <br><br><center><h2 style="color: black;">Our Books</h2></center><br><br>
                            </div>
                           <% if (book != null) { %>
                            <div class="booksmedia-detail-box">
                                <div class="detailed-box">
                                    <div class="col-xs-12 col-sm-5 col-md-3">
                                        <div class="post-thumbnail">
                                            <div class="book-list-icon blue-icon"></div>
                                            <img src="http://localhost:8080/Bookly_Admin/books_img/<%= book.getBookImg() %>" alt="<%= book.getBookName() %>" style="width: 284px; height: 330px; " class="center" >
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-7 col-md-6">
                                        <div class="post-center-content">
                                            <h2><%= book.getBookName() %></h2>
                                            <p><strong>Author:</strong> <%= book.getBookAuthor() %></p>
                                            <p><strong>Edition:</strong> <%= book.getBookEdition() %></p>
                                            <p><strong>Publisher:</strong> <%= book.getBookPublisher() %></p>
                                            <p><strong>Length:</strong> <%= book.getBookLength() %></p>
                                            <p><strong>Language:</strong> <%= book.getBookLanguage() %></p>
                                            <p><strong>Topics:</strong> <%= book.getBookTopic() %></p>
                                            <div class="actions">
                                                <ul>
                                                    <li></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <li></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <li></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <li></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <li></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                           <div class="col-xs-12 col-sm-12 col-md-3 ">
                                               <%
                                double discountedPrice = book.getBookPrice() - (book.getBookPrice() * book.getBookDiscount() / 100.0);
                            %>
                                        <div class="post-right-content">
                                            <!--<h4>Available now</h4>-->
                                            <p><strong>Total Price :</strong> &#8377; <%= book.getBookPrice() %></p>
                                            
                                            <p><strong>Discount    :</strong>  <%= book.getBookDiscount()%>% Off </p>
                                            <p><strong>Discount Price :</strong>  &#8377;<%= discountedPrice %></p>
                                            <p><strong>Book Rating   :</strong><span style="color: gold; font-size: 1.2em;">&#9733; &#9733; &#9733; &#9733; &#9734;</span></p>
                                            <p><strong>Payment Mode :</strong> COD</p>
                                            <a href="#." class="btn btn-dark-gray">Add to Cart</a> 
                                            <a href="#." class="btn btn-dark-gray">Buy</a> 
                                            <a href="books-media-gird-view-v2.jsp" class="btn btn-dark-gray">Cancel</a>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="clearfix"></div>
                                <p><strong>Description:</strong> <%= book.getBookDescription() %></p>
                                           
                            </div>
                        <% } else { %>
                            <p>Book not found!</p>
                        <% } %>
                        </div>
                    </div>
                </main>
            </div>
        </div>
      

        <!-- Start: Social Network -->
           <%@include file="followUs.jsp" %>
        <!-- End: Social Network -->

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