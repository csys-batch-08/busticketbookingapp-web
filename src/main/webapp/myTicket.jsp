<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<script
src="https://cdn.jsdelivr.net/npm/sweetalert2@11.3.10/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet'
href='https://cdn.jsdelivr.net/npm/sweetalert2@10.10.1/dist/sweetalert2.min.css'>
<link rel="stylesheet" href="Assets/css/NavigationUser.css">
<link rel="stylesheet" href="Assets/css/myTicket.css">
<title>Invoice</title>
</head>

<body>
	<c:set var="wrongnumbermessage" scope="session" value="${WrongNumber }"></c:set>
	<script src="Assets/js/popUpMessages.js"></script>
	<c:if test="${wrongnumbermessage!=null}">
		<script>
			popupMessages('${wrongnumbermessage}')
		</script>
	</c:if>
    <div id="nav">
            <ul>
                <li><h3 id="buslogo">BusHub</h3></li>
                <li><a href="SearchBus">Bus_Tickets</a></li>
                <li><a href="aboutUs.jsp">About_us</a></li>
                  <li><div class="dropdown">
                    <button class="dropbtn">Ticket 
                    </button>
                    <div class="dropdown-content">
                      <a href="UserBookingHistory">Booking History</a>
                      <a href="myTicket.jsp">My Ticket</a>
                      <a href="cancelTicket.jsp">Cancel Ticket</a>
                    </div>
                  </div> </li>
    
                  <li><div class="dropdown">
                    <button class="dropbtn">Wallet 
                    </button>
                    <div class="dropdown-content">
                      <a href="showBalance.jsp">Show Balance</a>
                      <a href="updateWallet.jsp">Update Wallet</a>
                    </div>
                  </div> 
                  <li><a href="userProfile.jsp">Profile</a></li>
                  <li><a href="logout">LogOut</a></li>
                </ul>
        </div>
    <div id="myticketdiv">
        <form action="myticketservlet" method="post">
        <table id="ticketnotable">
            <tr>
                <td><h3 id="ticketnoword">TICKET NUMBER:</h3></td>
                <td><input type="text" pattern="[A-Za-z0-9]{7}" title="please enter 7 digit ticket number" name="tickettext" placeholder="Enter the ticket number"   id="tickettext" autofocus autocomplete="off" required></td>
            </tr>
        </table>  
        <button id="searchbutton" type="submit" >Submit</button>
		</form>
		</div>
</body>
</html>