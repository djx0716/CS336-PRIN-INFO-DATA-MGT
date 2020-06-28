<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Airport</title>
</head>
<body>

<%

String airportID = request.getParameter("airportID");
int temp;

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql:"
		+ "//groupone.chnfim8mzrlx.us-east-2.rds.amazonaws.com:3306/"
		+ "GroupOne336","cody","codychen1005!"); 
Statement st= con.createStatement(); 
String query = "";

query =  "insert into Airport (airportID) values ('" + airportID + "')";
//out.print(query);
try{
	temp =  st.executeUpdate(query);
	out.println("Data is successfully added!");
}
catch(Exception e){
	System.out.print(e);
	e.printStackTrace();
}



%>

</body>
</html>