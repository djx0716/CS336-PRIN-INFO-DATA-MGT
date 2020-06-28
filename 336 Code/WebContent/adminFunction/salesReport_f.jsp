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
		<b>Please enter the month to get the sales report for that month (input 1-12), (with independent year) </b>
	</h1>
	
	<br>
	
	<form method="post" action="salesReport_b.jsp">
	
		<table>
		
			<tr>
				<td>Month</td>
				<td><input type="text" name="month_f"></td>
			</tr>
			
		</table>
		
		<br> <input type="submit" value="submit">
		
	</form>
	
	<a href="http://localhost:8080/336test/adminFunction/Adminlogin.jsp"> <mark>Back to manage function page</mark></a>

</body>
</html>