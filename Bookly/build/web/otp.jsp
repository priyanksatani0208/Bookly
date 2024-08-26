<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OTP Verification</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/otp_style.css" rel="stylesheet" type="text/css">
    <style>
        /* Custom styling for the logo */
        .logo-container img {
            max-width: 150px; /* Adjust width to medium-small size */
            max-height: 150px; /* Adjust height to keep the aspect ratio */
            margin-bottom:30px;;  /*Center the image horizontally*/ 
            display: block; /* Ensure the image is a block-level element for proper centering */
        }
    </style>
</head>

<body>
    <div class="container height-100 d-flex justify-content-center align-items-center">
        <div class="position-relative">
            <div class="card p-2 text-center">
                <!-- Centered Bookly Logo -->
                <div class="logo-container mb-3">
                    <img src="images/white bookly logo.png" alt="Bookly Logo" class="img-fluid">
                </div>
                
                <h6>Please enter the one time password <br> to verify your account</h6>
                <div> <span>A code has been sent to</span> <small>pri*******23@gmail.com</small> </div>
                <div id="otp" class="inputs d-flex flex-row justify-content-center mt-2"> 
                    <input class="m-2 text-center form-control rounded" type="text" id="first" maxlength="1" />
                    <input class="m-2 text-center form-control rounded" type="text" id="second" maxlength="1" disabled />
                    <input class="m-2 text-center form-control rounded" type="text" id="third" maxlength="1" disabled /> 
                </div>
                <div class="mt-4"> 
                    <button class="btn btn-danger px-4 validate">Validate</button> 
                </div>
                <div class="mt-3">
                    <a href="thanks.jsp" class="resend-otp">Resend OTP</a>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function (event) {

            const first = document.getElementById("first");
            const second = document.getElementById("second");
            const third = document.getElementById("third");

            first.addEventListener('input', function () {
                if (first.value) {
                    second.disabled = false;
                    second.focus();
                } else {
                    second.disabled = true;
                    third.disabled = true;
                }
            });

            second.addEventListener('input', function () {
                if (second.value) {
                    third.disabled = false;
                    third.focus();
                } else {
                    third.disabled = true;
                }
            });

            // Functionality for handling backspace and auto-focusing
            const inputs = document.querySelectorAll('#otp > *[id]');
            inputs.forEach((input, index) => {
                input.addEventListener('keydown', function (event) {
                    if (event.key === "Backspace") {
                        input.value = '';
                        if (index !== 0) {
                            inputs[index - 1].focus();
                        }
                        if (index < 2) {
                            inputs[index + 1].disabled = true;
                        }
                    }
                });
            });
        });
    </script>
</body>
</html>
