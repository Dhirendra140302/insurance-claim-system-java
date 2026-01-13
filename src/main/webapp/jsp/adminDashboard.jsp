<%@ page language="java"
	import="java.sql.*,com.insurance.dao.DBConnection"%>
<%
if (session.getAttribute("role") == null || !session.getAttribute("role").equals("ADMIN")) {
	response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>

	<div class="container">
		<h2>Admin Dashboard</h2>

		<table>
			<tr>
				<th>Claim ID</th>
				<th>User ID</th>
				<th>Policy No</th>
				<th>Amount</th>
				<th>Status</th>
				<th>Action</th>
			</tr>

			<%
			Connection con = DBConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM claims");

			while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getInt("id")%></td>
				<td><%=rs.getInt("user_id")%></td>
				<td><%=rs.getString("policy_no")%></td>
				<td><%=rs.getDouble("claim_amount")%></td>
				<td><%=rs.getString("status")%></td>
				<td>
					<form action="../AdminServlet" method="get"
						style="display: inline;">
						<input type="hidden" name="id" value="<%=rs.getInt("id")%>">
						<input type="hidden" name="status" value="APPROVED">
						<button type="submit">Approve</button>
					</form>

					<form action="../AdminServlet" method="get"
						style="display: inline;">
						<input type="hidden" name="id" value="<%=rs.getInt("id")%>">
						<input type="hidden" name="status" value="REJECTED">
						<button type="submit">Reject</button>
					</form>
				</td>
			</tr>
			<%
			}
			%>
		</table>

		<form action="../LogoutServlet" method="get">
			<button type="submit">Logout</button>
		</form>
	</div>

</body>
</html>
