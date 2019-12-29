<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Your Bids</title>
<style type="src/main/webapp/css/bidderNavigation.css"> </style>
<style>
.maindiv {
	display: block;
	margin-top:50px;
}

.subdiv1 {
	float: left;
	padding: 10px;
	width: 30%;
	background-color: #FFBD33;
}

.subdiv2 {
	float: left;
	padding: 10px;
	width: 30%;
	margin-left:38px;
	background-color: #FF5733;
}

.subdiv3 {
	margin-left:20px;
	float: right;
	padding: 10px;
	width: 30%;
	background-color: #DAF7A6;
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
.buttondiv{
display:block;
}
form{
float:left;

}
</style>
</head>
<body>
	
	<ul>
		<li><a href="bidderDashboard.jsp">Home</a></li>
		<li><a href="fetchAllCrops.rsvp">Bid Crops</a></li>
		<li><a href="viewYourBids.jsp">View Your Biddings</a></li>
		<li><a href="logoutBidder.rsvp">Logout </a></li>
	</ul>
		
	<h2 style="margin-left:45%">List Of All Bids By You</h2>

		<div class="buttondiv">

			<form style="margin-left:150px;" action="activeBids.rsvp">
				<input style="width:200px; border-radius:5px; background-color: #FFBD33;" type="submit" value="view  Your Active Bids">
			</form>
			<form style="margin-left:250px;" action="successfulBids.rsvp">
				<input style="width:200px; border-radius:5px; background-color: #FF5733;" type="submit" value="view  Your Successfull Bids">
			</form>
			<form style="margin-left:250px;" action="unsuccessfulBids.rsvp">
				<input style="width:200px; border-radius:5px; background-color: #DAF7A6;" type="submit" value="view  Your Unsuccessfull Bids">
			</form>

	</div>
	<div class="maindiv">
		<div class="subdiv1">
			<table>
				<tr>
					<th>Crop Type</th>
					<th>Crop Name</th>
					<th>Bid Amount</th>
				</tr>
				<c:forEach items="${ activeBidDetails }" var="bd">
					<tr>
						<td>${ bd.cropBid.cropType }</td>
						<td>${ bd.cropBid.cropName }</td>
						<td>${ bd.bidAmount }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="subdiv2">

			<table>
				<tr>
					<th>Crop Type</th>
					<th>Crop Name</th>
					<th>Bid Amount</th>
				</tr>
				<c:forEach items="${ successfulBidDetails }" var="bd">
					<tr>
						<td>${ bd.cropBid.cropType }</td>
						<td>${ bd.cropBid.cropName }</td>
						<td>${ bd.bidAmount }</td>
					</tr>
				</c:forEach>
			</table>

		</div>
		<div class="subdiv3">

			<table>
				<tr>
					<th>Crop Type</th>
					<th>Crop Name</th>
					<th>Bid Amount</th>
				</tr>
				<c:forEach items="${ unsuccessfulBidDetails }" var="bd">
					<tr>
						<td>${ bd.cropBid.cropType }</td>
						<td>${ bd.cropBid.cropName }</td>
						<td>${ bd.bidAmount }</td>
					</tr>
				</c:forEach>
			</table>

		</div>
	</div>
</body>
</html>