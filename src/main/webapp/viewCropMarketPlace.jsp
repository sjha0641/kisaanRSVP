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
body {
background-color: #4CAF50;
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
#AboutUs {background-color:#4CAF50;}
#ContactUs {background-color:#4CAF50;}
#HomePage {background-color:#4CAF50;}
#Login {background-color:#4CAF50;}
</style>
</head>
<body>
<a href="dashboard.rsvp"><button class="tablink">Home Page</button></a>
<button class="tablink" onclick="openFunction('AboutUs', this, 'green')" >AboutUs</button>
<a href="logoutBidder.rsvp"><button class="tablink">Logout</button></a>
<button class="tablink" onclick="openFunction('ContactUs', this, 'green')" >Contact Us</button>


<a> UserId:${ farmerInFo.farmerId }</a>&nbsp &nbsp &nbsp
<a> Name:${ farmerInFo.farmerFullName }</a><br>
<!-- ********************************************************************************** -->
<!-- ********************************************************************************** -->
							<!-- tables of view of crops here -->
<br/>
 <h1> ${ errort }</h1>	 
  <br/>
<table><tr>
<th>Crop Type</th>
<th>Crop Name</th>
<th>Base Price</th></tr>
<tr>
<td>${cropbycropid.cropType }</td>
<td>${cropbycropid.cropName }</td>
<td>${cropbycropid.cropBasicPrice }</td>
</tr>
<tr><th>Current Bid</th></tr>
<tr><td>${ currentbidamount }</td></tr>
<tr><th>Previous Bid</th></tr>
<c:forEach items="${ bidDetailsbycropid }" var="bid">
    <tr>
    <td><c:out value="${bid.bidAmount}"/></td>
    </tr>
</c:forEach>
</table>
<!-- ********************************************************************************** -->
<!-- ********************************************************************************** -->	
	



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