<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Flight Reservation</title>
</head>
<body>


<p> Following are the tickets you have,please enter one that you have </p>
<p> if there is nothing showed, you have no tickets yet </p>


<%

String customerID = request.getParameter("customerID");
String query_getAllTicket = "select ticket_number from Owns_by where customerID='"+customerID+"'";
//out.print(query_getAllTicket);
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql:"
		+ "//groupone.chnfim8mzrlx.us-east-2.rds.amazonaws.com:3306/"
		+ "GroupOne336","cody","codychen1005!"); 
Statement st= con.createStatement(); 
ResultSet rs = st.executeQuery(query_getAllTicket);

out.print("<table>");
out.print("<tr>");
while(rs.next()){
	out.print("<td>");
	out.print(rs.getString("ticket_number"));
	out.print("</td>");
}
out.print("</tr>");
out.print("</table>");

/*
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

*/
%>

<h2> Enter the information need to edit the flight</h2>

<form action="edit_customer_b2.jsp" method = "post">
<pre>
Ticket Number :<input type = "text" name = "ticket_number">

Original Flight Number : <input type = "text" name = "original_flight_number">

New Flight Number : <input type = "text" name = "new_flight_number">

           <input type = "submit" value = "Submit">

</pre>
</form>


</body>
</html>