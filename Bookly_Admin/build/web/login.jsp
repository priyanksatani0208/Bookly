<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Directory</title>
    <link rel="icon" href="img/logo.png" type="image/png">

    <link rel="stylesheet" href="css/bootstrap1.min.css" />
    <link rel="stylesheet" href="css/style1.css" />
    <link rel="stylesheet" href="css/colors/default.css" id="colorSkinCSS">
    <link rel="stylesheet" href="css/login_css.css" />

   
</head>

<body class="crm_body_bg">
    <div class="centered-login-container">
        <div class="login-box">
            <img src="img/users_img.png" alt="User Image">
            <div class="login-content">
                <h1 class="login-title">Admin - Log in</h1><br>
                <form action="LoginServlet" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" name="admin_email" placeholder="Enter your email" required>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" name="admin_password" placeholder="Password" required>
                    </div>
                    <button type="submit" class="btn btn-primary btn-login">Log in</button>
                    <p class="text-center"><br><a href="http://localhost:8080/Bookly/index.jsp">&rarr;&nbsp;Back To User-Side</a></p>
                </form>
            </div>
        </div>
    </div>

    <script src="js/custom.js"></script>
</body>

</html>
