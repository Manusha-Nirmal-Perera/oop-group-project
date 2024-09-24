package com.company.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.connection.DbCon;
import com.company.dao.AdminDao;
import com.company.dao.OrderDao;
import com.company.modal.AdminActivity;
import com.company.modal.Order;

@WebServlet("/admin-cancel-order")
public class AdminCancelOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			OrderDao odao = new OrderDao(DbCon.getConnection());
			Order canceledOrder = odao.getOrderById(id);

			AdminActivity adminActivity = new AdminActivity();
			AdminDao aDao = new AdminDao(DbCon.getConnection());
			adminActivity.setActType("Order Cancelled");
			
			boolean res = odao.adminCancelOrder(id);
			
			if(res) {
				adminActivity.setDescription("Order ID: #" + canceledOrder.getOrderId() + " User ID: #" + canceledOrder.getUid() +" Product name: " + canceledOrder.getName() + " Quntity: " + canceledOrder.getQunatity() + " Placed on: " + canceledOrder.getDate() + " Amount : " + canceledOrder.getPrice()*canceledOrder.getQunatity());
				adminActivity.setStatus("Successful");
				
				request.getSession().setAttribute("alertMessage", "Order Cancelled");
                request.getSession().setAttribute("alertType", "success");
			}else {
				adminActivity.setDescription("Order ID: #" + canceledOrder.getOrderId() + " User ID: #" + canceledOrder.getUid());
				adminActivity.setStatus("Failed");
				
				request.getSession().setAttribute("alertMessage", "Something went wrong..!");
                request.getSession().setAttribute("alertType", "error");
			}
			aDao.insetIntoAdminActivity(adminActivity);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("adminpanel/orders.jsp");
	}



}
