<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<link href="css/bootstrap.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>

<script
src="https://cdn.jsdelivr.net/npm/sweetalert2@11.3.10/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet'
href='https://cdn.jsdelivr.net/npm/sweetalert2@10.10.1/dist/sweetalert2.min.css'>

<link rel="stylesheet" type="text/css"
href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css">
<script
src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript"
src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>

<title>Booking List</title>
<link rel="stylesheet" href="css/NavigationAdmin.css">
<link rel="stylesheet" href="css/AdminPages.css">

<style>

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
        
        <h1 class="title-heading">Booking Details</h1>
        <div id="bookinglistdiv">
            <table id="table_id">
            	<thead>
                <tr>
                	<th>S.No</th>
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
                </thead>
                <tbody>
                <c:forEach begin="0" items="${BookingListAdmin}" var="booktickets" varStatus="loop">
                <tr>
                	<td>${loop.count }</td>
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
                </tbody>
            </table>
      </div>
    	
    <script type="text/javascript">
		$(document).ready(function() {
		$('#table_id').DataTable();
		});
	</script>
  
</body>
</html>