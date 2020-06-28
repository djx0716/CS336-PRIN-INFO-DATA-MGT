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
		<b>Please enter the customer's ID you want to delete</b>
	</h1>
	
	<br>
	
	<form method="post" action="deleteC_b.jsp">
	
		<table>
		
			<tr>
				<td>CustomerID</td>
				<td><input type="text" name="CustomerID_f"></td>
			</tr>
			
			
		</table>
		
		<br> <input type="submit" value="submit">
		
	</form>

</body>
</html>