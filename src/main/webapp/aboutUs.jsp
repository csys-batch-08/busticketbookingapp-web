<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>About BusHub</title>


<link rel="stylesheet" href="css/NavigationUser.css">

<style type="text/css">
        #contentdiv{
            padding: 20px;
            border: 1px solid black;
            margin-top: 125px;
            margin-left: 50px;
            width: 1250px;
            border: none;
            box-shadow: 0px 0px 10px 0px #c7c7c7;
        }
        #nav{
        	position: fixed;
        }
    </style>
</head>


<body>
		<c:set var="currentUserModel" scope="session" value="${userModel}"></c:set>
	
		<c:if test="${currentUserModel!=null }">
    <div id="nav">
            <ul>
                <li><h3 id="buslogo"><label for="bushub">BusHub</label></h3></li>
                <li><a href="SearchBus">Bus_Tickets</a></li>
                <li><a href="aboutUs.jsp">About_us</a></li>
                  <li><div class="dropdown">
                    <button class="dropbtn">Ticket 
                    </button>
                    <div class="dropdown-content">
                      <a href="UserBookingHistory">Booking History</a>
                      <a href="myTicket.jsp">My Ticket</a>
                      <a href="cancelTicket.jsp">Cancel Ticket</a>
                    </div>
                  </div> </li>
    
                  <li><div class="dropdown">
                    <button class="dropbtn">Wallet 
                    </button>
                    <div class="dropdown-content">
                      <a href="showBalance.jsp">Show Balance</a>
                      <a href="updateWallet.jsp">Update Wallet</a>
                    </div>
                  </div> 
                  <li><a href="userProfile.jsp">Profile</a></li>
                  <li><a href="logout">LogOut</a></li>
                </ul>
        </div>
        </c:if>
        <c:if test="${currentUserModel==null }">
           <div id="nav">
        <ul>
            <li><span id="buslogo"><label>BusHub</label></span></li>
            <li><a href="index.jsp">Bus_Tickets</a></li>
            <li><a href="aboutUs.jsp">About_us</a></li>
            
            <li id="loginlink"><a href="login.jsp">SignIn</a></li>
            <li><a href="userRegister.jsp">SignUp</a></li>
            </ul>
            
        </div>
        </c:if>


	<div id="contentdiv">

    <h3>Online Bus booking on BusHub</h3><br>
    <p>Travellers love exploring India by road. The spellbinding landscapes provide a deeper insight into the culture and beauty of India. 
        Unlike flights, travelling by road is much more intimate. That's why buses are among the most preferred ways 
        among travellers to explore India. Moreover, countless Indians make their bus booking everyday to travel to other
         states. Besides private operators, you will also find that Indian states have their own bus services. You can find
          buses running from one city to another throughout the day. So, an extensive network of buses is connecting the 
          different parts of the country and offering an affordable and easier way of travelling.</p>
    <br>
    <p>Choosing the right online platform for bus booking is as important as choosing the right traveling partner for your trip. BusHub is one the 
        India's biggest and most trusted bus booking online platforms. You can make your bus booking on BusHub and 
        travel to your preferred destination.</p>
    <br>
    <p>If you are confused about how to book bus online, BusHub can help you with that. BusHub's user-friendly interface helps you to do your bus booking from the comfort of your home.
         You can easily navigate through their website and app and book a bus ticket without any hassle.</p>
    <br>
<button id="hidebutton" type="submit" onclick="hidefunc()">show more</button>
    <div id="hidecontent" style="visibility: hidden;">
    <p>You can find all the required information regarding the buses, their prices and the bus routes on the official
         website and mobile app of BusHub. Moreover, you can also check out bus images, read the reviews of the bus operators, take a look at the ratings of the bus operators, as well as know about all the amenities you will get while making your booking.
    </p>
<br><br>
    <h3>Why choose BusHub for Bus ticket booking?</h3><br>
    <p>People used to stand in long queues and had to wait for hours to book their buses. But with BusHub, things are not the same anymore. The bus ticket booking system has been made quite easy,
         as you can make your bookings on BusHub within a few minutes.</p>
    <br>
    <p>On BusHub, you can get all the required information such as the bus routes taken, the stoppages along the way, dropping and boarding points, and even an itinerary of places you can visit on your trip. BusHub also updates the customers with the regular 
        status of the buses along with the kind of amenities that would be provided on the way by the bus operators.</p>
    <br>
    <p>You can take a look at the wide variety of options on BusHub as you can find top-rated bus operators listed on the portal. Moreover, customers also have the option to select the seats of their choice.</p>
