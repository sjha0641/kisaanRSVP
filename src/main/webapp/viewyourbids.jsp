<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.maindiv {
	display: block;
	background-color: #ccffcc;
	border: 2px solid black;
}

[class*="subdiv"] {
	float: left;
	padding: 10px;
	width: 30%;
	height: 50%;
}

.subdiv1 {
	background-color: #FFBD33;
}

.subdiv2 {
	background-color: #FF5733;
}

.subdiv3 {
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
background-color:blue;
border: 1px solid #ddd;
}
form{
display:inline;
margin:20px;
float:left;
}
</style>
</head>
<body>

	<h3>List Of All Bids By You</h3>

		<div class="buttondiv">

			<form action="activebids.rsvp">
				<input type="submit" value="view  Your Active Bids">
			</form>
			<form action="successfulbids.rsvp">
				<input type="submit" value="view  Your Successfull Bids">
			</form>
			<form action="unsuccessfulbids.rsvp">
				<input type="submit" value="view  Your Unsuccessfull Bids">
			</form>

	</div>
	<div class="maindiv">
		<div class="subdiv1">
			<table>
				<tr>
					<th>Crop Type</th>
					<th>Crop Name</th>
					<th>Current Bid Amount</th>
					<th>Crop status</th>
				</tr>
				<c:forEach items="${ activeBidDetails }" var="bd">
					<tr>
						<td>${ bd.cropType }</td>
						<td>${ bd.cropName }</td>
						<td>${ bd.cropCurrentBid }</td>
						<td>${ bd.bidStatus }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="subdiv2">

			<table>
				<tr>
					<th>Crop Type</th>
					<th>Crop Name</th>
					<th>Current Bid Amount</th>
					<th>Crop status</th>
				</tr>
				<c:forEach items="${ successfulBidDetails }" var="bd">
					<tr>
						<td>${ bd.cropType }</td>
						<td>${ bd.cropName }</td>
						<td>${ bd.cropCurrentBid }</td>
						<td>${ bd.bidStatus }</td>
					</tr>
				</c:forEach>
			</table>

		</div>
		unsuccessfulBidDetails
		<div class="subdiv3">

			<table>
				<tr>
					<th>Crop Type</th>
					<th>Crop Name</th>
					<th>Current Bid Amount</th>
					<th>Crop status</th>
				</tr>
				<c:forEach items="${ unsuccessfulBidDetails }" var="bd">
					<tr>
						<td>${ bd.cropType }</td>
						<td>${ bd.cropName }</td>
						<td>${ bd.cropCurrentBid }</td>
						<td>${ bd.bidStatus }</td>
					</tr>
				</c:forEach>
			</table>

		</div>
	</div>
</body>
</html>