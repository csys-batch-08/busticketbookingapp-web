<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Bus Hub</title>
<link rel="stylesheet" href="Assets/css/userNavigationIndex.css">
</head>
<body>
	<jsp:useBean id="busDao"
		class="com.busticketbooking.daoimpl.BusDaoImpl" />
	<c:set var="locationList" scope="session" value="${busDao.getLocations()}"></c:set>
	<div id="nav">
		<ul>
			<li><span id="buslogo">BusHub</span></li>
			<li><a href="index.jsp">Bus_Tickets</a></li>
			<li><a href="aboutUs.jsp">About_us</a></li>

			<li id="loginlink"><a href="login.jsp">SignIn</a></li>
			<li><a href="userRegister.jsp">SignUp</a></li>
		</ul>
	</div>
	<div>
		<form action="FilterBus" method="post">
			<div id="searchlocation">
				<table>
					<thead>
						<tr>
							<th><div class="fromto">
									<span>FROM</span><br> <input class="inputtype"
										name="fromlocation" id="fromlocation" pattern="[aA-zZ]{2,}"
										title="please enter correct city" autocomplete="off"
										placeholder="Search Locations" list="from" required>
									<datalist id="from">
										<c:forEach items="${locationList }" var="location">
											<option value="${location }">${location }</option>
										</c:forEach>
									</datalist>
								</div></th>
							<th><div class="fromto">
									<span>TO</span><br> <input class="inputtype"
										name="tolocation" id="tolocation" pattern="[aA-zZ]{2,}"
										title="please enter correct city" autocomplete="off"
										placeholder="Search Locations" list="to" required>
									<datalist id="to">
										<c:forEach items="${locationList }" var="location">
											<option value="${location }">${location }</option>
										</c:forEach>
									</datalist>
								</div></th>
							<th><div class="fromto">
									<span>DATE</span><br> <input class="inputtype" name="date"
										id="date" type="date" required>
								</div></th>
						</tr>
					</thead>
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
        <c:forEach items="${locationList }" var="location1" >
        <c:forEach items="${locationList }" var="location2" >
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