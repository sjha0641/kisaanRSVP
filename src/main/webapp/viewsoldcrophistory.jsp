<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View sold crop history</title>
</head>
<body>
<h1>${ logincredentials.userId }</h1><br><br>
<a> ${ farmerInFo.farmerFullName }</a><br><br>
<a> ${ farmerInFo.farmerId }</a><br><br>
<table border="3px">
  <c:forEach items="${ ListOfCrops }" var="crop">
    <tr>
    <td><c:out value="${crop.cropLastDateForBid}" /></td>
      <td><c:out value="${crop.cropName}" /></td>
      <td><c:out value="${crop.cropQuantity}" /></td>
      <td><c:out value="${crop.cropBasicPrice}" /></td>
      <td><c:out value="${crop.cropSoldPrice}" /></td>
      <td><c:out value="${crop.cropSoldPrice*crop.cropQuantity}" /></td>
      <td><c:out value="${crop.cropSoldStatus}" /></td>
    </tr>
  </c:forEach>
</table>
<a href="farmerdashbord.jsp">Dashboard</a>
</body>
</html>