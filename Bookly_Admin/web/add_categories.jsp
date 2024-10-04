<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Add Categories</title>
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
                    <div class="col-12">
                        <div class="QA_section">
                            <div class="white_box_tittle list_header d-flex align-items-center justify-content-between">
                                <h4>Add Category</h4>                       
                            </div>
                            <div class="QA_table mb_30">
                                <form action="CategoryServlet" method="POST" enctype="multipart/form-data">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="categoryName">Category Name</label>
                                                <input type="text" class="form-control" id="categoryName" name="catName" required>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="categoryImg">Category Image</label>
                                                <input type="file" class="form-control" id="categoryImg" name="catImg" required>
                                            </div>
                                        </div>
                                        <div class="col-12 text-center">
                                            <br><br> <button type="button" onclick="window.history.back()" class="btn btn-primary">Cancel</button>  <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
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
            if (msg === 's') {
                document.write("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'><\/script><script>Swal.fire({icon: 'success', title: 'Add Category successfully', toast: true, position: 'top-end', showConfirmButton: false, timer: 3000, timerProgressBar: true, didOpen: (toast) => {toast.onmouseenter = Swal.stopTimer; toast.onmouseleave = Swal.resumeTimer;}});<\/script>"); 
            } else if (msg === 'e') {
                
                document.write("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'><\/script><script>Swal.fire({icon: 'error', title: 'An error occurred', toast: true, position: 'top-end', showConfirmButton: false, timer: 3000, timerProgressBar: true, didOpen: (toast) => {toast.onmouseenter = Swal.stopTimer; toast.onmouseleave = Swal.resumeTimer;}});<\/script>"); 
            }
        </script>

        <script src="js/jquery1-3.4.1.min.js"></script>
        <script src="js/bootstrap1.min.js"></script>


    </body>
</html>
