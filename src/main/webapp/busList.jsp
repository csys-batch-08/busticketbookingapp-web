<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<link href="css/bootstrap.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
<title>Bus List</title>
<link rel="stylesheet" href="css/AdminNavigation.css">

<style>
#buslistdiv table tr th {
        background: #79a6dd;
    color: aliceblue;
}


#buslistdiv table tr:hover {
    background: #e7e7e7;
}
        #buslistfieldset table{
        border-collapse: collapse;
        }
        #buslistdiv table tr th,td {
            padding: 20px;
            text-align: center;
            border: 1px solid black;
            border-collapse: collapse;
         }
        #buslistfieldset{
            margin-top: 110px;
            
        }
        #buslistdiv{
            margin-top: 20px;
        }
        #buslistfieldset legend{
            font-size: 30px;
            font-weight:bold;
            text-align: center;
        }
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
    
        <fieldset id="buslistfieldset">
            <legend>Bus Details</legend>
        <div id="buslistdiv">
            <table>
                <tr>
                    <th>Bus Id</th>
                    <th>Bus No</th>
                    <th>Operator Id</th>
                    <th>Bus Type</th>
                    <th>From City</th>
                    <th>To City</th>
                    <th>Departure</th>
                    <th>Arrival</th>
                    <th>Seater Fare</th>
                    <th>Total Seat</th>
                    <th>Seat Status</th>
                    <th>Edit</th>
                </tr>
                <c:forEach items="${BusListAdmin}" var="bus">
                
                <tr>
                    <td>${bus.getBusId() }</td>
                    <td>${bus.getBusNo() }</td>
                    <td>${bus.getOperatorId() }</td>
                    <td>${bus.getBusCategory() }</td>
                    <td>${bus.getFromCity() }</td>
                    <td>${bus.getToCity() }</td>
                    
                    <fmt:parseDate value="${bus.getDeparture()}"
							pattern="yyyy-MM-dd'T'HH:mm" var="depature" type="both" />
					<td><fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${depature}" /></td>
                            
                    <fmt:parseDate value="${bus.getArrival() }" 
                    		pattern="yyyy-MM-dd'T'HH:mm" var="arrival" type="both" />
                    <td><fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${arrival }" /></td>
                    
                    <td>${bus.getSeaterFare() }</td>
                    <td>${bus.getTotalseat() }</td>
                    <td>${bus.getSeatStatus() }</td>
                    <td><a href="BusUpdate?busId=${bus.getBusId()}">Edit</a></td>
                </tr>
                </c:forEach>
            </table>
      </div>
    </fieldset>
    </body>

</html>