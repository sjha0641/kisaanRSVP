<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Farmer Details</title>
<link rel="stylesheet" href="adminLogin.css">
<style>
#farmerDetails {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 50%;
}
#farmerDetails td, #farmerDetails th {
  border: 1px solid #ddd;
  padding: 8px;
}
#farmerDetails tr:nth-child(even){background-color: #f2f2f2;}

#farmerDetails tr:hover {background-color: #ddd;}
#farmerDetails th {
 font-family: "Times New Roman", Times, serif;
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #0080ff;
  color: white;
}
</style>
</head>


<body>
<h1>${sessionScope.loggedInAdmin.adminEmail }</h1>
	<div>
		<ul>
			<li><a class="active" href="adminDashboard.jsp">Home</a></li>
			<li><a href="fetchAllUnverifiedCrops.rsvp">Crop Approval</a></li>
			<li><a href="fetchAllBidding.rsvp">Bidding Approval</a></li>
			<li><a href="fetchSoldBidding.rsvp">Sold Crops</a></li>
			<li><a href="adminLogout.rsvp">LogOut</a></li>
		</ul>
	</div>
	<h4>_____Farmer Details______</h4>
	<table id="farmerDetails">
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Contact</th>
		
		
		</tr>
	<c:forEach items="${ listOfFarmers }" var="farmer">
		<tr>
			<td>${farmer.farmerId }</td>
			<td>${farmer.farmerFullName }</td>
			<td>${farmer.farmerContact }</td>
			
		</tr>
	
	</c:forEach>
</table>
	
</body>
</html>