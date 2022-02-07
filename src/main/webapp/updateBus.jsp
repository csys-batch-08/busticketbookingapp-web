a<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<link href="css/bootstrap.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
<title>Add Bus</title>
<link rel="stylesheet" href="Assets/css/NavigationAdmin.css">
<link rel="stylesheet" href="Assets/css/busUpdate.css">
 </head>
 
 <body>
     <div id="homeadmin">
       <ul>
            <li><a href="adminHome.jsp">Home</a></li>
            <li><a href="addBus.jsp">Add Bus</a></li>
            <li><a href="addOperator.jsp">Add Operator</a></li>
            <li><a href="BusList">Bus list</a></li>
            <li><a href="OperatorList">Operator list</a></li>
            <li><a href="UserList">User list</a></li>
            <li><a href="BookingList">Booking list</a></li>
            <li><a href="SeatList">Seat list</a></li>
        </ul>
    </div>
        <div id="addbus" class="col-sm-4">
             <div id="headeraddbus"> <label id="bustitle" for="bus">Bus</label> </div>
        
            <form action="updateBusPage">
                <table>
                    <tr>
                        <th><label for="busCategory">Bus Category</label></th>
                        <th><input class="input" name="busCategory" type="text" id="busCategory" pattern="[A-Za-z ]{3,}"  title="please enter correct bus category" placeholder="Enter the category"  autofocus autocomplete="off" required ></th>
                    </tr>
                    <tr>
                <th><label for="fromCity">From City</label></th>
                <th><input class="input" name="fromCity" type="text" id="fromCity" pattern="[A-Za-z]{3,}" title="please enter correct bus category" placeholder="Enter from city" autocomplete="off" required ></th>
            </tr>
            <tr>
                <th><label for="toCity">To City</label></th>
                <th><input class="input" name="toCity" type="text" id="toCity" pattern="[A-Za-z]{3,}" title="please enter correct bus category" placeholder="Enter to city" autocomplete="off" required ></th>
            </tr>
            <tr>
                <th><label for="departure">Departure</label></th>
                <th><input class="input" name="departure" type="datetime-local" id="departure" required></th>
            </tr>
            <tr>
                <th><label for="arrival">Arrival</label></th>
                <th><input class="input" name="arrival" type="datetime-local" id="arrival" required></th>
            </tr>
            <tr>
                <th><label for="seaterFare">Seater Fare</label></th>
                <th><input class="input" name="seaterFare" type="number" id="seaterFare" placeholder="Enter seater fare" required></th>
            </tr>
            <tr>
                <th><label for="totalSeat">Total Seat</label></th>
                <th><input class="input" name="totalSeat" type="number" id="totalSeat" placeholder="Enter total seat" required></th>
            </tr>
			<tr>
                 <th><label for="seatStatus">Status</label></th>
                 <th><input type="radio" id="seatStatus" name="seatStatus" value="available" required ><label for="available"> Available</label> 
                    <input class="input" type="radio" id="seatStatus" value="unavailable" name="seatStatus" required ><label for="unavailable">UnAvailable</label></th>
             </tr>
        </table>

        <div id="btn"><br>
            <button id="btnsubmit" type="submit">Submit</button>
            <button id="btnreset" type="reset">Reset</button>
        </div>
                </form>
                </div>
     <div id="addbus2" class="col-sm-4">
          <div id="headeraddbus2"> <label id="bustitle" for="bus">Bus</label> </div>
        <form action="busAndOperatorPage">
            <table>
                <tr>
                    <th><label for="busno">Bus No</label></th>
                    <th><input class="input" name="busNo" type="text" id="busno" pattern="[0-9]{4}" title="only numbers are allowed with 4 digit " placeholder="Enter Bus No"   ></th>
                </tr>
                <tr>
                    <th><label for="operatorId">Operator ID</label></th>
                    <th><input class="input" name="operatorId" type="text" id="operatorId" pattern="[0-9]" title="only numbers are allowed"  placeholder="Enter operator Id" ></th>
                </tr>
            </table>
            <div id="btn"><br>
                <button id="btnsubmit" type="submit">Submit</button>
            	<button id="btnreset" type="reset">Reset</button>
            </div>
            </form>
            </div>

     <script type="text/javascript">
     	<c:set var="busModel" scope="session" value="${BusObject}"></c:set>
     	document.getElementById("busno").value=`${busModel.getBusNo()}`;
     	document.getElementById("operatorId").value=`${busModel.getOperatorId()}`;
     	document.getElementById("busCategory").value=`${busModel.getBusCategory()}`;
     	document.getElementById("fromCity").value=`${busModel.getFromCity()}`;
     	document.getElementById("toCity").value=`${busModel.getToCity()}`;
     	document.getElementById("departure").value=`${busModel.getDeparture()}`;
     	document.getElementById("arrival").value=`${busModel.getArrival()}`; 
     	document.getElementById("seaterFare").value=`${busModel.getSeaterFare()}`;
     	document.getElementById("totalSeat").value=`${busModel.getTotalseat()}`;
     	document.getElementById("seatStatus").value=`${busModel.getSeatStatus()}`;
     </script>
</body>
</html>