<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Approved Bids</title>
<link rel="stylesheet" href="adminLogin.css">
<style type="text/css">
.main{
margin-top: 0px;
width: 100%;
}
.first{
	
	float: left;
	width: 50%;
}

.second{
	float: left;
	width: 50%;

}
.approvedBid {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 80%;
}
.approvedBid td, .approvedBid th {
  border: 1px solid #ddd;
  padding: 8px;
}
.approvedBid tr:nth-child(even){background-color: #f2f2f2;}

.approvedBid tr:hover {background-color: #ddd;}
.approvedBid th {
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
			<li><a href="adminLogout.rsvp">LogOut</a></li>
		</ul>
	</div>
<div class="main">

	<div class="first">
	<h4>_____List of Bids______</h4>
		<table class="approvedBid">
			<tr>
				<th>Bid Id</th>
				<th>Bid Amount</th>
				<th>Status</th>
				<th>Crop Id</th>
				<th>Current Bid</th>
			</tr>
			<c:forEach items="${ listOfBidding }" var="bid">
				<tr>
						<td>${ bid.bidId}</td>
						<td>${ bid.bidAmount}</td>
						<td>${ bid.bidStatus}</td>
						<td>${ bid.cropBid.cropId}</td>
						<td>${ bid.cropBid.cropCurrentBid }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="second">
	<h4>_____Bids based on Crops______</h4>
		<table class="approvedBid">
		<form action="fetchAllBiddingBasedOnCropId.rsvp">
		<label>Enter CropId</label>
		<input type="number" name="cropId"/>
		<input type="submit" value="Submit" /></td>
		<h3>${ NoBids }</h3>
		</form>
			<tr>
				<th>Bid Id</th>
				<th>Bid Amount</th>
				<th>Status</th>
				<th>Current Bid</th>
				<th>Last Date</th>
				<th>Approve</th>
			</tr>
			<c:forEach items="${ listOfBiddingBasedOnCropId }" var="bid">
				<tr>
					<form action="approveBid.rsvp">
						<td>${ bid.bidId}</td>
						<td>${ bid.bidAmount}</td>
						<td>${ bid.bidStatus}</td>
						<td>${ bid.cropBid.cropCurrentBid }</td>
						<td>${ bid.cropBid.cropLastDateForBid }</td>
						<td>
						<input type="text" name="bidId" value="${ bid.bidId }" hidden/>
						<input type="text" name="cropId" value="${ bid.cropBid.cropId }" hidden/>
						<input type="submit" value="Approve" /></td>
					</form>
				</tr>
			</c:forEach>
			
		</table>
	</div>
</div>
	
	
	
</body>
</html>