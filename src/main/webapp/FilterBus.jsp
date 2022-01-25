<%@page import="java.util.ArrayList"%>
<%@page import="com.busticketbooking.model.Bus"%>
<%@page import="java.util.List"%>
<%@page import="com.busticketbooking.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.busticketbooking.daoimpl.BusDaoImpl" %>
    <%@page import="java.sql.ResultSet" %>
    <%@page import="java.time.LocalDate" %>
    <%@page import="java.time.format.DateTimeFormatter" %>
     <%User userModel=(User)session.getAttribute("userModel");
       List<Bus> busFilterList=(List<Bus>)session.getAttribute("BusList");%>
    <%
    DateTimeFormatter formatTime = DateTimeFormatter.ofPattern("HH:mm");
    DateTimeFormatter formatDate = DateTimeFormatter.ofPattern("dd-mm-yyyy");  
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bus Hub</title>
<style>
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
         }
         legend{
             border: 1px solid black;
             height: 33px;
             width: 170px;
             padding: 5px;
             border-radius: 10px;
             background-color: rgb(224, 209, 209);
         }
         legend h3{
             margin-left: 7px;
         }
         table,tr,th,td{
             text-align: center; 
             border: 1px solid black;
             width: 1200px;
             height: 60px;
             border: none;
             margin-left: 15px;
         }
         th{
             background-color: rgb(184, 71, 71);
             color: white;
         }
         #outerlinetable{
             border: 1px solid rgb(32, 32, 32);
             padding: 20px;
         }
         #fieldsettable{
             padding: 40px;
             margin-left: 2px;
             
         }
         #forcontent{
            border: 1px solid rgb(32, 32, 32);
             padding: 20px;
             border-bottom: none;
             border-radius: 10px 10px 0px 0px;
             height: 20px;
             background-color: rgb(138, 93, 93);
             color: white;
             margin-top: -15px;
         }
         #forcontent ul li{
            padding: 3px;
         }
         #forcontentinlist{
             padding: 0px;
             list-style: none;
             display: flex;
             margin-top: -8px;
         }
         #backlink{
            color: black;
            border: 1px solid black;
            background-color: rgb(188, 187, 247);
            border: none;
            padding: 6px;
            height: 30px;
            width: 150px;
            margin-left: 615px;
            border-radius: 5px;
         }
         #busId{
             height: 35px;
             width: 55px;
             outline: none;
             border: none;
             cursor: pointer;
             font-size: 15px;
             border-radius: 5px;
         }
         a{
             text-decoration: none;
         }
         #busId:hover{
            background-color: green;
            color:white;
         }
        </style>
    </head>
    <body>
    <form action="SeatBooking">
        <div>
            <fieldset id="fieldsettable">
                <legend><h3>Available Buses</h3></legend>
            
            	<%for(Bus busList:busFilterList){%>
            	
                <div id="forcontent">
                      <ul id="forcontentinlist">
                        <li><h4><%=busList.getFromCity() %></h4></li>
                        <li><p>to</p></li>
                        <li><h4><%=busList.getToCity() %></h4></li>
                        <li><p>Journey Date :</p></li>
                        <li><h4><%=busList.getDeparture().toLocalDate() %></h4></li>
                    </ul>
                </div>
                <div id="outerlinetable">
                    <table>
                        <tr>
                            <th>Type</th>	
                            <th>Start Point</th>
                            <th>Destination</th>
                            <th>Departure.time(at passenger start point)</th>
                            <th>Arrival.time(at passenger end point)</th>
                            <th>Seater Fare</th>
                            <th>Select Service</th>
                        </tr>
                        
                        <tr>
                            <td><%=busList.getBusCategory() %></td>
                            <td><%=busList.getFromCity() %></td>
                            <td><%=busList.getToCity() %></td>
                            <td><%=busList.getDeparture().toLocalTime().format(formatTime)%></td>
                            <td><%=busList.getArrival().toLocalTime().format(formatTime)%></td>
                            <td><%=busList.getSeaterFare() %></td>
                            <%if(userModel!=null){ %>
                            <td><button id="busId" name="busIdValue" value="<%=busList.getBusId()%>">BOOK</button></td>
                            <%} %>
                            
                        </tr>
                        <% } %>
                    </table>
                </div>
             
            </fieldset>
            <%if(userModel!=null){ %>
            <a href="SearchBus.jsp" id="backlink">GO BACK TO HOME</a>
            <%} else{%>
            <script type="text/javascript">
            	alert("please log in for booking...");
            </script>
            <a href="index.jsp" id="backlink">GO BACK TO HOME</a>
            <%} %>
        </div>
         </form>
    </body>
    </html>