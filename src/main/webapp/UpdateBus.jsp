<%@page import="com.busticketbooking.model.Bus"%>
<%@page import="com.busticketbooking.daoimpl.BusDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/bootstrap.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
<title>Add Bus</title>
<link rel="stylesheet" href="css/AdminNavigation.css">
<style>
    
     #bustitle{
                padding: 0px;
    font-size: 30px;
    font-weight:bold;
     text-align: center;
        }
            #headeraddbus {
    padding: 0px;
    box-shadow: 0px 0px 10px 0px #c7c7c7;
    text-align: center;
        }
        #headeraddbus,#addbus{
                margin: 0px auto;
        }
      /*   #headeraddbus{
             border: 1px solid black;
             height: 40px;
             background-color: rgb(200, 210, 238);
             margin-top:20px;
             padding: 10px;
             text-align: center;
             font-size: larger;
         } */
         #headeraddbus2{
             padding: 0px;
    box-shadow: 0px 0px 10px 0px #c7c7c7;
    text-align: center;
         }
         
         /* #headeraddbus,#addbus{
             width: 430px;
             margin-left: 120px;
         } */
         
         #headeraddbus2,#addbus2{
            margin: 0px auto;
         }
         #addbus{
         position:absolute;
              padding: 15px;
    box-shadow: 0px 0px 10px 0px #c7c7c7;
    border: none;
    margin: 10px auto;
    margin-left: 70px;
    margin-top: 130px;
         }
         #addbus2{
         position:absolute;
              padding: 15px;
    box-shadow: 0px 0px 10px 0px #c7c7c7;
    border: none;
    margin: 10px auto;
        margin-left: 750px;
    margin-top: 235px;
         }

         #addbus table tr th,td{
            padding: 7px 0px;
    margin: 14px auto;
         }
         #addbus2 table tr th,td{
            padding: 7px 0px;
    margin: 14px auto;
         }
         #addbus label {
        display: inline-block;
    padding: 0px 7px;
}
#addbus table,#addbus2 table{
margin-top:20px;
margin-left:20px;
}
        /*  input{
             height: 25px;
             width: 200px;
         } */
         #seatStatus{
            height: 13px;
        }
          #btn button {
    height: 35px;
    width: 100px;
    outline: none;
    border: none;
    box-shadow: 0px 0px 10px 0px #c7c7c7;
    background: none;
    margin: 0px 20px;
}
        #btn{
            text-align:center
        }
        #btnsubmit:hover{
                background-color: #008000c9;
                color:white;
        }
        #btnreset:hover{
        	background-color: red;
                color:white;
        } 
        
     </style>
 </head>
 <body>
 
     <div id="homeadmin">
       <ul>
            <li><a href="AdminHome.jsp">Home</a></li>
            <li><a href="AddBus.jsp">Add Bus</a></li>
            <li><a href="AddOperator.jsp">Add Operator</a></li>
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
                    <!-- pattern="[A-Za-z]{3,}" -->
                        <th><label for="busCategory">Bus Category</label></th>
                        <th><input name="busCategory" type="text" id="busCategory"  title="please enter correct bus category" placeholder="Enter the category"  autofocus autocomplete="off" required ></th>
                    </tr>
                    <tr>
                <th><label for="fromCity">From City</label></th>
                <th><input name="fromCity" type="text" id="fromCity" pattern="[A-Za-z]{3,}" title="please enter correct bus category" placeholder="Enter from city" autocomplete="off" required ></th>
            </tr>
            <tr>
                <th><label for="toCity">To City</label></th>
                <th><input name="toCity" type="text" id="toCity" pattern="[A-Za-z]{3,}" title="please enter correct bus category" placeholder="Enter to city" autocomplete="off" required ></th>
            </tr>
            <tr>
                <th><label for="departure">Departure</label></th>
                <th><input name="departure" type="datetime-local" id="departure" required></th>
            </tr>
            <tr>
                <th><label for="arrival">Arrival</label></th>
                <th><input name="arrival" type="datetime-local" id="arrival" required></th>
            </tr>
            <tr>
                <th><label for="seaterFare">Seater Fare</label></th>
                <th><input name="seaterFare" type="number" id="seaterFare" placeholder="Enter seater fare" required></th>
            </tr>
            <tr>
                <th><label for="totalSeat">Total Seat</label></th>
                <th><input name="totalSeat" type="number" id="totalSeat" placeholder="Enter total seat" required></th>
            </tr>
			<tr>
                 <th><label for="seatStatus">Status</label></th>
                 <th><input type="radio" id="seatStatus" name="seatStatus" value="available" required ><label for="available"> Available</label> 
                    <input type="radio" id="seatStatus" value="unavailable" name="seatStatus" required ><label for="unavailable">UnAvailable</label></th>
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
                    <th><input name="busNo" type="text" id="busno" pattern="[0-9]{4}" title="only numbers are allowed with 4 digit " placeholder="Enter Bus No"   ></th>
                </tr>
                <tr>
                    <th><label for="operatorId">Operator ID</label></th>
                    <th><input name="operatorId" type="text" id="operatorId" pattern="[0-9]" title="only numbers are allowed"  placeholder="Enter operator Id" ></th>
                </tr>
            </table>
            <div id="btn"><br>
                <button id="btnsubmit" type="submit">Submit</button>
            	<button id="btnreset" type="reset">Reset</button>
            </div>
            </form>
            </div>

     <script type="text/javascript">
     	<% 
         Bus busModel=(Bus) session.getAttribute("BusObject");
     	%> 
     	document.getElementById("busno").value="<%=busModel.getBusNo()%>";
     	document.getElementById("operatorId").value="<%=busModel.getOperatorId()%>";
     	document.getElementById("busCategory").value="<%=busModel.getBusCategory()%>";
     	document.getElementById("fromCity").value="<%=busModel.getFromCity()%>";
     	document.getElementById("toCity").value="<%=busModel.getToCity()%>";
     	document.getElementById("departure").value="<%=busModel.getDeparture()%>";
     	document.getElementById("arrival").value="<%=busModel.getArrival()%>";
     	document.getElementById("seaterFare").value="<%=busModel.getSeaterFare()%>";
     	document.getElementById("totalSeat").value="<%=busModel.getTotalseat()%>";
     	document.getElementById("seatStatus").value="<%=busModel.getSeatStatus()%>";
     </script>
</body>
</html>