<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="Assets/css/login.css">
</head>
<body>
	<c:set var="errorMsg" scope="session" value="${erroruserid}"></c:set>
	<div id="login">
		<form action="loginWay" method="post">
			<h2 class="pngtitle">LogIn</h2>
			<table id="tablee">
				<tr>
					<th><img src="Assets/LoginPngUserName.png" id="loginuserpng"
						alt=""></th>
					<th><input name="name" type="text" placeholder="Login Id"
						autofocus autocomplete="off" required><br>
					<br></th>
				</tr>
				<tr>
					<th><img src="Assets/password2.png" alt=""></th>
					<th><input name="password" type="password"
						placeholder="Password" autocomplete="off" required><br>
					<br></th>
				</tr>

			</table>
			<br>
			<button type="submit" id="buttonlogin">Login</button>
			<br>
			<br>
			<br> <label for="signup">New User ? </label> <a id="signup"
				href="userRegister.jsp">SignUp</a>

			<c:if test="${not empty errorMsg}">
				<p id="errorcontent">${errorMsg }</p>
				<c:remove var="errorMsg" />
			</c:if>
		</form>
	</div>
</body>
</html>