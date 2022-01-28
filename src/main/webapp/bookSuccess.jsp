<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Booking</title>
<link rel="stylesheet" href="css/NavigationUser.css">
<style>
        
        #successdiv{
            width: 450px;
            height: 300px;
            padding: 50px;
            padding-top: 70px;
            margin-left: 430px;
            margin-top: 120px;
            border-radius: 25px;
            background-color: rgb(91, 253, 91);
            border:none;
            box-shadow: 0px 0px 6px 0px #161313;
        }
    </style>
</head>
<body>

	<c:set var="booktickets" scope="session" value="${FinalBookTicketsModel}"></c:set>
	
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


    <div id="successdiv">
        <h2> Ticket Successfully Booked </h2><br><br><br>
        <h3>Your Ticket No :  <span>${booktickets.getTicketNo()}</span></h3>
        <p>--Use this Ticket No for further purpose--</p>

    </div>
    <script>
            alert("Booked successfully!! payment was deducted from your wallet");
    </script>
</body>
</html>