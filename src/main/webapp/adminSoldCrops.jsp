<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sold Crops</title>
<link rel="stylesheet" href="adminLogin.css">
<style>
#soldCrops {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 50%;
}
#soldCrops td, #soldCrops th {
  border: 1px solid #ddd;
  padding: 8px;
}
#soldCrops tr:nth-child(even){background-color: #f2f2f2;}

#soldCrops tr:hover {background-color: #ddd;}
#soldCrops th {
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
	<div >
		<ul>
			<li><a class="active" href="adminDashboard.jsp">Home</a></li>
			<li><a href="fetchAllUnverifiedCrops.rsvp">Crop Approval</a></li>
			<li><a href="fetchAllBidding.rsvp">Bidding Approval</a></li>
			<li><a href="fetchSoldBidding.rsvp">Sold Crops</a></li>
			<li><a href="adminLogin.jsp">LogOut ${ Session.Abandon }</a></li>
		</ul>
	</div>


	<div class="second">
	<h4>_____Sold Bids______</h4>
		<table id="soldCrops">
			<tr>
				<th>Bid Id</th>
				<th>Bid Amount</th>
				<th>Status</th>
			</tr>
			<c:forEach items="${ listOfSoldBidding }" var="bidSold">
				<tr>
						<td>${ bidSold.bidId}</td>
						<td>${ bidSold.bidAmount}</td>
						<td>${ bidSold.bidStatus}</td>
				</tr>
			</c:forEach>
		</table>
		
	</div>
	
</body>
</html>