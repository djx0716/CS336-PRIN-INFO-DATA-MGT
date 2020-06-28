<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Waiting List</title>
</head>
<body>
<%
String flight_number = request.getParameter("flight_number");

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql:"
		+ "//groupone.chnfim8mzrlx.us-east-2.rds.amazonaws.com:3306/"
		+ "GroupOne336","cody","codychen1005!"); 
Statement st= con.createStatement(); 

String get_listindex = "select list_index from Has where flight_number = '"+flight_number+"'";
ResultSet rs=st.executeQuery(get_listindex);
rs.next();
int list_index = Integer.parseInt(rs.getString("list_index"));

String get_customers = "select customerID from Is_IN where list_index="+list_index;

out.print("<h1>");
out.print("All customers in the waiting list of ");
out.print(flight_number);
out.print("</h1>");

rs = st.executeQuery(get_customers);
out.print("<table>");
while(rs.next()){
	out.print("<tr>");
	out.print("<td>");
	out.print(rs.getString("customerID"));
	out.print("</td>");
	out.print("</tr>");
	
	
}
out.print("</table>");


%>
</body>
</html>