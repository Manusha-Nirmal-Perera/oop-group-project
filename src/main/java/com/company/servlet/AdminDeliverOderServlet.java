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

@WebServlet("/admin-deliver-order")
public class AdminDeliverOderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			OrderDao odao = new OrderDao(DbCon.getConnection());
			boolean res = odao.adminDeliverOrder(id);
			if(res) {
				request.getSession().setAttribute("alertMessage", "Order delivered");
                request.getSession().setAttribute("alertType", "success");
			}else {
				request.getSession().setAttribute("alertMessage", "Something went wrong..!");
                request.getSession().setAttribute("alertType", "error");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("adminpanel/orders.jsp");
	}

}
