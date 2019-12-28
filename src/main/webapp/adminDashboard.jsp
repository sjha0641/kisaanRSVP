<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
<link rel="stylesheet" href="adminLogin.css">
<style>
.anchor>a {
	background-color: #ff0000;
	color: white;
	padding: 14px 25px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	margin-left: 40%;
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
<!-- 	<h4>${ pendingCrop }</h4> -->
	<div></div>


	<div class="anchor gap">
		<a href="fetchAllFarmers.rsvp">Listed Farmers</a></br> </br>
	</div>
	<div class="anchor gap">
		<a href="fetchAllBidders.rsvp">Listed Bidders</a>
	</div>
</body>
</html>