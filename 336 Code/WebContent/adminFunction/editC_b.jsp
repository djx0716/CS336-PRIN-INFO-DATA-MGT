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
		
		String action = request.getParameter("action");
		String oCRID_b = request.getParameter("oCRID_f");
		String nCRID_b = request.getParameter("nCRID_f");
		String CRID_b = request.getParameter("CRID_f");
		//out.println(CRID_b);
		String nPassword_b = request.getParameter("nPassword_f");
		
		//Edit CRID
		if(action.equals("1"))
		{
			
			try {

				//Get the database connection
				//Get the database connection
			Class.forName("com.mysql.jdbc.Driver"); 
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql:" + "//groupone.chnfim8mzrlx.us-east-2.rds.amazonaws.com:3306/" + "GroupOne336","cody","codychen1005!"); 
			//Get the inputs from the searchFlight3.jsp
			Statement stmt = con.createStatement();
			/****right now we know the attribute trip_type  = oneway, so we skip it and put it as a conditional statement***/

			
			String strQuery = "SELECT COUNT(*) FROM Customer where customerID=('"+oCRID_b+"');";
			ResultSet rs = stmt.executeQuery(strQuery);
			rs.next();
			String Countrow = rs.getString(1);
		    //out.println(Countrow);
		    
		    if (Countrow.equals("1"))
		    {
		    	
				//CRID in the database, can edit
		    	int i= stmt.executeUpdate ("update Customer set customerID = ('"+nCRID_b+"') where customerID = ('"+oCRID_b+"');");
		    	out.println("The customerID you want to edit is successfully edited.");
		    	out.print("<a href=" + "http://localhost:8080/336test/adminFunction/editC_f.jsp><mark>back</mark></a>");
				//out.print("<a href=" + "http://localhost:8080/336test/adminFunction/addC_f.jsp><mark>back</mark></a>");
		    }
		    else
		    {
		    	//CRID is not in the database
		    	out.println("The customerID you want to edit is not in the database, please try again.");
				out.print("<a href=" + "http://localhost:8080/336test/adminFunction/editC_f.jsp><mark>back</mark></a>");
		    }
			
			} catch (Exception e) {
				out.print(e);
			}
			
		}
		
		//Edit password
		else if(action.equals("2"))
		{
			try {

				//Get the database connection
				//Get the database connection
			Class.forName("com.mysql.jdbc.Driver"); 
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql:" + "//groupone.chnfim8mzrlx.us-east-2.rds.amazonaws.com:3306/" + "GroupOne336","cody","codychen1005!"); 
			//Get the inputs from the searchFlight3.jsp
			Statement stmt = con.createStatement();
			/****right now we know the attribute trip_type  = oneway, so we skip it and put it as a conditional statement***/

			
			String strQuery = "SELECT COUNT(*) FROM Customer where customerID=('"+CRID_b+"');";
			ResultSet rs = stmt.executeQuery(strQuery);
			rs.next();
			String Countrow = rs.getString(1);
		    //out.println(Countrow);
		    
		    if (Countrow.equals("1"))
		    {
		    	
				//CRID in the database, can edit
		    	int i= stmt.executeUpdate ("update Customer set password = ('"+nPassword_b+"') where customerID = ('"+CRID_b+"');");
		    	out.println("The password you want to edit is successfully edited.");
		    	out.print("<a href=" + "http://localhost:8080/336test/adminFunction/editC_f.jsp><mark>back</mark></a>");
				//out.print("<a href=" + "http://localhost:8080/336test/adminFunction/addC_f.jsp><mark>back</mark></a>");
		    }
		    else
		    {
		    	//CRID is not in the database
		    	out.println("The password you want to edit is not in the database, please try again.");
				out.print("<a href=" + "http://localhost:8080/336test/adminFunction/editC_f.jsp><mark>back</mark></a>");
		    }
			
			} catch (Exception e) {
				out.print(e);
			}
		}
%>

</body>
</html>