package com.company.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.connection.DbCon;
import com.company.dao.OrderDao;

/**
 * Servlet implementation class ReviewOrderServlet
 */
@WebServlet("/review-order")
public class ReviewOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String msg = request.getParameter("message");
		
		try {
			OrderDao odao = new OrderDao(DbCon.getConnection());
			
			boolean res = odao.userReviewOrder(id, msg);
			
			if(res) {
				request.getSession().setAttribute("alertMessage", "Review Submitted");
                request.getSession().setAttribute("alertType", "success");
			}else {
				request.getSession().setAttribute("alertMessage", "Something went wrong..!");
                request.getSession().setAttribute("alertType", "error");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("pages/orders.jsp");
	}

}
