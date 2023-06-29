<!DOCTYPE html>
<html>
    <head>
        <title>Insurance Services HUB</title>
        <link rel="icon" href="resource/autoinsurance-icon.png"/>
        
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
        
        <!-- AOS css and JS -->
        <link rel="stylesheet" href="resource/aos/aos.css">
        <script src="resource/aos/aos.js"></script>
        <!-- AOS css and JS END-->

        <!-- fontawesome -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" >
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <!-- fontawesome END -->

        <!-- Lightbox CSS & Script -->
        <script src="resource/lightbox/ekko-lightbox.js"></script>
        <link rel="stylesheet" href="resource/lightbox/ekko-lightbox.css"/>

        

        <!-- custom css-->
        <link rel="stylesheet" href="resource/custom.css"/>
        <!-- custom css END-->

        <meta name="author" content="Insurance Services HUB"/>
        <meta name="description" content="This is aInsurance website"/>
        <meta name="keywords" content="best Insurance comapny in Chicago"/>
    </head>
    <body>
    	<!-- Code for message receiving  -->
		<%
			String m=(String)session.getAttribute("msg");
			if(m!=null){
		%>
			<div class="alert alert-danger text-center" role="alert">
			  <%=m %>
			</div>
		<%
			session.setAttribute("msg",null);
			}
		%>
		
		<%
			String u_email=(String)session.getAttribute("u_email");
			String u_name=(String)session.getAttribute("u_name");
			if(u_email!=null){
		%>
        <nav class="navbar navbar-expand-sm sticky-top bg-light">
            <a class="navbar-brand c-font" href="">
              <img class="navbar-brand c-font" src='resource/autoinsurance-icon.png' width="40px"/><span class="text-danger font-weight-bold ">Insurance Services</span><span class="text-muted">HUB</span>
            </a>
            <button class="navbar-toggler bg-light" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <!-- <span class="navbar-toggler-icon text-dark"> <i class="fas fa-sort-down"></i> </span> -->
                <span class="fa fa-bars"></span> Menu
            </button>
            <div class="collapse navbar-collapse " id="collapsibleNavbar"  >
              <ul class="navbar-nav mx-auto ">
                <li class="nav-item">
                  <a class="nav-link text-secondary" href="index.jsp">HOME</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link text-secondary" href="UserHome.jsp">Profile</a>
                </li>
                <li class="nav-item">
                	<label class="nav-link"> 
                	Welcome: <b><%=u_name %></b> 
                	<img src='GetPhoto?email=<%=u_email%>&type=user' height='30'/>
                	</label>
                </li>
                <li class="nav-item">
                  <a class="nav-link text-secondary" href="UserInsurance.jsp">Insurance</a>
                </li> 
                <li class="nav-item">
                  <a class="nav-link text-secondary" href="Logout">Logout</a>
                </li>    
              </ul>
              <div >
                  <a class="text-danger h5 mr-3" href="tel:+1-XXXXXXXX">CALL US TODAY: +1-XXXXXXXXX</a>
              </div>
            </div>
        </nav>
        <%}else{ %>
        <nav class="navbar navbar-expand-sm sticky-top bg-light">
            <a class="navbar-brand c-font" href="">
              <img src='resource/autoinsurance-icon.png' width="40px"/> <span class="text-danger font-weight-bold ">Insurance Services</span><span class="text-muted">HUB</span>
            </a>
            <button class="navbar-toggler bg-light" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <!-- <span class="navbar-toggler-icon text-dark"> <i class="fas fa-sort-down"></i> </span> -->
                <span class="fa fa-bars"></span> Menu
            </button>
            <div class="collapse navbar-collapse " id="collapsibleNavbar"  >
              <ul class="navbar-nav mx-auto ">
                <li class="nav-item">
                  <a class="nav-link text-secondary" href="index.jsp">HOME</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link text-secondary" href="" data-toggle="modal" data-target="#adminModal" >Admin</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link text-secondary" href="Company.jsp">Company</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link text-secondary" href="" data-toggle="modal" data-target="#signInModal">User-Sign In</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link text-secondary" href="" data-toggle="modal" data-target="#signUpModal">User-Sign Up</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link text-secondary" href="contact.jsp">CONTACT</a>
                </li>    
              </ul>
              <div >
                  <a class="text-danger h5 mr-3" href="tel:+1-XXXXXXXX">CALL US TODAY: +1-XXXXXXXXX</a>
              </div>
            </div>
        </nav>
        <%} %>
        <section class="c-banner text-white">
            <div class="container">
              <div class="row align-items-center" >
                <div class="col-sm-8">
                  <h1>Accidents Happen. <br/> Be Insured & Be Assured.</h1>
                  <p>
                    <i class="fas fa-check"></i>
                    Very low payment option available
                    <br/>
                    <i class="fas fa-check"></i>
                    Get low quote for the coverage you need
                  </p>
                </div>
                <div class="col-sm-4 bg-danger text-center p-4" data-aos="fade-left" data-aos-duration="1000">
                    <h1>Search Policies</h1>
                    <form action='SearchPolicy.jsp' method="post" >
                      	<b style="font-size:25px;"">Auto</b> <input type="radio" name="category" value='Auto' checked/>
        				<b style="font-size:25px;""> Health </b><input type="radio" name="category" value='Health' /> <br/><br/>
                      	<button class="btn btn-dark w-100 p-3 my-2" name='submit'  type="submit">Search</button>
                    </form>
                </div>
              </div>
            </div>
        </section>
        <section class="c-card">
          <div class="container">
            <div class="row">
              <div class="col-sm-4">
                <div class="card">
                  <i class="far fa-thumbs-up"></i>
                  <h3>Free & Easy To Use</h3>
                  <p>We insure your life.<br>24/7 Online on Life.</p>
                </div>
              </div>
              <div class="col-sm-4">
                <div class="card">
                  <i class="far fa-clock"></i>
                  <h3>Save Time & Money</h3>
                  <p>We are providing best and modern equipment.</p>
                </div>
              </div>
              <div class="col-sm-4">
                <div class="card">
                  <i class="far fa-file-alt"></i>
                  <h3>No Obligation Quote</h3>
                  <p>Taking care of what's important.The power to help you succeed.</p>
                </div>
              </div>
            </div>
          </div>
        </section>
        <section class="my-4">
          <div class="container">
            <div class="row align-items-center">
              <div class="col-md-6">
                <img class="img-fluid" src="resource/i6.jpeg"" alt="" >
              </div>
              <div class="col-md-6">
                  <h2 class="text-uppercase">Pay Less & Get More</h2>
                  <p class="text-justify">
                    Very low payment option available. 
                  </p>
              </div>
            </div>
          </div>
        </section>

        <section class="my-4">
          <div class="container">
            <div class="row align-items-center">
              <div class="col-md-6">
                  <h2 class="text-uppercase">Quality Insurance Leads</h2>
                  <p class="text-justify">
                  Welcome to Insurance Services HUB, the best in the market. You could switch and save money on Insurance.
	                  At The Insurance Services HUB, we believe the honest way must also be the thorough way. So we partner with trusted insurance companies of all shapes and sizes to give you every option possible. </p>
              </div>
              <div class="col-md-6">
                <img class="img-fluid" src="resource/image1.jpg"" alt="" >
              </div>
            </div>
          </div>
        </section>
        <section class="my-4">
          <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <ul class="carousel-indicators">
              <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
              <li data-target="#myCarousel" data-slide-to="1" ></li>
              <li data-target="#myCarousel" data-slide-to="2"></li>
            </ul>
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="resource/slide3.jpg" class="w-100" >
                <div class="carousel-caption">
                  <h3>Image 1</h3>
                </div>   
              </div>
              <div class="carousel-item">
                <img src="resource/i5.jpeg" class="w-100" >
                <div class="carousel-caption">
                  <h3>Image 2</h3>
                </div>    
              </div>
              <div class="carousel-item">
                <img src="resource/i4.jpeg" class="w-100" >
                <div class="carousel-caption">
                  <h3>Image 3</h3>
                </div>   
              </div>
            </div>
            <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
              <!-- <span class="carousel-control-prev-icon"></span> -->
              <i class="fas fa-arrow-left text-danger"></i>
            </a>
            <a class="carousel-control-next" href="#myCarousel" data-slide="next">
              <span class="carousel-control-next-icon"></span>
            </a>
          </div>
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

        <a id="myTopBtn"><i class="fas fa-chevron-circle-up display-4 text-danger"></i></a>

        <!-- Modal Admin login code -->
        <div class="modal fade" id="adminModal"  aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header bg-danger text-white">
                <h3 class="modal-title" >Admin Login</h3>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <form action="ALogin" method="post">
                  <div class="form-group">
                    <label for="email">Admin Email ID:</label>
                    <input type="text" class="form-control" placeholder="Enter admin email id" id="email" name="email" required>
                  </div>
                  <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" class="form-control" placeholder="Enter password" id="pwd" name="password" required>
                  </div>
                  <button type="submit" class="btn btn-primary">Login</button>
                </form>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
        <!-- Modal Sign IN code -->
        <div class="modal fade" id="signInModal"  aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header bg-primary text-white">
                <h3 class="modal-title" >User Login</h3>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <form action="UserLogin" method="post">
                  <div class="form-group">
                    <label for="email">User Email ID:</label>
                    <input type="email" class="form-control" placeholder="Enter User email id" id="email" name="email" required>
                  </div>
                  <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" class="form-control" placeholder="Enter password" id="pwd" name="password" required>
                  </div>
                  <button type="submit" class="btn btn-primary">Login</button>
                </form>
                <a href='ForgetPassword.jsp'>Forget Password?</a>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
        <!-- Modal Sign UP code -->
        <div class="modal fade" id="signUpModal"  aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header bg-success text-white">
                <h3 class="modal-title" >User Registration</h3>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <form action="UserRegister" method="post" enctype="multipart/form-data">
                  <div class="form-group">
                    <label for="email">User Email ID:</label>
                    <input type="email" class="form-control" placeholder="Enter email id" id="email" name="email" required>
                  </div>
                  <div class="form-group">
                    <label for="email">User Name:</label>
                    <input type="text" class="form-control" placeholder="Enter name" id="name" name="name" required>
                  </div>
                  <div class="form-group">
                    <label for="email">User Phone:</label>
                    <input type="text" class="form-control" placeholder="Enter Phone" id="phone" name="phone" required>
                  </div>
                  <div class="form-group">
                    <label for="email">User Address:</label>
                    <textarea rows='3' class="form-control" placeholder="Enter Address" name="address" required></textarea>
                  </div>
                  <div class="form-group">
                    <label for="email">User Photo:</label>
                    <input type="file" class="form-control" name="photo" required>
                  </div>
                  <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" class="form-control" placeholder="Enter password" id="pwd" name="password" required>
                  </div>
                  <button type="submit" class="btn btn-primary">Register</button>
                </form>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
    </body>
    <script>
      AOS.init();

      //script for light box
      $(document).on('click', '[data-toggle="lightbox"]', function(event) {
          event.preventDefault();
          $(this).ekkoLightbox();
      });

      //Script for Scroll to Top button for hide and show
      $(window).scroll(function() {
          if ($(this).scrollTop()) {
              $('#myTopBtn').fadeIn();
          } else {
              $('#myTopBtn').fadeOut();
          }
      });
      //script for scroll to top
      $("#myTopBtn").click(function () {
        $("html, body").animate({scrollTop: 0}, 1000);
      });

      
    </script>
</html>