<!DOCTYPE html>
<%@page import="java.util.HashMap" %>
    <% String u_email=(String)session.getAttribute("u_email"); String u_name=(String)session.getAttribute("u_name");
        if(u_email!=null){ %>
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
            <link rel="stylesheet"
                href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
            <meta name="keywords" content="best Insurance comapny in chicago" />
        </head>

        <body>
            <!-- Code for message receiving  -->
            <% String m=(String)session.getAttribute("msg"); if(m!=null){ %>
                <% if(m.contains("success")){ %>
                    <div class="alert alert-success text-center">
                        <% }else{ %>
                            <div class="alert alert-danger text-center">
                                <% } %>
                                    <%=m %>
                            </div>

                            <% session.setAttribute("msg",null); } %>
                                <nav class="navbar navbar-expand-sm sticky-top bg-light">
                                    <a class="navbar-brand c-font" href="">
                                        <img class="navbar-brand c-font" src='resource/autoinsurance-icon.png'
                                            width="30px" /> <span class="text-danger font-weight-bold ">Auto</span><span
                                            class="text-muted">Insurance</span>
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
                                                <a class="nav-link text-secondary" href="UserHome.jsp">Profile</a>
                                            </li>
                                            <li class="nav-item">
                                                <label class="nav-link">
                                                    Welcome: <b>
                                                        <%=u_name %>
                                                    </b>
                                                    <img src='GetPhoto?email=<%=u_email%>&type=user' height='30' />
                                                </label>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link text-secondary"
                                                    href="UserInsurance.jsp">Insurance</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link text-secondary" href="Logout">Logout</a>
                                            </li>
                                        </ul>
                                        <div>
                                            <a class="text-danger h5 mr-3" href="tel:+1-XXXXXXXX">CALL US TODAY: +1-XXXXXXXXX</a>
                                        </div>
                                    </div>
                                </nav>

                                <section class='container p-4'>

                                    <h2>Change Photo</h2>
                                    <form action="ChangePhoto" method="post" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label>User Photo:</label>
                                            <input type="file" accept='.jpg,.png' class="form-control" name="photo"
                                                required>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Change Photo</button>
                                    </form>
                                    <hr />
                                    <h2>Update Basic Details</h2>
                                    <% autoInsurance.DbConnect db=new autoInsurance.DbConnect(); HashMap<String, String>
                                        user_details=db.getUserByEmail(u_email);
                                        %>
                                        <form action="UpdateUserData" method="post">
                                            <div class="form-group">
                                                <label>User Name:</label>
                                                <input type="text" class="form-control" placeholder="Enter name"
                                                    id="name" name="name" value='<%=user_details.get("name")%>'
                                                    required>
                                            </div>
                                            <div class="form-group">
                                                <label>User Phone:</label>
                                                <input type="text" class="form-control" placeholder="Enter Phone"
                                                    id="phone" name="phone" value='<%=user_details.get("phone")%>'
                                                    required>
                                            </div>
                                            <div class="form-group">
                                                <label>User Address:</label>
                                                <textarea rows='3' class="form-control" placeholder="Enter Address"
                                                    name="address" required><%=user_details.get("address")%></textarea>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Update</button>
                                        </form>
                                        <hr />
                                        <h2>Change Password</h2>
                                        <form action="ChangePassword" method="post">
                                            <div class="form-group">
                                                <label>Old Password:</label>
                                                <input type="password" class="form-control"
                                                    placeholder="Enter old password" id="pwd1" name="old_password"
                                                    required>
                                            </div>
                                            <div class="form-group">
                                                <label>New Password:</label>
                                                <input type="password" class="form-control"
                                                    placeholder="Enter new password" id="pwd2" name="new_password"
                                                    required>
                                            </div>
                                            <div class="form-group">
                                                <label>Confirm New Password:</label>
                                                <input type="password" class="form-control"
                                                    placeholder="Confirm new password" id="pwd3" name="confirm_password"
                                                    required>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Change Password</button>
                                        </form>
                                </section>

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
        <% }else{ session.setAttribute("msg","Plz Login!"); response.sendRedirect("index.jsp"); } %>