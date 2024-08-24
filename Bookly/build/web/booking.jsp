<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Order Form</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .order-form {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .form-title {
            text-align: center;
            margin-bottom: 20px;
            color: #343a40;
        }
        .btn-custom {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>

<div class="order-form">
    <h2 class="form-title">Book Order Form</h2>
    <form>
        <div class="mb-3">
            <label for="userName" class="form-label">User Name</label>
            <input type="text" class="form-control" id="userName" placeholder="Enter your name">
        </div>

        <div class="mb-3">
            <label for="userEmail" class="form-label">User Email</label>
            <input type="email" class="form-control" id="userEmail" placeholder="Enter your email">
        </div>

        <div class="mb-3">
            <label for="userAddress" class="form-label">User Pickup Address</label>
            <textarea class="form-control" id="userAddress" rows="3" placeholder="Enter your pickup address"></textarea>
        </div>

        <div class="mb-3">
            <label for="userMobile" class="form-label">User Mobile Number</label>
            <input type="tel" class="form-control" id="userMobile" placeholder="Enter your mobile number">
        </div>

        <div class="mb-3">
            <label for="bookName" class="form-label">Book Name</label>
            <input type="text" class="form-control" id="bookName" placeholder="Enter the book name">
        </div>

        <div class="mb-3">
            <label for="bookPrice" class="form-label">Original Book Price</label>
            <input type="number" class="form-control" id="bookPrice" placeholder="Enter the original price">
        </div>

        <div class="mb-3">
            <label for="bookDiscount" class="form-label">Book Discount Percentage</label>
            <input type="number" class="form-control" id="bookDiscount" placeholder="Enter the discount percentage">
        </div>

        <div class="mb-3">
            <label for="discountPrice" class="form-label">Discount Price</label>
            <input type="number" class="form-control" id="discountPrice" placeholder="Enter the discount price">
        </div>      

        <div class="mb-3">
            <label for="paymentMode" class="form-label"disable>Payment Mode  : </label>
               COD
            </select>
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-custom">Order Now</button>
        </div>
    </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Add any additional JavaScript here if needed
</script>
</body>
</html>
