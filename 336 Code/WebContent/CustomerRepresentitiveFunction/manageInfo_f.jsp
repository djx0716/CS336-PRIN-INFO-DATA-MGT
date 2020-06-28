<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage information</title>
</head>
<body>

<h2> Select the operation and what table to change</h2>

<br>
	<form method="post" action="manageInfo_transfer.jsp">
	<!-- hidden type name trip_type = "1"-->
	<p>
		<select name="operation" size=1>
			<!-- add means Add(operation), edit means Edit(operation), delete means Delete(operation)-->
			<option value="add">Add</option>
			<option value="edit">Edit</option>
			<option value="delete">Delete</option>
		</select>&nbsp;
	</p>
	
	<p>
	
		<br> <select name="table" size=1>
			<!-- aircraft means Aircraft(table), airport means Airports(table), flight means Flights(table)-->
			<option value="Aircrafts">Aircrafts</option>
			<option value="Airport">Airports</option>
			<option value="Flight">Flights</option>
		</select>&nbsp;
		<br>
	</p>
		 <input type="submit" value="Submit">
	</form>
<br>

</body>
</html>