<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transfer</title>
</head>
<body>
<%

String operation = request.getParameter("operation");
String table = request.getParameter("table");

if(operation.equals("add")){
	if(table.equals("Aircrafts")){
		out.println("<p> <a href='add_Aircraft_f.jsp'>Continue</a>  </p>");
	}	
	if(table.equals("Airport")){
		out.println("<p> <a href='add_Airport_f.jsp'>Continue</a>  </p>");
	}
	if(table.equals("Flight")){
		out.println("<p> <a href='add_Flight_f.jsp'>Continue</a>  </p>");
	}
}

if(operation.equals("edit")){
	if(table.equals("Aircrafts")){
		out.println("<p> <a href='edit_Aircraft_f.jsp'>Continue</a>  </p>");
	}	
	if(table.equals("Airport")){
		out.println("<p> <a href='edit_Airport_f.jsp'>Continue</a>  </p>");
	}
	if(table.equals("Flight")){
		out.println("<p> <a href='edit_Flight_f.jsp'>Continue</a>  </p>");
	}
}

if(operation.equals("delete")){
	if(table.equals("Aircrafts")){
		out.println("<p> <a href='delete_Aircraft_f.jsp'>Continue</a>  </p>");
	}	
	if(table.equals("Airport")){
		out.println("<p> <a href='delete_Airport_f.jsp'>Continue</a>  </p>");
	}
	if(table.equals("Flight")){
		out.println("<p> <a href='delete_Flight_f.jsp'>Continue</a>  </p>");
	}
}
	
%>

</body>
</html>