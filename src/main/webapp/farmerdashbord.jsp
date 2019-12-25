<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
/* Set a style for all buttons */
body {
background-color: #4CAF50;
}
button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}
body {
background-color: #4CAF50;
}

button:hover {
	opacity: 0.8;
}

.btn-group button {
  background-color: #4CAF50; /* Green background */
  border: none; /* Green border */
  color: white; /* White text */
  padding: 10px 24px; /* Some padding */
  cursor: pointer; /* Pointer/hand icon */
  width: 190px; /* Set a width if needed */
  display: block; /* Make the buttons appear below each other */
}

.btn-group button:not(:last-child) {
  border-bottom: none; /* Prevent double borders */
}

/* Add a background color on hover */
.btn-group button:hover {
  background-color: #4CAF50;
}
/* for top tab*/
.tablink {
  background-color: #4CAF50;
  color: white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  font-size: 17px;
  width: 25%;
}

.tablink:hover {
   background-color: #4CAF50;
}
#AboutUs {background-color:#4CAF50;}
#ContactUs {background-color:#4CAF50;}
#HomePage {background-color:#4CAF50;}
#Login {background-color:#4CAF50;}
/* Style the tab content */
.tabcontent {
  color: white;
  display: none;
  padding: 50px;
  text-align: center;
}
</style>
</head>
<body>
<a href="farmerdashbord.jsp"><button class="tablink">Home Page</button></a>
<button class="tablink" onclick="openFunction('AboutUs', this, 'green')" >AboutUs</button>
<a href="HomePage.jsp"><button class="tablink">Logout</button></a>
<button class="tablink" onclick="openFunction('ContactUs', this, 'green')" >Contact Us</button>


<a> UserId:${ farmerInFo.farmerId }</a>&nbsp &nbsp &nbsp
<a> Name:${ farmerInFo.farmerFullName }</a><br>


<br><br><br>
<div class="btn-group">
<button onclick="window.location.href = 'sellyourcropfarmer.jsp';">Sell Your Crop</button>
<button onclick="window.location.href = 'viewmarketplace.jsp';">View Market Place</button>
<button onclick="window.location.href = 'viewsoldcrophistory.rsvp';">View Sold Crop History</button>
</div>
																
<div id="HomePage" class="tabcontent">
  <h1>HomePage</h1>
  <p>hi wellcome to our page</p> 
</div>
<div id="AboutUs" class="tabcontent">
  <h1>AboutUs</h1>
  <p>We will change the feature with the help of <strong>Farmers</strong>.</p> 
</div>
<div id="ContactUs" class="tabcontent">
  <h1>ContactUs</h1>
  <p>PRIYANKYA ROY</p> 
  <p>VISHAL and SATHYA</p>
  <p>RaviThejaReddy</p>
</div>
<script>
function openFunction(functionName,elmnt,color) {
	  var i, tabcontent, tablinks;
	  tabcontent = document.getElementsByClassName("tabcontent");
	  for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
	  }
	  tablinks = document.getElementsByClassName("tablink");
	  for (i = 0; i < tablinks.length; i++) {
	    tablinks[i].style.backgroundColor = "";
	  }
	  document.getElementById(functionName).style.display = "block";
	  elmnt.style.backgroundColor = color;

	}
document.getElementById("defaultOpen").click();
</script>
</body>
</html>