<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Bus Hub</title>	

<!-- <link rel="stylesheet" href="css/UserNavigationIndex.css"> -->
<style type="text/css">

*{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, Helvetica, sans-serif;
        }
        .fromto span {
    margin-bottom: -16px;
    display: block;
        font-size: 25px;
}
        body{
            background: color("#D4EFDF");
            background-size: cover;
            background-repeat: no-repeat;
            height: 100vh;
        }
        #nav ul {
    		display: flex;
    		justify-content: space-between;
    		padding: 26px;
		}
		#nav li {
    		display: inline-block;
		}
         #buslogo{
            font-style: italic;
            font-family: cursive;
            font-size: 23px; 
            color: rgb(95, 95, 224);
        }
        #nav ul li a:hover {
        background-color: #4eaad9;
    color: white;
    padding: 12px;
    border-radius: 10px;
}
        #nav{
            background: white;
    		width: 100%;
    		top: 0;
    		box-shadow: 0px 0px 9px 0px black;
        }
        #nav a{
            text-decoration: none;
            font-size: 20px;
        }
       
        #searchlocation input{
            height: 30px;
            width: 220px;
            border-top: none;
            border-left: none;
            border-right: none;
            outline: none;
        }
         .inputtype {
    		font-size: 20px;
    		background-color: white;
    		padding: 15px 20px;
    		border-radius: 5px;
    		margin-top: 10px;
		} 
       
        
        #searchlocation table, tr, td {
    		box-shadow: -8px 4px 20px 0px #4283af52;
    		padding: 0px;
    		border-spacing: 0px;
    		margin: auto;
		}
        #searchlocation {
    		padding: 40px;
    		border: 1px solid black;
    		border-radius: 15px;
    		height: 247px;
    		width: 1030px;
    		margin-left: 150px;
    		margin-top: 140px;
    		background: linear-gradient(45deg, #0aacf9, #1197e566);
    		Border: none;
	}
	.fromto {
    		width: 300px;
   			 font-size: 20px;
    		padding: 20px;
    		margin-top: 0px;
    		text-align: center;
	}
       #searchbutton {
    		height: 50px;
    		width: 200px;
    		margin-top: 70px;
    		margin-left: 360px;
    		color: black;
    		background-color: rgb(255 255 255);
    		border: none;
    		border-radius: 10px;
    		cursor: pointer;
    		box-shadow: 0px 0px 5px 0px black;
	}
        
       
</style>
</head>
<body>

	<jsp:useBean id="busDao" class="com.busticketbooking.daoimpl.BusDaoImpl"/>
	<c:set var="locationList" scope="session" value="${busDao.getLocations()}"></c:set> 
    
    <div id="nav">
        <ul>
            <li><span id="buslogo">BusHub</span></li>
            <li><a href="index.jsp">Bus_Tickets</a></li>
            <li><a href="aboutUs.jsp">About_us</a></li>
            
            <li id="loginlink"><a href="login.jsp">SignIn</a></li>
            <li><a href="userRegister.jsp">SignUp</a></li>
            </ul>
            
        </div>
	 
    <div>
    <form action="FilterBus">
        <div id="searchlocation">
            <table>
            <thead>
                <tr>
                    <th><div class="fromto">
                        <span>FROM</span><br>
                        <input class="inputtype" name="fromlocation"  id="fromlocation" pattern="[aA-zZ]{2,}" title="please enter correct city" autocomplete="off" placeholder="Search Locations" list = "from" required>
                            <datalist id = "from">
                            <c:forEach items="${locationList }" var="location">
                        <option value="${location }">${location }</option>
 							</c:forEach>
                            </datalist></div></th																																																																																																>
                    <th><div class="fromto">
                        <span>TO</span><br>
                        <input class="inputtype" name="tolocation" id="tolocation" pattern="[aA-zZ]{2,}" title="please enter correct city" autocomplete="off" placeholder="Search Locations" list = "to"  required>
                        <datalist id = "to">
                        <c:forEach items="${locationList }" var="location">
                        <option value="${location }">${location }</option>
 							</c:forEach>
                        </datalist></div></th>
                    <th><div class="fromto">
                        <span>DATE</span><br>
                        <input class="inputtype" name="date" id="date" type="date" required></div></th>
                </tr>
                </thead>
            </table>
            <button type="submit" id="searchbutton" onclick="return validate()"><h3>SEARCH</h3></button>

        </div>
        </form>
    </div>
    
    <script type="text/javascript">
      
    today();
    function today(){
        var today = new Date();
        var dd = String(today.getDate()).padStart(2, '0');
        var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
        var yyyy = today.getFullYear();
        var yyyy1= today.getFullYear()+10;
    maxdate =yyyy1 + '-' + mm + '-'+ dd  ;
    mindate =yyyy + '-' + mm + '-'+ dd  ;
    document.getElementById("date").setAttribute("max",maxdate);
    document.getElementById("date").setAttribute("min",mindate);
    }
    
    function validate(){
        var from=document.getElementById("fromlocation");
        var to=document.getElementById("tolocation");
        
       if(from.value.trim()==to.value.trim()){
        	alert("please enter correct location");
            return false;
        }
        <c:forEach items="${locationList }" var="location1" >
        <c:forEach items="${locationList }" var="location2" >
        else if((from.value.trim()=="${location1}") && (to.value.trim()=="${location2}")){
        	return true;
        }
       </c:forEach>
       </c:forEach>
        else{
        	alert("please enter correct location");
        return false;
        } 
    } 
    </script>
</body>
</html>