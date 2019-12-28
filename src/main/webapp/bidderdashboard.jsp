<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="src/main/webapp/css/biddernavigation.css">  </style>
</head>

<body style="background-color: #03fc4e">

	<ul>
		<li><a href="bidderdashboard.jsp">Home</a></li>
		<li><a href="fetchallcrops.rsvp">Bid Crops</a></li>
		<li><a href="viewyourbids.jsp">View Your Biddings</a></li>
		<li><a href="logoutbidder.rsvp">Logout </a></li>
	</ul>
				
		<h1>Welcome ${ biddername } to KISAANRSVP. </h1>
		<h5>Our platform makes your experience super smooth for purchasing crops from farmers.</h5>
		<p>Go to Bid Crops Tab to view the list of all available crops and select a crop to bid for it.</p>
			
</body>
</html>