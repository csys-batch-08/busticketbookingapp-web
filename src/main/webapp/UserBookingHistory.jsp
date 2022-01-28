<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Booking History</title>
<link rel="stylesheet" href="css/NavigationUser.css">
<style>
       #nav{
       position:fixed;
       }
            #operatorlistdiv table tr th,td {
                padding: 25px;
                text-align: center;
                border: 1px solid black;
                border-collapse: collapse;
             }
            #operatorlistfieldset{
                margin-top: 110px;
                margin-left: 100px;
                width: 1000px;
                
            }
            #operatorlistdiv{
                padding: 40px;
                margin-left: 20px;
                margin-top: 10px;
            }
            #operatorlistfieldset legend{
                font-size: 30px;
                text-align: center;
            }
    </style>
</head>
<body>
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

        <fieldset id="operatorlistfieldset">
            <legend>Booking-History</legend>
        <div id="operatorlistdiv">
         
            <table>
                <tr>
                    <th>Ticket No</th>
                    <th>Booking_Date</th>
                    <th>Bus Type</th>
                    <th>Departure_Date</th>
                    <th>Arrival_Date</th>
                    <th>Seat Count</th>
                    <th>Total Price</th>
                    <th>Booking Status</th>
                </tr>
               <c:forEach items="${BookingList}" var="bookticket">
				<tr>
                    <td>${bookticket.getTicketNo() }</td>
                    <td>${bookticket.getBookingDate() }</td>
                    <td>${bookticket.getBusModel().getBusCategory() }</td>
                    
                    <fmt:parseDate value="${bookticket.getBusModel().getDeparture()}"
							pattern="yyyy-MM-dd'T'HH:mm" var="depature" type="both" />
                    <td><fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${depature}" /></td>
                            
					<fmt:parseDate value="${bookticket.getBusModel().getArrival()}"
							pattern="yyyy-MM-dd'T'HH:mm" var="arrival" type="both" />
                    <td><fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${arrival}" /></td>
                            
                    <td>${bookticket.getTicketCount() }</td>
                    <td>${bookticket.getTotalPrice() }</td>
                    <td>${bookticket.getBookingStatus() }</td>
                </tr>
                </c:forEach>
            </table>
            
      </div>
    </fieldset>
</body>
</html>