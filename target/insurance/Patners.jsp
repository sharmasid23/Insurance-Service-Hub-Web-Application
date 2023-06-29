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


    <style>
        th, td, p, input {
            font:14px Verdana;
        }
        table, th, td 
        {
            border: solid 1px #DDD;
            border-collapse: collapse;
            padding: 2px 3px;
            text-align: center;
        }
        th {
            font-weight:bold;
        }
    </style>
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
   
   <input type="button" onclick="CreateTableFromJSON()" value="Look out for Trusted Patners" />
    <p id="showData"></p>


    <script>
        function CreateTableFromJSON() {
            var myBooks = [
                {
                    "Name": "Michael Kane | Kane Insurance Group",
                    "Phone": "+17735250661",
                    "Address": "4016 N Lincoln Ave",
                    "Review Count": "11"
                },
                {
                    "Name": "Jenny Tola - State Farm Insurance Agent",
                    "Phone": "+17738838660",
                    "Address": "4083 N Broadway St",
                    "Review Count": "37"
                },
                {
                    "Name": "Ann Rodriguez - Nolan - State Farm Insurance Agent",
                    "Phone": "+17733425300",
                    "Address": "1631 N Milwaukee Ave",
                    "Review Count": "15"
                },
                {
                    "Name": "Lakeview Insurance Agency",
                    "Phone": "+17738718000",
                    "Address": "3438 N Southport Ave",
                    "Review Count": "22"
                },
                {
                    "Name": "Allstate Insurance: Joe Schneider",
                    "Phone": "+13127870221",
                    "Address": "521 W North Ave",
                    "Review Count": "53"
                },
                {
                    "Name": "Insurance Navy Brokers",
                    "Phone": "+17734781495",
                    "Address": "3325 W North Ave",
                    "Review Count": "1"
                },
                {
                    "Name": "Thomas Ward Insurance",
                    "Phone": "+13126909778",
                    "Address": "707 W Willow St",
                    "Review Count": "31"
                },
                {
                    "Name": "Sharon Robles Agency",
                    "Phone": "+13122940040",
                    "Address": "1655 S Blue Island Ave",
                    "Review Count": "1"
                },
                {
                    "Name": "American Family Insurance - Ralph Chalker Agency",
                    "Phone": "+17732029997",
                    "Address": "3753 N Harlem Ave",
                    "Review Count": "4"
                },
                {
                    "Name": "Forest Insurance",
                    "Phone": "+17083839000",
                    "Address": "7310 Madison St",
                    "Review Count": "16"
                },
                {
                    "Name": "Chris Collins - State Farm Insurance Agent",
                    "Phone": "+18476982355",
                    "Address": "444 N Northwest Hwy",
                    "Review Count": "24"
                },
                {
                    "Name": "Greg Jareczek - State Farm Insurance Agent",
                    "Phone": "+17733275559",
                    "Address": "1428 W Irving Park Rd",
                    "Review Count": "28"
                },
                {
                    "Name": "Mike Burton - State Farm Insurance Agent",
                    "Phone": "+17736855500",
                    "Address": "5520 W Lawrence Ave",
                    "Review Count": "8"
                },
                {
                    "Name": "The Health Insurance Shoppe",
                    "Phone": "+17738808484",
                    "Address": "1836 W Belmont Ave",
                    "Review Count": "70"
                },
                {
                    "Name": "Westside Insurance Agency",
                    "Phone": "+17736381700",
                    "Address": "906 S Homan Ave",
                    "Review Count": "1"
                },
                {
                    "Name": "Allstate Insurance: Garrel Behrends II",
                    "Phone": "+18722316187",
                    "Address": "Chicago, IL 60618",
                    "Review Count": "1"
                },
                {
                    "Name": "Kevin Smith - State Farm Insurance Agent",
                    "Phone": "+17737722244",
                    "Address": "2827 W. Belden Ave. Space 1B",
                    "Review Count": "31"
                },
                {
                    "Name": "Parr Insurance Brokerage, Inc.",
                    "Phone": "+17734893001",
                    "Address": "2157 Damen Ave",
                    "Review Count": "1"
                },
                {
                    "Name": "Insurance Trade Solutions",
                    "Phone": "+13122267334",
                    "Address": "1905 W Chicago Ave",
                    "Review Count": "1"
                },
                {
                    "Name": "The Manno Group Insurance Brokers",
                    "Phone": "+17086469280",
                    "Address": "1801 S Meyers Rd",
                    "Review Count": "3"
                },
                {
                    "Name": "Farmers Insurance - Sandra Cavoto",
                    "Phone": "+13126664424",
                    "Address": "948 W Madison St",
                    "Review Count": "7"
                },
                {
                    "Name": "Miles Insurance Agency",
                    "Phone": "+13125368792",
                    "Address": "3055 W 111th St",
                    "Review Count": "2"
                },

                {
                    "Name": "Stern Insurance Group",
                    "Phone": "+13127680634",
                    "Address": "2506 N Clark St",
                    "Review Count": "1"
                }
            ]

            // EXTRACT VALUE FOR HTML HEADER. 
            // ('Book ID', 'Book Name', 'Category' and 'Price')
            var col = [];
            for (var i = 0; i < myBooks.length; i++) {
                for (var key in myBooks[i]) {
                    if (col.indexOf(key) === -1) {
                        col.push(key);
                    }
                }
            }

            // CREATE DYNAMIC TABLE.
            var table = document.createElement("table");

            // CREATE HTML TABLE HEADER ROW USING THE EXTRACTED HEADERS ABOVE.

            var tr = table.insertRow(-1);                   // TABLE ROW.

            for (var i = 0; i < col.length; i++) {
                var th = document.createElement("th");      // TABLE HEADER.
                th.innerHTML = col[i];
                tr.appendChild(th);
            }

            // ADD JSON DATA TO THE TABLE AS ROWS.
            for (var i = 0; i < myBooks.length; i++) {

                tr = table.insertRow(-1);

                for (var j = 0; j < col.length; j++) {
                    var tabCell = tr.insertCell(-1);
                    tabCell.innerHTML = myBooks[i][col[j]];
                }
            }

            // FINALLY ADD THE NEWLY CREATED TABLE WITH JSON DATA TO A CONTAINER.
            var divContainer = document.getElementById("showData");
            divContainer.innerHTML = "";
            divContainer.appendChild(table);
        }
    </script>

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