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
	Please Select an attribute you want to edit below:
	</h2>
	<br>
	<form method="post" action="editCR_b.jsp">
		<select name="action" size=1>
			<option value="1">Edit CRID</option>
			<option value="2">Edit password</option>
		</select>&nbsp;
		<table>
		
			<tr>
				<td>Original CRID (if edit CRID, leave empty otherwise)</td>
				<td><input type="text" name="oCRID_f"></td>
			</tr>
			
			<tr>
				<td>New CRID (if edit CRID, leave empty otherwise)</td>
				<td><input type="text" name="nCRID_f"></td>
			</tr>
			
			<tr>
				<td>CRID (if edit password, leave empty otherwise)</td>
				<td><input type="text" name="CRID_f"></td>
			</tr>
			
			<tr>
				<td>New password (if edit password, leave empty otherwise)</td>
				<td><input type="text" name="nPassword_f"></td>
			</tr>
			
		</table>
		<br> <input type="submit" value="submit">
	</form>
	<a href="http://localhost:8080/336test/adminFunction/Adminlogin.jsp"> <mark>Back to management page</mark></a>
	<br>

</body>
</html>