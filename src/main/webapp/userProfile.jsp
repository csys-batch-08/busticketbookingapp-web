<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
<link rel="stylesheet" href="css/NavigationUser.css">
<style>
        #profiletable table tr th,td{
            padding: 10px;
        }
        #profiletable{
            margin-left: 70px;
            margin-top: 70px;
        }
        legend{
            text-align: center;
        }
        #updateprofile{
            width: 500px;
            margin-left: 600px;
            margin-top: -250px;
            padding:20px;
        }
        #updateprofile table tr td,th{
            padding: 10px;
        }
        #updateprofile table{
            padding: 40px;
        }
        input{
            height: 25px; 
        }
        /* #btn a{
        	text-decoration: none;
            font-size: large;
        } */
       #btn{
            height: 50px;
    		width: 200px;
    		margin-top: 36px;
    		margin-left: 60px;
    		font-size: 18px;
    		color: black;
    		background-color: rgb(255 255 255);
    		border: none;
    		border-radius: 10px;
    		cursor: pointer;
    		box-shadow: 0px 0px 5px 0px black;
    		position: absolute;
        }
         #btnupdatediv{
             height: 50px;
    		width: 200px;
    		margin-top: -10px;
    		margin-left: 125px;
    		font-size: 18px;
    		color: black;
    		background-color: rgb(255 255 255);
    		border: none;
    		border-radius: 10px;
    		cursor: pointer;
    		box-shadow: 0px 0px 5px 0px black;
    		
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
        
    <div  id="profiletable">
        <table>
            <tr>
                <th><label for="mobile">MobileNumber</label></th>
                <th>:</th>
                <th>${usermodel.getUserContact() }</th>
            </tr>
            <tr>
                <th><label for="name">UserName</label></th>
                <th>:</th>
                <th>${usermodel.getUserName()}</th>
            </tr>
            <tr>
                <th><label for="emailId">EmailId</label></th>
                <th>:</th>
                <th>${usermodel.getUserEmail() }</th>
            </tr>
            <tr>
                <th><label for="dob">Age</label></th>
                <th>:</th>
                <th>${userage}</th>
            </tr>
            <tr>
                <th><label for="password">Password</label></th>
                <th>:</th>
                <th>${userModel.getUserPassword() }</th>
            </tr>
            <tr>
                <th><label for="gender">Gender</label></th>
                <th>:</th>
                <th>${userModel.getUserGender() }</th>
            </tr>
        </table>
            <button id="btn" type="submit" onclick="updateProfilebox()">update</button>
    </div>


    
        <fieldset id="updateprofile" style="visibility: hidden;">
            <legend><h2>Profile</h2></legend>
            <form action="userProfileUpdate" >
            <table>
                <tr>
                    <th><label for="userName">UserName</label></th>
                    <th><input type="text" name="userName" id="userName" required autofocus autocomplete="off"></th>
                </tr>
                <tr>
                    <th><label for="emailId">EmailId</label></th>
                    <th><input type="email" name="emailId" id="emailId" required></th>
                </tr>
                <tr>
                    <th><label for="mobile">MobileNumber</label></th>
                    <th><input type="text" name="mobile" id="mobile" readonly required></th>
                </tr>
                <tr>
                    <th><label for="password">Password</label></th>
                    <th><input type="password" name="password" id="password"  required></th>
                </tr>
                <tr>
                    <th><label for="dob">DOB</label></th>
                    <th><input type="date" name="dob" id="dob" ></th>
                </tr>
                <tr>
                    <th><label for="gender">Gender</label></th>
                    <th id="male"><input type="radio" name="gender" id="gender" required><label for="Male"> Male</label> 
                        <input type="radio" name="gender" id="gender" required><label for="Female">Female</label></th>
                </tr>
                
            </table>
                <button  id="btnupdatediv" type="submit">Submit</button>
    	</form>
        </fieldset>
    
    <script>
        function updateProfilebox(){
            document.getElementById("updateprofile").style.visibility="visible";
        }
        document.getElementById("userName").value=`${usermodel.getUserName() }`;
        document.getElementById("emailId").value=`${usermodel.getUserEmail() }`;
        document.getElementById("mobile").value=`${usermodel.getUserContact() }`;
        document.getElementById("password").value=`${usermodel.getUserPassword() }`;
        document.getElementById("dob").value=`${usermodel.getUserDOB() }`;
        document.getElementById("gender").value=`${usermodel.getUserGender() }`;
    </script>
</body>
</html>