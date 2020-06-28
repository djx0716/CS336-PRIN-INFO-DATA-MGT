<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Flight</title>
</head>
<body>
<h2> Enter the information </h2>
<form action="add_Flight_b.jsp" method = "post">
<pre>

flight_number : <input type = "text" name = "flight_number">

domestic_or_international : <input type = "text" name = "domestic_or_international">

seat_avaiblity : <input type = "text" name = "seat_avaiblity">

arrival_airport : <input type = "text" name = "arrival_airport">

departure_airport : <input type = "text" name = "departure_airport">

departure_time : <input type = "text" name = "departure_time">

arrival_time : <input type = "text" name = "arrival_time">

operating_days : <input type = "text" name = "operating_days">

total_fare : <input type = "text" name = "total_fare">

           <input type = "submit" value = "Submit">

</pre>



</form>
</body>
</html>