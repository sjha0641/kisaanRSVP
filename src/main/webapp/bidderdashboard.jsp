<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
/* Set a style for all buttons */

button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}
input{
background-color: #4CAF50;
  color: white;
  align-content:center;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  font-size: 17px;
  width: 16.66%;
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
.login1button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
	border: 4px double rgba(28,110,164,0.52);
	border-radius: 0px 30px 0px 30px;
}

.login1button:hover {
	border: 4px double rgba(28,110,164,0.52);
	border-radius: 0px 30px 0px 30px;
	opacity: 0.8;
}
.login2button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
	border: 4px double rgba(28,110,164,0.52);
	border-radius: 30px 0px 30px 0px;
}

.login2button:hover {
	border: 4px double rgba(28,110,164,0.52);
	border-radius: 30px 0px 30px 0px;
	opacity: 0.8;
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
  width: 16.66%;
}

.tablink:hover {
   background-color: #4CAF50;
}

/* Style the tab content */
.tabcontent {

  display: none;
  padding: 50px;
  text-align: center;
}

.tabcontent1 {
  color: white;
  display: none;
  align-content: right;
  float: right;
}
/*cccccccccccccccccccccccc*/
.tablink1 {
  background-color: #4CAF50;
  color: white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  font-size: 17px;
  width: 16.66%;
  border-radius: 30px 0px 0px 30px;
}

.tablink1:hover {
   background-color: #4CAF50;
}
/*cccccccccccccccccccccccc*/
.tablink2 {
  background-color: #4CAF50;
  color: white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  font-size: 17px;
  width: 16.66%;
  border-radius: 0px 30px 30px 0px;
}
.tablink3 {
  background-color: #4CAF50;
  color: white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  font-size: 17px;
  width: 16.66%;
  border-radius: 30px 30px 30px 30px;
}

.tablink2:hover {
   background-color: #4CAF50;
}
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

</style>
</head>
<body>
<a href="bidderdashboard.jsp"><button class="tablink1">Home Page</button></a>
<button class="tablink" onclick="openFunction('AboutUs', this, 'green')" >AboutUs</button>
<a href="HomePage.jsp"><button class="tablink">Logout ${ Session.Abandon }</button></a>
<button class="tablink" onclick="openFunction('ContactUs', this, 'green')" >Contact Us</button>
<a href="getcropsforsale.rsvp"><button class="tablink">Bid Crops</button></a>
<button class="tablink2" onclick="window.location.href = 'viewyourbids.jsp';" >View All Your Bids</button>
<h1>${ loggedBidder.bidderFullName }</h1>
<h3> ${ msg }</h3>															
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
function Mytest() {
	var x = prompt("Enter the Bid Amount", "0");
	var num1 = parseInt(x);
	var y = document.getElementsByName("bid");
	y[0].value = num1;
	return true;
}
function openFunction(functionName,elmnt,color) {
	  var i, tabcontent,tabcontent1, tablinks;
	  tabcontent = document.getElementsByClassName("tabcontent");
	  tabcontent1 = document.getElementsByClassName("tabcontent1");
	  for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
	  }
	  for (i = 0; i < tabcontent1.length; i++) {
		    tabcontent1[i].style.display = "none";
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