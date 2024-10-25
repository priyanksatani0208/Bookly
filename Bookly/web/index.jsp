<%@page import="com.entities.Books"%>
<%@page import="com.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.dao.Categorydao"%>
<%
    Categorydao categorydao = new Categorydao(ConnectionProvider.getConnection());
    List<Category> categoryList = categorydao.getAllCategories();
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

        <!-- Stylesheet -->
        <link href="style.css" rel="stylesheet" type="text/css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


    </head>

    <body>

        <!-- Start: Header Section -->
        <%@include file="header.jsp" %>
        <!-- End: Header Section -->

        <!-- Start: Slider Section -->
        <div data-ride="carousel" class="carousel slide" id="home-v1-header-carousel">

            <!-- Carousel slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <figure>
                        <img alt="Home Slide" src="images/header-slider/home-v1/header-slide.jpg" />
                    </figure>
                    <div class="container">
                        <div class="carousel-caption">
                            <h3>Online Learning Anytime, Anywhere!</h3>
                            <h2>Discover Your Roots</h2>
                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humor, or randomized words.</p>
                            <div class="slide-buttons hidden-sm hidden-xs">    
                                <a href="services.jsp" class="btn btn-primary">Read More</a>
                                <a href="books-media-gird-view-v2.jsp" class="btn btn-default">Purchase</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <figure>
                        <img alt="Home Slide" src="images/header-slider/home-v1/header-slide.jpg" />
                    </figure>
                    <div class="container">
                        <div class="carousel-caption">
                            <h3>Online Learning Anytime, Anywhere!</h3>
                            <h2>Discover Your Roots</h2>
                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humor, or randomized words.</p>
                            <div class="slide-buttons hidden-sm hidden-xs">    
                                <a href="#" class="btn btn-primary">Read More</a>
                                <a href="#" class="btn btn-default">Purchase</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <figure>
                        <img alt="Home Slide" src="images/header-slider/home-v1/header-slide.jpg" />
                    </figure>
                    <div class="container">
                        <div class="carousel-caption">
                            <h3>Online Learning Anytime, Anywhere!</h3>
                            <h2>Discover Your Roots</h2>
                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humor, or randomized words.</p>
                            <div class="slide-buttons hidden-sm hidden-xs">    
                                <a href="#" class="btn btn-primary">Read More</a>
                                <a href="#" class="btn btn-default">Purchase</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#home-v1-header-carousel" data-slide="prev"></a>
            <a class="right carousel-control" href="#home-v1-header-carousel" data-slide="next"></a>
        </div>
        <!-- End: Slider Section -->


      

<!-- Start: Card Section -->
<center><br><br><h1>Categories</h1></center><br><br>
<div class="container mt-5">          
    <div class="row g-4">
        <%           
         for (Category category : categoryList) {
        %>
        <div class="col-lg-3 col-md-4 col-sm-6">
            <a href="books-media-gird-view-v2.jsp?categoryId=<%= category.getCatId()%>">
                <div class="card text-center" style="width: 100%;">
                    <img src="http://localhost:8080/Bookly_Admin/category_img/<%= category.getCatImg()%>" 
                         class="card-img-top" 
                         alt="<%= category.getCatName()%>" 
                         style="width: 100%; height: 100px; object-fit: contain; border-radius: 0;">
                    <div class="card-body">
                        <h5 class="card-title"><%= category.getCatName()%></h5> <br><br>
                    </div>
                </div>
            </a>
        </div>
        <%
            }
        %>
    </div>
