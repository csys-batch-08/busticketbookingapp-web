<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
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
        
        <div id="bookingdiv">
         <form  action="confirmBooking"  >
        <table id="seatbookingtable">
       
            <tr>
                <td><label for="pickuppoint">Pickup Point : <input type="text" id="pickuppoint" value="${CurrentBusObject.getFromCity()}"></label></td>
                <td><label for="pickuptime">Pickup Time  : <input type="text" id="pickuptime" value="${CurrentBusObject.getDeparture().toLocalTime()}"></label></td>
            </tr>
            <tr>
                <td><label for="dropoffpoint">DropOff Point  : <input id="dropoffpoint" type="text" value="${CurrentBusObject.getToCity()}"></label></td>
                <td><label for="dropofftime">DropOff Time  : <input id="dropofftime" type="text" value="${CurrentBusObject.getArrival().toLocalTime()}"></label></td>
            </tr>
        </table>
        <table id="seatinfotable">
            <tr>
                <td> <label for="buscategory">Bus Category :  <input id="buscategory" type="text" value="${CurrentBusObject.getBusCategory() }" ></label></td>
                
            </tr>
            <tr>
                <td><label for="availableseat">Available Seat : <input id="availableseat" type="text" value="${CurrentBusObject.getTotalseat()}"readonly ></label></td>
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
            <c:forEach begin="1" end="${CurrentBusObject.getTotalseat() }" var="count">
                <option  value="${count }">${count }</option>
              </c:forEach>
              </select>
           </div> 
                      
                 <%-- <jsp:useBean id="busDao" class="com.busticketbooking.daoimpl.BusDaoImpl"/> --%>
                      
           		<c:if test="${CurrentBusObject.getTotalseat()>0 }">
           		<button id="btn" name="btn" type="submit">BookTicket</button></c:if>
           		
           	<c:if test="${CurrentBusObject.getTotalseat()==0 }">
           		 <%-- ${busDao.updateBusStatus("unavailable", CurrentBusObject.getBusId()) } --%>
           		<p id="seatsunavailable">Seats are Unavailable</p></c:if>
           
         </form>  
    </div>
    
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
price.value=`${CurrentBusObject.getSeaterFare()}`*count;

var text = "";
var random = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
for (var i = 0; i < 7; i++)
  text += random.charAt(Math.floor(Math.random() * random.length));
randomNo.value=text;

}
</script>
</html>