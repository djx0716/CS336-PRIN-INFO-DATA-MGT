<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Flight</title>
</head>
<body>

<% 

String flight_number = request.getParameter("flight_number");
String column_name = request.getParameter("column_name");
String data = request.getParameter("data");
int temp;

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql:"
		+ "//groupone.chnfim8mzrlx.us-east-2.rds.amazonaws.com:3306/"
		+ "GroupOne336","cody","codychen1005!"); 
Statement st= con.createStatement(); 
String query = "";

if(column_name.equals("seat_avaiblity") || column_name.equals("total_fare")){
	
	int int_data = Integer.parseInt(data);
	query = "update Flight set "+ column_name+ " = "+int_data+ " where flight_number='"+flight_number+"'";
	try{
		temp =  st.executeUpdate(query);
		out.println("Data is successfully edited!");
	}
	catch(Exception e){
		System.out.print(e);
		e.printStackTrace();
	}
}

else{
	query = "update Flight set "+ column_name+ " = '"+data+ "' where flight_number='"+flight_number+"'";
	try{
		temp =  st.executeUpdate(query);
		out.println("Data is successfully edited!");
	}
	catch(Exception e){
		System.out.print(e);
		e.printStackTrace();
	}
}

%>

</body>
</html>