<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.3.10/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet'
	href='https://cdn.jsdelivr.net/npm/sweetalert2@10.10.1/dist/sweetalert2.min.css'>
<title>Cancel Ticket</title>
<link rel="stylesheet" href="Assets/css/NavigationUser.css">
<link rel="stylesheet" href="Assets/css/cancelTicket.css">
</head>

<body>
	<c:set var="wrongnumbermessage" scope="session" value="${WrongNumber}"></c:set>
	<c:set var="alreadycancelmessage" scope="session" value="${AlreadyCancel}"></c:set>
	<c:set var="dateendedmessage" scope="session" value="${DateEnded}"></c:set>
	<script src="Assets/js/popUpMessages.js"></script>
	<c:if test="${wrongnumbermessage!=null}">
		<script>
			popupMessages('${wrongnumbermessage}')
		</script>
	</c:if>

	<c:if test="${alreadycancelmessage!=null}">
		<script>
			popupMessages('${alreadycancelmessage}')
		</script>
	</c:if>

	<c:if test="${dateendedmessage!=null}">
		<script>
			popupMessages('${dateendedmessage}')
		</script>
	</c:if>

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
	<div id="cancelticketdiv">
		<form action="cancelticketservlet" method="post">
			<table id="ticketnotable" aria-describedby="cancelbus">
				<thead>
					<tr>
						<th><label for="tickettext">TICKET NO :</label></th>
						<th><input id="tickettext" name="tickettext" type="text"
							placeholder="Enter the ticket number" pattern="[A-Za-z0-9]{7}"
							title="please enter 7 digit ticket number" autofocus
							autocomplete="off" required></th>
					</tr>
				</thead>
			</table>
			<label for="deductedmessage" id="deductedmessage">If you want
				to cancel your ticket(15% amount will be deducted)</label>
			<button onclick="check()" id="submitbutton" type="submit">Submit</button>
		</form>
	</div>
</body>
<script type="text/javascript">
	function check() {
		var result = confirm("Do you want to cancel this ticket?");
		if (result == false) {
			event.preventDefault();
		}
	}
</script>
</html>