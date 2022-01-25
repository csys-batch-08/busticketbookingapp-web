
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      
<!DOCTYPE html>
<html>
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
    		margin-top: -10px;
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
    
    
    <div id="nav">
        <ul>
            <li><span id="buslogo">BusHub</span></li>
            <li><a href="SearchBus.jsp" onclick="searchbusfunc()">Bus_Tickets</a></li>
            <li><a href="AboutUs.jsp" onclick="aboutusfunc()">About_us</a></li>
              <li><div class="dropdown">
                <button class="dropbtn">Ticket 
                </button>
                <div class="dropdown-content">
                  <a href="UserBookingHistory.jsp" onclick="bookinghistoryfunc()">Booking History</a>
                  <a href="MyTicket.jsp" onclick="myticketfunc()">My Ticket</a>
                  <a href="CancelTicket.jsp" onclick="cancelticketfunc()">Cancel Ticket</a>
                </div>
              </div> </li>

              <li><div class="dropdown">
                <button class="dropbtn">Wallet 
                </button>
                <div class="dropdown-content">
                  <a href="ShowBalance.jsp" onclick="showbalancefunc()">Show Balance</a>
                  <a href="UpdateWallet.jsp" onclick="updatewalletfunc()">Update Wallet</a>
                </div>
              </div> 
              <li><a href="UserProfile.jsp" onclick="profilefunc()">Profile</a></li>
              <li><a href="logout" onclick="logoutfunc()">LogOut</a></li>
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
        
        <%String cancelMessage=(String)session.getAttribute("WrongNumber");
    if(cancelMessage!=null){%>
    	<p id="msgtag"><%=cancelMessage %></p>
    <%}session.removeAttribute("WrongNumber");%>
        
        <button id="searchbutton" type="submit" >Submit</button>
		</form>
		</div>
</body>
</html>