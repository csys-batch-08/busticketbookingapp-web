<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Wallet</title>
<link rel="stylesheet" href="Assets/css/NavigationUser.css">
<link rel="stylesheet" href="Assets/css/showBalance.css">
</head>

<body>
	<c:set var="usermodel" scope="session" value="${userModel }"></c:set>
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
      <form action="updateWallet.jsp">
        <div id="balancediv">
            <label for="balance" class="currentbalance">Current Balance</label>
            <span id="availableamount">${usermodel.getUserWallet() }</span> <br><br>
            <h3 class="clickmsg">Click here to Recharge your wallet</h3>
            <button id="btn" name="btn" type="submit">Deposit</button>
        </div>
        </form>
</body>
</html>