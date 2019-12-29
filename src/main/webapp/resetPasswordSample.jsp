<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
/* Set a style for all buttons */
button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}
body {
background-color: #4CAF50;
}
button:hover {
	opacity: 0.8;
}
#AboutUs {background-color:#4CAF50;}
#ContactUs {background-color:#4CAF50;}
#HomePage {background-color:#4CAF50;}
#Login {background-color:#4CAF50;}
/* for top tab*/
.tablink {
  background-color: #4CAF50;
  color: white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  font-size: 17px;
  width: 25%;
}

.tablink:hover {
  background-color: #4CAF50;
}

/* Style the tab content */
.tabcontent {
  color: white;
  display: none;
  padding: 50px;
  text-align: center;
}
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 4px double rgba(28,110,164,0.52);
	border-radius: 30px 30px 0px 30px;
	width: 80%; /* Could be more or less, depending on screen size */
}
input {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding-top: 60px;
}
</style>
</head>
<body>
<a href="homePage.jsp"><button class="tablink">Home Page</button></a>
<button class="tablink" onclick="openFunction('AboutUs', this, 'green')" >AboutUs</button>
<button class="tablink" onclick="openFunction('Login', this, 'green')">Login</button>
<button class="tablink" onclick="openFunction('ContactUs', this, 'green')" >Contact Us</button>
<form class="modal-content modal" action="resetPasswordFarmer.rsvp" method="post">
<input type="email" name="email" placeholder="enter your email">
<input type="password" name="password" placeholder="enter new password">
<button type="submit">reset password</button>
</form>
hgcjbasdckjb
<div id="Login" class="tabcontent">
<center>
<h1>${ invalidCredentials }</h1>
	<button class="login1button" onclick="document.getElementById('id01').style.display='block'"
		style="width: auto;">Farmer Login</button>
	<button class="login2button" onclick="document.getElementById('id02').style.display='block'"
		style="width: auto;">Bidder Login</button>
</center>
</div>																
<div id="HomePage" class="tabcontent">
  <h1>HomePage</h1>
  <p>hi wellcome to our page</p> 
</div>
<div id="AboutUs" class="tabcontent">
  <h1>AboutUs</h1>
  <p>We will change the feature with the help of <strong>Farmers</strong>.</p> 
</div>
<div id="ContactUs" class="tabcontent">
  <h1>ContactUs</h1>
  <p>PRIYANKYA ROY</p> 
  <p>VISHAL and SATHYA</p>
  <p>RaviThejaReddy</p>
</div>
<script>
function openFunction(functionName,elmnt,color) {
	  var i, tabcontent, tablinks;
	  tabcontent = document.getElementsByClassName("tabcontent");
	  for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
	  }
	  tablinks = document.getElementsByClassName("tablink");
	  for (i = 0; i < tablinks.length; i++) {
	    tablinks[i].style.backgroundColor = "";
	  }
	  document.getElementById(functionName).style.display = "block";
	  elmnt.style.backgroundColor = color;

	}
document.getElementById("defaultOpen").click();
</script>
</body>
</html>