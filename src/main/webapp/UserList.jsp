<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.busticketbooking.daoimpl.UserDaoImpl" %>
    <%@page import="java.sql.ResultSet" %>
    
    <%
        UserDaoImpl userDao=new UserDaoImpl(); 
            ResultSet rs=userDao.viewUserDetails();
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
                margin-left: 150px;
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
            <li><a href="BusList.jsp">Bus list</a></li>
            <li><a href="OperatorList.jsp?opertorId=0">Operator list</a></li>
            <li><a href="UserList.jsp">User list</a></li>
            <li><a href="BookingList.jsp">Booking list</a></li>
            <li><a href="SeatList.jsp">Seat list</a></li>
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
                    <th>Status</th>
                </tr>
              <% while(rs.next()){ %>
                <tr>
                    <td><%=rs.getInt(1) %></td>
                    <td><%=rs.getString(2) %></td>
                    <td><%=rs.getDate(3)%></td>
                    <td><%=rs.getString(4) %></td>
                    <td><%=rs.getLong(5) %></td>
                    <td><%=rs.getString(6) %></td>
                    <td><%=rs.getString(7) %></td>
                    <td><%=rs.getDouble(8) %></td>
                    <td><%=rs.getString(9) %></td>
                </tr>
                <%} %>
            </table>
      </div>
    </fieldset>
    
</body>
</html>