<%@page import="java.util.List"%>
<%@page import="com.entities.Books"%>
<%@page import="com.dao.Booksdao"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@ page import="com.dao.Categorydao" %>
<%@ page import="com.entities.Category" %>

<%
    Booksdao booksDao = new Booksdao(ConnectionProvider.getConnection());
    Categorydao categorydao = new Categorydao(ConnectionProvider.getConnection());

    String selectedCategoryId = request.getParameter("categoryId");
    List<Books> booksList;

    if (selectedCategoryId != null && !selectedCategoryId.isEmpty()) {
        booksList = booksDao.getBooksByPage(0, 10,selectedCategoryId);
        booksList = booksDao.getBooksByCategory(Integer.parseInt(selectedCategoryId)); // Assuming getBooksByCategory method exists
    } else {
        booksList = booksDao.getBooksByPage(0, 10,null); // Default list
    }

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

        <!-- Accordion Stylesheet -->
        <link rel="stylesheet" type="text/css" href="css/jquery.accordion.css">

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
                    <h2>Books</h2>
                    <span class="underline center"></span>
                    <p class="lead">Proin ac eros pellentesque dolor pharetra tempo.</p>
                </div>
                <div class="breadcrumb">
                    <ul>
                        <li><a href="index-2.html">Home</a></li>
                        <li>Books</li>
                    </ul>
                </div>
            </div>
        </section>
        <!-- End: Page Banner -->

        <!-- Start: Products Section -->
        <div id="content" class="site-content">
            <div id="primary" class="content-area">
                <main id="main" class="site-main">
                    <div class="books-media-gird">
                        <div class="container">
                            <div class="row">
                                <!-- Start: Search Section -->
                                <section class="search-filters">
                                    <div class="container">                                        
                                        <br><br><center><h1>Books</h1></center>

                                    </div>
                                </section>
                                <!-- End: Search Section -->
                            </div>
                            <div class="row">
                                <div class="col-md-9 col-md-push-3">
                                    <div class="books-gird">
                                        <ul class="row" id="book-display-container">
                                            <%                                                for (Books book : booksList) {
                                            %>
                                            <li class="col-md-4">
                                                <a href="books-media-detail-v2.jsp?bookId=<%= book.getBookId()%>" style="text-decoration: none; color: inherit;">
                                                    <div class="card-deck">
                                                        <div class="card shadow-sm" style="max-width: 200px; max-height: 450px; border-radius: 10px; overflow: hidden;">
                                                            <img src="http://localhost:8080/Bookly_Admin/books_img/<%= book.getBookImg()%>" class="card-img-top" alt="<%= book.getBookName()%>" style="width: 100%; height: 278px; object-fit: cover;">
                                                            <div class="card-body" style="padding: 15px; text-align: center;">
                                                                <h6 class="card-title" style="font-size: 1.2em; margin-bottom: 10px;"><%= book.getBookName()%></h6>
                                                                <p class="card-text">
                                                                    <!-- Rating stars -->
                                                                    <span style="color: gold; font-size: 1.2em;">
                                                                        &#9733; &#9733; &#9733; &#9733; &#9734;
                                                                    </span>
                                                                    <br>
                                                                    <!-- Calculate Discounted Price -->
                                                                    <%
                                                                        double discountedPrice = book.getBookPrice() - (book.getBookPrice() * book.getBookDiscount() / 100.0);
                                                                    %>
                                                                    <!-- Prices and Discount on one line -->
                                                                    <span style="font-weight: bold; font-size: 1.3em;">&#8377;<%= discountedPrice%></span> <!-- Discounted Price -->
                                                                    <span style="text-decoration: line-through; color: gray; font-size: 1.0em;">&#8377;<%= book.getBookPrice()%></span> <!-- Original Price -->
                                                                    <span style="color: red; font-size: 0.9em;">(<%= book.getBookDiscount()%>% Off)</span> <!-- Discount Percentage -->
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </li>
                                            <% }%>
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
                                <div class="col-md-3 col-md-pull-9">
                                    <aside id="secondary" class="sidebar widget-area" data-accordion-group>

                                        <!-- Category Checkboxes -->
                                        <div class="widget widget_related_search open" data-accordion>
                                            <h4 class="widget-title" data-control>Categories</h4>
                                            <div data-content>
                                                <div class="widget_categories">
                                                    <ul>
                                                        <% for (Category category : categoryList) {%>
                                                        <li>
                                                            <label>
                                                                <a href="?categoryId=<%= category.getCatId()%>" class="category-link" data-category-id="<%= category.getCatId()%>"><%= category.getCatName()%></a>
                                                            </label>
                                                        </li>
                                                        <% }%>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>


                                        <!-- Price Range -->
                                        <div class="widget widget_related_search open" data-accordion>
                                            <h4 class="widget-title" data-control>Price Range</h4>
                                            <div data-content>
                                                <input type="range" id="priceRange" name="priceRange" min="100" max="1000" value="100" oninput="updatePriceValue(this.value)">
                                                <p>Price: Rs <span id="priceValue">100</span></p>
                                                <script>
                                                    function updatePriceValue(value) {
                                                        document.getElementById('priceValue').textContent = value;
                                                    }
                                                </script>
                                            </div>
                                        </div>

                                        <!-- Language Checkboxes -->
                                        <div class="widget widget_related_search open" data-accordion>
                                            <h4 class="widget-title" data-control>Languages</h4>
                                            <div data-content>
                                                <div class="widget_categories">
                                                    <ul>
                                                        <li><label><input type="checkbox" name="language" value="English"> English</label></li>
                                                        <li><label><input type="checkbox" name="language" value="Spanish"> Hindi</label></li>
                                                        <li><label><input type="checkbox" name="language" value="French"> French</label></li>
                                                        <li><label><input type="checkbox" name="language" value="German"> German</label></li>
                                                        <li><label><input type="checkbox" name="language" value="Chinese"> Chinese</label></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>

                                    </aside>
                                </div>

                            </div>
                        </div>


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

        <script>
        document.addEventListener('DOMContentLoaded', function () {
            const links = document.querySelectorAll('.category-link');

            links.forEach(link => {
                link.addEventListener('click', function (event) {
                    event.preventDefault(); // Prevent the default link behavior

                    const categoryId = this.getAttribute('data-category-id');
                    console.log('Category ID:', categoryId); // Log the ID

                    const url = "?categoryId=".concat(categoryId);
                    console.log('Fetch URL:', url); // Log the URL

                    fetch(url)
                            .then(response => response.text())
                            .then(data => {
                                console.log('Response Data:', data); // Log the response

                                const parser = new DOMParser();
                                const doc = parser.parseFromString(data, 'text/html');
                                const newBookList = doc.querySelector('#book-display-container');

                                if (newBookList) {
                                    document.getElementById('book-display-container').innerHTML = newBookList.innerHTML;
                                } else {
                                    console.error('Error: #book-display-container not found in the response.');
                                }
                            })
                            .catch(error => console.error('Error fetching books:', error));
                });
            });
        });

        </script>


    </body>


</html>