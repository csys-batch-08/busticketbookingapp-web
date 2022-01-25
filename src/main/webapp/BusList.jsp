<%@page import="java.util.ArrayList"%>
<%@page import="com.busticketbooking.model.Bus"%>
<%@page import="java.util.List"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.busticketbooking.daoimpl.BusDaoImpl" %>
    <%@page import="java.sql.ResultSet" %>
    <%@page import="javax.servlet.http.HttpSession" %>
    <%DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm");
    List<Bus> busList=new ArrayList<Bus>();
    BusDaoImpl busDao=new BusDaoImpl();
    busList=busDao.viewAllBus();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/bootstrap.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
<title>Bus List</title>
<link rel="stylesheet" href="css/AdminNavigation.css">

<style>
#buslistdiv table tr th {
        background: #79a6dd;
    color: aliceblue;
}


#buslistdiv table tr:hover {
    background: #e7e7e7;
}
        #buslistfieldset table{
        border-collapse: collapse;
        }
        #buslistdiv table tr th,td {
            padding: 20px;
            text-align: center;
            border: 1px solid black;
            border-collapse: collapse;
         }
        #buslistfieldset{
            margin-top: 110px;
            
        }
        #buslistdiv{
            margin-top: 20px;
        }
        #buslistfieldset legend{
            font-size: 30px;
            font-weight:bold;
            text-align: center;
        }
    </style>
    
</head>
    <body>
    
    <% String sessionName=(String)session.getAttribute("AdminHome");
	if(sessionName.equals("UpdateBusSession")){
		session.setAttribute("AdminHome", "HomeSession");
	%>
		<script type="text/javascript">
		alert("Bus updated Successfully");
		</script>
	<%}%>
	
        <div id="homeadmin">
            <ul>
                <li><a href="AdminHome.jsp">Home</a></li>
            <li><a href="AddBus.jsp">Add Bus</a></li>
            <li><a href="AddOperator.jsp">Add Operator</a></li>
            <li><a href="BusList.jsp">Bus list</a></li>
            <li><a href="OperatorList.jsp?opertorId=0">Operator list</a></li>
            <li><a href="UserList.jsp">User list</a></li>
            <li><a href="BookingList.jsp">Booking list</a></li>
            <li><a href="SeatList.jsp">Seat list</a></li>
            </ul>
                
        </div>
        <fieldset id="buslistfieldset">
            <legend>Bus Details</legend>
        <div id="buslistdiv">
            <table>
                <tr>
                    <th>Bus Id</th>
                    <th>Bus No</th>
                    <th>Operator Id</th>
                    <th>Bus Type</th>
                    <th>From City</th>
                    <th>To City</th>
                    <th>Departure</th>
                    <th>Arrival</th>
                    <th>Seater Fare</th>
                    <th>Total Seat</th>
                    <th>Seat Status</th>
                    <th>Edit</th>
                </tr>
                <%for(Bus bus:busList){%>
                <tr>
                    <td><%=bus.getBusId() %></td>
                    <td><%=bus.getBusNo() %></td>
                    <td><%=bus.getOperatorId() %></td>
                    <td><%=bus.getBusCategory() %></td>
                    <td><%=bus.getFromCity() %></td>
                    <td><%=bus.getToCity() %></td>
                    <td><%=bus.getDeparture().format(format)%></td>
                    <td><%=bus.getArrival().format(format)%></td>
                    <td><%=bus.getSeaterFare() %></td>
                    <td><%=bus.getTotalseat() %></td>
                    <td><%=bus.getSeatStatus() %></td>
                    <td><a href="UpdateBus.jsp?busId=<%=bus.getBusId()%>">Edit</a></td>
                </tr>
                <%} %>
            </table>
      </div>
    </fieldset>
    </body>

</html>