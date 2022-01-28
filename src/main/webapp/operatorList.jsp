<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<link href="css/bootstrap.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
<title>Operator List</title>
<link rel="stylesheet" href="css/AdminNavigation.css">
<style>
    
        #operatorlistdiv table tr th {
             background: #79a6dd;
    color: aliceblue;
         }
         #operatorlistdiv table tr:hover {
    background: #e7e7e7;
}
#operatorlistfieldset table{
        border-collapse: collapse;
        }
        #operatorlistdiv table tr th,td {
            padding: 20px;
            text-align: center;
            border: 1px solid black;
            border-collapse: collapse;
         }
        #operatorlistfieldset{
             margin-top: 110px;
        }
        #operatorlistdiv{
            margin-top: 20px;
                margin-left: 140px;
        }
        #operatorlistfieldset legend{
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

    <fieldset id="operatorlistfieldset">
        <legend>Operator_Details</legend>
    <div id="operatorlistdiv">
        <table>
            <tr>
                <th>Operator Id</th>
                <th>Operator Name</th>
                <th>Operator Email</th>
                <th>Operator Contact</th>
                <th>Operator Age</th>
                <th>Operator Status</th>
                <th>edit and delete</th>
            </tr>
           <c:forEach items="${OperatorListAdmin}" var="operator">
                <tr>
                    <td>${operator.getOperatorId() }</td>
                    <td>${operator.getOperatorName() }</td>
                    <td>${operator.getOperatorEmail() }</td>
                    <td>${operator.getOperatorContact() }</td>
                    <td>${operator.getOperatorAge() }</td>
                    <td>${operator.getOperatorStatus() }</td>
                    
                    <c:if test="${operator.getOperatorStatus().equals('active') }">
                    <td><a href="OperatorUpdate?operatorId=${operator.getOperatorId()}">edit</a> / <a href="operatorDelete?operatorId=${operator.getOperatorId()}">delete</a></td>
                    </c:if>
                    
           			<c:if test="${operator.getOperatorStatus().equals('inactive') }">
           			<td></td>
           		    </c:if>
                </tr>
                </c:forEach>
        
        </table>
  </div>
  
</fieldset>


</body>
</html>