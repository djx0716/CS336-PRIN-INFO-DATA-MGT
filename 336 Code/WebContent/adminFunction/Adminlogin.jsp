<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
String userid=request.getParameter("name"); 
//session.putValue("userid",userid); 
String pwd=request.getParameter("password"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql:"
		+ "//groupone.chnfim8mzrlx.us-east-2.rds.amazonaws.com:3306/"
		+ "GroupOne336","cody","codychen1005!"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from Admin where adminID='"+userid+"'and password = '"+pwd+"'");


if(rs.next()) 
{ 

	
	if(rs.getString(2).equals(pwd)) 
	{ 
		out.println("welcome you administritor"+userid + "<a href='http://localhost:8080/336test/Seeyou.jsp'> logout </a>");
		out.println("<br/> <a href='manageCRt.jsp'> Manage customer representative</a>");
		out.println("<br/> <a href='manageC_f.jsp'> Manage customer</a>");
		out.println("<br/> <a href='salesReport_f.jsp'> Obtain sales report</a>");
		out.println("<br/> <a href='produceReservationList_f.jsp'> Produce lists of reservations</a>");
		out.println("<br/> <a href='revenueGeneratedBy_f.jsp'> Produce summary lists of revenue</a>");
		out.println("<br/> <a href='mostTotalValue_b.jsp'> Find out which customer generated most total revenue</a>");
		out.println("<br/> <a href='mostActiveFlights_b.jsp'> Find out which flights sold most tickets</a>");
		out.println("<br/> <a href='allFlightsByAirport_f.jsp'> List all flights for a given airport</a>");
	} 
	
	else 
	{ 
		out.println("Invalid password try again <a href='http://localhost:8080/336test/homet.jsp'>Home</a>"); 
	} 
}

else
	out.println("Invalid username or password try again <a href='http://localhost:8080/336test/homet.jsp'>Home</a>"); 
//else
%>

</body>
</html>