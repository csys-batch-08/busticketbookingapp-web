<%@page import="com.busticketbooking.model.BookedTickets"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%BookedTickets bookedTickets=(BookedTickets) session.getAttribute("FinalBookTicketsModel");%>
<!DOCTYPE html>
<html>
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

    <div id="nav">
            <ul>
                <li><span id="buslogo">BusHub</span></li>
                <li><a href="SearchBus.jsp">Bus_Tickets</a></li>
                <li><a href="AboutUs.jsp">About_us</a></li>
                  <li><div class="dropdown">
                    <button class="dropbtn">Ticket 
                    </button>
                    <div class="dropdown-content">
                      <a href="UserBookingHistory">Booking History</a>
                      <a href="MyTicket.jsp">My Ticket</a>
                      <a href="CancelTicket.jsp">Cancel Ticket</a>
                    </div>
                  </div> </li>
    
                  <li><div class="dropdown">
                    <button class="dropbtn">Wallet 
                    </button>
                    <div class="dropdown-content">
                      <a href="ShowBalance.jsp">Show Balance</a>
                      <a href="UpdateWallet.jsp">Update Wallet</a>
                    </div>
                  </div> 
                  <li><a href="UserProfile.jsp">Profile</a></li>
                  <li><a href="logout">LogOut</a></li>
                </ul>
        </div>


    <div id="successdiv">
        <h2> Ticket Successfully Booked </h2><br><br><br>
        <h3>Your Ticket No :  <span><%=bookedTickets.getTicketNo()%></span></h3>
        <p><--Use this Ticket No for further purpose--></p>

    </div>
    <script>
            alert("Booked successfully!! payment was deducted from your wallet");
    </script>
</body>
</html>