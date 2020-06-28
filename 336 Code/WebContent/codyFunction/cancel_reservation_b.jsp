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
*/


%>

<h2> Enter the Ticket Number </h2>
<form action="cancel_reservation_b2.jsp" method = "post">
<pre>

Ticker Number : <input type = "text" name = "ticket_number">

           <input type = "submit" value = "Submit">

</pre>
</form>

</body>
</html>