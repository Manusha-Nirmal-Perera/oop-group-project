package com.company.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.connection.DbCon;
import com.company.dao.WishlistDao;
import com.company.modal.Cart;
import com.company.modal.User;
import com.company.modal.WishlistItem;

@WebServlet("/wl-inc-dec")
public class WLQtyIncDecServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User user = (User) request.getSession().getAttribute("user");
		boolean skipExecution = false;	

		if(user != null) {
			try {
				String action = request.getParameter("action");
				int recId = Integer.parseInt(request.getParameter("id"));
				
				WishlistDao wlDao = new WishlistDao(DbCon.getConnection());
				
				WishlistItem wl;
				
				wl = wlDao.getSingleItem(recId);
				int qty = wl.getWLquantity();

				if (action != null) {
					if (action.equals("inc")) {
						qty = qty+1;
						boolean result = wlDao.qtyUpdate(recId, qty);
						if(result) {
							request.getSession().setAttribute("alertMessage", "Wishlist Item Quantity increased");
			                request.getSession().setAttribute("alertType", "success");
						}else {
							request.getSession().setAttribute("alertMessage", "Something went wrong..!");
			                request.getSession().setAttribute("alertType", "error");
						}
					}
					
					
					if (action.equals("dec")) {
						if(qty==1) {
							request.getSession().setAttribute("alertMessage", "Minimum Storeble qty is 1");
							request.getSession().setAttribute("alertType", "info");
							skipExecution = true;
						}
						if(!skipExecution) {
							
							boolean result = wlDao.qtyUpdate(recId, qty);
							if(result) {
								request.getSession().setAttribute("alertMessage", "Wishlist Item Quantity increased");
				                request.getSession().setAttribute("alertType", "success");
							}else {
								request.getSession().setAttribute("alertMessage", "Something went wrong..!");
				                request.getSession().setAttribute("alertType", "error");
							}
						}
					}
				} else {
					request.getSession().setAttribute("alertMessage", "Something went wrong..!");
	                request.getSession().setAttribute("alertType", "error");
				}
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}

		}else {
			request.getSession().setAttribute("alertMessage", "You need to login first before using this feature In");
            request.getSession().setAttribute("alertType", "info");
		}
		
		response.sendRedirect("pages/myprofile.jsp");
	}

}
