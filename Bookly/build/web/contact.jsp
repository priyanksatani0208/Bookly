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
                    <h2>Contact Us</h2>
                    <span class="underline center"></span>
                    <p class="lead">Proin ac eros pellentesque dolor pharetra tempo.</p>
                </div>
                <div class="breadcrumb">
                    <ul>
                        <li><a href="index-2.html">Home</a></li>
                        <li>Contact</li>
                    </ul>
                </div>
            </div>
        </section>
        <!-- End: Page Banner -->
        
        <!-- Start: Contact Us Section -->
        <div id="content" class="site-content">
            <div id="primary" class="content-area">
                <main id="main" class="site-main">
                    <div class="contact-main">
                        <div class="contact-us">
                            <div class="container">
                                <div class="contact-location">
                                    <div class="flipcard">
                                        <div class="front">
                                            <div class="top-info">
                                                <span><i class="fa fa-map-marker" aria-hidden="true"></i> Office Address</span>
                                            </div>
                                            <div class="bottom-info">
                                                <span class="top-arrow"></span>
                                                <ul>
                                                    <li> LDRP Institute of Technology & Research,  </li>
                                                    <li>Near KH-5, Sector-15,</li>
                                                    <li> Gandhinagar - 382015</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="back">
                                            <div class="bottom-info orange-bg">
                                                <span class="bottom-arrow"></span>
                                                <ul>
                                                    <li> LDRP Institute of Technology & Research,  </li>
                                                    <li>Near KH-5, Sector-15,</li>
                                                    <li> Gandhinagar - 382015</li>
                                                </ul>
                                            </div>
                                            <div class="top-info dark-bg">
                                                <span><i class="fa fa-map-marker" aria-hidden="true"></i> Office Address</span>
                                            </div>                                                
                                        </div>
                                    </div>
                                    <div class="flipcard">
                                        <div class="front">
                                            <div class="top-info">
                                                <span><i class="fa fa-fax" aria-hidden="true"></i> Phone and Fax</span>
                                            </div>
                                            <div class="bottom-info">
                                                <span class="top-arrow"></span>
                                                <ul>                                                   
                                                    <li><a href="tel:+123-456-7890">Local: +91 75730 - 98568</a></li>
                                                    <li><a href="fax:(001)-254-7359">Fax: (009)-598-75395</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="back">
                                            <div class="bottom-info orange-bg">
                                                <span class="bottom-arrow"></span>
                                                <ul>
                                                   <li><a href="tel:+123-456-7890">Local: +91 75730 - 98568</a></li>
                                                    <li><a href="fax:(001)-254-7359">Fax: (009)-598-75395</a></li>
                                                </ul>
                                            </div>
                                            <div class="top-info dark-bg">
                                                <span><i class="fa fa-fax" aria-hidden="true"></i> Phone and Fax</span>
                                            </div>                                                
                                        </div>
                                    </div>
                                    <div class="flipcard">
                                        <div class="front">
                                            <div class="top-info">
                                                <span><i class="fa fa-envelope" aria-hidden="true"></i> Email Address</span>
                                            </div>
                                            <div class="bottom-info">
                                                <span class="top-arrow"></span>
                                                <ul>
                                                    <li>www.bookly.com</li>
                                                    <li>support@bookly.com</li>
                                                    <li>info@bookly.com</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="back">
                                            <div class="bottom-info orange-bg">
                                                <span class="bottom-arrow"></span>
                                                <ul>
                                                    <li>www.bookly.com</li>
                                                    <li>support@bookly.com</li>
                                                    <li>info@bookly.com</li>
                                                </ul>
                                            </div>
                                            <div class="top-info dark-bg">
                                                <span><i class="fa fa-envelope" aria-hidden="true"></i> Email Address</span>
                                            </div>                                                
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="row">
                                    <div class="contact-area">
                                        <div class="container">
                                            <div class="col-md-5 col-md-offset-1 border-gray-left">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="contact-map bg-light margin-left">
                                                                <div class="company-map" id="map"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-5 border-gray-right">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="contact-form bg-light margin-right">
                                                            <h2>Send us a message</h2>
                                                            <span class="underline left"></span>
                                                            <div class="contact-fields">
                                                                <form action="ContactServlet" method="post" >
                                                                    <div class="row">
                                                                        <div class="col-md-6 col-sm-6">
                                                                            <div class="form-group">
                                                                                <input class="form-control" type="text" placeholder="First Name" name="contFname"  required />
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-6 col-sm-6">
                                                                            <div class="form-group">
                                                                                <input class="form-control" type="text" placeholder="Last Name" name="contLname"  required />
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-6 col-sm-6">
                                                                            <div class="form-group">
                                                                                <input class="form-control" type="email" placeholder="Email" name="contEmail"  required />
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-6 col-sm-6">
                                                                            <div class="form-group">
                                                                                <input class="form-control" type="number" placeholder="Phone Number" name="contPhone" required />
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-sm-12">
                                                                            <div class="form-group">
                                                                                <textarea class="form-control" placeholder="Your message"  name="contMessage" required></textarea>
                                                                                <div class="clearfix"></div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-sm-12">
                                                                            <div class="form-group form-submit">
                                                                                <input class="btn btn-default"  type="submit"  value="Send Message"  />
                                                                            </div>
                                                                        </div>
                                                                     </div>
                                                                </form> 
                                                            </div>                                                                   
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <!-- End: Contact Us Section -->

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
        
        <!-- Google Map API -->
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAT5k-RhvFSVIuCALkpHhKgQx6SJUd9gpI"></script>

        <!-- Google Map (Custom Style) -->
        <script type="text/javascript" src="js/google.map.js"></script>

        <!-- Custom Scripts -->
        <script type="text/javascript" src="js/main.js"></script>

    </body>


</html>
