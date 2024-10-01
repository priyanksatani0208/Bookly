<%@page import="com.entities.Books"%>
<%@page import="com.dao.Booksdao"%>
<%@page import="com.entities.Add_cart"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.dao.Add_cartdao"%>
<%@page import="com.entities.User"%>
<%
    User user = (User) session.getAttribute("currentUser");

    if (user == null) {
        response.sendRedirect("sign-in.jsp");
        return;
    }

    Add_cartdao add_cartdao = new Add_cartdao(ConnectionProvider.getConnection());
    Booksdao booksdao = new Booksdao(ConnectionProvider.getConnection());

    String cartIdParam = request.getParameter("cartId");
    if (cartIdParam != null) {
        int cartId = Integer.parseInt(cartIdParam);
        boolean remove = add_cartdao.removeCartItem(cartId);

        if (remove) {
            response.getWriter().write("success");
            return;
        } else {
            response.getWriter().write("failure");
            return;
        }
    }

    List<Add_cart> cartItems = add_cartdao.getCartItems(user.getuId());

    double totalPrice = 0.0;
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

        <!------>

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
            /* Custom style for the total line */
            .checkout-total {
                font-weight: bold;
                color: #ff0000; /* Red color */
                background-color: #f8f8f8; /* Light background for contrast */
                padding: 10px;
                border-top: 2px solid #ddd; /* Light border for separation */
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

                                <% if (cartItems.size() == 0) { %>
                                <p><h4>Your shopping cart contains : No books selected.</h4></p>
                                <% } else {%>
                                <span> <h4>Your shopping cart contains : <%= cartItems.size()%> Products</h4></span>
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
                                        <%
                                            int slNo = 1;
                                            for (Add_cart item : cartItems) {
                                                Books book = booksdao.getCategoryById(item.getBookId());
                                        %>
                                        <tr class="rem1">
                                            <td class="invert"><%= slNo%></td>
                                            <td class="invert-image">
                                                <a href="single_product.html">
                                                    <img src="http://localhost:8080/Bookly_Admin/books_img/<%= book.getBookImg()%>" alt=" " class="img-responsive" style="width: 150px; height: 180px;">
                                                </a>
                                            </td>
                                            <td class="invert">
                                                <div class="quantity">
                                                    <div class="quantity-select">
                                                        <div class="entry value-minus" data-cartid="<%= item.getCartId()%>">&nbsp;</div>
                                                        <div class="entry value">
                                                            <span><%= item.getQuantity()%></span>
                                                        </div>
                                                        <div class="entry value-plus active" data-cartid="<%= item.getCartId()%>">&nbsp;</div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="invert"><%= book.getBookName()%></td>
                                            <td class="invert">&#8377; <%= book.getBookPrice()%></td>
                                            <td class="invert">
                                                <div class="rem">
                                                    <a href="javascript:void(0);" class="remove-item" data-cartid="<%= item.getCartId()%>">Remove</a>
                                                </div>
                                            </td>
                                        </tr>
                                        <%
                                                slNo++;
                                            }
                                        %>
                                    </tbody>
                                </table>
                                <% } %>
                            </div>


                            <div class="checkout-left">
                                <% if (cartItems.size() > 0) { %>
                                <div class="col-md-4 checkout-left-basket">
                                    <h4>Continue to basket</h4>
                                    <ul>
                                        <%
                                            // Iterate through cart items to display each book's name and price
                                            for (Add_cart item : cartItems) {
                                                Books book = booksdao.getCategoryById(item.getBookId());
                                                double itemTotalPrice = book.getBookPrice() * item.getQuantity();
                                                totalPrice += itemTotalPrice;
                                        %>
                                        <li>
                                            <%= book.getBookName()%> 
                                            <i>-</i> 
                                            <span>&#8377; <%= book.getBookPrice()%> (x<%= item.getQuantity()%>)  &nbsp;&nbsp;= &#8377; <%= itemTotalPrice%></span>
                                        </li>
                                        <% }%>
                                        <li class="checkout-total">Total
                                            <i>-</i>
                                            <span>&#8377; <%= totalPrice%></span>
                                        </li>
                                    </ul>
                                </div>

                                <div class="col-md-8 address_form">
                                    <h4>Billing Address</h4>
                                    <form action="BookingServlet" method="post" class="creditly-card-form shopf-sear-headinfo_form">
                                        <div class="creditly-wrapper wrapper">
                                            <div class="information-wrapper">
                                                <div class="first-row form-group">
                                                    <input type="hidden"  name="uID" value="<%= user.getuId()%>">
                                                    <input type="hidden"  name="total_amount" value="<%= totalPrice %>">

                                                    <%
                                                        for (Add_cart item : cartItems) {
                                                    %>
                                                    <input type="hidden" name="bookId[]" value="<%= item.getBookId()%>">
                                                    <%
                                                        }
                                                    %>
                                                    <div class="controls">
                                                        <label class="control-label">Customer name: </label>
                                                        <input class="billing-address-name form-control" type="text" name="name" 
                                                               value="<%= user.getUName()%>" placeholder="Full name" readonly>
                                                    </div>
                                                    <div class="card_number_grids">
                                                        <div class="card_number_grid_left">
                                                            <div class="controls">
                                                                <label class="control-label">Mobile number:</label>
                                                                <input class="form-control" type="text" name="phone" 
                                                                       value="<%= user.getuPhone()%>" placeholder="Mobile number" readonly>
                                                            </div>
                                                        </div>
                                                        <div class="card_number_grid_right">
                                                            <div class="controls">
                                                                <label class="control-label">Email Address:</label>
                                                                <input class="form-control" type="text" name="email" 
                                                                       value="<%= user.getUemail()%>" placeholder="Email Address" readonly>
                                                            </div>
                                                        </div>
                                                        <div class="clear"> </div>
                                                    </div>

                                                    <div class="controls">
                                                        <label class="control-label">Payment Type</label>
                                                        <input class="form-control" type="text" name="bookingType" value="COD" placeholder="COD" readonly>
                                                    </div>
                                                    <div class="controls">
                                                        <label class="control-label">User Address: </label>
                                                        <input class="form-control" type="text" name="userAddress" 
                                                               value="<%= user.getuAddress()%>" placeholder="User Address" readonly>
                                                    </div>
                                                    <div class="controls">
                                                        <label class="control-label">Shipping Address: </label>
                                                        <input class="form-control" type="text" name="shippingAddress" placeholder="">
                                                    </div>
                                                </div>
                                                <button class="submit check_out">Place Order</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <% }%>
                                <div class="clearfix"> </div>
                            </div>


                        </div>

                    </div>
                </div>
                <!--//checkout-->


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

            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

            <script>
                $(document).ready(function () {
                    $('.remove-item').click(function () {
                        var cartId = $(this).data('cartid');
                        var row = $(this).closest('tr'); // Get the row to remove it later

                        $.ajax({
                            url: 'cart_booking.jsp',
                            method: 'GET',
                            data: {cartId: cartId},
                            success: function (response) {
                                // If the item is successfully removed, remove the row from the table
                                row.remove();

                                // Reassign the serial numbers
                                $('.timetable_sub tbody tr').each(function (index) {
                                    $(this).find('td:first').text(index + 1); // Update the SL No
                                });

                                // You may want to update other parts of the page, like the cart total, here
                            },
                            error: function () {
                                alert('Error occurred while removing the item.');
                            }
                        });
                    });
                });


            </script>
    </body>


</html>