<br><br>
    <h3>Online Bus booking services by BusHub</h3><br>
    <p>BusHub is a one-stop destination for online booking bus. Bus booking can be done from anywhere and BusHub ensures that your bus journey is a smooth one.</p><br>
    <p><strong>E-Tickets:</strong> BusHub provides e-tickets to passengers. When you make an online booking, an e-ticket is generated which is sent to your registered email ID and phone number. All you have to do is show that e-ticket in order to 
        board your bus. Although, to have a stress-free journey, it is always advisable to carry the print of your e-tickets.</p>
<br>
<p><strong>Refunds:</strong> If you book bus online on BusHub and for some reason, either you have to cancel your trip or the bus trip was cancelled by the bus provider, then the refund process is initiated. Though, please note that if you are cancelling your trip at the last moment, then you will not be eligible for a refund.</p>
<br>
<p><strong>Cancel Booked Tickets:</strong> Steps to cancel your booked ticket are easy to follow. All you have to do is to go to the cancel tab on BusHub's home page and put in the necessary details such as your booking ID and ticket number. After selecting the ticket, simply click on the cancel button.</p>
<br><br>

<h3>Book at cheapest online fares</h3><br>
<p>On BusHub, you can book your bus tickets at affordable rates. Though you must keep in mind that the bus fares depend on various factors such as the bus operator selected, the route taken by the bus, the distance between the city of origin and the destination, amenities provided by the bus operator as well as 
    the date and time of the journey. A wide range of buses are available for customers to choose from. Below, we are mentioning the different types of buses listed on BusHub:</p>
<br>
<p>Volvo AC buses</p><br>
<p>AC buses</p><br>
<p>Non AC buses</p><br>
<p>Seater buses</p><br>
<p>Luxury</p><br>
<br><br>

<h3>Boarding and Dropping points</h3> <br>
<p>In order to make your journey as smooth and hassle-free as possible, BusHub clearly mentions the boarding and dropping points for the route you select. 
    BusHub consistently offers all the updated information regarding the boarding and dropping points so that you can reach your point on time.</p>
<br>
<p>Passengers who book bus ticket with BusHub also get the location of the boarding point along with their e-ticket in order to avoid any confusion during the time of departure. It is suggested that you should reach the boarding point at least 30 minutes before the departure of the bus.
     Moreover, a passenger has to pay no extra charges other than their bus ticket fare.</p>
<br>
<p>BusHub also informs the passengers about all stoppages that would come along the way so that you can choose a route which is apt for you. While making your online bus booking, you will be required to fill the city of origin and destination so that all
     the boarding and dropping points related to those locations can be generated for you.</p>
<br><br>

<h3>How to book Bus ticket on BusHub?</h3><br>
<p>It is really easy to book bus tickets on the BusHub portal, all thanks to their easy-to-use user interface. It is quite easy to find all the services on one click on the official website and mobile app of BusHub. 
    There are some simple steps that you have to follow for making your bus booking:</p>
<br>
<p><strong>Step 1:</strong> Visit the mobile app or BusHub website and go to the bus section in order to make your bus booking.</p>
<br>
<p><strong>Step 2:</strong> Fill in important details such as your city of origin, your destination and set the journey date of your preference.</p>
<br>
<p><strong>Step 3:</strong> After bus selection, it's time to select a seat of your choice.</p>
<br>
<p><strong>Step 4:</strong> After the confirmation of details, it's time to pay the final amount and get your e-ticket. </p>
<br>
<p>Considering the number of bus operators listed on BusHub, you can get the services from anywhere in India. Whether you wish to travel to popular cities such as Delhi, Mumbai, Chennai and Kolkata or explore the offbeat locations of the country such as Spiti, Puducherry, Chamba and Itanagar, you can board a bus and reach your
     destination. In fact, the bus service offered on BusHub is among the cheapest ways of travelling across India.</p>
<br><br>
<h3>BusHub ensures a safe journey</h3>
<br>
<p>You can be assured that you can enjoy a safe journey if you book your bus tickets on BusHub.  Due to the current Covid-19 situation, all the hygiene measures are being followed thoroughly. The temperature of the passengers and drivers are checked before the journey. Moreover, regular bus 
    sanitization, seat sanitization, and floor sanitization are happening to ensure maximum safety of the passengers. 
    It is also mandatory for drivers and passengers to wear their masks. The staff also wears their hand gloves while providing refreshments to the passengers. Bus operators are not providing blankets during this period due to safety reasons.</p>
<br>

</div>
</div>


<script>
    function hidefunc(){
        var hideContent=document.getElementById("hidecontent");
        hideContent.style.visibility="visible";
        var hideButton=document.getElementById("hidebutton");
        hideButton.style.visibility="hidden";
    }
</script>
</body>
</html>