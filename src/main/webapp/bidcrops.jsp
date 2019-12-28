<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="src/main/webapp/css/biddernavigation.css"></style>
<script>
	var cropId,currentBidAmount; 
	
	
	function close() {
		document.getElementById('bg').style.display='none';
	}
	
	
	function doSubmit(){
		var amount=document.getElementsByName('bidamount')[0].value;
		
		var y= amount%100;
		if(amount < currentBidAmount || y!=0)
			{
			var p1=document.getElementById('p1').style.display="block";	
			return false;}
		else{
			return true;
		}
	}
	
	function myTest() {
		
		var ele = document.getElementsByName('bidthiscrop'); 
         
         for(i = 0; i < ele.length; i++) { 
             if(ele[i].checked) 
				cropId = ele[i].value; 
         } 
		
		alert(cropId);
		currentBidAmount = document.getElementById(cropId).value;
		alert(currentBidAmount);
		document.getElementById('bg').style.display = 'block';
		document.getElementById('b1').style.display = 'none';
	}
</script>

<style>
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

</head>
<body>

	<ul>
		<li><a href="bidderdashboard.jsp">Home</a></li>
		<li><a href="fetchallcrops.rsvp">Bid Crops</a></li>
		<li><a href="viewyourbids.jsp">View Your Biddings</a></li>
		<li><a href="logoutbidder.rsvp">Logout </a></li>
	</ul>

	<h3>${ successfullbidmsg }</h3>
	<h4 style="margin-left: 45%">List Of Crops To Bid</h4>

	<form action="bidding.rsvp" onsubmit="return doSubmit()">
		<table>
			<tr>
				<th>Select To Bid</th>
				<th>Crop Type</th>
				<th>Crop Name</th>
				<th>Base Price</th>
				<th>Current Bid</th>
				<th>Last Day Of Bid</th>
			</tr>
			<c:forEach items="${ cropsList }" var="crop">
				<tr>
					<td><input type="radio"  name="bidthiscrop"
						value="${ crop.cropId }" /></td>
					<td>${ crop.cropType }</td>
					<td>${ crop.cropName }</td>
					<td>${ crop.cropBasicPrice }</td>
					<td>${ crop.cropCurrentBid }</td>
					<td>${ crop.cropLastDateForBid }</td>
					<input type="hidden" id="${ crop.cropId }" value="${ crop.cropCurrentBid }" />
				</tr>
			</c:forEach>
		</table>
		
		<div class="bg-modal" id="bg">
			<div class="modal-contents">
				<button type="button" class="close" value="+"></button>
				<h2>Enter Amount greater than the Current Bid</h2>
				<input class="input1" type="number" name="bidamount"/>
				<p style="display: none;" id="p1">Please enter amount greater than the current bid amount and in	multiples of 100..</p>
							
				<input type="submit" value="Submit" />
			</div>
		</div>


		<input
			style="position: absolute; margin-top: 50px; margin-left: 47%; background-color: #336600 width:300px; border-radius: 5px"
			type="button" id="b1" onclick="myTest()" value="CLICK TO BID" />
	</form>
</body>
</html>