<%@page import="com.busticketbooking.daoimpl.BusDaoImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.busticketbooking.model.User" %>
    <%@page import="com.busticketbooking.daoimpl.UserDaoImpl" %>
    <%@page import="javax.servlet.http.HttpSession" %>
    <%BusDaoImpl busDao=new BusDaoImpl();
    List<String> locationList=new ArrayList<String>(); 
    locationList=busDao.getLocations();
    %>
       
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bus Hub</title>

<link rel="stylesheet" href="css/NavigationUser.css">
<style type="text/css">

</style>
</head>
<body>

<!-- <marquee width="100%" direction="left" height="30%">
	Welcome! Start your ride with us...book a ticket now!
    </marquee> -->
    
        <%session.setAttribute("userHome", "homeSession");%>
           
    <div id="nav">
        <ul>
            <li><span id="buslogo">BusHub</span></li>
            <li><a href="index.jsp">Bus_Tickets</a></li>
            <li><a href="AboutUs.jsp">About_us</a></li>
            
            <li id="loginlink"><a href="Login.jsp">SignIn</a></li>
            <li><a href="UserRegister.jsp">SignUp</a></li>
            </ul>
            
        </div>
	
	
    <div>
    <form action="FilterBus.jsp">
        <div id="searchlocation">
            <table>
                <tr>
                    <td><div class="fromto">
                        <span>FROM</span><br>
                        <input name="fromlocation"  id="fromlocation" pattern="[aA-zZ]{2,}" title="please enter correct city" autocomplete="off" placeholder="Search Locations" list = "from" required>
                            <datalist id = "from">
                            <%for(int i=0;i<locationList.size();i++){%>
                        	<option value="<%=locationList.get(i)%>"><%=locationList.get(i)%></option>
                        	<%}%>
                            </datalist></div></td																																																																																																		>
                    <td><div class="fromto">
                        <span>TO</span><br>
                        <input name="tolocation" id="tolocation" pattern="[aA-zZ]{2,}" title="please enter correct city" autocomplete="off" placeholder="Search Locations" list = "to"  required>
                        <datalist id = "to">
                        <%for(int i=0;i<locationList.size();i++){%>
                        <option value="<%=locationList.get(i)%>"><%=locationList.get(i)%></option>
                        <%}%>
                        </datalist></div></td>
                    <td><div class="fromto">
                        <span>DATE</span><br>
                        <input name="date" id="date" type="date" required></div></td>
                </tr>
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
        
         <%for(int i=0;i<locationList.size();i++){
         for(int j=0;j<locationList.size();j++){%>
        else if((from.value.trim()=="<%=locationList.get(i)%>") && (to.value.trim()=="<%=locationList.get(j)%>")){
        	return true;
        }
        <%}}%>
        else{
        	alert("please enter correct location");
        return false;
        }
    }
    </script>
</body>
</html>