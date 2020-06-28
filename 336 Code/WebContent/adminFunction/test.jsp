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

			String strQuery = "SELECT * FROM (select f.Flight as go from Flight as f where ) Ticket as t where Month(t.date_of_purchase)=('"+month_b+"');";
			ResultSet rs = stmt.executeQuery(strQuery);
			
			out.print("<table style = 'width:50%'>");

				out.print("<tr>");
				
				out.print("<td>");
				out.print("Departure Airport");
				out.print("</td>");
				
				out.print("<td>");
				out.print("Arrival Airport");
				out.print("</td>");
				
				out.print("<td>");
				out.print("Total fare");
				out.print("</td>");
	
				
				out.print("</tr>");
				String cody;
				String coda;
				//Statement stmt2 = con.createStatement();
				String money_cody, money_coda;
				while (rs.next()) 
				{
					Statement stmt2 = con.createStatement();
					cody = rs.getString("go");//string = ca880
					coda = rs.getString("back");//string =cz260
					money_cody =  "SELECT total_fare FROM Flight where flight_number =('"+cody+"');";
					money_coda = "SELECT total_fare FROM Flight where flight_number =('"+coda+"');";
					ResultSet rsmcody = stmt2.executeQuery(money_cody);
					ResultSet rsmcoda = stmt2.executeQuery(money_coda);
					
					int mcody = Integer.parseInt(rsmcody.getString("rsmcody"));
					int mcoda = Integer.parseInt(rsmcody.getString("rsmcoda"));
					
					int sum = mcody+mcoda;
					
					out.print("<tr>");
					
					out.print("<td>");
					out.print(cody);
					out.print("</td>");
					
					out.print("<td>");
					out.print(coda);
					out.print("</td>");
					
					out.print("<td>");
					out.print("sum");
					out.print("</td>");
					
					
				
					out.print("</tr>");
					
				}
			out.print("</table>");
			//out.print("<a href=" + "http://localhost:8080/336test/adminFunction/salesReport_f.jsp><mark>back</mark></a>");
		
		} catch (Exception e) {
			out.print(e);
		}
	%>


</body>
</html>