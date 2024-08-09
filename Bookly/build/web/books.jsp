<%@page errorPage="404.jsp" %>
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
                    <h2>Books & Media Listing</h2>
                    <span class="underline center"></span>
                    <p class="lead">Proin ac eros pellentesque dolor pharetra tempo.</p>
                </div>
                <div class="breadcrumb">
                    <ul>
                        <li><a href="index-2.html">Home</a></li>
                        <li>Books & Media</li>
                    </ul>
                </div>
            </div>
        </section>
        <!-- End: Page Banner -->

        <!-- Start: Products Section -->
        <div id="content" class="site-content">
            <div id="primary" class="content-area">
                <main id="main" class="site-main">
                    <div class="books-full-width">
                        <div class="container">
                            <!-- Start: Search Section -->
                            <section class="search-filters">
                                <div class="filter-box">
                                    <h3>What are you looking for at the library?</h3>
                                    <form action="#" method="get">
                                        <div class="col-md-4 col-sm-6">
                                            <div class="form-group">
                                                <input class="form-control" placeholder="Search by Keyword" id="keywords" name="keywords" type="text">
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-sm-6">
                                            <div class="form-group">
                                                <select name="catalog" id="catalog" class="form-control">
                                                    <option>Search the Catalog</option>                                                
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-sm-6">
                                            <div class="form-group">
                                                <select name="category" id="category" class="form-control">
                                                    <option>All Categories</option>                                                    
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-2 col-sm-6">
                                            <div class="form-group">
                                                <input class="form-control" type="submit" value="Search">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="clear"></div>
                            </section>
                            <!-- End: Search Section -->
                            
                          
                            <div class="booksmedia-fullwidth">
                                <ul>
                                    <li>
                                        <div class="book-list-icon blue-icon"></div>
                                        <figure>
                                            <a href="books-detail.jsp"><img src="images/books-media/layout-3/books-media-layout3-01.jpg" alt="Book"></a>
                                            <figcaption>
                                                <header>
                                                    <h4><a href="books-media-detail-v2.html">The Great Gatsby</a></h4>
                                                    <p><strong>Author:</strong>  F. Scott Fitzgerald</p>
                                                    <p><strong>ISBN:</strong>  9781581573268</p>
                                                </header>
                                                <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. Pellentesque dolor turpis, pulvinar varius.</p>
                                                <div class="actions">
                                                    <ul>
                                                        <li>
                                                            <a href="#" target="_blank" data-toggle="blog-tags" data-placement="top" title="Add TO CART">
                                                                <i class="fa fa-shopping-cart"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="#" target="_blank" data-toggle="blog-tags" data-placement="top" title="Like">
                                                                <i class="fa fa-heart"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="#" target="_blank" data-toggle="blog-tags" data-placement="top" title="Mail">
                                                                <i class="fa fa-envelope"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="#" target="_blank" data-toggle="blog-tags" data-placement="top" title="Search">
                                                                <i class="fa fa-search"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="#" target="_blank" data-toggle="blog-tags" data-placement="top" title="Print">
                                                                <i class="fa fa-print"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="#" target="_blank" data-toggle="blog-tags" data-placement="top" title="Share">
                                                                <i class="fa fa-share-alt"></i>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </figcaption>
                                        </figure>                                                
                                    </li>
                                </ul>
                            </div>
                            <nav class="navigation pagination text-center">
                                <h2 class="screen-reader-text">Posts navigation</h2>
                                <div class="nav-links">
                                    <a class="prev page-numbers" href="#."><i class="fa fa-long-arrow-left"></i> Previous</a>
                                    <a class="page-numbers" href="#.">1</a>
                                    <span class="page-numbers current">2</span>
                                    <a class="page-numbers" href="#.">3</a>
                                    <a class="page-numbers" href="#.">4</a>
                                    <a class="next page-numbers" href="#.">Next <i class="fa fa-long-arrow-right"></i></a>
                                </div>
                            </nav>
                        </div>
<!--                         Start: Staff Picks 
                        <section class="team staff-picks">
                            <div class="container">
                                <div class="center-content">
                                    <h2 class="section-title">Staff Picks</h2>
                                    <span class="underline center"></span>
                                    <p class="lead">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                </div>
                                <div class="team-list">
                                    <div class="team-member">
                                        <figure>
                                            <img src="images/books-media/staff-pick/staff-picks-01.jpg" alt="Staff Pick" />
                                        </figure>
                                        <div class="content-block">
                                            <div class="member-info">
                                                <div class="member-thumb">
                                                    <img src="images/books-media/staff-pick/gail.jpg" alt="Katherine">
                                                </div>
                                                <div class="member-content">
                                                    <span class="designation">Downtown & Business</span>
                                                    <h4>The Collector</h4>
                                                    <ul class="social">
                                                        <li>
                                                            <a href="#" target="_blank">
                                                                <i class="fa fa-linkedin"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="#" target="_blank">
                                                                <i class="fa fa-facebook-f"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="#" target="_blank">
                                                                <i class="fa fa-twitter"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="#" target="_blank">
                                                                <i class="fa fa-skype"></i>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <p>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here...</p>
                                                <a class="btn btn-primary" href="#">Read More</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="team-member">
                                        <figure>
                                            <img src="images/books-media/staff-pick/staff-picks-02.jpg" alt="Staff Pick" />
                                        </figure>
                                        <div class="content-block">
                                            <div class="member-info">
                                                <div class="member-thumb">
                                                    <img src="images/books-media/staff-pick/katherine.jpg" alt="Katherine">
                                                </div>
                                                <div class="member-content">
                                                    <span class="designation">Katherine, West End</span>
                                                    <h4>Mongolia</h4>
                                                    <ul class="social">
                                                        <li>
                                                            <a href="#" target="_blank">
                                                                <i class="fa fa-linkedin"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="#" target="_blank">
                                                                <i class="fa fa-facebook-f"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="#" target="_blank">
                                                                <i class="fa fa-twitter"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="#" target="_blank">
                                                                <i class="fa fa-skype"></i>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <p>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here...</p>
                                                <a class="btn btn-primary" href="#">Read More</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="team-member">
                                        <figure>
                                            <img src="images/books-media/staff-pick/staff-picks-03.jpg" alt="Staff Pick" />
                                        </figure>
                                        <div class="content-block">
                                            <div class="member-info">
                                                <div class="member-thumb">
                                                    <img src="images/books-media/staff-pick/chris.jpg" alt="Katherine">
                                                </div>
                                                <div class="member-content">
                                                    <span class="designation">Chris, East Liberty</span>
                                                    <h4>The Revolution</h4>
                                                    <ul class="social">
                                                        <li>
                                                            <a href="#" target="_blank">
                                                                <i class="fa fa-linkedin"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="#" target="_blank">
                                                                <i class="fa fa-facebook-f"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="#" target="_blank">
                                                                <i class="fa fa-twitter"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="#" target="_blank">
                                                                <i class="fa fa-skype"></i>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <p>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here...</p>
                                                <a class="btn btn-primary" href="#">Read More</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                         End: Staff Picks -->
                    </div>
                </main>
            </div>
        </div>
        <!-- End: Products Section -->

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