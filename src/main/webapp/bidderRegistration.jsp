<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

input{
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
</style>
</head>
<body>
<div class="container">
  <form action="registerBidder.rsvp" method="post" enctype="multipart/form-data">
  <label>Personal Details</label>
    <div class="row">
      <div class="col-25">
        <label for="name">Name</label>
      </div>
      <div class="col-75">
        <input type="text" id="name" name="bidderFullName" placeholder="Your name..">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="contact">Contact No</label>
      </div>
      <div class="col-75">
        <input type="number" id="contact" name="bidderContact" placeholder="Your contact no..">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="email">email</label>
      </div>
      <div class="col-75">
        <input type="email" id="email" name="email" placeholder="Your email..">
      </div>
    </div>
    <label>Address Line</label>
    <div class="row">
      <div class="col-25">
        <label for="addressline1">Address line1</label>
      </div>
      <div class="col-75">
       <input type="text" id="addressline1" name="bidderAddressLine1" placeholder="Your AddressLine1..">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="addressline2">Address line2</label>
      </div>
      <div class="col-75">
       <input type="text" id="addressline2" name="bidderAddressLine2" placeholder="Your AddressLine2..">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="city">City</label>
      </div>
      <div class="col-75">
       <input type="text" id="city" name="bidderCity" placeholder="Your city.."> 
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="state">State</label>
      </div>
      <div class="col-75">
       <input type="text" id="state" name="bidderState" placeholder="Your state.."> 
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="pincode">Pin Code</label>
      </div>
      <div class="col-75">
       <input type="number" id="pincode" name="bidderPinCode" placeholder="Your pin code.."> 
      </div>
    </div>
    <label>Bank Details</label>
    <div class="row">
      <div class="col-25">
        <label for="accountno">Account No</label>
      </div>
      <div class="col-75">
       <input type="number" id="accountno" name="bidderAccountNo" placeholder="Your Bank Account No.."> 
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="ifsccode">IFSC Code</label>
      </div>
      <div class="col-75">
       <input type="text" id="ifsccode" name="bidderIFSCCode" placeholder="Your IFSC code.."> 
      </div>
    </div>
    <label>Documents Upload</label>
    <div class="row">
      <div class="col-25">
        <label for="aadharfile">Aadhaar</label>
      </div>
      <div class="col-75">
       <input type="file" id="aadharfile" name="bidderAadhaarfile"> 
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="pan">PAN</label>
      </div>
      <div class="col-75">
       <input type="file" id="pan" name="bidderPanfile" > 
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="certificate">Certificate</label>
      </div>
      <div class="col-75">
       <input type="file" id="certificate" name="bidderCertificatefile"> 
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="pass">password</label>
      </div>
      <div class="col-75">
       <input type="password" id="pass" name="password"> 
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="passw">confirm password</label>
      </div>
      <div class="col-75">
       <input type="password" id="passw" name="confirmpassword"> 
      </div>
    </div>
    <div class="row">
      <input type="submit" value="Submit">
    </div>
  </form>
</div>
</body>
</html>
</body>
</html>