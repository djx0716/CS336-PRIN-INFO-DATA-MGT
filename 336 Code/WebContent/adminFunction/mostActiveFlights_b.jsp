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
			Statement stmt = con.createStatement();
			/****right now we know the attribute trip_type  = oneway, so we skip it and put it as a conditional statement***/

			String strQuery = "SELECT r.flight_number, count(r.flight_number) as numberOfTSold from Relates_to as r group by r.flight_number order by numberOfTSold DESC;";
			ResultSet rs = stmt.executeQuery(strQuery);
			
			out.print("<table style = 'width:50%'>");

				out.print("<tr>");
				
				out.print("<td>");
				out.print("Flight number");
				out.print("</td>");
				
				out.print("<td>");
				out.print("Number of tickets sold");
				out.print("</td>");
				
	
				
				out.print("</tr>");
				
				while (rs.next()) 
				{
					
					out.print("<tr>");
					
					out.print("<td>");
					out.print(rs.getString("flight_number"));
					//String test = rs.getString("flight_number");
					//out.println(test);
					out.print("</td>");
					
					out.print("<td>");
					out.print(rs.getString("numberOfTSold"));
					out.print("</td>");
					
				
					out.print("</tr>");
					
				}
			out.print("</table>");
			out.print("<a href=" + "http://localhost:8080/336test/adminFunction/Adminlogin.jsp><mark>back</mark></a>");
		
		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>