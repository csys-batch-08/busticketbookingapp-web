<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.3.10/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet'
	href='https://cdn.jsdelivr.net/npm/sweetalert2@10.10.1/dist/sweetalert2.min.css'>
<title>Wallet</title>
<link rel="stylesheet" href="Assets/css/NavigationUser.css">
<link rel="stylesheet" href="Assets/css/updateWallet.css">
</head>

<body>
	<c:set var="usermodel" scope="session" value="${userModel }"></c:set>
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
	<form action="WalletUpdate" method="post">
		<div id="updatewalletdiv">
			<table>
				<tr>
					<th>Login Id</th>
					<th>:</th>
					<th>${usermodel.getUserContact() }</th>
				</tr>
				<tr>
					<th>Available Balance</th>
					<th>:</th>
					<th>${usermodel.getUserWallet() }</th>
				</tr>
			</table>
			<div id="amountdiv">
				<label for="amounttext">Enter the amount</label> <input
					id="amounttext" name="amountentered" type="number"
					placeholder="To be added to your wallet" autocomplete="off"
					min="100" autofocus required>
			</div>
			<button id="btn" name="btn" type="submit">Submit</button>
		</div>
	</form>
</body>

<script src="Assets/js/popUpMessages.js"></script>
<c:if test="${param.insufficient!=null}">
	<script>
		popupMessages('Insufficient balance')
	</script>
</c:if>

<c:if test="${param.recharged!=null}">
	<script>
		popupMessages('Recharged successfully')
	</script>
</c:if>

</html>