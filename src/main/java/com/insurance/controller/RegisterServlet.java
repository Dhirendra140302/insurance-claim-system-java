package com.insurance.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insurance.dao.DBConnection;

public class RegisterServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("INSERT INTO users(name,email,password,role) VALUES(?,?,?,'USER')");

			ps.setString(1, req.getParameter("name"));
			ps.setString(2, req.getParameter("email"));
			ps.setString(3, req.getParameter("password"));

			ps.executeUpdate();
			res.sendRedirect("jsp/login.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
