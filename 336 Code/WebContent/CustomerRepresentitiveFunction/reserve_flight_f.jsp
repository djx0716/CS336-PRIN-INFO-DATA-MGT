<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reserve Flight</title>
</head>
<body>

<h2> Enter the information to reserve flight</h2>
<p> If trip type is round, please enter return flight number and return date </p>
<form action="reserve_flight_b.jsp" method = "post">
<pre>

Customer ID : <input type = "text" name = "customerID">

Flight Number : <input type = "text" name = "flight_number">

Departure Date : <input type = "text" name = "departure_date">

Trip Type : <input type = "text" name = "trip_type">

Special Meal : <input type = "text" name = "special_meal">

Class : <input type = "text" name = "class">

Seat Number : <input type = "text" name = "seat_number">

Return Flight Number(leave blank if not round trip) : <input type = "text" name = "return_flight_number">

Return Date(leave blank if not round trip) : <input type = "text" name = "return_date">

           <input type = "submit" value = "Submit">

</pre>





</form>

</body>
</html>