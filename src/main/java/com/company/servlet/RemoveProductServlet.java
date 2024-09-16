package com.company.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.connection.DbCon;
import com.company.dao.ProductDao;

/**
 * Servlet implementation class RemoveProductServlet
 */
@WebServlet("/admin-rm-product")
public class RemoveProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int prID = Integer.parseInt(request.getParameter("id"));
		
		try {
			ProductDao pDAO = new ProductDao(DbCon.getConnection());
			boolean result = pDAO.deleteItem(prID);
			if(result) {
				request.getSession().setAttribute("alertMessage", "Item Deleted");
                request.getSession().setAttribute("alertType", "success");
			}else {
				request.getSession().setAttribute("alertMessage", "Something went wrong !");
                request.getSession().setAttribute("alertType", "error");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("adminpanel/allproducts.jsp");
	}

}
