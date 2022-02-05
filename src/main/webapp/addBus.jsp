<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<link href="css/bootstrap.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>

<script
src="https://cdn.jsdelivr.net/npm/sweetalert2@11.3.10/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet'
href='https://cdn.jsdelivr.net/npm/sweetalert2@10.10.1/dist/sweetalert2.min.css'>

<title>Add Bus</title>
<link rel="stylesheet" href="css/NavigationAdmin.css">
<link rel="stylesheet" href="css/AdminAddBus.css">

<style>
        
    </style>
</head>
<body>

	<c:if test="${param.infomsg!=null}">
        <script>
		Swal.fire({
 		icon: 'success',
 		title: 'Added successfully',
 		showConfirmButton: false,
 		timer: 1500})
	</script>
	</c:if>
	
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

	<form action="addbus">
    
    <div id="addbus" class="col-sm-4">
    <div id="headeraddbus"> <label id="bustitle" for="bus">Bus</label> </div>
        <table>
            <tr>
                <th><label for="busCategory">Bus Category</label></th>
                <th><input name="busCategory" type="text" id="busCategory" pattern="[A-Za-z ]{3,}" title="please enter correct bus category" placeholder="Enter the category"  autofocus  required ></th>
            </tr>
            <tr>
                <th><label for="fromCity">From City</label></th>
                <th><input name="fromCity" type="text" id="fromCity" pattern="[A-Za-z]{3,}" title="please enter correct bus category" placeholder="Enter from city" required ></th>
            </tr>
            <tr>
                <th><label for="toCity">To City</label></th>
                <th><input name="toCity" type="text" id="toCity" pattern="[A-Za-z]{3,}" title="please enter correct bus category" placeholder="Enter to city"  required ></th>
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
    </div>
    </form>

 
   
</body>

<script type="text/javascript">
      
    today();
    function today(){
        var today = new Date();
        var dd = String(today.getDate()).padStart(2, '0');
        var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
        var yyyy = today.getFullYear();
        var yyyy1= today.getFullYear()+10;
    maxdate =yyyy1 + '-' + mm + '-'+ dd +'-' + HH +'-'+ mm  ;
    mindate =yyyy + '-' + mm + '-'+ dd +'-' + HH +'-'+ mm  ;
    
    document.getElementById("departure").setAttribute("max",maxdate);
    
    document.getElementById("departure").setAttribute("min",mindate);
    
    /* document.getElementById("arrival").setAttribute("max",maxdate);
    document.getElementById("arrival").setAttribute("min",mindate); */
    }
    </script>
</html>