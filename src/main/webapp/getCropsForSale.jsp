<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.bs {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}
.tablink {
  background-color: #4CAF50;
  color: white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  font-size: 17px;
  width: 16.66%;
}

.field{
 padding: 8px 20px;
}

.tablink:hover {
   background-color: #4CAF50;
}

/* Style the tab content */
.tabcontent {

  display: none;
  padding: 50px;
  text-align: center;
}

.tabcontent1 {
  color: white;
  display: none;
  align-content: right;
  float: right;
}
/*cccccccccccccccccccccccc*/
.tablink1 {
  background-color: #4CAF50;
  color: white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  font-size: 17px;
  width: 16.66%;
  border-radius: 30px 0px 0px 30px;
}

.tablink1:hover {
   background-color: #4CAF50;
}
/*cccccccccccccccccccccccc*/
.tablink2 {
  background-color: #4CAF50;
  color: white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  font-size: 17px;
  width: 16.66%;
  border-radius: 0px 30px 30px 0px;
}
.tablink3 {
  background-color: #4CAF50;
  color: white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  font-size: 17px;
  width: 16.66%;
  border-radius: 30px 30px 30px 30px;
}
.container {
padding-top:90px;
	border-radius: 0px 0px 0px 30px;
}

.tablink2:hover {
   background-color: #4CAF50;
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

tr:nth-child(even){background-color: #f2f2f2}</style>
</head>
<body>
<div>
<a href="bidderDashboard.jsp"><button class="tablink1">Home Page</button></a>
<button class="tablink" onclick="openFunction('AboutUs', this, 'green')" >AboutUs</button>
<a href="homePage.jsp"><button class="tablink">Logout ${ Session.Abandon }</button></a>
<button class="tablink" onclick="openFunction('ContactUs', this, 'green')" >Contact Us</button>
<a href="getCropsForSale.rsvp"><button class="tablink">Bid Crops</button></a>
<button class="tablink2" onclick="window.location.href = 'viewYourBids.jsp';" >View All Your Bids</button>
</div>
<h1>${ loggedBidder.bidderFullName }</h1>
<h1>${ bidinfo.bidderId }</h1>
<h3> ${ msg }</h3>
<div class="container">
<table>
<tr>
      <th>Last Day for Bid</th>
      <th>Crop Type</th>
      <th>Crop Name</th>
      <th>Base Price</th>
      <th>Current Bid</th>
      <th>Bid Amount</th>
      <th>Bid</th>
    </tr>
  <c:forEach items="${ listOfCrops }" var="crop">
    <tr>
    <td><c:out value="${crop.cropLastDateForBid}" /></td>
      <td><c:out value="${crop.cropType}" /></td>
      <td><c:out value="${crop.cropName}" /></td>
      <td><c:out value="${crop.cropBasicPrice}" /></td>
      <td></td>
      <td><form action="bidding.rsvp" method="post"><input type="hidden" name="bidthiscrop" value="${crop.cropId}"><input type="hidden" name="bidderid" value="${ bidinfo.bidderId }"><input class="field" type="number" name="bid"></td>
      <td><input class="bs" type="submit" value="clik to bid"></td></form>
    </tr>
  </c:forEach>
</table>
</div>
</body>
</html>