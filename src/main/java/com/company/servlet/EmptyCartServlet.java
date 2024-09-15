package com.company.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.modal.Cart;

/**
 * Servlet implementation class EmptyCartServlet
 */
@WebServlet("/empty-cart")
public class EmptyCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			if (cart_list != null) {
				cart_list.clear();
					
				request.getSession().setAttribute("alertMessage", "Cart Emptied");
                request.getSession().setAttribute("alertType", "success");

			} else {
				request.getSession().setAttribute("alertMessage", "Something went wrong.");
                request.getSession().setAttribute("alertType", "error");
			}
			response.sendRedirect("pages/shop.jsp");
		}
	}

}
