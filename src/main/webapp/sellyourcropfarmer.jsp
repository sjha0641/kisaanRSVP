<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="sellyourcrop.rsvp" method="post" enctype="multipart/form-data">
Crop Type<input type="text" name="cropType"><br>
Crop Name<input type="text" name="cropName"><br>
Fertilizer Type<input type="text" name="cropFertilizerType"><br>
Quantity<input type="number" name="cropQuantity"><br>
Last date for bid<input type="date" name="cropLastDateForBid"><br>
Basic cost <input type="number" name="cropBasicPrice"><br>
Soil PH Certificate<input type="file" name="soilphcertificateFile"><br>
<button type="submit">sell your crop</button><br>
</form>
</body>
</html>