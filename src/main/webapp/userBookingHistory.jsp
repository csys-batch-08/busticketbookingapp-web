<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
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
<title>Booking History</title>
<link rel="stylesheet" href="Assets/css/NavigationUser.css">
<link rel="stylesheet" href="Assets/css/userBookingHistory.css">
</head>
<body>
	<div id="nav">
		<ul>
			<li><h3 id="buslogo">BusHub</h3></li>
			<li><a href="SearchBus">Bus_Tickets</a></li>
			<li><a href="aboutUs.jsp">About_us</a></li>
			<li><div class="dropdown">
					<button class="dropbtn">Ticket</button>
					<div class="dropdown-content">
						<a href="UserBookingHistory">Booking History</a> <a
							href="myTicket.jsp">My Ticket</a> <a href="cancelTicket.jsp">Cancel
							Ticket</a>
					</div>
				</div></li>

			<li><div class="dropdown">
					<button class="dropbtn">Wallet</button>
					<div class="dropdown-content">
						<a href="showBalance.jsp">Show Balance</a> <a
							href="updateWallet.jsp">Update Wallet</a>
					</div>
				</div>
			<li><a href="userProfile.jsp">Profile</a></li>
			<li><a href="logout">LogOut</a></li>
		</ul>
	</div>
	<h1 class="title-heading">Booking History</h1>
	<div id="operatorlistdiv">
		<table id="table_id">
			<thead>
				<tr>
					<th>S.No</th>
					<th>Ticket No</th>
					<th>Booking Date</th>
					<th>Bus Type</th>
					<th>Departure Date</th>
					<th>Arrival Date</th>
					<th>Seat Count</th>
					<th>Total Price</th>
					<th>Booking Status</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach begin="0" items="${BookingList}" var="bookticket"
					varStatus="loop">
					<tr>
						<td>${loop.count }</td>
						<td>${bookticket.getTicketNo() }</td>
						<fmt:parseDate value="${bookticket.getBookingDate() }"
							pattern="yyyy-MM-dd" var="bookingDate" type="both" />
						<td><fmt:formatDate pattern="dd-MM-yyyy"
								value="${bookingDate}" /></td>
						<td>${bookticket.getBusModel().getBusCategory() }</td>

						<fmt:parseDate value="${bookticket.getBusModel().getDeparture()}"
							pattern="yyyy-MM-dd'T'HH:mm" var="depature" type="both" />
						<td><fmt:formatDate pattern="dd-MM-yyyy HH:mm"
								value="${depature}" /></td>

						<fmt:parseDate value="${bookticket.getBusModel().getArrival()}"
							pattern="yyyy-MM-dd'T'HH:mm" var="arrival" type="both" />
						<td><fmt:formatDate pattern="dd-MM-yyyy HH:mm"
								value="${arrival}" /></td>
						<td>${bookticket.getTicketCount() }</td>
						<td>${bookticket.getTotalPrice() }</td>
						<td>${bookticket.getBookingStatus() }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
<script src="Assets/js/dataTable.js"></script>
</html>