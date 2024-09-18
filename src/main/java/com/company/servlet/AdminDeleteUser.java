package com.company.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.connection.DbCon;
import com.company.dao.UserDao;

/**
 * Servlet implementation class AdminDeleteUser
 */
@WebServlet("/admin-del-user")
public class AdminDeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		try {
			UserDao udao = new UserDao(DbCon.getConnection());
			boolean result = udao.deleteUser(id);
			if(result) {
				request.getSession().setAttribute("alertMessage", "User Deleted");
                request.getSession().setAttribute("alertType", "success");
			}else {
				request.getSession().setAttribute("alertMessage", "Something went wrong..!");
                request.getSession().setAttribute("alertType", "error");
			}
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		response.sendRedirect("adminpanel/users.jsp");
	}
}
