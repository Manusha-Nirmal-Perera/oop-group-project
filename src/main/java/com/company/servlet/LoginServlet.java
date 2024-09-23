package com.company.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.connection.DbCon;
import com.company.dao.*;
import com.company.modal.*;

@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String email = request.getParameter("login-email");
			String password = request.getParameter("login-password");
			UserDao udao = new UserDao(DbCon.getConnection());
			User user = udao.userLogin(email, password);
			if (user != null) {
				request.getSession().setAttribute("user", user);				
				request.getSession().setAttribute("alertMessage", "Logged In");
                request.getSession().setAttribute("alertType", "success");
				System.out.println("user logged in");
				
			} else {
				request.getSession().setAttribute("alertMessage", "Invalid Credentials. Please try again");
                request.getSession().setAttribute("alertType", "error");
				System.out.println("there is no user-from servlet");
			}
			response.sendRedirect("pages/home.jsp");

		} catch (ClassNotFoundException|SQLException e) {
			e.printStackTrace();
		} 

	}
}
