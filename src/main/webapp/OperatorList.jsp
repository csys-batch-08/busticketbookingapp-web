<%@page import="java.util.ArrayList"%>
<%@page import="com.busticketbooking.model.Operator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.busticketbooking.daoimpl.OperatorDaoImpl" %>
    <%@page import="java.sql.ResultSet" %>
    <%
    List<Operator> operatorList=new ArrayList<Operator>();
    OperatorDaoImpl operatorDao=new OperatorDaoImpl();
    operatorList=operatorDao.viewOperator();
        int opertorId=Integer.parseInt(request.getParameter("opertorId"));
        operatorDao.deleteOperator(opertorId);
    %>
   
<!DOCTYPE html>
<html>
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
	<%if(opertorId>0){ %>
	<script type="text/javascript">
		alert("Operator deleted Successfully");
		</script>
		<%} %>
		
	<% String sessionName=(String)session.getAttribute("AdminHome");
	//System.out.println(sessionName);
	if(sessionName.equals("UpdateOperatorSession")){
		session.setAttribute("AdminHome", "HomeSession");
	%>
		<script type="text/javascript">
		alert("Operator Updated Successfully");
		</script>
	<%}%>
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
                <th>edit&delete</th>
            </tr>
           <%for(Operator operator:operatorList){%>
                <tr>
                    <td><%=operator.getOperatorId() %></td>
                    <td><%=operator.getOperatorName() %></td>
                    <td><%=operator.getOperatorEmail() %></td>
                    <td><%=operator.getOperatorContact() %></td>
                    <td><%=operator.getOperatorAge() %></td>
                    <td><%=operator.getOperatorStatus() %>
                    <td><a href="UpdateOperator.jsp?operatorId=<%=operator.getOperatorId()%>">edit</a> / <a href="OperatorList.jsp?opertorId=<%=operator.getOperatorId()%>">delete</a></td>
                </tr>
                <% } %>
        
        </table>
  </div>
  
</fieldset>


</body>
</html>