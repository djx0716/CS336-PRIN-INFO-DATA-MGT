<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Flight</title>
</head>
<body>

<%

String flight_number = request.getParameter("flight_number");
String domestic_or_international = request.getParameter("domestic_or_international");
int seat_avaiblity = Integer.parseInt(request.getParameter("seat_avaiblity"));
String arrival_airport = request.getParameter("arrival_airport");
String departure_airport = request.getParameter("departure_airport");
String departure_time = request.getParameter("departure_time");
String arrival_time = request.getParameter("arrival_time");
String operating_days = request.getParameter("operating_days");
int total_fare = Integer.parseInt(request.getParameter("total_fare"));

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql:"
		+ "//groupone.chnfim8mzrlx.us-east-2.rds.amazonaws.com:3306/"
		+ "GroupOne336","cody","codychen1005!"); 
Statement st= con.createStatement(); 
String query = "";
int temp;

query =  "insert into Flight (flight_number,domestic_or_international,seat_avaiblity,arrival_airport,departure_airport,departure_time,arrival_time,operating_days,total_fare) values('"+flight_number+"','"+domestic_or_international+"',"+seat_avaiblity+",'"+arrival_airport+"','"+departure_airport+"','"+departure_time+"','"+arrival_time+"','"+operating_days+"',"+total_fare+")";                            ;
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