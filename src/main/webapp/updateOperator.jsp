<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<link href="css/bootstrap.css" rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Update Operator</title>
<link rel="stylesheet" href="Assets/css/NavigationAdmin.css">
<link rel="stylesheet" href="Assets/css/operatorUpdate.css">

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
	<form action="UpdateOperatorjsp">
		<div id="addOperator" class="col-sm-4">
			<div id="headeraddoperator">
				<label id="operatortitle" for="operatortitle">Operator</label>
			</div>
			<table>
				<tr>
					<th><label for="operatorName">Operator Name</label></th>
					<th><input class="input" name="operatorName" type="text" id="operatorName"
						pattern="[aA-zZ]{4,}"
						title="Min 4 characters...Numbers and symbols are not allowed"
						required autofocus autocomplete="off"></th>
				</tr>
				<tr>
					<th><label for="operatorEmail">Operator Email</label></th>
					<th><input class="input" name="operatorEmail" type="email"
						id="operatorEmail" autocomplete="off"
						pattern="[A-Za-z0-9]+[@][a-zA-Z]+[.][A-Za-z]{2,3}"
						placeholder="eg.abc@gmail.com" required></th>
				</tr>
				<tr>
					<th><label for="operatorContact">Operator Contact</label></th>
					<th><input class="input" name="operatorContact" type="text"
						id="operatorContact" pattern="[6-9][0-9]{9}"
						title="Must contain 10 numbers only" autocomplete="off" required></th>
				</tr>
				<tr>
					<th><label for="operatorAge">Operator Age</label></th>
					<th><input class="input" name="operatorAge" type="text" id="operatorAge"
						pattern="[0-9]{2}" title="please enter correct age" required></th>
				</tr>
			</table>
			<div id="btn">
				<br>
				<button id="btnsubmit" type="submit">Submit</button>
				<button id="btnreset" type="reset">Reset</button>
			</div>
		</div>
	</form>

	<script type="text/javascript">
		<c:set var="operatormodel" scope="session" value="${OperatorObject}"></c:set>
		document.getElementById("operatorName").value = `${operatormodel.getOperatorName()}`;
		document.getElementById("operatorEmail").value = `${operatormodel.getOperatorEmail()}`;
		document.getElementById("operatorContact").value = `${operatormodel.getOperatorContact()}`;
		document.getElementById("operatorAge").value = `${operatormodel.getOperatorAge()}`;
	</script>

</body>
</html>