<%@page import="com.busticketbooking.daoimpl.UserDaoImpl"%>
<%@page import="com.busticketbooking.model.BookedTickets"%>
<%@page import="com.busticketbooking.daoimpl.BookedTicketsDaoImpl"%>
<%@page import="com.busticketbooking.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="javax.servlet.http.HttpSession" %>
    <%User userModel=(User)session.getAttribute("userModel"); 
      UserDaoImpl userDao=new UserDaoImpl();
      User userModel1=userDao.getUserDetailsById(userModel.getUserId());%>
<!DOCTYPE html>
<html>
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
    		font-size: 25px;
    		margin-top: 25px;
    		color: red;
   			position: absolute;
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

	<%String cancelMessage=(String)session.getAttribute("userHome");
    if(cancelMessage.equals("cancelSuccess")){
    	session.setAttribute("userHome", "homeSession");
    	%>
    	<script>
    	alert("Ticket cancelled successfully");
    	alert("Your (85%)refund amount will be credit with your wallet with in 7 working days ")
    </script>
    <%} %>
    <div id="nav">
            <ul>
                <li><span id="buslogo">BusHub</span></li>
                <li><a href="SearchBus.jsp">Bus_Tickets</a></li>
                <li><a href="AboutUs.jsp">About_us</a></li>
                  <li><div class="dropdown">
                    <button class="dropbtn">Ticket 
                    </button>
                    <div class="dropdown-content">
                      <a href="UserBookingHistory.jsp">Booking History</a>
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
	
	<div id="cancelticketdiv">
        <form action="cancelticketservlet">
        <table id="ticketnotable">
            <tr>
                <td>TICKET NO :</td>
                <td><input id="tickettext" name="tickettext" type="text" placeholder="Enter the ticket number" pattern="[A-Za-z0-9]{7}" title="please enter 7 digit ticket number" autofocus autocomplete="off" required></td>
            </tr>
        </table>
        <label for="deductedmessage" id="deductedmessage">If you want to cancel your ticket(15% amount will be deducted)</label>
       	
    <%String wrongNumberMessage=(String)session.getAttribute("WrongNumber");
    if(wrongNumberMessage!=null){%>
    	<p id="msgtag"><%=wrongNumberMessage %></p>
    <%}session.removeAttribute("WrongNumber");%>
    
    <%String alreadyCancelMessage=(String)session.getAttribute("AlreadyCancel");
    if(alreadyCancelMessage!=null){%>
    	<p id="msgtag"><%=alreadyCancelMessage %></p>
    <%}session.removeAttribute("AlreadyCancel");%>
    
    <%String DateEndedMessage=(String)session.getAttribute("DateEnded");
    if(DateEndedMessage!=null){%>
    	<p id="msgtag"><%=DateEndedMessage %></p>
    <%}session.removeAttribute("DateEnded");%>
    
        <button id="submitbutton" type="submit" >Submit</button>
        </form>
        </div>
<script type="text/javascript">

</script>
</body>
</html>