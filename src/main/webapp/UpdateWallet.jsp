<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
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
        
<form action="WalletUpdate" method="post">
    <div id="updatewalletdiv">
        <table>
            <tr>
                <td>Login Id</td>
                <td>:</td>
                <td>${usermodel.getUserContact() }</td>
            </tr>
            
            
            <tr>
                <td>Available Balance</td>
                <td>:</td>
                <td>${usermodel.getUserWallet() }</td>
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