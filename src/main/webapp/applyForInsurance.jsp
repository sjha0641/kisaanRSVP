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
  <form action="applyForInsurance.rsvp" method="post">
    <div class="row">
      <div class="col-25">
        <label for="season">Season</label>
      </div>
      <div class="col-75">
        <input type="text" id="season" name="Season" placeholder="which season is it..">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="year">Year</label>
      </div>
      <div class="col-75">
        <input type="date" id="year" name="year" placeholder="current year..">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="cropName">Crop Name</label>
      </div>
      <div class="col-75">
        <input type="text" id="cropName" name="cropName" placeholder="Your Crop Name..">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="sumInsured">Sum Insured</label>
      </div>
      <div class="col-75">
       <input type="number" id="sumInsured" name="sumInsured" placeholder="Sum Insured">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="area">Area</label>
      </div>
      <div class="col-75">
       <input type="number" id="area" name="area" placeholder="Your field area">
      </div>
    </div>
    <div class="row">
      <input type="submit" value="Submit">
    </div>
  </form>
</div>
</body>
</html>