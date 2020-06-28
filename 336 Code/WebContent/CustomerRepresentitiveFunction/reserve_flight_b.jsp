<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reserve Flight</title>
</head>
<body>

<%

String customerID = request.getParameter("customerID");
String flight_number = request.getParameter("flight_number");
String trip_type = request.getParameter("trip_type");
String special_meal = request.getParameter("special_meal");
String class_data = request.getParameter("class");
String seat_number = request.getParameter("seat_number");
String departure_date = request.getParameter("departure_date");
String return_flight_number = request.getParameter("return_flight_number");
String return_date = request.getParameter("return_date");
int temp;

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql:"
		+ "//groupone.chnfim8mzrlx.us-east-2.rds.amazonaws.com:3306/"
		+ "GroupOne336","cody","codychen1005!"); 
Statement st= con.createStatement(); 
String query_ticket = "";
String query_relatesto = "";
String query_ownsby = "";

int Nsold;

//compare departure date to operating days

ResultSet temp_set = st.executeQuery("select weekday('"+departure_date+"') as weekday");
temp_set.next();
String weekday = temp_set.getString("weekday");

String query = "select flight_number from Flight where flight_number='"+flight_number+"' and operating_days like '%"+weekday+"%'";
temp_set = st.executeQuery(query);
temp_set.next();
try{
String flight = temp_set.getString("flight_number");
}
catch(Exception e){
	out.print("The flight does not operate at this departure Date");
	return;
}


String get_list = "select flight_number,count(flight_number) as Nsold from Relates_to where flight_number='"+flight_number+"' and departure_date ='"+departure_date+"' group by flight_number ";
temp_set = st.executeQuery(get_list);
temp_set.next();
//Nsold = number of ticket sold of given flight and date
try{
    Nsold = Integer.parseInt(temp_set.getString("Nsold"));
}
catch(Exception e){
	Nsold = 0;
}

get_list = "select seat_avaiblity from Flight where flight_number='"+flight_number+"'";
temp_set = st.executeQuery(get_list);
temp_set.next();
//Nsold = number of ticket sold of given flight and date
int seat_avaiblity = Integer.parseInt(temp_set.getString("seat_avaiblity"));

if(Nsold>=seat_avaiblity){
	out.print("Not enough seats, customer is added to the waiting list(go)");
	query = "select list_index from Has where flight_number='"+flight_number+"'";
	temp_set = st.executeQuery(query);
	temp_set.next();
	//Nsold = number of ticket sold of given flight and date
	int list_index = Integer.parseInt(temp_set.getString("list_index"));
//	out.print(list_index); 
	query = "insert into Is_IN (customerId,list_index) values ('"+customerID + "',"+list_index+")";
	temp =  st.executeUpdate(query);
	return;
}


