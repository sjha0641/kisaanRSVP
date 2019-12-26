<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: green;
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover {
	background-color: #111;
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






</style>
<script>
	function Mytest() {
		var x = prompt("Enter the Bid Amount", "0");
		var num1 = parseInt(x);
		var y = document.getElementsByName("bid");
		y[0].value = num1;
		return true;
	}
</script>
</head>
<body style="background-color: #03fc4e">

	<ul>
		<li><a class="active" href="#home">Home</a></li>
		<li><a href="#news">Bid Crops</a></li>
		<li><a href="viewyourbids.jsp">View Your Biddings</a></li>
		<li><a href="HomePage.jsp">Logout</a></li>
	</ul>


	<table >

		<h3>${ msg }</h3>
		<h4 style="margin-left:45%">List Of Crops To Bid</h4>
		<div>
			<form style="margin: auto" action="bidding.rsvp">
				<tr>
					<th>Select To Bid</th>
					<th>Crop Type</th>
					<th>Crop Name</th>
					<th>Base Price</th>
					<th>Current Bid</th>
				</tr>
				<c:forEach items="${ cropsList }" var="crop">
					<tr>

						<td><input type="radio" name="bidthiscrop"
							value="${ crop.cropId }" /></td>
						<td>${ crop.cropType }</td>
						<td>${ crop.cropName }</td>
						<td>${ crop.cropBasicPrice }</td>
						<td>${ crop.cropCurrentBid }</td>
					</tr>
				</c:forEach>
	</table>
	<input type="number" name="bid" hidden />
	<input style="position: absolute; margin-top: 50px; margin-left:47%; background-color:#90fc03 width:300px; border-radius:5px" type="submit"
		onclick="return Mytest()" value="CLICK TO BID" />

	</form>

	<div>
</body>
</html>