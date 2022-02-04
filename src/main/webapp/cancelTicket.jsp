<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Cancel Ticket</title>
<link rel="stylesheet" href="css/NavigationUser.css">
<style>
        
        #tickettext {
            border-top: none;
            border-left: none;
            border-right: none;
        }
        #tickettext{
            height: 30px;    
            font-size: 18px;
            outline: none;
            color: rgb(24, 11, 7);
            width: 200px;
            text-align: center;
        }
       	#ticketnotable{
            padding: 35px;
            padding-top:0px;
            margin-left: 65px;
    		color: white;
    		font-size: 20px;
        }
        #deductedmessage{
            position: absolute;
            color: red;
            font-size: 17px;
            margin-left: 22px;
    		margin-top: -27px;
        }
         #cancelticketdiv{
        	width: 600px;
        	height:215px;
    		padding: 50px;
    		background: linear-gradient(45deg, #0aacf9, #1197e566);
    		border-radius: 10px;
    		border: none;
    		margin-top: 160px;
    		margin-left: 430px;
    		box-shadow: 0px 0px 5px 0px #161313;
        }
        #submitbutton {
    		height: 50px;
    		width: 200px;
    		margin-top: 72px;
    		margin-left: 159px;
    		font-size: 18px;
    		color: black;
    		background-color: rgb(255 255 255);
    		border: none;
    		border-radius: 10px;
    		cursor: pointer;
    		box-shadow: 0px 0px 5px 0px black;
    		position: absolute;
		}
		#msgtag{
        	margin-left: 105px;
    		margin-top: 25px;
    		color: red;
   			position: absolute;
   			font-size: 25px;
   			font-variant: all-petite-caps;
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
    
    <c:set var="wrongnumbermessage" scope="session" value="${WrongNumber}"></c:set>
     <c:set var="alreadycancelmessage" scope="session" value="${AlreadyCancel}"></c:set>
     <c:set var="dateendedmessage" scope="session" value="${DateEnded}"></c:set>
    
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
	
	<div id="cancelticketdiv">
        <form action="cancelticketservlet">
        <table id="ticketnotable" aria-describedby="cancelbus">
        
            <tr>
                <td>TICKET NO :</td>
                <td><input id="tickettext" name="tickettext" type="text" placeholder="Enter the ticket number" pattern="[A-Za-z0-9]{7}" title="please enter 7 digit ticket number" autofocus autocomplete="off" required></td>
            </tr>
            
        </table>
        <label for="deductedmessage" id="deductedmessage">If you want to cancel your ticket(15% amount will be deducted)</label>
       	
    <c:if test="${wrongnumbermessage!=null}">
    	<p id="msgtag">${wrongnumbermessage }</p>
    </c:if> 
    <%-- <%}session.removeAttribute("WrongNumber");%> --%>
    
    <c:if test="${alreadycancelmessage!=null}">
    	<p id="msgtag">${alreadycancelmessage  }</p>
    </c:if>
    
    <c:if test="${dateendedmessage!=null}">
    	<p id="msgtag">${dateendedmessage }</p>
    </c:if>
    
        <button onclick="check()" id="submitbutton" type="submit" >Submit</button>
        </form>
        </div>
<script type="text/javascript">
function check() {
	var result = confirm("Do you want to cancel this ticket?");

	if (result == false) {
		event.preventDefault();
	}
}
</script>
</body>
</html>