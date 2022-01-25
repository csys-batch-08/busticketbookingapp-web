<%@page import="com.busticketbooking.exception.SeatsUnavailable"%>
<%@page import="com.busticketbooking.daoimpl.UserDaoImpl"%>
<%@page import="com.busticketbooking.model.User"%>
<%@page import="com.busticketbooking.model.BookedTickets"%>
<%@page import="com.busticketbooking.model.Bus"%>
<%@page import="com.busticketbooking.daoimpl.BusDaoImpl"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% Bus busModel=(Bus)session.getAttribute("CurrentBusObject");
    BusDaoImpl busDao=new BusDaoImpl();%>
       
       
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking</title>
<style>
        fieldset{
            padding: 47px;
    		width: 500px;
    		margin-left:300px;
        }
        #bookingdiv{
            border: 1px solid black;
    		border-radius: 30px;
    		padding-left: 100px;
    		padding: 20px;
    		width: 696px;
        }
        legend{
            font-size: xx-large;
            text-align: center;
        }
        #seatsunavailable{
        	padding: 15px;
			margin-left: 230px;
    		font-size: 25px;
        	color: red;
        	font-variant: all-petite-caps;
        }
        #seatbookingtable tr td{
            padding: 15px;
        }
        #seatcountdiv {
   		margin-left: 245px; 
       position: absolute;
    	margin-top: -68px;
    	text-align: center;
    	margin-bottom: 14px;
}
        #seatinfotable tr td{
            padding: 15px;
            padding-left: 20px;
        }
        #seatcount{
            width: 70px;
            height: 35px;
            text-align: center;
        }
        label{
            font-size: 17px;
        }
input {
    border: none;
    outline: none;
    font-size: 22px;
    text-align: center;
    width: 100%;
    margin-top: 14px;
    padding: 5px;
}
      #bookingdiv {
    border: 1px solid #237c85;
    border-radius: 30px;
    padding-left: 100px;
    padding: 20px;
    width: 696px;
    background: linear-gradient(45deg,#7dd0f7, #1197e566);
}
   
element.style {
}
#btn {
    		height: 50px;
    		width: 200px;
    		margin-left: 240px;
    		font-size: 18px;
    		color: black;
    		background-color: rgb(255 255 255);
    		border: none;
    		border-radius: 10px;
    		cursor: pointer;
    		box-shadow: 0px 0px 5px 0px black;
}
#btn:hover {
        background-color: green;
    color: white;
}
    </style>
</head>
<body onmouseover="check()">
  
    <fieldset>
        <legend>Booking Form</legend>
        <form  action="confirmBooking" >
        <div id="bookingdiv" >
        <table id="seatbookingtable">
            <tr>
                <td><label for="pickuppoint">Pickup Point : <input type="text" id="pickuppoint" value="<%=busModel.getFromCity() %>"></label></td>
                <td><label for="pickuptime">Pickup Time  : <input type="text" id="pickuptime" value="<%=busModel.getDeparture().toLocalTime()%>"></label></td>
            </tr>
            <tr>
                <td><label for="dropoffpoint">DropOff Point  : <input id="dropoffpoint" type="text" value="<%=busModel.getToCity()%>"></label></td>
                <td><label for="dropofftime">DropOff Time  : <input id="dropofftime" type="text" value="<%=busModel.getArrival().toLocalTime()%>"></label></td>
            </tr>
        </table>
        <table id="seatinfotable">
            <tr>
                <td> <label for="buscategory">Bus Category :  <input id="buscategory" type="text" value="<%=busModel.getBusCategory() %>" ></label></td>
                
            </tr>
            <tr>
                <td><label for="availableseat">Available Seat : <input id="availableseat" type="text" value="<%=busModel.getTotalseat()%> "readonly ></label></td>
            </tr>
            <tr>
                <td><label for="noofselectedseat">No OF Seats Selected :  <input id="noofseatsselected" name="noofseats" type="text" readonly ></label></td>
            </tr>
            <tr>
                <td><label for="totalfair">Total Fair : <input id="totalFair" name="totalFair" type="text" readonly ></label></td>
            </tr>
            <tr>
                <td><input id="randomnumber" name="randomnumber" type="text" style="visibility: hidden;" ></td>
            </tr>
         </table>

         <div id="seatcountdiv">
            <label for="seatercount">Select Seater Count</label>
            <select name="seatcount" id="seatcount" >
            <%int totalSeat=busModel.getTotalseat();
            for(int i=1;i<=totalSeat;i++) { %>
                <option  value="<%=i%>"><%=i%></option>
               <%} %>
              </select>
           </div>
           
		<%try{
		if(totalSeat!=0){ %>
         <button id="btn" name="btn" type="submit">BookTicket</button>
         <%} else{ 
         busDao.updateBusStatus("unavailable", busModel.getBusId());
         throw new SeatsUnavailable();
         }
         }
         catch(SeatsUnavailable un){%>
         <p id="seatsunavailable"><%=un.getUnavailableMessage()%></p>
         <%} %>
         
    </div>
    </form>  
        </fieldset>

</body>

<script type="text/javascript">
function check(){
var numberSeats=document.getElementById('noofseatsselected'); 
var price=document.getElementById('totalFair');
var seatcount=document.getElementById('seatcount');
var randomNo=document.getElementById('randomnumber');
var count=seatcount.options[seatcount.selectedIndex].value;

numberSeats.value=count;
price.value=<%=busModel.getSeaterFare()%>*count;

var text = "";
var random = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
for (var i = 0; i < 7; i++)
  text += random.charAt(Math.floor(Math.random() * random.length));
randomNo.value=text;

}
</script>
</html>