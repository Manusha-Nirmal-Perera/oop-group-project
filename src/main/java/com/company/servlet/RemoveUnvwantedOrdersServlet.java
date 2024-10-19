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
 * Servlet implementation class RemoveUnvwantedOrdersServlet
 */
@WebServlet("/admin-rm-unwanted-orders")
public class RemoveUnvwantedOrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int oid = Integer.parseInt(request.getParameter("oid"));
		
		try {
			OrderDao odao = new OrderDao(DbCon.getConnection());
			odao.cancelOrder(oid);
			
			request.getSession().setAttribute("alertMessage", "Order Removed");
            request.getSession().setAttribute("alertType", "success");
            
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("adminpanel/rejectedOrders.jsp");
	}

}
