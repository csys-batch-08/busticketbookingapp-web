<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<link href="css/bootstrap.css" rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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
<title>User Lists</title>
<link rel="stylesheet" href="Assets/css/NavigationAdmin.css">
<link rel="stylesheet" href="Assets/css/adminPages.css">
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
	<h1 class="title-heading">User Details</h1>
	<div id="userlistdiv">
		<table id="table_id">
			<thead>
				<tr>
					<th>S.No</th>
					<th>User Id</th>
					<th>Name</th>
					<th>DateOfBirth</th>
					<th>Email</th>
					<th>Contact</th>
					<th>Gender</th>
					<th>Password</th>
					<th>Wallet</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach begin="0" items="${UserList}" var="user" varStatus="loop">
					<tr>
						<td>${loop.count }</td>
						<td>${user.getUserId() }</td>
						<td>${user.getUserName() }</td>
						<td>${user.getUserDOB() }</td>
						<td>${user.getUserEmail() }</td>
						<td>${user.getUserContact() }</td>
						<td>${user.getUserGender() }</td>
						<td>${user.getUserPassword() }</td>
						<td>${user.getUserWallet() }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
<script src="Assets/js/dataTable.js"></script>
</html>