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

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="js/html5shiv.min.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->
         <style>
            #heading{
                color: black;            
            }
            .signin-main {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 60vh;
                background-color: #f8f8f8;
                margin-top: 60px;
            }
            .signin-container {
                background-color: #fff;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 0 15px rgba(0,0,0,0.1);
                width: 100%;
                max-width: 400px;
            }
            .signin-container h2 {
                text-align: center;
                margin-bottom: 20px;
            }
            .signin-container .form-row {
                margin-bottom: 15px;
            }
            .signin-container .form-row label {
                display: block;
                margin-bottom: 5px;
            }
            .signin-container .form-row input {
                width: 100%;
                padding: 8px;
                border: 1px solid #ddd;
                border-radius: 4px;
            }
            .signin-container .button {
                width: 100%;
                padding: 10px;
                background-color: #007bff;
                border: none;
                border-radius: 4px;
                color: #fff;
                font-size: 16px;
                cursor: pointer;
            }
            .signin-container .button:hover {
                background-color: #0056b3;
            }
            .signin-container .form-footer {
                text-align: center;
                margin-top: 20px;
            }
            .signin-container .form-footer a {
                color: #007bff;
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
                    <h2>Sign-In</h2>
                    <span class="underline center"></span>
                    <!--<p class="lead">Proin ac eros pellentesque dolor pharetra tempo.</p>-->
                </div>
                <div class="breadcrumb">
                    <ul>
                        <li><a href="index-2.html">Home</a></li>
                        <li>Sign-In</li>
                    </ul>
                </div>
            </div>
        </section>
        <!-- End: Page Banner -->

       <!-- Start: Signin Section -->
        <div class="signin-main">
            <div class="signin-container">
                <h2 id="heading">Sign in</h2>
                <form class="signin" method="post" action="SigninServlet">
                    
                    <label for="uemail">Email <span class="second-letter" style="color:lightcoral;">*</span></label>
                    <div class="form-row input-required">                        
                        <input type="email" id="uemail" name="uemail" class="input-text">
                    </div>

                   <label for="upassword">Password <span class="second-letter"style="color:lightcoral;">*</span></label>
                    <div class="form-row input-required">
                        <input type="password" id="upassword" name="upassword" class="input-text">
                    </div>

                    <div class="form-row">
                        <input type="submit" value="Signin" name="signin" class="button btn btn-default">
                    </div>
                </form>
                <div class="form-footer">
                    
                    <p>Don't have an account? <a href="sign-up.jsp">Sign up</a></p>
                    <p><a href="http://localhost:8080/Bookly_Admin/">&rarr;&nbsp;  Only Use Of Admin</a></p>
                </div>
            </div>
        </div>
        <!-- End: Signin Section -->


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
