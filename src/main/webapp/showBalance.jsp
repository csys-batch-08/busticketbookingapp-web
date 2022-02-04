<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Wallet</title>
<link rel="stylesheet" href="css/NavigationUser.css">
<style>
        #balancediv{
            width: 600px;
        	height:205px;
    		padding: 63px;
    		background: linear-gradient(45deg, #0aacf9, #1197e566);
    		border-radius: 10px;
    		border: none;
    		margin-top: 160px;
    		margin-left: 430px;
    		box-shadow: 0px 0px 5px 0px #161313;
        }
        #btn a{
        	text-decoration: none;
            font-size: large;
        }
       #btn{
            height: 50px;
    		width: 200px;
    		margin-top: 13px;
    		margin-left: 152px;
    		font-size: 18px;
    		color: black;
    		background-color: rgb(255 255 255);
    		border: none;
    		border-radius: 10px;
    		cursor: pointer;
    		box-shadow: 0px 0px 5px 0px black;
    		position: absolute;
        }
        .clickmsg{
        	margin-left: 108px;
    		margin-top: 24px;
    		color: white;
        }
        /* #btn:hover{
            background-color: rgb(247, 112, 112);
        } */
        #availableamount{
            font-size: 32px;
    		font-style: oblique;
    		border-radius: 11px;
    		border: 1px solid rgb(238, 225, 225);
    		padding: 10px;
    		margin-left: 10px;
    		color: #fff4f4;
        }
        .currentbalance{
        	margin-left: 74px;
    		font-size: 31px;
    		color: white;
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