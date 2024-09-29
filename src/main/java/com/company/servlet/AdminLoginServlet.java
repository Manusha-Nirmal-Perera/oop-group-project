package com.company.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.connection.DbCon;
import com.company.dao.AdminDao;
import com.company.dao.UserDao;
import com.company.modal.Admin;
import com.company.modal.User;

/**
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet("/admin-login")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String email = request.getParameter("login-email");
			String password = request.getParameter("login-password");
			AdminDao adao = new AdminDao(DbCon.getConnection());
			Admin admin = adao.adminLogin(email, password);
			if (admin != null) {
				request.getSession().setAttribute("admin", admin);				
				request.getSession().setAttribute("alertMessage", "Logged In");
                request.getSession().setAttribute("alertType", "success");
				System.out.println("Admin logged in");
				
			} else {
				request.getSession().setAttribute("alertMessage", "Invalid Credentials. Please try again");
                request.getSession().setAttribute("alertType", "error");
				System.out.println("there is no admin-from servlet");
			}
			response.sendRedirect("adminpanel/dashboard.jsp");

		} catch (ClassNotFoundException|SQLException e) {
			e.printStackTrace();
		} 
	}

}
