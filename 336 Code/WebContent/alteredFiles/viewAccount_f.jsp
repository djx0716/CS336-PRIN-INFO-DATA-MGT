<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>
	Please Select an attribute below:
	</h2>
	<br>
	<form method="post" action="viewAccount_b.jsp">
		<select name="action" size=1>
			<option value="1">View all past reservations</option>
			<option value="2">View all upcoming reservations</option>
		</select>&nbsp;
		
		<table>
		
			<tr>
				<td>CustomerID</td>
				<td><input type="text" name="UID_f"></td>
			</tr>
			
		</table>
		
		<br> <input type="submit" value="submit">
	</form>
	<a href="http://localhost:8080/336test/adminFunction/produceReservationList_f.jsp"> <mark>Back to product reservation page</mark></a>
	<br>

</body>
</html>