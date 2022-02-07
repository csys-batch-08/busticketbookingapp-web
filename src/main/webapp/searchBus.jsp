<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="Assets/css/NavigationUser.css">
<link rel="stylesheet" href="Assets/css/searchBus.css">
</head>

<body>
	<c:set var="locationList" scope="session" value="${LocationList}"></c:set>
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

	<div>
		<form action="FilterBus" method="post">
			<div id="searchlocation">
				<table>
					<tr>
						<th><div class="fromto">
								<span>FROM</span><br> <input class="inputtype" name="fromlocation"
									id="fromlocation" pattern="[a-zA-Z]{2,}"
									title="please enter correct city" autocomplete="off"
									placeholder="Search Locations" list="from" required>
								<datalist id="from">
									<c:forEach items="${locationList }" var="location">
										<option value="${location }">${location }</option>
									</c:forEach>
								</datalist>
							</div></th>
						<th><div class="fromto">
								<span>TO</span><br> <input class="inputtype" name="tolocation"
									id="tolocation" pattern="[a-zA-Z]{2,}"
									title="please enter correct city" autocomplete="off"
									placeholder="Search Locations" list="to" required>
								<datalist id="to">
									<c:forEach items="${locationList }" var="location">
										<option value="${location }">${location }</option>
									</c:forEach>
								</datalist>
							</div></th>
						<th><div class="fromto">
								<label for="date">DATE</label><br> <input class="inputtype" name="date" id="date"
									type="date" required>
							</div></th>
					</tr>
				</table>
				<button type="submit" id="searchbutton" onclick="return validate()">
					<h3>SEARCH</h3>
				</button>

			</div>
		</form>
	</div>


	<script src="Assets/js/popUpMessages.js"></script>
	<script>
		dayBefore();
	
    function validate(){
        var from=document.getElementById("fromlocation");
        var to=document.getElementById("tolocation"); 
       if(from.value.trim()==to.value.trim()){
        	alert("please enter correct location");
            return false;
        }
        <c:forEach items="${LocationList }" var="location1" >
        <c:forEach items="${LocationList }" var="location2" >
        else if((from.value.trim()=="${location1}") && (to.value.trim()=="${location2}")){
        	return true;
        }
       </c:forEach>
       </c:forEach>
        else{
        	alert("please enter correct location");
        return false;
        } 
    } 
    </script>

</body>
</html>