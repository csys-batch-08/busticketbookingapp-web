<%@page import="java.util.ArrayList"%>
<%@page import="com.busticketbooking.model.BookedTickets"%>
<%@page import="java.util.List"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.busticketbooking.daoimpl.BookedTicketsDaoImpl" %>
    <%@page import="java.time.LocalDate" %>
    <%@page import="java.sql.ResultSet" %>
    <%
    List<BookedTickets> bookingListAdmin=new ArrayList<BookedTickets>();
    BookedTicketsDaoImpl bookDao=new BookedTicketsDaoImpl();
    bookingListAdmin=bookDao.showlistAdmin();
        DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-yyyy   HH:mm");
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/bootstrap.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
<title>Booking List</title>
<link rel="stylesheet" href="css/AdminNavigation.css">
<style>

#bookinglistdiv table tr th {
        background: #79a6dd;
    color: aliceblue;
}
#bookinglistdiv table tr:hover {
    background: #e7e7e7;
}
#bookinglistfieldset table{
        border-collapse: collapse;
        }
            #bookinglistdiv table tr th,td {
                 padding: 20px;
            text-align: center;
            border: 1px solid black;
            border-collapse: collapse;
             }
            #bookinglistfieldset{
                margin-top: 107px;
            }
            #bookinglistdiv{
                margin-top: 20px;
                margin-left: 15px;
            }
            #bookinglistfieldset legend{
                 font-size: 30px;
            font-weight:bold;
            text-align: center;
            }
        </style>
</head>
<body>
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
        <fieldset id="bookinglistfieldset">
            <legend>Booking List</legend>
        <div id="bookinglistdiv">
            <table>
                <tr>
                	<th>Booking Id</th>
                    <th>Ticket No</th>
                    <th>User Id</th>
                    <th>Bus Id</th>
                    <th>Booking Date</th>
                    <th>Departure</th>
                    <th>Ticket Count</th>
                    <th>Total Price</th>
                    <th>Booking Status</th>
                    <th>Payment Status</th>
                </tr>
                <%for(BookedTickets bookTickets:bookingListAdmin){%>
                <tr>
                	<td><%=bookTickets.getBookingId() %></td>
                    <td><%=bookTickets.getTicketNo() %></td>
                    <td><%=bookTickets.getUserModel().getUserId() %></td>
                    <td><%=bookTickets.getBusModel().getBusId() %></td>
                    <td><%=bookTickets.getBookingDate() %></td>
                    <td><%=bookTickets.getBusModel().getDeparture().format(format)%></td>
                    <td><%=bookTickets.getTicketCount() %></td>
                    <td><%=bookTickets.getTotalPrice() %></td>
                    <td><%=bookTickets.getBookingStatus() %></td>
                    <td><%=bookTickets.getPaymentStatus() %></td>
                </tr>
                <%} %>
            </table>
      </div>
    </fieldset>
  
</body>
</html>