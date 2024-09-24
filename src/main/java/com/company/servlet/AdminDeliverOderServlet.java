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

@WebServlet("/admin-deliver-order")
public class AdminDeliverOderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			OrderDao odao = new OrderDao(DbCon.getConnection());
			Order deliveredOrder = odao.getOrderById(id);
			
			AdminActivity adminActivity = new AdminActivity();
			AdminDao aDao = new AdminDao(DbCon.getConnection());
			adminActivity.setActType("Order Delivered");
			
			boolean res = odao.adminDeliverOrder(id);
			
			if(res) {
				adminActivity.setDescription("Order ID: #" + deliveredOrder.getOrderId() + " User ID: #" + deliveredOrder.getUid() +" Product name: " + deliveredOrder.getName() + " Quntity: " + deliveredOrder.getQunatity() + " Placed on on: " + deliveredOrder.getDate() + " Amount : " + deliveredOrder.getPrice()*deliveredOrder.getQunatity());
				adminActivity.setStatus("Successful");
				
				request.getSession().setAttribute("alertMessage", "Order delivered");
                request.getSession().setAttribute("alertType", "success");
			}else {
				adminActivity.setDescription("Order ID: #" + deliveredOrder.getOrderId() + " User ID: #" + deliveredOrder.getUid());
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
