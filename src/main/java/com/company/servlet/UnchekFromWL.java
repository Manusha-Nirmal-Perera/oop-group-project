package com.company.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.connection.DbCon;
import com.company.dao.WishlistDao;
import com.company.modal.User;

/**
 * Servlet implementation class UnchekFromWL
 */
@WebServlet("/user-uncheck-wishlist")
public class UnchekFromWL extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int prID = Integer.parseInt(request.getParameter("prID"));
		User user = (User) request.getSession().getAttribute("user");
		if(user == null) {
			response.sendRedirect("pages/home.jsp");
		}
		try {
			WishlistDao wDao = new WishlistDao(DbCon.getConnection());
			boolean result = wDao.removeFromWishList(user.getId(), prID);
			if(result) {
				request.getSession().setAttribute("alertMessage", "Item removed from wishlist");
                request.getSession().setAttribute("alertType", "success");
			}else {
				request.getSession().setAttribute("alertMessage", "Something went wrong..!");
                request.getSession().setAttribute("alertType", "error");
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}	
		response.sendRedirect("pages/shop.jsp");
	}


}
