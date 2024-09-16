package com.company.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.connection.DbCon;
import com.company.dao.ProductDao;

/**
 * Servlet implementation class EditProductInfo
 */
@WebServlet("/edit-pr-info")
public class EditProductInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productId = Integer.parseInt(request.getParameter("pr-id"));
		String productName = request.getParameter("pr-name");

	    String priceParam = request.getParameter("pr-price");
	    double price = Double.parseDouble(priceParam);
	    
	    try {
	    	ProductDao pDAO = new ProductDao(DbCon.getConnection());
			boolean result = pDAO.editProductinfo(productId, productName, price);
			if(result) {
				request.getSession().setAttribute("alertMessage", "Item info updated");
                request.getSession().setAttribute("alertType", "success");
			}else {
				request.getSession().setAttribute("alertMessage", "Something went wrong !");
		        request.getSession().setAttribute("alertType", "error");
			}
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	    response.sendRedirect("adminpanel/allproducts.jsp");
	}

}
