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
<title>Bus Hub</title>
<link rel="stylesheet" href="Assets/css/filterBus.css">
</head>

<body>
	<c:set var="busList" scope="session" value="${BusList}"></c:set>
	<c:set var="fromLocation" scope="session" value="${FromLocation}"></c:set>
	<c:set var="toLocation" scope="session" value="${ToLocation}"></c:set>
	<c:set var="date" scope="session" value="${Date}"></c:set>
	<c:set var="UserSession" scope="session" value="${userModel}"></c:set>
	<form action="SeatBooking" method="post">
		<div>
			<fieldset id="fieldsettable">
				<legend>Available Buses</legend>
				<div id="forcontent">
					<ul id="forcontentinlist">
						<c:set var="from" value="${fn:toUpperCase(fromLocation )}" />
						<li><h4>${from}</h4></li>
						<li><p>to</p></li>
						<c:set var="to" value="${fn:toUpperCase(toLocation )}" />
						<li><h4>${to}</h4></li>
						<li><p>Journey Date :</p></li>
						<fmt:parseDate value="${date}" pattern="yyyy-mm-dd"
							var="dateDeparture" type="both" />
						<li><h4>
								<fmt:formatDate pattern="dd-mm-yyyy" value="${dateDeparture}" />
							</h4></li>
					</ul>
				</div>
				<div id="outerlinetable">
					<table>
						<tr>
							<th>Type</th>
							<th>Start Point</th>
							<th>Destination</th>
							<th>Departure.time(at passenger start point)</th>
							<th>Arrival.time(at passenger end point)</th>
							<th>Seater Fare</th>
							<th>Select Service</th>
						</tr>
						<c:forEach items="${busList}" var="busList">
							<tr>
								<td>${busList.getBusCategory() }</td>
								<td>${busList.getFromCity()}</td>
								<td>${busList.getToCity()}</td>

								<fmt:parseDate value="${busList.getDeparture()}"
									pattern="yyyy-MM-dd'T'HH:mm" var="DepatureTime" type="both" />
								<td><fmt:formatDate pattern="HH:mm" value="${DepatureTime}" /></td>

								<fmt:parseDate value="${busList.getArrival()}"
									pattern="yyyy-MM-dd'T'HH:mm" var="ArrivalTime" type="both" />
								<td><fmt:formatDate pattern="HH:mm" value="${ArrivalTime}" /></td>
								<td>${busList.getSeaterFare()}</td>
								<c:if test="${UserSession!=null }">
									<td><button id="busId" name="busIdValue"
											value="${busList.getBusId()}">BOOK</button></td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</div>
			</fieldset>
			<c:if test="${UserSession!=null }">
				<a href="SearchBus" id="backlink">GO BACK TO HOME</a>
			</c:if>
			<c:if test="${UserSession==null }">
				<script type="text/javascript">
					alert("please log in for booking...");
				</script>
				<a href="index.jsp" id="backlink">GO BACK TO HOME</a>
			</c:if>
		</div>
	</form>
</body>
<script src="Assets/js/popUpMessages.js"></script>
<c:if test="${param.seatstatus!=null}">
	<script>
		popupMessages('Seats are unavailable')
	</script>
</c:if>
</html>