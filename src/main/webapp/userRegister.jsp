<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.3.10/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet'
	href='https://cdn.jsdelivr.net/npm/sweetalert2@10.10.1/dist/sweetalert2.min.css'>
<link rel="stylesheet" href="Assets/css/registerUser.css">
</head>

<body>
	<c:set var="errorMsg" scope="session" value="${registerMessage}"></c:set>
	<fieldset class="signup">
		<legend>
			<h2>Registration</h2>
		</legend>
		<form action="registerpage" method="post">
			<table id="signuptable" style="border-spacing: 5px;">
				<tr>
					<th><label for="name">UserName</label></th>
					<th><input type="text" name="name" id="name"
						pattern="[aA-zZ]{4,}"
						title="Min 4 characters....Numbers and symbols are not allowed"
						required autofocus autocomplete="off"></th>
				</tr>
				<tr>
					<th><label for="emailId">EmailId</label></th>
					<th><input name="emailId" type="email" id="emailId"
						autocomplete="off"
						pattern="[A-Za-z0-9]+[@][a-zA-Z]+[.][A-Za-z]{2,3}"
						placeholder="eg.abc@gmail.com" required></th>
				</tr>
				<tr>
					<th><label for="mobile">MobileNumber</label></th>
					<th><input name="mobile" type="text" id="mobile"
						autocomplete="off" pattern="[6-9][0-9]{9}"
						title="Must contain 10 numbers only" required></th>
				</tr>
				<tr>
					<th><label for="password">Password</label></th>
					<th><input name="password" type="password" id="password"
						autocomplete="off"
						pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$"
						title="weak-password" required></th>
				</tr>
				<tr>
					<th><label for="dob">DOB</label></th>
					<th><input name="dob" type="date" id="dob" autocomplete="off"
						required></th>
				</tr>
				<tr>
					<th><label for="gender">Gender</label></th>
					<th id="male"><input type="radio" name="gender" value="Male"
						required required><label for="Male"> Male</label> <input
						type="radio" value="Female" name="gender" required required><label
						for="Female">Female</label></th>
				</tr>
			</table>
			<br>
			<table id="buttontable">
				<tr>
					<td><button type="submit">Register</button></td>
					<td><button type="reset">Reset</button></td>
					<td><button type="submit">
							<a href="index.jsp"> Home</a>
						</button></td>
				</tr>
			</table>
		</form>
	</fieldset>
</body>
<script src="Assets/js/popUpMessages.js"></script>
<c:if test="${param.register!=null}">
	<script>
		popupMessages('Registered successfully')
	</script>
</c:if>
<c:if test="${errorMsg!=null}">
	<script>
		console.log("kkji");
		popupMessages('${errorMsg}')
	</script>
</c:if>
<script>
	today();
</script>
</html>