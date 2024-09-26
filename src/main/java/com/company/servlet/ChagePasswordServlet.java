package com.company.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import com.company.connection.DbCon;
import com.company.dao.UserDao;
import com.company.modal.User;

/**
 * Servlet implementation class ChagePasswordServlet
 */
@WebServlet("/user-change-password")
public class ChagePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {
			int uid = Integer.parseInt(request.getParameter("userID"));
			String email = request.getParameter("chpw-email");
			String oldPassword = request.getParameter("chpw-old-password");
			String newPassword = request.getParameter("chpw-password");
			
			UserDao udao = new UserDao(DbCon.getConnection());
			User user = udao.userLogin(email, oldPassword);
			
			if (user != null) {
				String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());
				boolean res = udao.ChangePassword(uid, hashedPassword);
				if(res) {
					request.getSession().setAttribute("alertMessage", "Password cahnged");
	                request.getSession().setAttribute("alertType", "success");
				}else {
					request.getSession().setAttribute("alertMessage", "Something went wrong..!");
	                request.getSession().setAttribute("alertType", "error");
				}
				
				
			} else {
				request.getSession().setAttribute("alertMessage", "Invalid Credentials. Please try again");
                request.getSession().setAttribute("alertType", "error");
			}
			response.sendRedirect("pages/myprofile.jsp");

		} catch (ClassNotFoundException|SQLException e) {
			e.printStackTrace();
		} 
	}

}
