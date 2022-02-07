<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Booking</title>
<link rel="stylesheet" href="Assets/css/seatBooking.css">
    
</head>
<body onmouseover="check()"> 					
    <fieldset>
        <legend>Booking Form</legend>    
        <div id="bookingdiv">
         <form  action="confirmBooking" method="post" >
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
           		<c:if test="${CurrentBusObject.getTotalseat()>0 }">
           		<button id="btn" name="btn" type="submit">BookTicket</button></c:if>   		
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