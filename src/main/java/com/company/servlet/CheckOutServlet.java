package com.company.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.connection.DbCon;
import com.company.dao.OrderDao;
import com.company.modal.*;

/**
 * Servlet implementation class CheckOutServlet
 */
@WebServlet("/cart-all-products-chekout")
public class CheckOutServlet extends HttpServlet {


	private static final long serialVersionUID = 1L;
       
   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			User user = (User) request.getSession().getAttribute("user");
			if(cart_list != null && user!=null) {
				for(Cart c:cart_list) {
					Order order = new Order();
					
					order.setId(c.getId());
					order.setUid(user.getId());
					order.setQunatity(c.getQuantity());
					order.setDate(formatter.format(date));
					
					OrderDao oDao = new OrderDao(DbCon.getConnection());
					boolean result = oDao.insertOrder(order);
					if(!result) break;
				}
				cart_list.clear();
				response.sendRedirect("pages/orders.jsp");
			}else {
				if(user==null) {
					response.sendRedirect("pages/home.jsp");
				}
				response.sendRedirect("pages/shop.jsp");
			}
		} catch (ClassNotFoundException|SQLException e) {
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}


}
