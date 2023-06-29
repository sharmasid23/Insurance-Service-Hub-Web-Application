<!DOCTYPE html>
<%@page import="java.util.HashMap"%>
<%
	String c_email=(String)session.getAttribute("c_email");
	String c_name=(String)session.getAttribute("c_name");
	if(c_email!=null){
%>
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
        <meta name="description" content="This is a Auto Insurance website"/>
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
        <nav class="navbar navbar-expand-sm sticky-top bg-light">
            <a class="navbar-brand c-font" href="">
              <img class="navbar-brand c-font" src='resource/autoinsurance-icon.png' width="30px"/> <span class="text-danger font-weight-bold ">Insurance Services</span><span class="text-muted">HUB</span>
            </a>
            <button class="navbar-toggler bg-light" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <!-- <span class="navbar-toggler-icon text-dark"> <i class="fas fa-sort-down"></i> </span> -->
                <span class="fa fa-bars"></span> Menu
            </button>
            <div class="collapse navbar-collapse " id="collapsibleNavbar"  >
              <ul class="navbar-nav mx-auto ">
                <li class="nav-item">
                  <a class="nav-link text-secondary" href="CompanyHome.jsp">HOME</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link text-secondary" href="CompanyPolicies.jsp">All Policies</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link text-secondary" href="UserPolicies.jsp">Users</a>
                </li>
                <li class="nav-item">
                	<label class="nav-link"> Welcome: <b><%=c_name %></b> </label>
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
        
        <section class='container p-4'>
        		<div class='bg-warning p-2'>
	        		<%
	        		autoInsurance.DbConnect db=new autoInsurance.DbConnect();
	        		HashMap<String, String> company_details=db.getCompanyDetails(c_email);
	        		db.disconnect();
	        		String status=company_details.get("status");
	        		%>
        			<p style="font-size:30px;">Company Status: <B><%=status %></B> </p>
        		</div>
        		<%
        		if(!status.equalsIgnoreCase("pending") && !status.equalsIgnoreCase("deactivate")){
        		%>
        			<br/><br/>
        			<h2>Add Policy</h2>
        			<form action='AddPolicy' method="post">
        				<div class="form-group">
		                  <label >Policy Name:</label>
		                  <input type="text" class="form-control" placeholder="Enter name" id="p_name" name="p_name" required>
		                </div>
		                <div class="form-group">
		                  <label >SumInsured Amount:</label>
		                  <input type="number" class="form-control" placeholder="Enter amount" id="p_si_amt" name="p_si_amt" required>
		                </div>
		                <div class="form-group">
		                  <label >Category:</label><br>
		                  Auto <input type="radio" class="form-control" name="category" value='Auto' checked>
		                  Health <input type="radio" class="form-control" name="category" value='Health' checked>
		                </div>
		                <div class="form-group">
		                  <label >Policy Description:</label>
		                  <textarea rows='3' class="form-control" placeholder="Enter Policy Description" name="p_desc" required></textarea>
		                </div>
		                <button type="submit" class="btn btn-primary">ADD</button>
        			</form>
        			
        		<%	
        		}
        		%>
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
<% 
	}else{
		session.setAttribute("msg","Plz Login!");
		response.sendRedirect("Company.jsp");
	}
%>