<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
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
  width: 20%;
}

.tablink:hover {
   background-color: #4CAF50;
}
#AboutUs {background-color:#4CAF50;}
#ContactUs {background-color:#4CAF50;}
#HomePage {background-color:#4CAF50;}
#Insurance {background-color:#4CAF50;}
#Login {background-color:#4CAF50;}
/* Style the tab content */
.tabcontent {
  color: white;
  display: none;
  padding: 20px 0px 20px 0px;
  position: absolute;
   left: 0;
   bottom: 0;
   width: 100%;
   text-align: center;
}

.tabcontent1 {
  color: white;
  display: none;
  align-content: right;
  float: right;
  margin-bottom: 0;
}
.table11{
display: inline-table;
}
/*-----------------*/
.outer {
}
.outer > * {
  display:inline-block;
  vertical-align:middle;
}
</style>
</head>
<body>
<a href="dashboard.rsvp"><button class="tablink">Home Page</button></a>
<button class="tablink" onclick="openFunction('AboutUs', this, 'green')" >AboutUs</button>
<a href="HomePage.jsp"><button class="tablink">Logout ${ Session.Abandon }</button></a>
<button class="tablink" onclick="openFunction('ContactUs', this, 'green')" >Contact Us</button>
<button class="tablink" onclick="openFunction('Insurance', this, 'green')" >Insurance</button>
<div id="Insurance" class="tabcontent1">
<a> ${ ins }</a>
	<button class="login1button" onclick="window.location.href = 'applyforinsurance.jsp';"
		style="width: auto;">Apply for Insueance</button>
	<button class="login2button" onclick="window.location.href = 'claimInsurance.jsp';"
		style="width: auto;">Claim Insurance</button>
</div>	
<a> UserId:${ farmerInFo.farmerId }</a>&nbsp &nbsp &nbsp
<a> Name:${ farmerInFo.farmerFullName }</a><br>

<%-- <div class="table11">
<table>
<tr>
      <th>Last Day for Bid</th>
      <th>Crop Name</th>
      <th>Quantity</th>
      <th>MSP</th>
      <th>Crop Active Status</th>
      <th>SoldStatus</th>
    </tr>
  <c:forEach items="${ listofnonactivecrop }" var="crop">
    <tr>
    <td><c:out value="${crop.cropLastDateForBid}" /></td>
      <td><c:out value="${crop.cropName}" /></td>
      <td><c:out value="${crop.cropQuantity}" /></td>
      <td><c:out value="${crop.cropBasicPrice}" /></td>
     <td><c:out value="${crop.cropActiveStatus}" /></td>
      <td><c:out value="${crop.cropSoldStatus}" /></td>
    </tr>
  </c:forEach>
</table>
</div> --%>
<div class="btn-group" style="float: left;">
<button onclick="window.location.href = 'sellyourcropfarmer.jsp';">Sell Your Crop</button>
<button onclick="window.location.href = 'viewmarketplace.rsvp';">View Market Place</button>
<button onclick="window.location.href = 'viewsoldcrophistory.rsvp';">View Sold Crop History</button>
</div>

<div style="float: right;">
<center><a>Un Sold Crop List</a></center>
<table>
<tr>
      <th>Last Day for Bid</th>
      <th>Crop Type</th>
      <th>Crop Name</th>
      <th>Quantity</th>
      <th>MSP</th>
      <th>Crop Sold Status</th>
    </tr>
  <c:forEach items="${ listofunsoldcrops }" var="crop">
    <tr>
      <td><c:out value="${crop.cropLastDateForBid}" /></td>
      <td><c:out value="${crop.cropType}" /></td>
      <td><c:out value="${crop.cropName}" /></td>
      <td><c:out value="${crop.cropQuantity}" /></td>
      <td><c:out value="${crop.cropBasicPrice}" /></td>
     <td><center><c:out value="${crop.cropSoldStatus}" /></center></td>
    </tr>
  </c:forEach>
</table>
</div>

<div style="float: right;">
<center><a>Non Active Crop List</a></center>
<table>
<tr>
      <th>Last Day for Bid</th>
      <th>Crop Type</th>
      <th>Crop Name</th>
      <th>Quantity</th>
      <th>MSP</th>
      <th>Crop Active Status</th>
    </tr>
  <c:forEach items="${ listofnonactivecrop }" var="crop">
    <tr>
    <td><c:out value="${crop.cropLastDateForBid}" /></td>
    <td><c:out value="${crop.cropType}" /></td>
      <td><c:out value="${crop.cropName}" /></td>
      <td><c:out value="${crop.cropQuantity}" /></td>
      <td><c:out value="${crop.cropBasicPrice}" /></td>
     <td><center><c:out value="${crop.cropActiveStatus}" /></center></td>
    </tr>
  </c:forEach>
</table>
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
var modal1 = document.getElementById('idi1');
var modal2 = document.getElementById('idi2');


// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal1) {
        modal1.style.display = "none";
    }
    if (event.target == modal2) {
        modal2.style.display = "none";
    }
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