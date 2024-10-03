<%@page import="com.dao.Add_cartdao"%>
<%@page import="com.entities.Add_cart"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.entities.Books"%>
<%@page import="com.dao.Booksdao"%>
<%@page import="com.entities.User"%>
<%@page import="com.dao.Userdao"%>
<%
    // Fetch the current user from the session
    User user = (User) session.getAttribute("currentUser");

    // If the user is not logged in, redirect to the sign-in page
    if (user == null) {
        response.sendRedirect("sign-in.jsp");
        return;
    }

    Add_cartdao add_cartdao = new Add_cartdao(ConnectionProvider.getConnection());

    // Fetch book details
    Booksdao booksdao = new Booksdao(ConnectionProvider.getConnection());
    String bookIdParam = request.getParameter("bookId");
    Books book = null;

    if (bookIdParam != null) {
        int bookId = Integer.parseInt(bookIdParam);
        book = booksdao.getCategoryById(bookId); // Fetch book details using the bookId
    }

    List<Add_cart> cartItems = add_cartdao.getCartItems(user.getuId());


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
        <!--<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i%7CLato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet" />-->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />


        <!-- Stylesheet -->
        <link href="style.css" rel="stylesheet" type="text/css" />

        <!-- Custom Theme files -->
        <!--<link href="css/check_out_bootstrap.css" type="text/css" rel="stylesheet" media="all">-->
        <!-- shop css -->
        <link href="css/check_out_shop.css" type="text/css" rel="stylesheet" media="all">
        <!-- checkout css -->
        <link href="css/checkout.css" type="text/css" rel="stylesheet" media="all">
        <link href="css/check_out_style.css" type="text/css" rel="stylesheet" media="all">
        <!-- font-awesome icons -->
        <link href="css/font-awesome.css" rel="stylesheet">
        <!-- //Custom Theme files -->
        <!-- online-fonts -->

        <!-- titles -->
        <link href="//fonts.googleapis.com/css?family=Merriweather+Sans:300,300i,400,400i,700,700i,800,800i" rel="stylesheet">
        <!-- body -->
        <link href="//fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
        <!-- //online-fonts -->

        <style>
            /* Loader Styles */
            #loader {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(255, 255, 255, 0.8);
                z-index: 9999;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .loader-spinner {
                border: 8px solid #FF6600; /* Light grey */
                border-top: 8px solid #FFFFFF; /* Blue */
                border-radius: 50%;
                width: 60px;
                height: 60px;
                animation: spin 1s linear infinite;
            }

            @keyframes spin {
                0% {
                    transform: rotate(0deg);
                }
                100% {
                    transform: rotate(360deg);
                }
            }

        </style>

    </head>

    <body>

        <!-- Start: Header Section -->
        <%@include file="header.jsp" %>
        <!-- End: Header Section -->

        <!-- Start: Page Banner -->
        <section class="page-banner services-banner">
            <div class="container">
                <div class="banner-header">
                    <h2>Cart Page</h2>
                    <span class="underline center"></span>
                    <p class="lead">Proin ac eros pellentesque dolor pharetra tempo.</p>
                </div>
                <div class="breadcrumb">
                    <ul>
                        <li><a href="index-2.html">Home</a></li>
                        <li>Dashboard</li>
                    </ul>
                </div>
            </div>
        </section>
        <!-- End: Page Banner -->
        <!-- Start: Cart Section -->
        <div id="content" class="site-content">
            <div id="home">
                <!-- header -->


                <!--checkout-->
                <div class="innerf-pages section">
                    <div class="container">
                        <div class="privacy about">

                            <div class="checkout-right">
                                <h4>Your shopping cart contains:
                                    <span>3 Products</span>
                                </h4>
                                <table class="timetable_sub table-responsive">
                                    <thead>
                                        <tr>
                                            <th>SL No.</th>
                                            <th>Product</th>
                                            <th>Quantity</th>
                                            <th>Product Name</th>
                                            <th>Price</th>
                                            <th>Remove</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="rem1">
                                            <td class="invert">1</td>
                                            <td class="invert-image">
                                                <img src="http://localhost:8080/Bookly_Admin/books_img/<%= book.getBookImg()%>" alt=" " class="img-responsive"  style="width: 150px; height: 180px;">
                                            </td>
                                            <td class="invert">
                                                <div class="quantity">
                                                    <span>1</span> <!-- Assuming default quantity is 1 -->
                                                </div>
                                            </td>
                                            <td class="invert"><%= book.getBookName()%></td>
                                            <td class="invert">&#8377; <%= book.getBookPrice()%></td>
                                            <td class="invert">
                                                <div class="rem">
                                                    <a href="books-media-gird-view-v2.jsp" class="remove-item" data-cartid="">Cancel</a>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div>
                                <!-- Billing Address Form -->
                                <div class="checkout-left" style="padding: 30px;">
                                    <h2 style="color: red; text-align: center;">Billing Address</h2>
                                    <form action="BookingServlet" method="post" class="creditly-card-form shopf-sear-headinfo_form">
                                        <div class="creditly-wrapper wrapper">
                                            <input type="hidden"  name="uID" value="<%= user.getuId()%>">
                                            <input type="hidden"  name="total_amount" value="<%= book.getBookPrice()%>">

                                            <!-- Send only the selected bookId -->
                                            <input type="hidden" name="bookId" value="<%= book.getBookId()%>">

                                            <div class="information-wrapper">
                                                <div class="container">
                                                    <!-- Customer Details -->
                                                    <div class="row justify-content-center">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <div class="controls">
                                                                    <label class="control-label">Customer Name:</label>
                                                                    <input class="billing-address-name form-control" type="text" name="customer_name" value="<%= user.getUName()%>" placeholder="Enter your full name" readonly>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <div class="controls">
                                                                    <label class="control-label">Mobile Number:</label>
                                                                    <input class="form-control" type="text" name="mobile_number" value="<%= user.getuPhone()%>" placeholder="Enter your mobile number" readonly>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row justify-content-center mt-3">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <div class="controls">
                                                                    <label class="control-label">Email Address:</label>
                                                                    <input class="form-control" type="email" name="email" value="<%= user.getUemail()%>" placeholder="Enter your email" readonly>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <div class="controls">
                                                                    <label class="control-label">Payment Type</label>
                                                                    <input class="form-control" type="text" name="bookingType" value="COD" placeholder="COD" readonly>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- User Address Input Field -->
                                                    <div class="row justify-content-center mt-3">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <div class="controls">
                                                                    <label class="control-label">User Address:</label>
                                                                    <input class="form-control" type="text" id="userAddress" name="" value="<%= user.getuAddress()%>" required>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <!-- Shipping Address Input Field -->
                                                    <div class="row justify-content-center mt-3">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <div class="controls">
                                                                    <label class="control-label">Shipping Address:</label>
                                                                    <input class="form-control" type="text" id="shippingAddress" name="shippingAddress" required>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- Place Order Button (Centered) -->
                                                    <div class="row justify-content-center mt-4">
                                                        <div class="col-12 text-center">
                                                            <button class="submit check_out" type="submit">Place Order</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                            </div>

                        </div>
                    </div>
                    <!--//checkout-->

                    <!-- Loader -->
                    <div id="loader" style="display: none;">
                        <div class="loader-spinner"></div>
                    </div>

                    <script>
                        document.querySelector(".creditly-card-form").addEventListener("submit", function () {
                            document.getElementById("loader").style.display = "flex"; // Show the loader
                        });
                    </script>

                    <!-- //home -->

                    <!-- Common js -->
                    <script src="js/jquery-2.2.3.min.js"></script>
                    <!--// Common js -->

                    <!-- cart-js -->
                    <script src="js/minicart.js"></script>

                    <script src="js/SmoothScroll.min.js"></script>
                    <!-- //smooth-scrolling-of-move-up -->


                    <script src="js/bootstrap.js"></script>
                </div>
                <!-- End: Cart Section -->



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