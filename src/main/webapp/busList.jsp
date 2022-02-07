<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>Bus List</title>
<link rel="stylesheet" href="Assets/css/NavigationAdmin.css">
<link rel="stylesheet" href="Assets/css/adminPages.css">
</head>

<body>
<script src="Assets/js/popUpMessages.js"></script>
<c:if test="${param.infomsg!=null}">
	<script>
		popupMessages('Updated successfully')
	</script>
</c:if>
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


	<h1 class="title-heading">Bus Details</h1>
	<div id="buslistdiv">
		<table id="table_id">
			<thead>
				<tr>
					<th>S.No</th>
					<th>Bus Id</th>
					<th>Bus No</th>
					<th>Operator Id</th>
					<th>Bus Type</th>
					<th>From City</th>
					<th>To City</th>
					<th>Departure</th>
					<th>Arrival</th>
					<th>Seater Fare</th>
					<th>Total Seat</th>
					<th>Seat Status</th>
					<th>Edit</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach begin="0" items="${BusListAdmin}" var="bus"
					varStatus="loop">
					<tr>
						<td>${loop.count }</td>
						<td>${bus.getBusId() }</td>
						<td>${bus.getBusNo() }</td>
						<td>${bus.getOperatorId() }</td>
						<td>${bus.getBusCategory() }</td>
						<td>${bus.getFromCity() }</td>
						<td>${bus.getToCity() }</td>

						<fmt:parseDate value="${bus.getDeparture()}"
							pattern="yyyy-MM-dd'T'HH:mm" var="depature" type="both" />
						<td><fmt:formatDate pattern="dd-MM-yyyy HH:mm"
								value="${depature}" /></td>

						<fmt:parseDate value="${bus.getArrival() }"
							pattern="yyyy-MM-dd'T'HH:mm" var="arrival" type="both" />
						<td><fmt:formatDate pattern="dd-MM-yyyy HH:mm"
								value="${arrival }" /></td>

						<td>${bus.getSeaterFare() }</td>
						<td>${bus.getTotalseat() }</td>
						<td>${bus.getSeatStatus() }</td>
						<td><button id="editbutton"
								onclick="editBus(${bus.getBusId()})">Edit</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>

<script src="Assets/js/dataTable.js"></script>
<script type="text/javascript">
            function editBus(BusId){
        		window.location.replace("BusUpdate?info=&busId=" + BusId);
        	}
        	</script>
</html>