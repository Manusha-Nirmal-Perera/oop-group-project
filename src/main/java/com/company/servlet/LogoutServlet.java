package com.company.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/user-logout")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			if(request.getSession().getAttribute("user")!=null) {
				request.getSession().removeAttribute("user");
				request.getSession().setAttribute("alertMessage", "Logged out");
                request.getSession().setAttribute("alertType", "success");
				response.sendRedirect("pages/home.jsp");
			}else {
				request.getSession().setAttribute("alertMessage", "Something went Wrong..!");
                request.getSession().setAttribute("alertType", "error");
				response.sendRedirect("pages/home.jsp");
			}
		} 
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
