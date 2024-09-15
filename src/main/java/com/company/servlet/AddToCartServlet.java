 package com.company.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.company.modal.Cart;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
            
            ArrayList<Cart> cartList = new ArrayList<>();
            
            int cpid = Integer.parseInt(request.getParameter("id"));
            Cart cp = new Cart();
            
            cp.setId(cpid);
            cp.setQuantity(1);
            HttpSession ses = request.getSession();
            @SuppressWarnings("unchecked")
			ArrayList<Cart> cart_list = (ArrayList<Cart>) ses.getAttribute("cart-list");
            
            if (cart_list == null) {
                cartList.add(cp);
                ses.setAttribute("cart-list", cartList);
                
                request.getSession().setAttribute("alertMessage", "Item added");
                request.getSession().setAttribute("alertType", "success");
                response.sendRedirect("pages/shop.jsp");
                
                
            } else {
                cartList = cart_list;
                boolean isExist = false;
                for (Cart c : cart_list) {
                	out.println(c.getImage());
                    if (c.getId() == cpid) {
                    	isExist = true;
                    	request.getSession().setAttribute("alertMessage", "Item already exist");
                        request.getSession().setAttribute("alertType", "error");
                        response.sendRedirect("pages/shop.jsp");
                    }
                }

                if (!isExist) {
                    cartList.add(cp);
                    request.getSession().setAttribute("alertMessage", "Item added");
                    request.getSession().setAttribute("alertType", "success");
                    response.sendRedirect("pages/shop.jsp");
                }
            }
        }
	}

}

