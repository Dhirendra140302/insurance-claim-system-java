<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Register</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>

	<div class="container">
		<form action="../RegisterServlet" method="post">
			<h2>User Registration</h2>

			<input type="text" name="name" placeholder="Enter Name" required>
			<input type="email" name="email" placeholder="Enter Email" required>
			<input type="password" name="password" placeholder="Enter Password"
				required>

			<button type="submit">Register</button>
		</form>

		<form action="login.jsp" method="get">
			<button type="submit">Back to Login</button>
		</form>
	</div>

</body>
</html>
