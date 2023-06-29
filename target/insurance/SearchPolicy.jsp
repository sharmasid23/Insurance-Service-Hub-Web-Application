<!DOCTYPE html>
<%@page import="java.util.HashMap" %>
    <%@page import="java.util.ArrayList" %>
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
            <meta name="keywords" content="best Insurance comapny in Chicago" />
        </head>

        <body>
            <!-- Code for message receiving  -->
            <% String m=(String)session.getAttribute("msg"); if(m!=null){ %>
                <div class="alert alert-danger text-center" role="alert">
                    <%=m %>
                </div>

                <% session.setAttribute("msg",null); } %>
                    <% String u_email=(String)session.getAttribute("u_email"); String
                        u_name=(String)session.getAttribute("u_name"); if(u_email!=null){ %>
                        <nav class="navbar navbar-expand-sm sticky-top bg-light">
                            <a class="navbar-brand c-font" href="">
                                <img class="navbar-brand c-font" src='resource/autoinsurance-icon.png' width="30px" />
                                <span class="text-danger font-weight-bold ">Auto</span><span
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
                                        <a class="nav-link text-secondary" href="UserInsurance.jsp">Insurance</a>
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
                        <%}else{ %>
                            <nav class="navbar navbar-expand-sm sticky-top bg-light">
                                <a class="navbar-brand c-font" href="">
                                    <img src='resource/autoinsurance-icon.png' width="30px" /> <span
                                        class="text-danger font-weight-bold ">Auto</span><span
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
                                            <a class="nav-link text-secondary" href="" data-toggle="modal"
                                                data-target="#adminModal">Admin</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link text-secondary" href="Company.jsp">Company</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link text-secondary" href="" data-toggle="modal"
                                                data-target="#signInModal">User-Sign In</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link text-secondary" href="" data-toggle="modal"
                                                data-target="#signUpModal">User-Sign Up</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link text-secondary" href="contact.jsp">CONTACT</a>
                                        </li>
                                    </ul>
                                    <div>
                                        <a class="text-danger h5 mr-3" href="tel:+1-XXXXXXXXX">CALL US TODAY:
                                            +1-XXXXXXXX</a>
                                    </div>
                                </div>
                            </nav>
                            <%} %>
                                <div class='container p-4'>
                                    <% String category=request.getParameter("category"); 
                                    autoInsurance.DbConnect db=new autoInsurance.DbConnect(); 
                                    ArrayList<HashMap<String, Object>> policies=db.getPoliciesByCategory(category);
                                        for(HashMap<String, Object> policy:policies){
                                            %>
                                            <div class='bg-light p-3'>
                                                <p>
                                                    <% String c_email=(String)policy.get("c_email"); HashMap<String,
                                                        String> company_details=db.getCompanyDetails(c_email);
                                                        %>
                                                        <img src='GetPhoto?email=<%=c_email%>&type=company'
                                                            height='45' />
                                                        Company Name: <b>
                                                            <%=company_details.get("name") %>
                                                        </b>
                                                        Company Phone: <b>
                                                            <%=company_details.get("phone") %>
                                                        </b>
                                                        Company Email: <b>
                                                            <%=c_email %>
                                                        </b>
                                                </p>
                                                <p>
                                                    Policy ID: <b>
                                                        <%=policy.get("pid") %>
                                                    </b><br>
                                                    Policy Name: <b>
                                                        <%=policy.get("p_name") %>
                                                    </b><br>
                                                    Sum Insured Amount: <b>
                                                        <%=policy.get("p_si_amt") %>
                                                    </b><br>
                                                    Description: <b>
                                                        <%=policy.get("p_desc") %>
                                                    </b>
                                                <form action='BuyPolicy.jsp' method='post'>
                                                    <input type="hidden" name="pid" id="pid" value='<%= policy.get("pid") %>'/>
                                                    <button class='btn btn-success' type='submit'>Buy Now</button>
                                                    <hr>
                                                </form>
                                                </p>
                                            </div>
                                            <% } %>
                                                <hr>
                                                <a href="index.jsp" style="font-size:40px;font-family:arial">Back</a>
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