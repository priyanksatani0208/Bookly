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
        
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="js/html5shiv.min.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->
        
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
            <div id="primary" class="content-area">
                <main id="main" class="site-main">
                    <div class="cart-main">
                        <div class="container">
                            <div class="row">
                                <div class="cart-head">
                                    <div class="col-xs-12 col-sm-6 account-option">
                                        <strong>Scott Fitzgerald</strong>
                                        <ul>
                                            <li><a href="#">Edit Account</a></li>
                                            <li class="divider">|</li>
                                            <li><a href="#">Edit Pin </a></li>
                                        </ul>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 library-info">
                                        <ul>
                                            <li>
                                                <strong>Home Library:</strong>
                                                Stephen A. Schwarzman Building
                                            </li>
                                            <li>
                                                <strong>Email:</strong>
                                                <a href="mailto:scottfitzgerald@gmail.com">scottfitzgerald@gmail.com</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12">
                                    <div class="page type-page status-publish hentry">
                                        <div class="entry-content">
                                            <div class="woocommerce table-tabs" id="responsiveTabs">
                                                <ul class="nav nav-tabs">
                                                    <li class="active"><b class="arrow-up"></b><a data-toggle="tab" href="#sectionA">Book Bag</a></li>
                                                    <li><b class="arrow-up"></b><a data-toggle="tab" href="#sectionB">Holds (4)</a></li>
                                                    <li><b class="arrow-up"></b><a data-toggle="tab" href="#sectionC">My Checkouts (0)</a></li>
                                                    <li><b class="arrow-up"></b><a data-toggle="tab" href="#sectionD">My eBooks (1)</a></li>
                                                    <li><b class="arrow-up"></b><a data-toggle="tab" href="#sectionE">My Lists</a></li>
                                                    <li><b class="arrow-up"></b><a data-toggle="tab" href="#sectionF">Fines/Fees ($0.00)</a></li>
                                                </ul>
                                                <div class="tab-content">
                                                    <div id="sectionA" class="tab-pane fade in active">
                                                        <form method="post" action="http://libraria.demo.presstigers.com/cart-page.html">
                                                            <table class="table table-bordered shop_table cart">
                                                                <thead>
                                                                    <tr>
                                                                        <th class="product-name">&nbsp;</th>
                                                                        <th class="product-name">Title</th>
                                                                        <th class="product-quantity">Action</th>
                                                                        <th class="product-price">Pickup Location </th>                                                                
                                                                        <th class="product-subtotal">&nbsp;</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr class="cart_item">
                                                                        <td data-title="cbox" class="product-cbox">
                                                                            <span>
                                                                                <input type="checkbox" id="cbox3" value="first_checkbox">
                                                                            </span>
                                                                        </td>
                                                                        <td data-title="Product" class="product-name">
                                                                            <span class="product-thumbnail">
                                                                                <a href="#"><img src="images/cart/cart-product-1.jpg" alt="cart-product-1"></a>
                                                                            </span>
                                                                            <span class="product-detail">
                                                                                <a href="#"><strong>The Great Gatsby</strong></a>
                                                                                <span><strong>Author:</strong> F. Scott Fitzgerald</span>
                                                                                <span><strong>ISBN:</strong> 9781581573268</span>
                                                                                <span><strong>Fees:</strong> <em>$10</em></span>
                                                                            </span>
                                                                        </td>
                                                                        <td data-title="action" class="product-action">
                                                                            <div class="dropdown">
                                                                                <a href="#" data-toggle="dropdown" class="dropdown-toggle">Edit Hold <b class="caret"></b></a>
                                                                                <ul class="dropdown-menu">
                                                                                    <li><a href="#">Edit Hold</a></li>
                                                                                    <li><a href="#">Cancel Hold</a></li>
                                                                                    <li><a href="#">Add Another Hold</a></li>
                                                                                </ul>
                                                                            </div>
                                                                            <div class="addition-action">
                                                                                <small>Additional Actions:</small>
                                                                                <ul>
                                                                                    <li><a href="#"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
                                                                                    <li><a href="#"><i class="fa fa-heart" aria-hidden="true"></i></a></li>
                                                                                    <li><a href="#"><i class="fa fa-envelope" aria-hidden="true"></i></a></li>
                                                                                    <li><a href="#"><i class="fa fa-search" aria-hidden="true"></i></a></li>
                                                                                    <li><a href="#"><i class="fa fa-print" aria-hidden="true"></i></a></li>
                                                                                </ul>
                                                                            </div>
                                                                        </td>
                                                                        <td data-title="Price" class="product-price">
                                                                            <p><a href="#">Available </a> at 53rd Street Fiction (CLASSICS FIC MORRISON) plus 4 more <a href="#"> see all </a></p>
                                                                        </td>
                                                                        <td class="product-remove">
                                                                            You've placed this item on hold. This item is in your book bag <a href="#">remove</a>
                                                                        </td>
                                                                    </tr>
                                                                    <tr class="cart_item">
                                                                        <td>
                                                                            <span data-title="cbox" class="product-cbox">
                                                                                <input type="checkbox" id="cbox1" value="first_checkbox">
                                                                            </span>
                                                                        </td>
                                                                        <td data-title="Product" class="product-name">
                                                                            <span class="product-thumbnail">
                                                                                <a href="#"><img src="images/cart/cart-product-2.jpg" alt="cart-product-2"></a>
                                                                            </span>
                                                                            <span class="product-detail">
                                                                                <a href="#"><strong>The Great Gatsby</strong></a>
                                                                                <span><strong>Author:</strong> F. Scott Fitzgerald</span>
                                                                                <span><strong>ISBN:</strong> 9781581573268</span>
                                                                                <span><strong>Fees:</strong> <em>$10</em></span>
                                                                            </span>
                                                                        </td>
                                                                        <td data-title="action" class="product-action">
                                                                            <div class="dropdown">
                                                                                <a href="#" data-toggle="dropdown" class="dropdown-toggle">Edit Hold <b class="caret"></b></a>
                                                                                <ul class="dropdown-menu">
                                                                                    <li><a href="#">Edit Hold</a></li>
                                                                                    <li><a href="#">Cancel Hold</a></li>
                                                                                    <li><a href="#">Add Another Hold</a></li>
                                                                                </ul>
                                                                            </div>
                                                                            <div class="addition-action">
                                                                                <small>Additional Actions:</small>
                                                                                <ul>
                                                                                    <li><a href="#"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
                                                                                    <li><a href="#"><i class="fa fa-heart" aria-hidden="true"></i></a></li>
                                                                                    <li><a href="#"><i class="fa fa-envelope" aria-hidden="true"></i></a></li>
                                                                                    <li><a href="#"><i class="fa fa-search" aria-hidden="true"></i></a></li>
                                                                                    <li><a href="#"><i class="fa fa-print" aria-hidden="true"></i></a></li>
                                                                                </ul>
                                                                            </div>
                                                                        </td>
                                                                        <td data-title="Price" class="product-price">
                                                                            <p><a href="#">Available </a> at 53rd Street Fiction (CLASSICS FIC MORRISON) plus 4 more <a href="#"> see all </a></p>
                                                                        </td>
                                                                        <td class="product-remove">
                                                                            You've placed this item on hold. This item is in your book bag <a href="#">remove</a>
                                                                        </td>
                                                                    </tr>
                                                                    <tr class="cart_item">
                                                                        <td>
                                                                            <span data-title="cbox" class="product-cbox">
                                                                                <input type="checkbox" id="cbox2" value="first_checkbox">
                                                                            </span>
                                                                        </td>
                                                                        <td data-title="Product" class="product-name">
                                                                            <span class="product-thumbnail">
                                                                                <a href="#"><img src="images/cart/cart-product-3.jpg" alt="cart-product-3"></a>
                                                                            </span>
                                                                            <span class="product-detail">
                                                                                <a href="#"><strong>The Great Gatsby</strong></a>
                                                                                <span><strong>Author:</strong> F. Scott Fitzgerald</span>
                                                                                <span><strong>ISBN:</strong> 9781581573268</span>
                                                                                <span><strong>Fees:</strong> <em>$10</em></span>
                                                                            </span>
                                                                        </td>
                                                                        <td data-title="action" class="product-action">
                                                                            <div class="dropdown">
                                                                                <a href="#" data-toggle="dropdown" class="dropdown-toggle">Edit Hold <b class="caret"></b></a>
                                                                                <ul class="dropdown-menu">
                                                                                    <li><a href="#">Edit Hold</a></li>
                                                                                    <li><a href="#">Cancel Hold</a></li>
                                                                                    <li><a href="#">Add Another Hold</a></li>
                                                                                </ul>
                                                                            </div>
                                                                            <div class="addition-action">
                                                                                <small>Additional Actions:</small>
                                                                                <ul>
                                                                                    <li><a href="#"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
                                                                                    <li><a href="#"><i class="fa fa-heart" aria-hidden="true"></i></a></li>
                                                                                    <li><a href="#"><i class="fa fa-envelope" aria-hidden="true"></i></a></li>
                                                                                    <li><a href="#"><i class="fa fa-search" aria-hidden="true"></i></a></li>
                                                                                    <li><a href="#"><i class="fa fa-print" aria-hidden="true"></i></a></li>
                                                                                </ul>
                                                                            </div>
                                                                        </td>
                                                                        <td data-title="Price" class="product-price">
                                                                            <p><a href="#">Available </a> at 53rd Street Fiction (CLASSICS FIC MORRISON) plus 4 more <a href="#"> see all </a></p>
                                                                        </td>
                                                                        <td class="product-remove">
                                                                            You've placed this item on hold. This item is in your book bag <a href="#">remove</a>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </form>
                                                    </div>
                                                    <div id="sectionB" class="tab-pane fade in">
                                                        <h5>Lorem Ipsum Dolor</h5>
                                                        <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.</p>
                                                    </div>
                                                    <div id="sectionC" class="tab-pane fade in">
                                                        <h5>Lorem Ipsum Dolor</h5>
                                                        <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.</p>
                                                    </div>
                                                    <div id="sectionD" class="tab-pane fade in">
                                                        <h5>Lorem Ipsum Dolor</h5>
                                                        <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.</p>
                                                    </div>                                                    
                                                    <div id="sectionE" class="tab-pane fade in">
                                                        <h5>Lorem Ipsum Dolor</h5>
                                                        <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.</p>
                                                    </div>                                                    
                                                    <div id="sectionF" class="tab-pane fade in">
                                                        <h5>Lorem Ipsum Dolor</h5>
                                                        <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div><!-- .entry-content -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <!-- End: Cart Section -->
        
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