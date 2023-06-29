<!DOCTYPE html>
<html>

<head>
    <title>Insurance Services HUB</title>
    <link rel="icon" href="resource/autoinsurance-icon.png" />

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>

    <!-- AOS css and JS -->
    <link rel="stylesheet" href="resource/aos/aos.css">
    <script src="resource/aos/aos.js"></script>
    <!-- AOS css and JS END-->

    <!-- fontawesome -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <!-- fontawesome END -->

    <!-- Lightbox CSS & Script -->
    <script src="resource/lightbox/ekko-lightbox.js"></script>
    <link rel="stylesheet" href="resource/lightbox/ekko-lightbox.css" />



    <!-- custom css-->
    <link rel="stylesheet" href="resource/custom.css" />
    <!-- custom css END-->

    <meta name="author" content="Insurance Services HUB" />
    <meta name="description" content="This is a Auto Insurance website" />
    <meta name="keywords" content="best Insurance comapny in Chicago" />
</head>

<body>
    <!-- Code for message receiving  -->
    <% String m=(String)session.getAttribute("msg"); if(m!=null){ %>
        <div class="alert alert-danger text-center" role="alert">
            <%=m %>
        </div>

        <% session.setAttribute("msg",null); } %>
            <nav class="navbar navbar-expand-sm sticky-top bg-light">
                <a class="navbar-brand c-font" href="">
                    <img class="navbar-brand c-font" src='resource/autoinsurance-icon.png' width="30px" /> <span
                        class="text-danger font-weight-bold ">Auto</span><span class="text-muted">Insurance</span>
                </a>
                <button class="navbar-toggler bg-light" type="button" data-toggle="collapse"
                    data-target="#collapsibleNavbar">
                    <!-- <span class="navbar-toggler-icon text-dark"> <i class="fas fa-sort-down"></i> </span> -->
                    <span class="fa fa-bars"></span> Menu
                </button>
                <div class="collapse navbar-collapse " id="collapsibleNavbar">
                    <ul class="navbar-nav mx-auto ">
                        <li class="nav-item">
                            <a class="nav-link text-secondary" href="index.jsp">HOME</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-secondary" href="contact.jsp">Contact</a>
                        </li>
                    </ul>
                    <div>
                        <a class="text-danger h5 mr-3" href="tel:+1-XXXXXXXX">CALL US TODAY: +1-XXXXXXXXX</a>
                    </div>
                </div>
            </nav>
            <div class='container p-4'>
                <div class='row'>
                    <div class='col-sm-12 bg-light p-4'>
                        <h4>Enter Registered Email ID:</h4>
                        <hr />
                        <form action="ForgetPass" method="post">
                            <div class="form-group">
                                <label>Email ID:</label>
                                <input type="email" class="form-control" placeholder="Enter your registered email id"
                                    id="email" name="email" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>


            <footer class="bg-dark p-4">
                <p class="text-white">
                    <a href="#">Insurance Services HUB</a> &copy; Rights
                    reserved
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    Social Media:
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    &nbsp;
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    &nbsp;
                    <a href="#"><i class="fab fa-linkedin"></i></a>
                    &nbsp;
                    <a href="#"><i class="fab fa-youtube"></i></a>
                    &nbsp;
                    <a href="#"><i class="fab fa-twitter"></i></a>
                </p>
            </footer>


</body>

</html>