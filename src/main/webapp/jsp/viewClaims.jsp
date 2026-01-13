<%@ page language="java"
	import="java.sql.*,com.insurance.dao.DBConnection"%>
<%
if (session.getAttribute("userId") == null) {
	response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<title>My Claims</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>

	<div class="container">
		<h2>My Insurance Claims</h2>

		<table>
			<tr>
				<th>Claim ID</th>
				<th>Policy No</th>
				<th>Amount</th>
				<th>Status</th>
			</tr>

			<%
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM claims WHERE user_id=?");
			ps.setInt(1, (int) session.getAttribute("userId"));
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getInt("id")%></td>
				<td><%=rs.getString("policy_no")%></td>
				<td><%=rs.getDouble("claim_amount")%></td>
				<td><%=rs.getString("status")%></td>
			</tr>
			<%
			}
			%>
		</table>

		<form action="dashboard.jsp" method="get">
			<button type="submit">Back to Dashboard</button>
		</form>
	</div>

</body>
</html>
