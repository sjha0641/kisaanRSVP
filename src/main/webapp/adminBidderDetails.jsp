<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bidder Details</title>
<link rel="stylesheet" href="adminLogin.css">
<style>
#bidderDetails {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 50%;
}
#bidderDetails td, #bidderDetails th {
  border: 1px solid #ddd;
  padding: 8px;
}
#bidderDetails tr:nth-child(even){background-color: #f2f2f2;}

#bidderDetails tr:hover {background-color: #ddd;}
#bidderDetails th {
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
	<div>
		<h4>_____Bidder Details______</h4>
	<table id="bidderDetails">
	<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Contact</th>
		</tr>
	<c:forEach items="${ listOfBidders }" var="bidder">
		<tr>
		<td>${bidder.bidderId }</td>
			<td>${bidder.bidderFullName }</td>
			<td>${bidder.bidderContact }</td>	
		</tr>
	
	</c:forEach>
</table>
	</div>
</body>
</html>