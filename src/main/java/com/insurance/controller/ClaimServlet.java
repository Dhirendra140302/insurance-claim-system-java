package com.insurance.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insurance.dao.DBConnection;

public class ClaimServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		int userId = (int) req.getSession().getAttribute("userId");
		String policy = req.getParameter("policy");
		double amount = Double.parseDouble(req.getParameter("amount"));

		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO claims(user_id,policy_no,claim_amount,status) VALUES(?,?,?,'PENDING')");
			ps.setInt(1, userId);
			ps.setString(2, policy);
			ps.setDouble(3, amount);
			ps.executeUpdate();

			res.sendRedirect("jsp/viewClaims.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
