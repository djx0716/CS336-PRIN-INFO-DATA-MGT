<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String flight_number = request.getParameter("flight_number");
int temp;

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql:"
		+ "//groupone.chnfim8mzrlx.us-east-2.rds.amazonaws.com:3306/"
		+ "GroupOne336","cody","codychen1005!"); 
Statement st= con.createStatement(); 
String query = "";

query = "delete from Flight where flight_number=('" + flight_number + "')";
//out.print(query);
try{
	temp =  st.executeUpdate(query);
	out.println("Data is successfully deleted!");
}
catch(Exception e){
	System.out.print(e);
	e.printStackTrace();
}



%>
</body>
</html>