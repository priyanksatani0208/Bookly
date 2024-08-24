<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OTP Verification</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <link href="css/otp_style.css" rel="stylesheet" type="text/css">
</head>
<body class="container-fluid bg-body-tertiary">
    <div class="row justify-content-center w-100">
        <div class="col-12 col-md-6 col-lg-4">
            <div class="card bg-white mb-5 mt-5 border-0" style="box-shadow: 0 12px 15px rgba(0, 0, 0, 0.02);">
                <div class="card-body p-5 text-center">
                  

                    <h4>Verify</h4>
                    <p>Your code was sent to you via email<br><b>priyanksatani1234@gmail.com</b></p>

                    <div class="otp-field mb-4">
                        <input type="number" />
                        <input type="number" disabled />
                        <input type="number" disabled />                        
                    </div>

                    <a href="thanks.jsp" class="status_btn1">Verify</a>

                    <p class="resend text-muted mb-0">
                        Didn't receive code? <a href="#">Request again</a>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <script src="js/otp_script.js"></script>
</body>
</html>
