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

@WebServlet("/user-add-to-wishlist")
public class AddToWishlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int prId = Integer.parseInt(request.getParameter("prid"));
		User user = (User) request.getSession().getAttribute("user");
		
		if(user!=null) {
//			TODO: complete adding
			int uid = user.getId();
			try {
				WishlistDao wldao = new WishlistDao(DbCon.getConnection());
				boolean isExist = wldao.isExist(uid, prId);
				if(!isExist) {
					boolean res = wldao.AddToWishList(uid, prId);
					if(res) {
						request.getSession().setAttribute("alertMessage", "Item added to wish list");
		                request.getSession().setAttribute("alertType", "success");
					} else {
						request.getSession().setAttribute("alertMessage", "Something went wrong..!");
		                request.getSession().setAttribute("alertType", "error");
					}
				}else {
					boolean res = wldao.removeFromWishList(uid, prId);
					if(res) {
						request.getSession().setAttribute("alertMessage", "Item removed from wish list");
		                request.getSession().setAttribute("alertType", "success");
					} else {
						request.getSession().setAttribute("alertMessage", "Something went wrong..!");
		                request.getSession().setAttribute("alertType", "error");
					}
				}
				
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			} 
		} else {
			request.getSession().setAttribute("alertMessage", "You need to login first before adding an item to wish list");
            request.getSession().setAttribute("alertType", "info");
		}
		response.sendRedirect("pages/shop.jsp");
	}

}
