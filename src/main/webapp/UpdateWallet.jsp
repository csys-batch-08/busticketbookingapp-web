<%@page import="com.busticketbooking.daoimpl.UserDaoImpl"%>
<%@page import="com.busticketbooking.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="javax.servlet.http.HttpSession" %>
    <%User userModel=(User)session.getAttribute("userModel"); 
      /* UserDaoImpl userDao=new UserDaoImpl();
      
      User userModel1=userDao.getUserDetailsById(userModel.getUserId()); */%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Wallet</title>
<link rel="stylesheet" href="css/NavigationUser.css">
<style>
body{
 color:white;
}
    #updatewalletdiv{
        width: 600px;
        	height:333px; 
    		padding: 45px;
    		background: linear-gradient(45deg, #0aacf9, #1197e566);
    		border-radius: 10px;
    		border: none;
    		margin-top: 111px;
    		margin-left: 430px;
    		box-shadow: 0px 0px 5px 0px #161313;
    }
    #updatewalletdiv table tr td{
        padding: 8px;
        font-size: x-large;
    }
    #updatewalletdiv table{
    	margin-left:50px;
    	color:white;
    }
    #amounttext{
        height: 40px;
        width: 200px;
        font-size: 15px;
        text-align: center;
    }
    #amountdiv{
        margin-top: 35px;
        margin-left: 138px;
        font-size: 26px;
    }
    #btn{
    		height: 50px;
    		width: 200px;
    		margin-top: 62px;
    		margin-left: 145px;
    		font-size: 18px;
    		color: black;
    		background-color: rgb(255 255 255);
    		border: none;
    		border-radius: 10px;
    		cursor: pointer;
    		box-shadow: 0px 0px 5px 0px black;
    		position: absolute;
        }
        /* #btn:hover{
            background-color: rgb(247, 112, 112);
        } */
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
<form action="WalletUpdate" method="post">
    <div id="updatewalletdiv">
        <table>
            <tr>
                <td>Login Id</td>
                <td>:</td>
                <td><%=userModel.getUserContact() %></td>
            </tr>
            <%String walletMessage=(String)session.getAttribute("userHome");
            if(walletMessage.equals("insufficient")){
            	session.setAttribute("userHome", "homeSession");
            	%>
            <script>
            	alert("Insufficient Balance...You can't book ticket with this balance    Please Recharge your Wallet");
            </script>
            
            <%} %>
            
            <tr>
                <td>Available Balance</td>
                <td>:</td>
                <td><%=userModel.getUserWallet() %></td>
            </tr>
        </table>
    <div id="amountdiv">
        <label for="enteramount" >Enter the amount</label>
        <input id="amounttext" name="amountentered" type="number" placeholder="To be added to your wallet" autocomplete="off" min="100" autofocus required>
    </div>
         <button id="btn" name="btn" type="submit">Submit</button>
    </div>
</form>
</body>
</html>