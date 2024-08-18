<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.entities.User"%>
<%--<%@page import="com.dao.UserDao"%>--%>
<%@page errorPage="error_400.jsp" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Change Password</title>
        <link rel="stylesheet" href="css/bootstrap1.min.css" />
        <link rel="stylesheet" href="css/style1.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    </head>

    <body class="crm_body_bg">

        <!-- Header -->
        <%@include file="header.jsp" %>
        <!-- Header End -->

        <!-- Main Content -->
        <div class="main_content_iner ">
            <div class="container-fluid p-0">
                <div class="row justify-content-center">
                    <div class="col-lg-6 col-md-8 col-sm-10 col-12">
                        <div class="QA_section">
                            <div class="white_box_tittle list_header text-center">
                                <h2>Change Password</h2>
                            </div>
                            <div class="QA_table mb_30">
                                <form action="ChangePasswordServlet" method="POST">
                                    <div class="form-group">
                                        <label for="currentPassword">Current Password</label>
                                        <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="newPassword">New Password</label>
                                        <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="confirmPassword">Confirm Password</label>
                                        <input type="password" class="form-control" id="confirmPassword" name="confirmNewPassword" required>
                                    </div>
                                    <div class="text-center">
                                        <br><br> <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <%@include file="footer.jsp" %>
        <!-- Footer End -->

        <script src="js/jquery1-3.4.1.min.js"></script>
        <script src="js/bootstrap1.min.js"></script>
        <script src="js/custom.js"></script>
        <script>
            // Function to get URL parameter
            function getUrlParameter(name) {
                name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
                var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
                var results = regex.exec(location.search);
                return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
            }

            // Check for the 'msg' parameter and show alert if it exists
            var msg = getUrlParameter('msg');
             if (msg === 's') 
           {
               document.write("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'><\/script><script>Swal.fire({icon: 'success', title: 'Update successfully', toast: true, position: 'top-end', showConfirmButton: false, timer: 3000, timerProgressBar: true, didOpen: (toast) => {toast.onmouseenter = Swal.stopTimer; toast.onmouseleave = Swal.resumeTimer;}});<\/script>"); 
           }
           else if (msg === 'e') 
           { 
               document.write("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'><\/script><script>Swal.fire({icon: 'error', title: 'Error', text: 'An error occurred', toast: true, position: 'top-end', showConfirmButton: false, timer: 3000, timerProgressBar: true, didOpen: (toast) => {toast.onmouseenter = Swal.stopTimer; toast.onmouseleave = Swal.resumeTimer;}});<\/script>"); 
           }        </script>

        <script src="js/jquery1-3.4.1.min.js"></script>
        <script src="js/bootstrap1.min.js"></script>
    </body>
</html>
