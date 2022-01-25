<%@page import="com.busticketbooking.model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.busticketbooking.daoimpl.UserDaoImpl" %>
    <%@page import="java.sql.ResultSet" %>
    
    <%  List<User> userList = (List<User>)session.getAttribute("UserList");
        %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/bootstrap.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
<title>User Lists</title>
<link rel="stylesheet" href="css/AdminNavigation.css">

 <style>
 #userlistdiv table tr th {
        background: #79a6dd;
    color: aliceblue;
}
#userlistdiv table tr:hover {
    background: #e7e7e7;
}
#userlistfieldset table{
        border-collapse: collapse;
        }
            #userlistdiv table tr th,td {
                padding: 20px;
            text-align: center;
            border: 1px solid black;
            border-collapse: collapse;
             }
            #userlistfieldset{
               margin-top: 110px;
            }
            #userlistdiv{
                margin-top: 20px;
                margin-left: 210px;
            }
            #userlistfieldset legend{
                font-size: 30px;
            font-weight:bold;
            text-align: center;
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
        <fieldset id="userlistfieldset">
            <legend>User Details</legend>
        <div id="userlistdiv">
            <table>
                <tr>
                    <th>User Id</th>
                    <th>Name</th>
                    <th>DateOfBirth</th>
                    <th>Email</th>
                    <th>Contact</th>
                    <th>Gender</th>
                    <th>Password</th>
                    <th>Wallet</th>
                </tr>
              <%for(User user:userList){%>
                <tr>
                    <td><%=user.getUserId() %></td>
                    <td><%=user.getUserName() %></td>
                    <td><%=user.getUserDOB() %></td>
                    <td><%=user.getUserEmail() %></td>
                    <td><%=user.getUserContact() %></td>
                    <td><%=user.getUserGender() %></td>
                    <td><%=user.getUserPassword() %></td>
                    <td><%=user.getUserWallet() %></td>
                </tr>
                <%} %>
            </table>
      </div>
    </fieldset>
    
</body>
</html>