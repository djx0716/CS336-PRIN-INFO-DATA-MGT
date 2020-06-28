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
		<b>Please enter the customer representative's CRID you want to delete</b>
	</h1>
	
	<br>
	
	<form method="post" action="deleteCR_b.jsp">
	
		<table>
		
			<tr>
				<td>CRID</td>
				<td><input type="text" name="CRID_f"></td>
			</tr>
			
			
		</table>
		
		<br> <input type="submit" value="submit">
		
	</form>

</body>
</html>