</div>
<!-- End: Card Section -->


    <br><center><h1> Add Features</h1></center>
    <!-- Start: Features -->
    <section class="features">
        <div class="container">
            <ul>
                <li class="bg-yellow">
                    <div class="feature-box">
                        <i class="yellow"></i>
                        <h3>Books</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque dolor turpis, pulvinar varius dui id, convallis iaculis eros.</p>
                        <a class="yellow" href="#">
                            View Selection <i class="fa fa-long-arrow-right"></i>
                        </a>
                    </div>
                </li>
                <li class="bg-light-green">
                    <div class="feature-box">
                        <i class="light-green"></i>
                        <h3>eBooks</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque dolor turpis, pulvinar varius dui id, convallis iaculis eros.</p>
                        <a class="light-green" href="#">
                            View Selection <i class="fa fa-long-arrow-right"></i>
                        </a>
                    </div>
                </li>
                <li class="bg-blue">
                    <div class="feature-box">
                        <i class="blue"></i>
                        <h3>DVDs</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque dolor turpis, pulvinar varius dui id, convallis iaculis eros.</p>
                        <a class="blue" href="#">
                            View Selection <i class="fa fa-long-arrow-right"></i>
                        </a>
                    </div>
                </li>
                <li class="bg-red">
                    <div class="feature-box">
                        <i class="red"></i>
                        <h3>Magazines</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque dolor turpis, pulvinar varius dui id, convallis iaculis eros.</p>
                        <a class="red" href="#">
                            View Selection <i class="fa fa-long-arrow-right"></i>
                        </a>
                    </div>
                </li>
                <li class="bg-violet">
                    <div class="feature-box">
                        <i class="violet"></i>
                        <h3>Audio</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque dolor turpis, pulvinar varius dui id, convallis iaculis eros.</p>
                        <a class="violet" href="#">
                            View Selection <i class="fa fa-long-arrow-right"></i>
                        </a>
                    </div>
                </li>
                <li class="bg-green">
                    <div class="feature-box">
                        <i class="green"></i>
                        <h3>eAudio</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque dolor turpis, pulvinar varius dui id, convallis iaculis eros.</p>
                        <a class="green" href="#">
                            View Selection <i class="fa fa-long-arrow-right"></i>
                        </a>
                    </div>
                </li>
            </ul>
        </div>
    </section>
    <!-- End: Features -->







    <!-- Start: Our Community Section -->
    <section class="community-testimonial">
        <div class="container">
            <div class="text-center">
                <h2 class="section-title">Words From our Community</h2>
                <span class="underline center"></span>
                <p class="lead">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            </div>
            <div class="owl-carousel">
                <div class="single-testimonial-box">
                    <div class="top-portion">
                        <img src="images/testimonial-image-01.jpg" alt="Testimonial Image" />
                        <div class="user-comment">
                            <div class="arrow-left"></div>
                            <blockquote cite="#">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent urna magna, rhoncus eget commodo et, dignissim non nulla. Sed sit amet vestibulum ex. Donec dolor velit
                            </blockquote>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="bottom-portion">
                        <a href="#" class="author">
                            Adrey Pachai <small>(Student )</small>
                        </a>
                        <div class="social-share-links">
                            <ul>
                                <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-skype" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="single-testimonial-box">
                    <div class="top-portion">
                        <img src="images/testimonial-image-02.jpg" alt="Testimonial Image" />
                        <div class="user-comment">
                            <div class="arrow-left"></div>
                            <blockquote cite="#">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent urna magna, rhoncus eget commodo et, dignissim non nulla. Sed sit amet vestibulum ex. Donec dolor velit
                            </blockquote>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="bottom-portion">
                        <a href="#" class="author">
                            Maria B <small>(Student )</small>
                        </a>
                        <div class="social-share-links">
                            <ul>
                                <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-skype" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="single-testimonial-box">
                    <div class="top-portion">
                        <img src="images/testimonial-image-01.jpg" alt="Testimonial Image" />
                        <div class="user-comment">
                            <div class="arrow-left"></div>
                            <blockquote cite="#">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent urna magna, rhoncus eget commodo et, dignissim non nulla. Sed sit amet vestibulum ex. Donec dolor velit
                            </blockquote>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="bottom-portion">
                        <a href="#" class="author">
                            Adrey Pachai <small>(Student )</small>
                        </a>
                        <div class="social-share-links">
                            <ul>
                                <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-skype" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="single-testimonial-box">
                    <div class="top-portion">
                        <img src="images/testimonial-image-02.jpg" alt="Testimonial Image" />
                        <div class="user-comment">
                            <div class="arrow-left"></div>
                            <blockquote cite="#">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent urna magna, rhoncus eget commodo et, dignissim non nulla. Sed sit amet vestibulum ex. Donec dolor velit
                            </blockquote>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="bottom-portion">
                        <a href="#" class="author">
                            Maria B <small>(Student )</small>
                        </a>
                        <div class="social-share-links">
                            <ul>
                                <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-skype" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="single-testimonial-box">
                    <div class="top-portion">
                        <img src="images/testimonial-image-01.jpg" alt="Testimonial Image" />
                        <div class="user-comment">
                            <div class="arrow-left"></div>
                            <blockquote cite="#">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent urna magna, rhoncus eget commodo et, dignissim non nulla. Sed sit amet vestibulum ex. Donec dolor velit
                            </blockquote>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="bottom-portion">
                        <a href="#" class="author">
                            Adrey Pachai <small>(Student )</small>
                        </a>
                        <div class="social-share-links">
                            <ul>
                                <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-skype" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="single-testimonial-box">
                    <div class="top-portion">
                        <img src="images/testimonial-image-02.jpg" alt="Testimonial Image" />
                        <div class="user-comment">
                            <div class="arrow-left"></div>
                            <blockquote cite="#">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent urna magna, rhoncus eget commodo et, dignissim non nulla. Sed sit amet vestibulum ex. Donec dolor velit
                            </blockquote>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="bottom-portion">
                        <a href="#" class="author">
                            Maria B <small>(Student )</small>
                        </a>
                        <div class="social-share-links">
                            <ul>
                                <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-skype" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="single-testimonial-box">
                    <div class="top-portion">
                        <img src="images/testimonial-image-01.jpg" alt="Testimonial Image" />
                        <div class="user-comment">
                            <div class="arrow-left"></div>
                            <blockquote cite="#">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent urna magna, rhoncus eget commodo et, dignissim non nulla. Sed sit amet vestibulum ex. Donec dolor velit
                            </blockquote>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="bottom-portion">
                        <a href="#" class="author">
                            Adrey Pachai <small>(Student )</small>
                        </a>
                        <div class="social-share-links">
                            <ul>
                                <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-skype" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="single-testimonial-box">
                    <div class="top-portion">
                        <img src="images/testimonial-image-02.jpg" alt="Testimonial Image" />
                        <div class="user-comment">
                            <div class="arrow-left"></div>
                            <blockquote cite="#">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent urna magna, rhoncus eget commodo et, dignissim non nulla. Sed sit amet vestibulum ex. Donec dolor velit
                            </blockquote>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="bottom-portion">
                        <a href="#" class="author">
                            Maria B <small>(Student )</small>
                        </a>
                        <div class="social-share-links">
                            <ul>
                                <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-skype" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </section>
    <!-- End: Our Community Section -->




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
<script>
    // Function to get URL parameter
    function getUrlParameter(name) {
        name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
        var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
        var results = regex.exec(location.search);
        return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
    }

    // Check for the 'msg' parameter and show alert if it exists
    var msg = getUrlParameter('msg');
    if (msg === 's') {
        swal('Login Successfully', 'Welcome to Bookly', 'success');
    } else if (msg === 'e') {
        swal('Error', 'An error occurred', 'error');
    }
</script>
<script src="js/jquery1-3.4.1.min.js"></script>
<script src="js/bootstrap1.min.js"></script>


</html>