<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html lang="en">
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
            <li><a href="adminHome.jsp">Home</a></li>
            <li><a href="addBus.jsp">Add Bus</a></li>
            <li><a href="addOperator.jsp">Add Operator</a></li>
            <li><a href="BusList">Bus list</a></li>
            <li><a href="OperatorList">Operator list</a></li>
            <li><a href="UserList">User list</a></li>
            <li><a href="BookingList">Booking list</a></li>
            <li><a href="SeatList">Seat list</a></li>
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
                <c:forEach items="${BookingListAdmin}" var="booktickets">
                <tr>
                	<td>${booktickets.getBookingId() }</td>
                    <td>${booktickets.getTicketNo() }</td>
                    <td>${booktickets.getUserModel().getUserId() }</td>
                    <td>${booktickets.getBusModel().getBusId() }</td>
                    <td>${booktickets.getBookingDate() }</td>
                    
                    <fmt:parseDate value="${booktickets.getBusModel().getDeparture()}"
							pattern="yyyy-MM-dd'T'HH:mm" var="Depature" type="both" />
                    <td><fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${Depature}" /></td>
                            
                    <td>${booktickets.getTicketCount() }</td>
                    <td>${booktickets.getTotalPrice() }</td>
                    <td>${booktickets.getBookingStatus() }</td>
                    <td>${booktickets.getPaymentStatus() }</td>
                </tr>
                </c:forEach>
            </table>
      </div>
    </fieldset>
  
</body>
</html>