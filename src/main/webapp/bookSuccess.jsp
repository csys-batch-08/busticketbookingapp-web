<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.3.10/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet'
	href='https://cdn.jsdelivr.net/npm/sweetalert2@10.10.1/dist/sweetalert2.min.css'>
<title>Booking</title>
<link rel="stylesheet" href="Assets/css/NavigationUser.css">
<link rel="stylesheet" href="Assets/css/bookSuccess.css">
</head>

<body>
	<script src="Assets/js/popUpMessages.js"></script>
	<c:if test="${param.infomsg!=null}">
		<script>
			popupMessages('Booked successfully')
		</script>
	</c:if>
	<c:set var="booktickets" scope="session"
		value="${FinalBookTicketsModel}"></c:set>
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
	<div id="successdiv">
		<h2>Ticket Successfully Booked</h2>
		<br> <br> <br>
		<h3>
			Your Ticket No : <span>${booktickets.getTicketNo()}</span>
		</h3>
		<p>--Use this Ticket No for further purpose--</p>
	</div>
</body>
</html>