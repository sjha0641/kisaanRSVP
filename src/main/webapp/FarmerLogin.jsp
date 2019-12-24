<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="loginfarmers.rsvp" method="post">
Enter email:<input type="email" name="email" placeholder="Email">
Enter password:<input type="password" name="password" placeholder="password">
<button type="submit">Login</button>
</form>
<h1>${ invalidcredentials }</h1>
<a href="FarmerRegistration.jsp">farmerRegistration</a>
<a href="forgotpasswordfarmer.jsp">forgot password</a>
</body>
</html>