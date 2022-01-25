<%@page import="com.busticketbooking.model.Operator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="com.busticketbooking.daoimpl.*" %>
    <%@page import="java.sql.ResultSet" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/bootstrap.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
<title>Add Operator</title>
<link rel="stylesheet" href="css/AdminNavigation.css">
<style>
     #addOperator label {
        display: inline-block;
    padding: 0px 7px;
}
        #headeraddoperator{
             padding: 0px;
    box-shadow: 0px 0px 10px 0px #c7c7c7;
    text-align: center;
         }
         #headeraddoperator,#addOperator{
             margin: 0px auto;
         }
         #operatortitle{
              padding: 0px;
    font-size: 30px;
    font-weight:bold;
     text-align: center;
         }
         #addOperator{
              padding: 17px;
    box-shadow: 0px 0px 10px 0px #c7c7c7;
    border: none;
    margin: 140px auto;
            
         }
         #addOperator table tr td,th{
              padding: 7px 0px;
    margin: 14px auto;
         }
         #addOperator table {
         margin-top:20px;
         text-align:center;
         }
         /* input{
             height: 25px;
         } */
          #btn button{
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
    

<form action="UpdateOperatorjsp">
     <div id="addOperator" class="col-sm-4">
     <div id="headeraddoperator"> <label id="operatortitle" for="operatortitle">Operator</label> </div>
     
         <table >
             <tr>
                <th><label for="operatorName">Operator Name</label></th>
                <th><input name="operatorName" type="text" id="operatorName" pattern="[aA-zZ]{4,}" title="Min 4 characters...Numbers and symbols are not allowed" required autofocus autocomplete="off"></th>
            </tr>
            <tr>
                <th><label for="operatorEmail">Operator Email</label></th>
                <th><input name="operatorEmail" type="email" id="operatorEmail" autocomplete="off" pattern="[A-Za-z0-9]+[@][a-zA-Z]+[.][A-Za-z]{2,3}" placeholder="eg.abc@gmail.com" required ></th>
            </tr>
            <tr>
                <th><label for="operatorContact">Operator Contact</label></th>
                <th><input name="operatorContact" type="text" id="operatorContact" pattern="[6-9][0-9]{9}" title="Must contain 10 numbers only" autocomplete="off" required></th>
            </tr>
            <tr>
                <th><label for="operatorAge">Operator Age</label></th>
                <th><input name="operatorAge" type="text" id="operatorAge" pattern="[0-9]{2}" title="please enter correct age" required></th>
            </tr>
            
      </table>
         <div id="btn"><br>
             <button id="btnsubmit" type="submit">Submit</button>
             <button id="btnreset" type="reset">Reset</button>
         </div>
     </div>
     </form>
     
     <script type="text/javascript">
     	<% 
         Operator operatorModel=(Operator) session.getAttribute("OperatorObject");
     	%> 
     	document.getElementById("operatorName").value="<%=operatorModel.getOperatorName()%>";
     	document.getElementById("operatorEmail").value="<%=operatorModel.getOperatorEmail()%>";
     	document.getElementById("operatorContact").value="<%=operatorModel.getOperatorContact()%>";
     	document.getElementById("operatorAge").value="<%=operatorModel.getOperatorAge()%>";
     </script>

</body>
</html>