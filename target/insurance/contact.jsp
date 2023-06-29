<!DOCTYPE html>
<html>

<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

<head>
    <title>Insurance Services HUB</title>
    <link rel="icon" href="resource/autoinsurance-icon.png" />

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
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


    <!-- custom css-->
    <link rel="stylesheet" href="resource/custom.css" />
    <!-- custom css END-->

    <meta name="author" content="Insurance Services HUB" />
    <meta name="description" content="This is a Auto Insurance website" />
    <meta name="keywords" content="best Insurance comapny in Chicago" />
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
        <a class="navbar-brand c-font" href="index.html">
            <img src='resource/autoinsurance-icon.png' width="40px" /> <span
                class="text-danger font-weight-bold ">Insurance Services</span><span class="text-muted">HUB</span>
        </a>
        <button class="navbar-toggler bg-light" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
            <!-- <span class="navbar-toggler-icon text-dark"> <i class="fas fa-sort-down"></i> </span> -->
            <span class="fa fa-bars"></span> Menu
        </button>
        <div class="collapse navbar-collapse " id="collapsibleNavbar">
            <ul class="navbar-nav mx-auto ">
                <li class="nav-item">
                    <a class="nav-link text-secondary" href="index.jsp">HOME</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-secondary" href="contact.jsp">CONTACT</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-secondary" href="Patners.jsp">Our Patners</a>
                </li>
            </ul>
            <div>
                <a class="text-danger h5 mr-3" href="tel:+1-XXXXXXXX">CALL US TODAY: +1-XXXXXXXXX</a>
            </div>
        </div>
    </nav>
    <section class="my-5">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6" data-aos="fade-right" data-aos-duration="1000">
                    <img class="img-fluid" src="resource/incontact.jpeg" alt="" >
              </div>
              <div class=" col-md-6">
                    <p><i class="fas fa-map-marker-alt"></i>10 W 35th St, Chicago, IL 60616</p>
                    <p><i class="fas fa-mobile-alt"></i> (312) 567-3000</p>
                    <p><i class="fas fa-envelope"></i> insuranceserviceshub@gmail.com</p>
                    <hr />
                    <h5>Please send us your thoughts and suggestions. Thank You!</h5>
                    <form method="post" action="SubmitReview">
                        <div class="form-group">
                            <input class="form-control" type="text" id="Name" name="Name" pattern="[a-z A-Z]+" placeholder="NAME"
                                required />
                        </div>
                        <div class="form-group">
                            <input class="form-control" type="text" id="Email" name="Email" placeholder="EMAIL" required />
                        </div>
                        <div class="form-group">
                            <input class="form-control" type="text" id="Phone" name="Phone" placeholder="PHONE" required />
                        </div>
                        <div class="form-group">
                            <input class="form-control" type="text" id="ZipCode" name="ZipCode" pattern="[0-9]+"
                                placeholder="ZIP CODE" required />
                        </div>
                        <div class="form-group">
                            <input class="form-control" type="text" id="type1" name="type1" pattern="[a-z A-Z]+"
                                placeholder="What Type of Insurance are you intrested in?(Health/Auto)" required />
                        </div>
                        <div class="form-group">
                            <input class="form-control" type="text" id="input" name="input" pattern="[a-z A-Z]+"
                                placeholder="Your Review" required />
                        </div>
                        <button class="btn btn-dark w-100 p-3 my-2" name='submit' type="submit">Send</button>
                        <button class="btn btn-dark w-100 p-3 my-2" type="reset">Reset</button>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <section class="my-5">
            <!-- Async script executes immediately and must be after any DOM elements used in callback. -->
        <div id="map" style="width:100%;height:400px;"></div>
        <script>
            function initMap() {
            const map = new google.maps.Map(document.getElementById("map"), {
            center: { lat: 41.8350038663387, lng: -87.62235573106408 },
            zoom: 15,
            });
            const request = {
            placeId: "ChIJD6jp03IsDogRGm_7Gmbky5E",
            fields: ["name", "formatted_address", "place_id", "geometry"],
            };
            const infowindow = new google.maps.InfoWindow();
            const service = new google.maps.places.PlacesService(map);

            service.getDetails(request, (place, status) => {
                if (
                status === google.maps.places.PlacesServiceStatus.OK &&
                place &&
                place.geometry &&
                place.geometry.location
                ) {
                const marker = new google.maps.Marker({
                    map,
                    position: place.geometry.location,
                });

                google.maps.event.addListener(marker, "click", () => {
                    const content = document.createElement("div");
                    const nameElement = document.createElement("h2");

                    nameElement.textContent = place.name;
                    content.appendChild(nameElement);

                    const placeIdElement = document.createElement("p");

                    placeIdElement.textContent = place.place_id;
                    content.appendChild(placeIdElement);

                    const placeAddressElement = document.createElement("p");

                    placeAddressElement.textContent = place.formatted_address;
                    content.appendChild(placeAddressElement);
                    infowindow.setContent(content);
                    infowindow.open(map, marker);
                });
            }
      });
    }
    </script>

    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDa5k9bBBhMOJ20sJxjX0xtdsYkb-h1bhU&callback=initMap&libraries=places&v=weekly"
      async
    >
    </script>  
    </section> 

    <section class="my-5">
    
    <%
        Gson gsonObj = new Gson();
        Map<Object,Object> map = null;
        List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
    
        ArrayList<autoInsurance.Mostsoldzip> mos= new ArrayList<autoInsurance.Mostsoldzip>();
        mos=autoInsurance.MongoDBDataStoreUtilities.mostsoldZip();

        map = new HashMap<Object,Object>(); map.put("label", "60616"); map.put("y", 5); list.add(map);
        map = new HashMap<Object,Object>(); map.put("label", "60617"); map.put("y", 3); list.add(map);
        map = new HashMap<Object,Object>(); map.put("label", "60620"); map.put("y", 8); list.add(map);
        map = new HashMap<Object,Object>(); map.put("label", "60619"); map.put("y", 9); list.add(map);
        map = new HashMap<Object,Object>(); map.put("label", "60621"); map.put("y", 2); list.add(map);
        map = new HashMap<Object,Object>(); map.put("label", "60618"); map.put("y", 4); list.add(map);
 
        String dataPoints = gsonObj.toJson(list);
        
        
        //String dataPoints = gsonObj.toJson(autoInsurance.MongoDBDataStoreUtilities.mostsoldZip());


        
    %>
    
    <script type="text/javascript">
        window.onload = function() { 
        
        var chart = new CanvasJS.Chart("chartContainer", {
            title: {
                text: "Suggestions Based On ZipCodes"
            },
            axisX: {
                title: "ZipCodes"
            },
            axisY: {
                title: "Count of Reviews",
                includeZero: true
            },
            data: [{
                type: "column",
                dataPoints: 
                <%out.print(dataPoints);%>
            }]
        });
        chart.render();
        
        }
    </script>

    <div id="chartContainer" style="height: 370px; width: 100%;"></div>
    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
    
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
<script>
    AOS.init();

    //Script for Scroll to Top button for hide and show
    $(window).scroll(function () {
        if ($(this).scrollTop()) {
            $('#myTopBtn').fadeIn();
        } else {
            $('#myTopBtn').fadeOut();
        }
    });
    //script for scroll to top
    $("#myTopBtn").click(function () {
        $("html, body").animate({ scrollTop: 0 }, 1000);
    });

    // let map;

    // function initMap() {
    //     map = new google.maps.Map(document.getElementById("map"), {
    //         center: { lat: -33.866, lng: 151.196 },
    //         zoom: 8,
    //     });
    // }


    // //script for Google Sheet
    // const scriptURL = 'https://script.google.com/macros/s/AKfycbwmOkfD6saCOWTr8qZWOtRcWz5X74Yn1fiWePRXU-JceE8DfQKzeMqj_z1uSj1f_d48/exec';
    // const form = document.forms['google-sheet'];
    // form.addEventListener('submit', e => {
    //     e.preventDefault()
    //     fetch(scriptURL, { method: 'POST', body: new FormData(form) })
    //         .then(response => alert("Thanks for Contacting us..! We Will Contact You Soon..."))
    //         .catch(error => console.error('Error!', error.message))
   // });

</script>

</html>