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

<link rel="stylesheet" type="text/css"
href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css">
<script
src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript"
src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<title>Seat List</title>
<link rel="stylesheet" href="css/AdminNavigation.css">


<style>


 /*  #seatlistdiv table tr th {
        background: #79a6dd;
    color: aliceblue;
}
#seatlistdiv table tr:hover {
    background: #e7e7e7;
}
#seatlistfieldset table{
        border-collapse: collapse;
        }
        #seatlistdiv table tr th,td {
            padding: 20px;
            text-align: center;
            border: 1px solid black;
            border-collapse: collapse;
         }
         
       #seatlistfieldset{
            margin-top: 107px;
        }
       #seatlistdiv{
            margin-top: 20px;
                margin-left: 380px;
        }
        #seatlistfieldset legend{
           font-size: 30px;
            font-weight:bold;
            text-align: center;
        } */
     </style>
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

        <fieldset id="seatlistfieldset">
            <legend>Seat_Details</legend>
        <div id="seatlistdiv">
            <table id="table_id">
            
                <thead>
                    <th>Ticket_No</th>
                    <th>User_Id</th>
                    <th>Bus_Id</th>
                    <th>Seat_No</th>
                    <th>Seat_Status</th>
                </thead>
                
                <tbody>
                 <c:forEach items="${SeatList}" var="seatlist">
                <tr>
                    <td>${seatlist.getBookedTickets().getTicketNo() }</td>
                    <td>${seatlist.getBookedTickets().getUserModel().getUserId()}</td>
                    <td>${seatlist.getBookedTickets().getBusModel().getBusId() }</td>
                    <td>${seatlist.getSeatNo() }</td>
                    <td>${seatlist.getStatus() }</td>
                </tr>
                 </c:forEach>
                </tbody>
            </table>
      </div>
    </fieldset>

	<script type="text/javascript">
	$(document).ready(function() {
		$('#table_id').DataTable();
		});
	</script>
     
 </body>
 </html>