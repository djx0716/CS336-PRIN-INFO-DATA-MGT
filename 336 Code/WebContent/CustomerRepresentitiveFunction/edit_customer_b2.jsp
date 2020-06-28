<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit flight</title>
</head>
<body>
<%
int ticket_number = Integer.parseInt(request.getParameter("ticket_number"));
String original_flight_number = request.getParameter("original_flight_number");
String new_flight_number = request.getParameter("new_flight_number");

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql:"
		+ "//groupone.chnfim8mzrlx.us-east-2.rds.amazonaws.com:3306/"
		+ "GroupOne336","cody","codychen1005!"); 
Statement st= con.createStatement(); 


// "update Aircrafts set "+ column_name+ " = "+data+ " where aircraftID="+aircraftID;
String query = "update Relates_to set flight_number= '"+new_flight_number +"' where ticket_number="+ticket_number+" and flight_number='"+original_flight_number+"'";
//out.print(query);
int temp = st.executeUpdate(query);
out.println("Reservation successfully changed");

%>

</body>
</html>