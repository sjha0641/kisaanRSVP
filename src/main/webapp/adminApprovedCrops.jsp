<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Approved Crops</title>
<link rel="stylesheet" href="adminLogin.css">
<style>
#approvedCrops {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 50%;
}
#approvedCrops td, #approvedCrops th {
  border: 1px solid #ddd;
  padding: 8px;
}
#approvedCrops tr:nth-child(even){background-color: #f2f2f2;}

#approvedCrops tr:hover {background-color: #ddd;}
#approvedCrops th {
 font-family: "Times New Roman", Times, serif;
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #0080ff;
  color: white;
}
</style>
</head>
<body >
<h1>${sessionScope.loggedInAdmin.adminEmail }</h1>
	<div>
		<ul>
			<li><a class="active" href="adminDashboard.jsp">Home</a></li>
			<li><a href="fetchAllUnverifiedCrops.rsvp">Crop Approval</a></li>
			<li><a href="fetchAllBidding.rsvp">Bidding Approval</a></li>
			<li><a href="fetchSoldBidding.rsvp">Sold Crops</a></li>
			<li><a href="adminLogout.rsvp">LogOut  ${ Session.Abandon }</a></li>
		</ul>
	</div>
	<h4>_____Crop Status______</h4>
	<table id="approvedCrops">
		<tr>
			<th>Type</th>
			<th>Name</th>
			<th>Quantity</th>
			<th>Basic Price</th>
			<th>Sold Price</th>
			<th>Current Bid</th>
	
			<th>Status</th>
		</tr>
	<c:forEach items="${ listOfApprovedCrops }" var="Crop">
		<tr>
			<form action="approve.rsvp">
			<td>${ Crop.cropType}</td>
			<td>${ Crop.cropName}</td>
			<td>${ Crop.cropQuantity }</td>
			<td>${ Crop.cropBasicPrice }</td>
			<td>${ Crop.cropSoldPrice }</td>
			<td>${ Crop.cropCurrentBid }</td>
			
			<td>
			<input type="submit"  value="Approved" disabled /></td>
			</form>
		</tr>
	</c:forEach>
</table>
</body>
</html>