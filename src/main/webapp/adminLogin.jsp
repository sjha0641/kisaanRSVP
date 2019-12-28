<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<link rel="stylesheet" href="adminLogin.css">
<style>
.gap > input{
	float: right;
	margin-right: 38%;
}

#button{
	margin-left: 100px;
}
</style>
</head>
<body style="background-image: url('images/images2.jfif');">
<h3>${errorMsg}</h3>
<form action="adminLogin.rsvp" method="get">
		<div class="main">
		<h4 style="text-align: center">Admin</h4>
			<div class="gap">
				<label>Email</label> <input type="text" name="adminEmail" />
			</div>
			<div class="gap">
				<label>Password</label> <input type="password" name="adminPassword" />
			</div>
			<div class="gap" id="button">
			<button type="submit">login</button>
			<button type="reset">clear</button>
			</div>
		</div>
	</form>
</body>
</html>