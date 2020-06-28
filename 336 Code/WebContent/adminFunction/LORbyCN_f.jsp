<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>
		<b>Please enter the customer name to get the reservations for that flight </b>
	</h1>
	
	<br>
	
	<form method="post" action="LORbyCN_b.jsp">
	
		<table>
		
			<tr>
				<td>Customer name</td>
				<td><input type="text" name="CN_f"></td>
			</tr>
			
		</table>
		
		<br> <input type="submit" value="submit">
		
	</form>
	
	<a href="http://localhost:8080/336test/adminFunction/Adminlogin.jsp"> <mark>Back to manage function page</mark></a>

</body>
</html>