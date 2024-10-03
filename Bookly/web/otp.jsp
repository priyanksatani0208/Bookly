<%@page import="com.entities.User"%>
<%
    // Fetch the current user from the session
    User user = (User) session.getAttribute("currentUser");
    String userEmail = user != null ? user.getUemail() : "Not Available"; // Fetch user email, or set a default
%>
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
                margin-bottom: 30px; /* Center the image horizontally */
                display: block; /* Ensure the image is a block-level element for proper centering */
            }

            /* Loader Styles */
            .loader {
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                display: none; /* Hide the loader by default */
            }

            .loader div {
                width: 40px;
                height: 40px;
                border: 4px solid rgba(255, 0, 0, 0.5);
                border-top: 4px solid #f00;
                border-radius: 50%;
                animation: spin 1s linear infinite;
            }

            @keyframes spin {
                0% {
                    transform: rotate(0deg);
                }
                100% {
                    transform: rotate(360deg);
                }
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

                    <h6>Please enter the one-time password <br> to verify your account</h6>
                    <div>
                        <span>A code has been sent to</span>
                        <small><%= userEmail.replaceAll("(?<=.{3}).(?=.*@)", "*")%></small> <!-- Masking part of the email -->
                    </div>
                    <!-- OTP Input Form -->
                    <form id="otp-form" action="OtpServlet" method="POST" >
                        <div id="otp" class="inputs d-flex flex-row justify-content-center mt-2"> 
                            <input type="hidden" name="uid" value="<%= user.getuId()%>"> <!-- Pass user ID here -->

                            <input class="m-2 text-center form-control rounded" type="text" id="first" maxlength="1" name="otp1" required />
                            <input class="m-2 text-center form-control rounded" type="text" id="second" maxlength="1" disabled name="otp2" />
                            <input class="m-2 text-center form-control rounded" type="text" id="third" maxlength="1" disabled name="otp3" />
                            <input class="m-2 text-center form-control rounded" type="text" id="fourth" maxlength="1" disabled name="otp4" />
                        </div>
                        <div class="mt-4"> 
                            <button type="submit" class="btn btn-danger px-4 validate">Validate</button> 
                        </div>
                    </form>

                    <div class="mt-3">
                        <a href="otp.jsp" class="resend-otp">Resend OTP</a>
                    </div>
                </div>
            </div>
        </div>

        

        <script>
            document.addEventListener("DOMContentLoaded", function (event) {
                const first = document.getElementById("first");
                const second = document.getElementById("second");
                const third = document.getElementById("third");
                const fourth = document.getElementById("fourth");

                first.addEventListener('input', function () {
                    if (first.value) {
                        second.disabled = false;
                        second.focus();
                    } else {
                        second.disabled = true;
                        third.disabled = true;
                        fourth.disabled = true;
                    }
                });

                second.addEventListener('input', function () {
                    if (second.value) {
                        third.disabled = false;
                        third.focus();
                    } else {
                        third.disabled = true;
                        fourth.disabled = true;
                    }
                });

                third.addEventListener('input', function () {
                    if (third.value) {
                        fourth.disabled = false;
                        fourth.focus();
                    } else {
                        fourth.disabled = true;
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
                            if (index < 3) { // Adjust the condition for 4 OTP digits
                                inputs[index + 1].disabled = true;
                            }
                        }
                    });
                });
            });
        </script>
    </body>

</html>
