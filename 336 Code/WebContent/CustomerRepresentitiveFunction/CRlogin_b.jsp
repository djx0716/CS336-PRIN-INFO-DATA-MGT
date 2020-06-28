<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome CR</title>
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
	ResultSet rs=st.executeQuery("select * from Customer_Representitive where CRID='"+userid+"'and password = '"+pwd+"'");
	
	
	if(rs.next()) 
	{ 
	
		
		if(rs.getString(2).equals(pwd)) 
		{ 
			out.println("Welcome Customer Representive "+ userid + "<p align='right'> <a href='http://localhost:8080/336test/Seeyou.jsp'>Logout</a> </p>");
			out.println("<p align='center'> <a href='reserve_flight_f.jsp'>Reserve Flight</a>  </p>");
			out.println("<p align='center'> <a href='manageInfo_f.jsp'>Manage Data</a>  </p>");
			out.println("<p align='center'> <a href='edit_customer_f.jsp'>Edit Flight reservation for Customer</a>  </p>");
			out.println("<p align='center'> <a href='get_waitinglist_f.jsp'>Get Waitting List</a>  </p>");
			
		} 
		
		else 
		{ 
			out.println("Invalid password try again " + "<p align='left'> <a href='http://localhost:8080/336test/homet.jsp'>Home</a> </p>"); 
		} 
	}
	
	else
		out.println("Invalid username or password try again" + "<p align='left'> <a href='http://localhost:8080/336test/homet.jsp'>Home</a> </p>"); 
				
%>
</body>
</html>