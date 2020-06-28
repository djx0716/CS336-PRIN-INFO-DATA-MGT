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
			String CustomerID_b = request.getParameter("CustomerID_f");
			Statement stmt = con.createStatement();
			/****right now we know the attribute trip_type  = oneway, so we skip it and put it as a conditional statement***/

			//check whether the CRID Admin want to delete is exist in the database
			String strQuery = "SELECT COUNT(*) FROM Customer where customerID=('"+CustomerID_b+"');";
			ResultSet rs = stmt.executeQuery(strQuery);
			rs.next();
			String Countrow = rs.getString(1);
		    //out.println(Countrow);
			
			if (Countrow.equals("1")) 
			{
				
			    //delete the data
			    int i= stmt.executeUpdate ("delete from Customer where customerID = ('"+CustomerID_b+"');");
				out.println("Data is successfully deleted");
				out.println("<a href='manageC_f.jsp'> manage customer</a>");
			
			}
			else
			{
				
				//the CRID is not existing in the database
				out.println("The customerID you want to delete is not correct, please check again.");
				out.print("<a href=" + "http://localhost:8080/336test/adminFunction/deleteC_f.jsp><mark>back</mark></a>");
				
			}
			
			
			
			
		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>