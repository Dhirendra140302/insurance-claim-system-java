package com.insurance.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insurance.dao.DBConnection;

public class AdminServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		String status = req.getParameter("status");

		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("UPDATE claims SET status=? WHERE id=?");
			ps.setString(1, status);
			ps.setInt(2, id);
			ps.executeUpdate();

			res.sendRedirect("jsp/adminDashboard.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
