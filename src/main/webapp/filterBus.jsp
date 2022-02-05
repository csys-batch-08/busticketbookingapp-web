<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<script
src="https://cdn.jsdelivr.net/npm/sweetalert2@11.3.10/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet'
href='https://cdn.jsdelivr.net/npm/sweetalert2@10.10.1/dist/sweetalert2.min.css'>
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
             font-size:20px;
             text-align:-webkit-center;
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
    
     <c:if test="${param.seatstatus!=null}">
	<script type="text/javascript"> 
	 Swal.fire({
		title: "Oops!",
		text: "Seats are unavailable",
	    position: "center",
	    /* background: "linear-gradient(red, brown)", 
	    color: "white",*/
	    allowOutsideClick: false,
	    allowEscapeKey: false,
	    allowEnterKey: false,
	    showConfirmButton: false,
	    showCancelButton: false,
	    timer: 3000
	  });
	</script>
	</c:if>
	
     <c:set var="busList" scope="session" value="${BusList}"></c:set>
     <c:set var="fromLocation" scope="session" value="${FromLocation}"></c:set>
     <c:set var="toLocation" scope="session" value="${ToLocation}"></c:set>
     <c:set var="date" scope="session" value="${Date}"></c:set>
     <c:set var="UserSession" scope="session" value="${userModel}"></c:set>
    
    <form action="SeatBooking" method="post">
        <div>
            <fieldset id="fieldsettable">
                <legend>Available Buses</legend>
            
            	
            	
                <div id="forcontent">
                      <ul id="forcontentinlist">
                      <c:set var = "from" value = "${fn:toUpperCase(fromLocation )}" />
                        <li><h4>${from}</h4></li>
                        <li><p>to</p></li>
                        <c:set var = "to" value = "${fn:toUpperCase(toLocation )}" />
                        <li><h4>${to}</h4></li>
                        <li><p>Journey Date :</p></li>
                        <fmt:parseDate value="${date}"
							pattern="yyyy-mm-dd" var="dateDeparture" type="both" />
                        <li><h4><fmt:formatDate pattern="dd-mm-yyyy" value="${dateDeparture}" /></h4></li>
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
                        <c:forEach items="${busList}" var="busList">
                        <tr>
                            <td>${busList.getBusCategory() }</td>
                            <td>${busList.getFromCity()}</td>
                            <td>${busList.getToCity()}</td>
                            
                           <fmt:parseDate value="${busList.getDeparture()}"
							pattern="yyyy-MM-dd'T'HH:mm" var="DepatureTime" type="both" />
                            <td><fmt:formatDate pattern="HH:mm" value="${DepatureTime}" /></td>
                            
                            <fmt:parseDate value="${busList.getArrival()}"
							pattern="yyyy-MM-dd'T'HH:mm" var="ArrivalTime" type="both" />
                            <td><fmt:formatDate pattern="HH:mm" value="${ArrivalTime}" /></td>
                            
                            <td>${busList.getSeaterFare()}</td>
                            <c:if test="${UserSession!=null }"> 
                            <td><button id="busId" name="busIdValue" value="${busList.getBusId()}">BOOK</button></td>
                            </c:if>
                        </tr>
                    
            			 </c:forEach>
                    </table>
                </div>
               
            </fieldset>
            <c:if test="${UserSession!=null }"> 
            <a href="SearchBus" id="backlink">GO BACK TO HOME</a>
            </c:if>
            <c:if test="${UserSession==null }"> 
            <script type="text/javascript">
            	alert("please log in for booking...");
            </script>
            <a href="index.jsp" id="backlink">GO BACK TO HOME</a>
            </c:if>
        </div>
         </form>
    </body>
    </html>