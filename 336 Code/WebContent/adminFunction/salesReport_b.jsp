<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="javax.sql.*"%>
    <%@ page import="java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
		try {

			//Get the database connection
			Class.forName("com.mysql.jdbc.Driver"); 
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql:" + "//groupone.chnfim8mzrlx.us-east-2.rds.amazonaws.com:3306/" + "GroupOne336","cody","codychen1005!"); 
			//Get the inputs
			String month_b = request.getParameter("month_f");
			Statement stmt = con.createStatement();
			/****right now we know the attribute trip_type  = oneway, so we skip it and put it as a conditional statement***/

			String strQuery = "SELECT t.ticket_number, f.flight_number, f.total_fare FROM Flight as f join Relates_to as r using(flight_number) join Ticket as t using(ticket_number) where Month(t.date_of_purchase)=('"+month_b+"') order by ticket_number;";
			ResultSet rs = stmt.executeQuery(strQuery);
			
			out.print("<table style = 'width:50%'>");

				out.print("<tr>");
				
				out.print("<td>");
				out.print("Ticket number");
				out.print("</td>");
				
				out.print("<td>");
				out.print("Flight number");
				out.print("</td>");
				
				out.print("<td>");
				out.print("Total_fare");
				out.print("</td>");
				
	
				
				out.print("</tr>");
				
				while (rs.next()) 
				{
					
					out.print("<tr>");
					
					out.print("<td>");
					out.print(rs.getString("ticket_number"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(rs.getString("flight_number"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(rs.getString("total_fare"));
					out.print("</td>");
					
				
					out.print("</tr>");
					
				}
			out.print("</table>");
			out.print("<a href=" + "http://localhost:8080/336test/adminFunction/salesReport_f.jsp><mark>back</mark></a>");
		
		} catch (Exception e) {
			out.print(e);
		}
	%>


</body>
</html>