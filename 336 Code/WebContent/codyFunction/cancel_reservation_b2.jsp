<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cancel Reservation</title>
</head>
<body>

<% 
int ticket_number = Integer.parseInt(request.getParameter("ticket_number"));

String query_ticket ="delete from Ticket where ticket_number ="+ticket_number;
String query_relatesto = "delete from Relates_to where ticket_number ="+ticket_number;

//out.print(query_ticket);

java.sql.Connection con = DriverManager.getConnection("jdbc:mysql:"
		+ "//groupone.chnfim8mzrlx.us-east-2.rds.amazonaws.com:3306/"
		+ "GroupOne336","cody","codychen1005!"); 
Statement st= con.createStatement(); 
int temp;

temp = st.executeUpdate(query_relatesto);
temp = st.executeUpdate(query_ticket);
out.print("Ticket successfully canceled");
%>

</body>
</html>