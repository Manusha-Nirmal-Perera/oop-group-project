package com.company.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin-logout")
public class AdminLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			if(request.getSession().getAttribute("admin")!=null) {
				request.getSession().removeAttribute("admin");
				request.getSession().setAttribute("alertMessage", "Logged Out");
                request.getSession().setAttribute("alertType", "success");
				response.sendRedirect("adminpanel/adminIndex.jsp");
			}else {
				request.getSession().setAttribute("alertMessage", "Something went Wrong..!");
                request.getSession().setAttribute("alertType", "error");
				response.sendRedirect("adminpanel/adminIndex.jsp");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
