<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Aircraft</title>
</head>
<body>

<%

int aircraftID = Integer.parseInt(request.getParameter("aircraftID"));
String column_name = request.getParameter("column_name");
int data = Integer.parseInt(request.getParameter("data"));
int temp;

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql:"
		+ "//groupone.chnfim8mzrlx.us-east-2.rds.amazonaws.com:3306/"
		+ "GroupOne336","cody","codychen1005!"); 
Statement st= con.createStatement(); 
String query = "";

query = "update Aircrafts set "+ column_name+ " = "+data+ " where aircraftID="+aircraftID;
//out.print(query);
try{
	temp =  st.executeUpdate(query);
	out.println("Data is successfully edited!");
}
catch(Exception e){
	System.out.print(e);
	e.printStackTrace();
}



%>
</body>
</html>