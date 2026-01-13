package com.insurance.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.insurance.dao.DBConnection;

public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String email = req.getParameter("email");
		String password = req.getParameter("password");

		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE email=? AND password=?");
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				HttpSession session = req.getSession();
				session.setAttribute("userId", rs.getInt("id"));
				session.setAttribute("role", rs.getString("role"));

				if (rs.getString("role").equals("ADMIN"))
					res.sendRedirect("jsp/adminDashboard.jsp");
				else
					res.sendRedirect("jsp/dashboard.jsp");
			} else {
				res.sendRedirect("jsp/login.jsp?error=1");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
