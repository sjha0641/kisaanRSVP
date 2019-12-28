<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
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

button:hover {
	opacity: 0.8;
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

/* Style the tab content */
.tabcontent {
  color: white;
  display: none;
  padding: 50px;
  text-align: center;
}
table { 
  width: 100%; 
  border-collapse: collapse; 
}
/* Zebra striping */
tr:nth-of-type(odd) { 
  background: #eee; 
}
th { 
  background: #333; 
  color: white; 
  font-weight: bold; 
}
td, th { 
  padding: 6px; 
  border: 1px solid #ccc; 
  text-align: left; 
}
#AboutUs {background-color:green;}
#ContactUs {background-color:green;}
#HomePage {background-color:green;}
</style>
</head>
<body>
<a href="dashboard.rsvp"><button class="tablink">Home Page</button></a>
<button class="tablink" onclick="openFunction('AboutUs', this, 'green')" >AboutUs</button>
<a href="HomePage.jsp"><button class="tablink">Logout ${ Session.invalidate() }</button></a>
<button class="tablink" onclick="openFunction('ContactUs', this, 'green')" >Contact Us</button>


<a> UserId:${ farmerInFo.farmerId }</a>&nbsp &nbsp &nbsp
<a> Name:${ farmerInFo.farmerFullName }</a><br>

<table>
<tr>
      <th>Last Day for Bid</th>
      <th>Crop Name</th>
      <th>Quantity</th>
      <th>MSP</th>
      <th>Sold Price</th>
      <th>Total Price</th>
      <th>SoldStatus</th>
    </tr>
  <c:forEach items="${ ListOfCrops }" var="crop">
    <tr>
    <td><c:out value="${crop.cropLastDateForBid}" /></td>
      <td><c:out value="${crop.cropName}" /></td>
      <td><c:out value="${crop.cropQuantity}" /></td>
      <td><c:out value="${crop.cropBasicPrice}" /></td>
      <td><c:out value="${crop.cropSoldPrice}" /></td>
      <td><c:out value="${crop.cropSoldPrice*crop.cropQuantity}" /></td>
      <td><c:out value="${crop.cropSoldStatus}" /></td>
    </tr>
  </c:forEach>
</table>
														
<div id="AboutUs" class="tabcontent" style="center-bottom">
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