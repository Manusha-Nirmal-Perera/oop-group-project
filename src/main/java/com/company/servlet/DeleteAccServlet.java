package com.company.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.connection.DbCon;
import com.company.dao.OrderDao;
import com.company.dao.UserDao;
import com.company.modal.Order;

/**
 * Servlet implementation class DeleteAccServlet
 */
@WebServlet("/delete-user")
public class DeleteAccServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int UserId = Integer.parseInt(request.getParameter("id")); 
		try {
//			TODO: When a user delete an account orders info become null 
//					so as the solution implement a soft delete so that account status is changed to deleted and the record is preserved
			UserDao udao = new UserDao(DbCon.getConnection());
			boolean result = udao.deleteUser(UserId);
			if(result) {
				request.getSession().removeAttribute("user");				
				request.getSession().setAttribute("alertMessage", "Account Deleted");
                request.getSession().setAttribute("alertType", "success");
                response.sendRedirect("pages/home.jsp");
			}else {			
				request.getSession().setAttribute("alertMessage", "Something went Wrong..!");
                request.getSession().setAttribute("alertType", "error");
                response.sendRedirect("pages/myprofile.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
