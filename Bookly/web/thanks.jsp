<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Thank You</title>
	<link href='https://fonts.googleapis.com/css?family=Lato:300,400|Montserrat:700' rel='stylesheet' type='text/css'>
	<style>
		@import url(//cdnjs.cloudflare.com/ajax/libs/normalize/3.0.1/normalize.min.css);
		@import url(//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css);

		/* Additional styling for buttons */
		.button-group {
			margin-top: 20px;
			display: flex;
			justify-content: center;
			gap: 15px;
		}

		.button-group a, .button-group button {
			padding: 10px 20px;
			font-size: 16px;
			border-radius: 5px;
			text-decoration: none;
			display: inline-block;
			cursor: pointer;
		}

		/* Image styling */
		.main-content__image {
			width: 100px;
			height: 100px;
			display: block;
			margin: 0 auto 20px;
		}

		
	</style>
	<link rel="stylesheet" href="https://2-22-4-dot-lead-pages.appspot.com/static/lp918/min/default_thank_you.css">
	<script src="https://2-22-4-dot-lead-pages.appspot.com/static/lp918/min/jquery-1.9.1.min.js"></script>
	<script src="https://2-22-4-dot-lead-pages.appspot.com/static/lp918/min/html5shiv.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.min.js"></script>
</head>
<body>
	<header class="site-header" id="header">
		<h1>Thank you for your order!</h1>
	</header>

	<div class="main-content" id="invoice-content">            
		<!-- Replace the checkmark icon with an image -->
                <img src="images/correct.png" alt="Order Confirmed" class="main-content__image" />
		<p class="main-content__body" data-lead-id="main-content-body">Your order will be delivered in 2-3 working days! Don't hesitate to contact us at support@bookly.com.</p>
		
		
		
		<!-- Buttons Section -->
		<div class="button-group">			
			<a href="#" class="feedback">Leave Feedback</a>
                        <a id="download-invoice" class="feedback">Download Invoice</a>
			<a href="#" class="home">Back to Home</a>
		</div>
                
              
	</div>


</body>
</html>
