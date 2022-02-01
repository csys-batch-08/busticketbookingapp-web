<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/NavigationUser.css">
<title>Invoice</title>
    <style>

        #tickettext {
            border-top: none;
            border-left: none;
            border-right: none;
        }
        #tickettext{
            height: 40px;    
            font-size: 19px;
            outline: none;
            color: rgb(24, 11, 7);
            width: 200px;
            text-align: center;
            margin-left:20px;
        }
        #ticketnoword{
         color: white;
        }
        #ticketnotable{
            padding: 10px;
            padding-top:0px;
            margin-left: 30px;
        }
        #myticketdiv{
        	width: 600px;
        	height:190px;
    		padding: 50px;
    		background: linear-gradient(45deg, #0aacf9, #1197e566);
    		border-radius: 10px;
    		border: none;
    		margin-top: 160px;
    		margin-left: 430px;
    		box-shadow: 0px 0px 5px 0px #161313;
        }
        
        /* #btnticket:hover{
            background-color: rgb(247, 112, 112);
        } */
        #msgtag{
        	margin-left: 130px;
    		font-size: 25px;
    		margin-top: 10px;
    		color:red;
    		position: absolute;
    		font-variant: all-petite-caps;
        }
         #searchbutton {
    		height: 50px;
    		width: 200px;
    		margin-top: 60px;
    		margin-left: 156px;
    		font-size: 18px;
    		color: black;
    		background-color: rgb(255 255 255);
    		border: none;
    		border-radius: 10px;
    		cursor: pointer;
    		box-shadow: 0px 0px 5px 0px black;
    		position: absolute;
		}
        #buslogo{
            font-style: italic;
            font-family: cursive;
            font-size: 23px; 
            color: rgb(95, 95, 224);
        }
    </style>
</head>
<body>
    
    <c:set var="cancelMessage" scope="session" value="${WrongNumber }"></c:set>
    
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
        <form action="myticketservlet">
        <table id="ticketnotable">
            <tr>
                <td><h3 id="ticketnoword">TICKET NUMBER:</h3></td>
                <td><input type="text" pattern="[A-Za-z0-9]{7}" title="please enter 7 digit ticket number" name="tickettext" placeholder="Enter the ticket number"   id="tickettext" autofocus autocomplete="off" required></td>
            </tr>
        </table>
        
        <c:if test="${cancelMessage!=null }">
    	<p id="msgtag"><c:out value="${cancelMessage }"></c:out></p>
        </c:if>
        <c:remove var="cancelMessage" scope="session"/>
        
        <button id="searchbutton" type="submit" >Submit</button>
		</form>
		</div>
</body>
</html>