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
			String AN_b = request.getParameter("AN_f");
			Statement stmt = con.createStatement();
			/****right now we know the attribute trip_type  = oneway, so we skip it and put it as a conditional statement***/

			//String strQuery = "SELECT F.flight_number from Associate as a join Airport as ap using(airportID) join Airline_Company as ac using(companyID) join Operate as o using(companyID) join Flight as f using(flight_number) where f.arrival_airport = ('"+AN_b+"') or f.departure_airport = ('"+AN_b+"');";
			String strQuery = "SELECT f.flight_number from Flight as f where f.arrival_airport = ('"+AN_b+"') or f.departure_airport = ('"+AN_b+"');";
			ResultSet rs = stmt.executeQuery(strQuery);
			
			out.print("<table style = 'width:50%'>");

				out.print("<tr>");
				
				/*out.print("<td>");
				out.print("Airport ID");
				out.print("</td>");*/
				
				out.print("<td>");
				out.print("Flight number in that airport");
				out.print("</td>");
				
	
				
				out.print("</tr>");
				
				while (rs.next()) 
				{
					
					out.print("<tr>");
					
					/*out.print("<td>");
					out.print(rs.getString("airportID"));
					out.print("</td>");*/
					
					out.print("<td>");
					out.print(rs.getString("flight_number"));
					out.print("</td>");
					
				
					out.print("</tr>");
					
				}
			out.print("</table>");
			out.print("<a href=" + "http://localhost:8080/336test/adminFunction/allFlightsByAirport_f.jsp><mark>back</mark></a>");
		
		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>