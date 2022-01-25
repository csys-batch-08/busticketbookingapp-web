<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.busticketbooking.model.SeatDetails"%>
<%@page import="com.busticketbooking.daoimpl.SeatDetailsDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    List<SeatDetails> seatDetailsList= (List<SeatDetails>) session.getAttribute("SeatList");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/bootstrap.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
<title>Seat List</title>
<link rel="stylesheet" href="css/AdminNavigation.css">
<style>


#seatlistdiv table tr th {
        background: #79a6dd;
    color: aliceblue;
}
#seatlistdiv table tr:hover {
    background: #e7e7e7;
}
#seatlistfieldset table{
        border-collapse: collapse;
        }
        #seatlistdiv table tr th,td {
            padding: 20px;
            text-align: center;
            border: 1px solid black;
            border-collapse: collapse;
         }
         
        #seatlistfieldset{
            margin-top: 107px;
        }
        #seatlistdiv{
            margin-top: 20px;
                margin-left: 380px;
        }
        #seatlistfieldset legend{
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
            <li><a href="BusList">Bus list</a></li>
            <li><a href="OperatorList">Operator list</a></li>
            <li><a href="UserList">User list</a></li>
            <li><a href="BookingList">Booking list</a></li>
            <li><a href="SeatList">Seat list</a></li>
        </ul>
    </div>

        <fieldset id="seatlistfieldset">
            <legend>Seat_Details</legend>
        <div id="seatlistdiv">
            <table>
                <tr>
                    <th>Ticket_No</th>
                    <th>User_Id</th>
                    <th>Bus_Id</th>
                    <th>Seat_No</th>
                    <th>Seat_Status</th>
                </tr>
                <%for(SeatDetails seatInfo:seatDetailsList){%>
                <tr>
                    <td><%=seatInfo.getBookedTickets().getTicketNo() %></td>
                    <td><%=seatInfo.getBookedTickets().getUserModel().getUserId()%></td>
                    <td><%=seatInfo.getBookedTickets().getBusModel().getBusId() %></td>
                    <td><%=seatInfo.getSeatNo() %></td>
                    <td><%=seatInfo.getStatus() %></td>
                </tr>
                 <%} %>
            </table>
      </div>
    </fieldset>

     
 </body>
 </html>