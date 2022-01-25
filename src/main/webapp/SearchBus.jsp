<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.busticketbooking.daoimpl.BusDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.busticketbooking.model.User" %>
    <%@page import="com.busticketbooking.daoimpl.UserDaoImpl" %>
    <%@page import="javax.servlet.http.HttpSession" %>
    <%BusDaoImpl busDao=new BusDaoImpl();
    List<String> locationList=new ArrayList<String>(); 
    locationList=busDao.getLocations();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="css/NavigationUser.css">

<style>
        #searchlocation input{
            height: 30px;
            width: 220px;
            border-top: none;
            border-left: none;
            border-right: none;
            outline: none;
        }
		#searchlocation input, type {
    		font-size: 20px;
    		padding-top: 5px;
    		background-color: white;
    		padding: 15px 20px;
    		border-radius: 5px;
    		margin-top: 10px;
		}
		#searchlocation table tr td {
    		box-shadow: -8px 4px 20px 0px #4283af52;
    		padding: 0px;
    		border-spacing: 0px;
    		margin: auto;
		}
      #searchlocation {
    		padding: 40px;
    		border: 1px solid black;
    		border-radius: 15px;
    		height: 247px;
    		width: 1030px;
    		margin-left: 150px;
    		margin-top: 100px;
    		background: linear-gradient(45deg, #0aacf9, #1197e566);
    		border: none;
	}
		.fromto {
    		width: 300px;
   			 font-size: 20px;
    		padding: 20px;
    		margin-top: 0px;
    		text-align: center;
	}
       #searchbutton {
    		height: 50px;
    		width: 200px;
    		margin-top: 70px;
    		margin-left: 360px;
    		color: black;
    		background-color: rgb(255 255 255);
    		border: none;
    		border-radius: 10px;
    		cursor: pointer;
    		box-shadow: 0px 0px 5px 0px black;
	}
        #usernameshow{
            font-size: larger;
            margin-left: 1100px;
        }
       
    </style>
</head>


<body>
   
        <%session.setAttribute("userHome", "homeSession");%>
           
    <div id="nav">
            <ul>
                <li><h3 id="buslogo">BusHub</h3></li>
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
	
	
    <div>
    <form action="FilterBus.jsp">
        <div id="searchlocation">
            <table>
                <tr>
                    <td><div class="fromto">
                        <span>FROM</span><br>
                        <input name="fromlocation"  id="fromlocation" pattern="[a-zA-Z]{2,}" title="please enter correct city" autocomplete="off" placeholder="Search Locations" list = "from" required>
                            <datalist id = "from">
                            <%for(int i=0;i<locationList.size();i++){%>
                        	<option value="<%=locationList.get(i)%>"><%=locationList.get(i)%></option>
                       	    <%}%>
                            </datalist></div></td																																																																																																		>
                    <td><div class="fromto">
                        <span>TO</span><br>
                        <input name="tolocation" id="tolocation" pattern="[a-zA-Z]{2,}" title="please enter correct city" autocomplete="off" placeholder="Search Locations" list = "to" required>
                        <datalist id = "to">
                        <%for(int i=0;i<locationList.size();i++){%>
                        <option value="<%=locationList.get(i)%>"><%=locationList.get(i)%></option>
                        <%}%>
                        </datalist></div></td>
                    <td><div class="fromto">
                        <span>DATE</span><br>
                        <input name="date" id="date" type="date" required></div></td>
                </tr>
            </table>
            <button type="submit" id="searchbutton" onclick="return validate()"><h3>SEARCH</h3></button>

        </div>
        </form>
    </div>
    
    
    <script type="text/javascript">
      
    today();
    function today(){
        var today = new Date();
        var dd = String(today.getDate()).padStart(2, '0');
        var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
        var yyyy = today.getFullYear();
        var yyyy1= today.getFullYear()+10;
    maxdate =yyyy1 + '-' + mm + '-'+ dd  ;
    mindate =yyyy + '-' + mm + '-'+ dd  ;
    document.getElementById("date").setAttribute("max",maxdate);
    document.getElementById("date").setAttribute("min",mindate);
    }
    function validate(){
        var from=document.getElementById("fromlocation");
        var to=document.getElementById("tolocation");
        if(from.value.trim()==to.value.trim()){
        	alert("please enter correct location");
            return false;
        }
        <%for(int i=0;i<locationList.size();i++){
         for(int j=0;j<locationList.size();j++){%>
        else if((from.value.trim()=="<%=locationList.get(i)%>") && (to.value.trim()=="<%=locationList.get(j)%>")){
        	return true;
        }
        <%}}%>
        else{
        	alert("please enter correct location");
        return false;
        }
    }
    </script>
</body>
</html>