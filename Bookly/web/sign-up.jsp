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
    <link href="css/sign-up.css" rel="stylesheet" type="text/css" />   
     
</head>

<body>
    <!-- Start: Header Section -->
    <%@include file="header.jsp" %>
    <!-- End: Header Section -->
    
    <!-- Start: Page Banner -->
    <section class="page-banner services-banner">
        <div class="container">
            <div class="banner-header">
                <h2>Signup</h2>
                <span class="underline center"></span>
                <!--<p class="lead">Proin ac eros pellentesque dolor pharetra tempo.</p>-->
            </div>
            <div class="breadcrumb">
                <ul>
                    <li><a href="index-2.html">Home</a></li>
                    <li>Signup</li>
                </ul>
            </div>
        </div>
    </section>
    <!-- End: Page Banner -->
    
   <!-- Start: Signup Section -->
    <div class="signup-main">
        <div class="signup-container">
            <h2 id="heding">Create New Account</h2>
            <form class="signup" method="post" action="SignupServlet" enctype="multipart/form-data">
                
                <label for="uName">Enter Full Name <span class="second-letter" style="color:lightcoral;">*</span></label>
                <div class="form-row input-required">                    
                    <input type="text" id="uName" name="uName" class="input-text">
                </div>
                
                <label for="uemail">Enter Email <span class="second-letter" style="color:lightcoral;">*</span></label>
                <div class="form-row input-required">                    
                    <input type="email" id="uemail" name="uemail" class="input-text">
                </div>
                
                <label for="uPhone">Enter Phone <span class="second-letter" style="color:lightcoral;">*</span></label>
                <div class="form-row input-required">                    
                    <input type="number" id="uPhone" name="uPhone" class="input-text">
                </div>
                
                <label for="ugender">Gender <span class="second-letter" style="color:lightcoral;">*</span></label>
                <div class="form-row input-required">                    
                    <div class="gender-label">
                        <input type="radio" id="male" name="ugender" value="male">Male
                      <input type="radio" id="female" name="ugender" value="female">Female
                </div>
                    
                </div>
                
                <label for="uAddress">Enter Address <span class="second-letter"style="color:lightcoral;">*</span></label>
                <div class="form-row input-required">                    
                    <input type="text" id="uAddress" name="uAddress" class="input-text" >
                </div>
                                  
                <label for="uabout">About</label>
                <div class="form-row input-required">
                    
                    <textarea id="uabout" name="uabout" class="input-text"></textarea>
                </div>
                
                <label for="uProfile">Profile <span class="second-letter" style="color:lightcoral;">*</span></label>
                <div class="form-row input-required">                    
                    <input type="file" id="uProfile" name="uProfile" class="input-text">
                </div>
                
                <label for="upassword">Enter Password <span class="second-letter"style="color:lightcoral;">*</span></label>
                <div class="form-row input-required">                    
                    <input type="password" id="upassword" name="upassword" class="input-text">
                </div>
                
                <div class="form-row">
                    <input type="submit" value="Signup" name="signup" class="button btn btn-default">
                </div>
            </form>
             <div class="form-footer">
                    <p>have an account? <a href="sign-in.jsp">Sign in</a></p>
             </div>
        </div>
    </div>
    <!-- End: Signup Section -->
    
    
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
