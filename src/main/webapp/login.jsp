<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Login</title>


    <style>
        body{
            background: url("Assets/imagelogin.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            height: 537px;
        }
        div,img{
            width: 20px;
            height: 25px;
        }
        div,input{
            height: 30px;
            width: 200px;
            border-top: none;
            border-left: none;
            border-right: none;
            outline: none;
            background: transparent;
        }
        #login{
            margin-left: 150px;
            margin-top: 80px;
            height: 370px;
            width: 300px;
            padding-left: 40px;
            padding-top: 20px;
            background-color: rgb(228, 208, 208);
            border-radius: 30px ; 
            box-shadow: 0 0 15px rgb(255, 255, 255); 
        }
        #loginuserpng{
        width:38px;
        height:40px;
        }
        .pngtitle{
            margin-left: 90px;
           
        }
        #buspng{
            border-radius: 50%;
            border: 1px solid black;
            height: 70px;
            width: 60px;
        }
        #buttonlogin{
            margin-left: 40px;
            cursor: pointer;
            
        }
        button{
            height: 35px;
            width: 180px;
            background-color: rgb(127, 127, 221);
            outline: none;
            border: none;
            
        }
        table,th{
            border-spacing: 5px;
        }
        button:hover{
            background-color: rgb(247, 112, 112);
        }
        a:hover{
            background-color:  rgb(247, 112, 112);
        }
        a{
             text-decoration: none;
        }
       #signup{
           font-weight:bolder;
           font-size: 20px;

       }
	   #errorcontent{
	      font-size: 20px;
	      color: red;
	   }

       /* register*/


    </style>
</head>
<body>

	<c:set var="errorMsg" scope="session" value="${erroruserid}"></c:set>
	
    <div id="login">
        <form action="loginWay">
       
        <h2 class="pngtitle" >LogIn</h2>

        <table id="tablee">
            <tr>
                <th><img src="Assets/LoginPngUserName.png" id="loginuserpng"></th>
                <th><input name="name" type="text" placeholder="Login Id" autofocus autocomplete="off" required><br><br></th>
            </tr>
            <tr>
                <th><img src="Assets/password2.png"></th>
                <th><input name="password" type="password" placeholder="Password" autocomplete="off" required><br><br></th>
            </tr>
            
        </table><br>
            <button type="submit" id="buttonlogin">Login</button><br><br><br>

            <label for="signup">New User ? </label>
            <a id="signup" href="userRegister.jsp">SignUp</a>	
		
		<c:if test="${not empty errorMsg}">
			<p id="errorcontent">${errorMsg }</p>
			 <c:remove var="errorMsg"/>
		</c:if>
		
         </form>        
           
 </div>
</body>
</html>