<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>

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
			//Get the inputs from the searchFlight3.jsp
			String CRID_b = request.getParameter("CRID_f");
			String Password_b = request.getParameter("Password_f");
			Statement stmt = con.createStatement();
			/****right now we know the attribute trip_type  = oneway, so we skip it and put it as a conditional statement***/

			String strQuery = "SELECT COUNT(*) FROM Customer_Representitive where CRID=('"+CRID_b+"');";
			ResultSet rs = stmt.executeQuery(strQuery);
			rs.next();
			String Countrow = rs.getString(1);
		    //out.println(Countrow);
		    
		    if (Countrow.equals("1"))
		    {
		    	
				//cannot add because the CRID is already exist
		    	out.println("The CRID you want to add is already existed, please try again.");
				out.print("<a href=" + "http://localhost:8080/336test/adminFunction/addCR_f.jsp><mark>back</mark></a>");
		    }
		    else
		    {
		    	//add data into the database
				int i= stmt.executeUpdate ("insert into Customer_Representitive(CRID, password)values('"+CRID_b+"', '"+Password_b+"');");
				out.println("Data is successfully inserted");
				out.println("<a href='manageCRt.jsp'> manage customer representative</a>");
		    }
		} catch (Exception e) {
			out.print(e);
		}
	%>


</body>
</html>