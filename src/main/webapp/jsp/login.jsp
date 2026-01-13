<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>

	<div class="container">
		<form action="../LoginServlet" method="post">
			<h2>Login</h2>

			<input type="email" name="email" placeholder="Enter Email" required>
			<input type="password" name="password" placeholder="Enter Password"
				required>

			<button type="submit">Login</button>
		</form>

		<form action="register.jsp" method="get">
			<button type="submit">New User? Register</button>
		</form>

		<%
		if (request.getParameter("error") != null) {
		%>
		<p class="error">Invalid Email or Password</p>
		<%
		}
		%>
	</div>

</body>
</html>
