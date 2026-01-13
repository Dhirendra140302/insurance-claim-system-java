<%@ page language="java"%>
<%
if (session.getAttribute("userId") == null) {
	response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Apply Claim</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>

	<div class="container">
		<form action="../ClaimServlet" method="post">
			<h2>Apply Insurance Claim</h2>

			<input type="text" name="policy" placeholder="Policy Number" required>
			<input type="number" name="amount" placeholder="Claim Amount"
				required>

			<button type="submit">Submit Claim</button>
		</form>

		<form action="dashboard.jsp" method="get">
			<button type="submit">Back to Dashboard</button>
		</form>
	</div>

</body>
</html>