if(trip_type.equals("oneway")){
	String getfare = "select total_fare from Flight where flight_number = '"+flight_number +"'";	
	ResultSet rs = st.executeQuery(getfare);
	rs.next();
	int fare = Integer.parseInt(rs.getString("total_fare"));
	
	
	String getdate = "select current_date() as d";
	rs = st.executeQuery(getdate);
	rs.next();
	String cdate = rs.getString("d");
	
	String gettime = "select (current_time() - interval 4 hour) as t";
	rs = st.executeQuery(gettime);
	rs.next();
	String ctime = rs.getString("t");
	
	
	
	if(class_data.equals("Economy")){
		
		query_ticket = "insert into Ticket (trip_type,valid_for_change,special_meal,class,seat_number,total_fare,date_of_purchase,time_of_purchase,booking_fee) values ('" +trip_type+"',0,'"+special_meal+"','Economy','"+seat_number+"',"+fare+",'"+cdate+"','"+ctime+"',30)";                         
	//	out.print(query_ticket);
		try{
			temp =  st.executeUpdate(query_ticket);
			out.println("Data is successfully added!");
		}
			catch(Exception e){
				System.out.print(e);
				e.printStackTrace();
			}
		String getTN = "select max(ticket_number) as mtn from Ticket";
		rs = st.executeQuery(getTN);
		rs.next();
		int tn = Integer.parseInt(rs.getString("mtn"));
		query_relatesto = "insert into Relates_to (flight_number,ticket_number,departure_date) values ('"+flight_number+"',"+tn+",'"+departure_date+"')";
		temp =  st.executeUpdate(query_relatesto);
		query_ownsby = "insert into Owns_by (customerID,ticket_number) values ('"+customerID+"',"+tn+")";
		temp =  st.executeUpdate(query_ownsby);
	}
	
	else if(class_data.equals("Business")){
		
		query_ticket = "insert into Ticket (trip_type,valid_for_change,special_meal,class,seat_number,total_fare,date_of_purchase,time_of_purchase,booking_fee) values ('" +trip_type+"',1,'"+special_meal+"','Business','"+seat_number+"',"+fare+",'"+cdate+"','"+ctime+"',30)";                         
	//	out.print(query_ticket);
		try{
			temp =  st.executeUpdate(query_ticket);
			out.println("Data is successfully added!");
		}
			catch(Exception e){
				System.out.print(e);
				e.printStackTrace();
			}
		String getTN = "select max(ticket_number) as mtn from Ticket";
		rs = st.executeQuery(getTN);
		rs.next();
		int tn = Integer.parseInt(rs.getString("mtn"));
		query_relatesto = "insert into Relates_to (flight_number,ticket_number,departure_date) values ('"+flight_number+"',"+tn+",'"+departure_date+"')";
		temp =  st.executeUpdate(query_relatesto);
		query_ownsby = "insert into Owns_by (customerID,ticket_number) values ('"+customerID+"',"+tn+")";
		temp =  st.executeUpdate(query_ownsby);
	}
	
	else if(class_data.equals("First")){
		
		query_ticket = "insert into Ticket (trip_type,valid_for_change,special_meal,class,seat_number,total_fare,date_of_purchase,time_of_purchase,booking_fee) values ('" +trip_type+"',1,'"+special_meal+"','First','"+seat_number+"',"+fare+",'"+cdate+"','"+ctime+"',30)";                         
	//	out.print(query_ticket);
		try{
			temp =  st.executeUpdate(query_ticket);
			out.println("Data is successfully added!");
		}
			catch(Exception e){
				System.out.print(e);
				e.printStackTrace();
			}
		String getTN = "select max(ticket_number) as mtn from Ticket";
		rs = st.executeQuery(getTN);
		rs.next();
		int tn = Integer.parseInt(rs.getString("mtn"));
		query_relatesto = "insert into Relates_to (flight_number,ticket_number,departure_date) values ('"+flight_number+"',"+tn+",'"+departure_date+"')";
		temp =  st.executeUpdate(query_relatesto);
		query_ownsby = "insert into Owns_by (customerID,ticket_number) values ('"+customerID+"',"+tn+")";
		temp =  st.executeUpdate(query_ownsby);
	}
}
else if(trip_type.equals("round")){
	
	
	
	temp_set = st.executeQuery("select weekday('"+return_date+"') as weekday");
	temp_set.next();
	weekday = temp_set.getString("weekday");
	query = "select flight_number from Flight where flight_number='"+return_flight_number+"' and operating_days like '%"+weekday+"%'";
	temp_set = st.executeQuery(query);
	temp_set.next();
	try{
	String flight = temp_set.getString("flight_number");
	}
	catch(Exception e){
		out.print("The flight does not operate at this return Date");
		return;
	}
	

	get_list = "select flight_number,count(flight_number) as Nsold from Relates_to where flight_number='"+return_flight_number+"' and departure_date ='"+return_date+"' group by flight_number ";
	temp_set = st.executeQuery(get_list);
	temp_set.next();
	//Nsold = number of ticket sold of given flight and date
	try{
	    Nsold = Integer.parseInt(temp_set.getString("Nsold"));
	}
	catch(Exception e){
		Nsold = 0;
	}

	get_list = "select seat_avaiblity from Flight where flight_number='"+return_flight_number+"'";
	temp_set = st.executeQuery(get_list);
	temp_set.next();
	//Nsold = number of ticket sold of given flight and date
	seat_avaiblity = Integer.parseInt(temp_set.getString("seat_avaiblity"));

	if(Nsold>=seat_avaiblity){
	out.print("Not enough seats, customer is added to the waiting list(return)");
	query = "select list_index from Has where flight_number='"+return_flight_number+"'";
	temp_set = st.executeQuery(query);
	temp_set.next();
	//Nsold = number of ticket sold of given flight and date
	int list_index = Integer.parseInt(temp_set.getString("list_index"));
//	out.print(list_index); 
	query = "insert into Is_IN (customerId,list_index) values ('"+customerID + "',"+list_index+")";
	temp =  st.executeUpdate(query);
	}
	
	
	
	String getfare = "select total_fare from Flight where flight_number = '"+flight_number +"'";	
	ResultSet rs = st.executeQuery(getfare);
	rs.next();
	int fare = Integer.parseInt(rs.getString("total_fare"));
	
	
	String getdate = "select current_date() as d";
	rs = st.executeQuery(getdate);
	rs.next();
	String cdate = rs.getString("d");
	
	String gettime = "select (current_time() - interval 4 hour) as t";
	rs = st.executeQuery(gettime);
	rs.next();
	String ctime = rs.getString("t");
	
	if(class_data.equals("Economy")){
		
		query_ticket = "insert into Ticket (trip_type,valid_for_change,special_meal,class,seat_number,total_fare,date_of_purchase,time_of_purchase,booking_fee) values ('" +trip_type+"',0,'"+special_meal+"','Economy','"+seat_number+"',"+fare+",'"+cdate+"','"+ctime+"',30)";                         
	//	out.print(query_ticket);
		try{
			temp =  st.executeUpdate(query_ticket);
			out.println("Data is successfully added!");
		}
			catch(Exception e){
				System.out.print(e);
				e.printStackTrace();
			}
		String getTN = "select max(ticket_number) as mtn from Ticket";
		rs = st.executeQuery(getTN);
		rs.next();
		int tn = Integer.parseInt(rs.getString("mtn"));
		query_relatesto = "insert into Relates_to (flight_number,ticket_number,departure_date) values ('"+flight_number+"',"+tn+",'"+departure_date+"')";
		temp =  st.executeUpdate(query_relatesto);
		query_ownsby = "insert into Owns_by (customerID,ticket_number) values ('"+customerID+"',"+tn+")";
		temp =  st.executeUpdate(query_ownsby);
		
		String query_return = "insert into Relates_to (flight_number,ticket_number,departure_date) values ('"+return_flight_number+"',"+tn+",'"+return_date+"')";
		temp = st.executeUpdate(query_return);
		
	}
	
	else if(class_data.equals("Business")){
		
		query_ticket = "insert into Ticket (trip_type,valid_for_change,special_meal,class,seat_number,total_fare,date_of_purchase,time_of_purchase,booking_fee) values ('" +trip_type+"',1,'"+special_meal+"','Business','"+seat_number+"',"+fare+",'"+cdate+"','"+ctime+"',30)";                         
	//	out.print(query_ticket);
		try{
			temp =  st.executeUpdate(query_ticket);
			out.println("Data is successfully added!");
		}
			catch(Exception e){
				System.out.print(e);
				e.printStackTrace();
			}
		String getTN = "select max(ticket_number) as mtn from Ticket";
		rs = st.executeQuery(getTN);
		rs.next();
		int tn = Integer.parseInt(rs.getString("mtn"));
		query_relatesto = "insert into Relates_to (flight_number,ticket_number,departure_date) values ('"+flight_number+"',"+tn+",'"+departure_date+"')";
		temp =  st.executeUpdate(query_relatesto);
		query_ownsby = "insert into Owns_by (customerID,ticket_number) values ('"+customerID+"',"+tn+")";
		temp =  st.executeUpdate(query_ownsby);
		
		String query_return = "insert into Relates_to (flight_number,ticket_number,departure_date) values ('"+return_flight_number+"',"+tn+",'"+return_date+"')";
		temp = st.executeUpdate(query_return);
	}
	
	else if(class_data.equals("First")){
		
		query_ticket = "insert into Ticket (trip_type,valid_for_change,special_meal,class,seat_number,total_fare,date_of_purchase,time_of_purchase,booking_fee) values ('" +trip_type+"',1,'"+special_meal+"','First','"+seat_number+"',"+fare+",'"+cdate+"','"+ctime+"',30)";                         
	//	out.print(query_ticket);
		try{
			temp =  st.executeUpdate(query_ticket);
			out.println("Data is successfully added!");
		}
			catch(Exception e){
				System.out.print(e);
				e.printStackTrace();
			}
		String getTN = "select max(ticket_number) as mtn from Ticket";
		rs = st.executeQuery(getTN);
		rs.next();
		int tn = Integer.parseInt(rs.getString("mtn"));
		query_relatesto = "insert into Relates_to (flight_number,ticket_number,departure_date) values ('"+flight_number+"',"+tn+",'"+departure_date+"')";
		temp =  st.executeUpdate(query_relatesto);
		query_ownsby = "insert into Owns_by (customerID,ticket_number) values ('"+customerID+"',"+tn+")";
		temp =  st.executeUpdate(query_ownsby);
		
		String query_return = "insert into Relates_to (flight_number,ticket_number,departure_date) values ('"+return_flight_number+"',"+tn+",'"+return_date+"')";
		temp = st.executeUpdate(query_return);
	}
	
}


	
%>
</body>
</html>