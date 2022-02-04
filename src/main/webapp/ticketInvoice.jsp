<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Invoice</title>
<link rel="stylesheet" href="css/NavigationUser.css">
 <style>
        
        #btnticket{
            height: 45px;
            width: 120px;
            background-color: rgb(129, 168, 252);
            outline: none;
            border: none;
            color: blanchedalmond;
            text-decoration: none;
            font-size: large;
        }
        #btnticket:hover{
            background-color: rgb(247, 112, 112);
        }
        #buslogo{
            font-style: italic;
            font-family: cursive;
            font-size: 23px; 
            color: rgb(95, 95, 224);
        }

        #buslogohead{
            font-style: italic;
            font-family: cursive;
            font-size: 40px; 
            color: rgb(95, 95, 224);
        }
        #ticketdiv{
            border: 1px solid black;
   			padding: 30px;
            width: 788px;
            margin-left: 300px;
            height: 530px;
            margin-top:10px;
        }
        #heading{
            text-align: center;
        }
        #endtable tr td,#starttable tr td,#seattable tr td{
            padding: 10px;
        }
        #endtable{
            position: relative;
    		margin-left: 410px;
    		margin-top: -200px;
        }
        #usertable tr td{
            padding: 0 45px;
        }
        #usertable{
            position: absolute;
            margin-left: -30px;
        }
        #passengerdetails{
            text-align: center;
        }
        #seattable{
            margin-top: -40px;
        }
        

    </style>
</head>
<body>

	<c:set var="booktickets" scope="session" value="${ticketdetailsresult }"></c:set>
	<c:set var="seatnolist" scope="session" value="${seatnumberdetailsresult }"></c:set>
	<c:set var="userage" scope="session" value="${UserAge }"></c:set>
	
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


            <div id="ticketdiv">
        <div id="heading">
            <h1 id="buslogohead">Bus Hub</h1>
            <h3>Ticket-Reservation</h3>
        </div><br>
            <table id="starttable">
                <tr>
                    <td><label for="bookingdate">Booking Date</label></td>
                    <td>:</td>
                    <td><h4>${booktickets.getBookingDate() }</h4></td>
                </tr>
                <tr>
                    <td><label for="dateofjourney">Date of Journey</label></td>
                    <td>:</td>
                    <td><h4>${booktickets.getDepartureDate().toLocalDate() }</h4></td>
                </tr>
                <tr>
                    <td><label for="startpoint">Service Start Point</label></td>
                    <td>:</td>
                    <td><h4>${booktickets.getBusModel().getFromCity() }</h4></td>
                </tr>
                <tr>
                    <td><label for="starttime">Start Time</label></td>
                    <td>:</td>
                    <td><h4>${booktickets.getBusModel().getDeparture().toLocalTime() }</h4></td>
                </tr>
                <tr>
                    <td><label for="class">Class Of Service</label></td>
                    <td>:</td>
                    <td><h4>${booktickets.getBusModel().getBusCategory() }</h4></td>
                </tr>
            </table>

            <table id="endtable">
                <tr>
                    <td><label for="pnrnumber">PNR Number</label></td>
                    <td>:</td>
                    <td><h4>${booktickets.getTicketNo() }</h4></td>
                </tr>
                <tr>
                    <td><label for="arrivaldate">Arrival Date</label></td>
                    <td>:</td>
                    <td><h4>${booktickets.getBusModel().getArrival().toLocalDate() }</h4></td>
                </tr>
                <tr>
                    <td><label for="endpoint">Service End Point</label></td>
                    <td>:</td>
                    <td><h4>${booktickets.getBusModel().getToCity() }</h4></td>
                </tr>
                <tr>
                    <td><label for="destinationtime">Destination Time</label></td>
                    <td>:</td>
                    <td><h4>${booktickets.getBusModel().getArrival().toLocalTime() }</h4></td>
                </tr>
                <tr>
                    <td><label for="status">Booking Status</label></td>
                    <td>:</td>
                    <td><h4>${booktickets.getBookingStatus() }</h4></td>
                </tr>
                <tr>
                    <td><label for="totalfair">Total Fair</label></td>
                    <td>:</td>
                    <td><h4>${booktickets.getTotalPrice() }</h4></td>
                </tr>
            </table>
            <table id="seattable">
                <tr>
                    <td><label for="noofseats">No Of Seats</label></td>
                    <td>:</td>
                    <td><h4>${booktickets.getTicketCount() }</h4></td>
                </tr>
                <tr>
                    <td><label for="seatno">Seat No</label></td>
                    <td>:</td>
                    <td><h4>${seatnolist }</h4></td>
                </tr>
            </table><br>
            <h4 id="passengerdetails">Passenger Details</h4><br>
            <table id="usertable">
                <tr>
                    <td><label for="username">UserName</label></td>
                    <td><label for="age">Age</label></td>
                    <td><label for="mobile">Mobile</label></td>
                    <td><label for="gender">Gender</label></td>
                </tr>
                <tr>
                    <td><h4>${booktickets.getUserModel().getUserName() }</h4></td>
                    <td><h4>${userage }</h4></td>
                    <td><h4>${booktickets.getUserModel().getUserContact() }</h4></td>
                    <td><h4>${booktickets.getUserModel().getUserGender() }</h4></td>
                </tr>
            </table>
        </div>
    
    
</body>
</html>