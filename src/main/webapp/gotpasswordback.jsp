<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

/* Full-width input fields */
input[type=email], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

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

button:hover {
	opacity: 0.8;
}

.login1button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
	border: 4px double rgba(28,110,164,0.52);
	border-radius: 0px 30px 0px 30px;
}

.login1button:hover {
	border: 4px double rgba(28,110,164,0.52);
	border-radius: 0px 30px 0px 30px;
	opacity: 0.8;
}
.login2button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
	border: 4px double rgba(28,110,164,0.52);
	border-radius: 30px 0px 30px 0px;
}

.login2button:hover {
	border: 4px double rgba(28,110,164,0.52);
	border-radius: 30px 0px 30px 0px;
	opacity: 0.8;
}
/* Extra styles for the cancel button */
.re {
	width: auto;
	padding: 10px 18px;
	background-color: #4CAF50;
}

/* Center the image and position the close button */
.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
	position: relative;
}

img.avatar {
	width: 40%;
	border-radius: 50%;
}

.container {
	padding: 16px;
	border-radius: 0px 0px 0px 30px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

/* The Modal (background) */
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

/* The Close Button (x) */
.close {
	position: absolute;
	right: 25px;
	top: 0;
	color: #000;
	font-size: 35px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: red;
	cursor: pointer;
}

/* Add Zoom Animation */
.animate {
	-webkit-animation: animatezoom 0.6s;
	animation: animatezoom 0.6s
}

@
-webkit-keyframes animatezoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@
keyframes animatezoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}

}
body {
background-color: #4CAF50;
}
/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}

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

#AboutUs {background-color:#4CAF50;}
#ContactUs {background-color:#4CAF50;}
#HomePage {background-color:#4CAF50;}
#Login {background-color:#4CAF50;}


</style>
</head>
<body>
<div>
<button class="tablink" onclick="openFunction('HomePage', this, 'green')" >Home Page</button>
<button class="tablink" onclick="openFunction('AboutUs', this, 'green')" >AboutUs</button>
<button class="tablink" onclick="openFunction('Login', this, 'green')">Login</button>
<button class="tablink" onclick="openFunction('ContactUs', this, 'green')" >Contact Us</button>



								<!-- Login Things Starts here-->
<!-- ************************************************************************************************************ -->	
<!-- ************************************************************************************************************ -->	
<!-- ************************************************************************************************************ -->		
<div id="id01" class="modal">
		<form class="modal-content animate" action="loginfarmers.rsvp"
			method="post">
			<br> <br> <br>
			<div class="container">
				<label for="email"><b>Email</b></label> <input type="email"
					placeholder="Enter Email" name="email" required> <label
					for="password"><b>Password</b></label> <input type="password"
					placeholder="Enter Password" name="password" required>
				<button type="submit">Login</button>
				<label> <input type="checkbox" checked="checked"
					name="remember"> Remember me
				</label>
			</div>
			<br> <br> <br>
			<div class="container" style="background-color: #f1f1f1">
				<a href="FarmerRegistration.jsp"><button type="button" class="re">Register for New Account</button></a>
				<span class="psw">Forgot <a href="forgotpasswordgeneral.jsp">password?</a></span>
			</div>
		</form>
	</div>
<div id="id02" class="modal">
		<form class="modal-content animate" action="loginfarmers.rsvp"
			method="post">
			<br> <br> <br>
			<div class="container">
				<label for="email"><b>Email</b></label> <input type="email"
					placeholder="Enter Email" name="email" required> <label
					for="password"><b>Password</b></label> <input type="password"
					placeholder="Enter Password" name="password" required>

				<button type="submit">Login</button>
				<label> <input type="checkbox" checked="checked"
					name="remember"> Remember me
				</label>
			</div>

			<br> <br> <br>
			<div class="container" style="background-color: #f1f1f1">
				<a href="FarmerRegistration.jsp"><button type="button" class="re" >Register for New Account</button></a>
				<span class="psw">Forgot <a href="forgotpasswordgeneral.jsp">password?</a></span>
			</div>
		</form>
	</div>

<!-- ************************************************************************************************************ -->	
<!-- ************************************************************************************************************ -->	
<!-- ************************************************************************************************************ -->
									<!-- Login Things Starts here-->
									
						<!-- homepage contactus aboutus Things Starts here-->	
<!-- ************************************************************************************************************ -->	
<!-- ************************************************************************************************************ -->	
<!-- ************************************************************************************************************ -->
<div id="Login" class="tabcontent">
<center>
<h1>${ invalidcredentials }</h1>
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
  <p>VISHAL and SATYA</p>
  <p>RaviThejaReddy</p>
</div>
<!-- ************************************************************************************************************ -->	
<!-- ************************************************************************************************************ -->	
<!-- ************************************************************************************************************ -->
						<!-- homepage contactus aboutus Things ends here-->
						<center><h1> your password is: ${ passwordGeneral.password }</h1></center>
										<!-- Start of Scripts -->
<script>
// Get the modal
var modal1 = document.getElementById('id01');
var modal2 = document.getElementById('id02');


// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal1) {
        modal1.style.display = "none";
    }
    if (event.target == modal2) {
        modal2.style.display = "none";
    }
}

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

										<!-- End of Scripts -->
</div>

</body>
</html>