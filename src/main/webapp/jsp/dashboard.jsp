<%@ page language="java"%>
<%
if (session.getAttribute("userId") == null) {
	response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<title>User Dashboard</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>

	<div class="container">
		<h2>User Dashboard</h2>

		<form action="claim.jsp" method="get">
			<button type="submit">Apply Insurance Claim</button>
		</form>

		<form action="viewClaims.jsp" method="get">
			<button type="submit">View My Claims</button>
		</form>

		<!-- <form action="../LogoutServlet" method="get">
			<button type="submit">Logout</button>
		</form> -->

		<form action="<%=request.getContextPath()%>/LogoutServlet"
			method="get">
			<button type="submit">Logout</button>
		</form>

	</div>

</body>
</html>
