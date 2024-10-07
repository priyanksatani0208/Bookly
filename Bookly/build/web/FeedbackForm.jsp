<%@page import="com.dao.Feedbackdao"%>
<%@page import="com.entities.Feedback"%>
<%

    User user = (User) session.getAttribute("currentUser");
    Integer bookId = Integer.parseInt(request.getParameter("bookId"));

%>

<!DOCTYPE html>
<html lang="zxx">
    <head>        
        <!-- Meta -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1">

        <!-- Title -->
        <title>Bookly - Feedback</title>

        <!-- Favicon -->
        <link href="images/favicon.ico" rel="icon" type="image/x-icon" />

        <!-- Fonts -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />

        <!-- Stylesheet -->
        <link href="style.css" rel="stylesheet" type="text/css" />
        <link href="css/check_out_shop.css" type="text/css" rel="stylesheet" media="all">
        <link href="css/checkout.css" type="text/css" rel="stylesheet" media="all">
        <link href="css/check_out_style.css" type="text/css" rel="stylesheet" media="all">
        <link href="css/font-awesome.css" rel="stylesheet">

        <!-- online-fonts -->
        <link href="//fonts.googleapis.com/css?family=Merriweather+Sans:300,300i,400,400i,700,700i,800,800i" rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
        <!-- //online-fonts -->

        <style>
            .feedback-section {
                padding: 50px 30px;
                margin: 50px 0;
                background-color: #f1f1f1;
                border-radius: 8px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                max-width: 600px;
                margin: auto;
                font-family: 'Roboto', sans-serif;
                margin-top: 20px;
                margin-bottom: 20px;
            }

            .feedback-section h2 {
                margin-bottom: 20px;
                text-align: center;
                font-weight: 700;
                color: #333;
            }

            .feedback-section p {
                text-align: center;
                color: #666;
                margin-bottom: 20px;
            }

            .rating {
                display: flex;
                justify-content: center;
                gap: 10px;
            }

            .rating input[type="radio"] {
                display: none;
            }

            .rating label {
                font-size: 3.0em;
                color: #ddd;
                cursor: pointer;
                transition: color 0.3s;
            }

            .rating label:hover ~ label,
            .rating label:hover,
            .rating input[type="radio"]:checked ~ label {
                color: #f1c40f;
            }

            .review {
                margin: 20px 0;
            }

            .review textarea {
                width: 100%;
                padding: 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
                resize: vertical;
            }

            #charCount {
                display: block;
                text-align: right;
                color: #666;
                margin-top: 5px;
            }

            button {
                display: block;
                width: 100%;
                background-color: #007bff;
                color: white;
                padding: 12px;
                border: none;
                border-radius: 4px;
                font-size: 1.2em;
                font-weight: bold;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            button:hover {
                background-color: #0056b3;
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
                    <h2>Feedback</h2>
                    <span class="underline center"></span>
                </div>
                <div class="breadcrumb">
                    <ul>
                        <li><a href="index.html">Home</a></li>
                        <li>Dashboard</li>
                    </ul>
                </div>
            </div>
        </section>
        <!-- End: Page Banner -->

        <!-- Feedback Form Section -->
        <div id="content" class="site-content">
            <div id="home">
                <section class="feedback-section">
                    <h2>We Value Your Feedback!</h2>
                    <p>Let us know how your experience was. Your feedback helps us improve.</p>

                    <form id="FeedbackServlet" method="post" action="FeedbackServlet" onsubmit="showThankYouMessage()">
                        <input type="hidden" name="cust_id" value="<%= user.getuId()%>">
                        <input type="hidden" name="bookId" value="<%= bookId%>">

                        <div class="rating">
                            <input type="radio" name="rating" value="5" id="rating5">
                            <label for="rating5" class="fa fa-star" title="Excellent"></label>

                            <input type="radio" name="rating" value="4" id="rating4">
                            <label for="rating4" class="fa fa-star" title="Very Good"></label>

                            <input type="radio" name="rating" value="3" id="rating3">
                            <label for="rating3" class="fa fa-star" title="Good"></label>

                            <input type="radio" name="rating" value="2" id="rating2">
                            <label for="rating2" class="fa fa-star" title="Fair"></label>

                            <input type="radio" name="rating" value="1" id="rating1" required>
                            <label for="rating1" class="fa fa-star" title="Poor"></label>
                        </div>

                        <div class="review">
                            <label for="review">Your Review:</label>
                            <textarea id="review" name="review" rows="5" placeholder="Write your review here..." required maxlength="500" oninput="updateCounter()"></textarea>
                            <small id="charCount">500 characters remaining</small>
                        </div>

                        <button type="submit">Submit Feedback</button>
                    </form>
                </section>

                <!-- Start: Footer -->
                <%@include file="footer.jsp" %>
                <!-- End: Footer -->

                <!-- Scripts -->
                <script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
                <script type="text/javascript" src="js/bootstrap.min.js"></script>
                
                <!-- Character Counter Script -->
                <script>
                    function updateCounter() {
                        const textarea = document.getElementById('review');
                        const maxChars = textarea.getAttribute('maxlength');
                        const currentChars = textarea.value.length;
                        document.getElementById('charCount').textContent = `${maxChars - currentChars} characters remaining`;
                    }

                    function showThankYouMessage() {
                        alert("Thank you for your feedback!");
                    }
                </script>
            </div>
        </div>
    </body>
</html>
