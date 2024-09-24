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
import com.company.dao.ProductDao;
import com.company.modal.AdminActivity;
import com.company.modal.Product;

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
			Product removedProduct = pDAO.getSingleProduct(prID);
			boolean result = pDAO.deleteItem(prID);
			
			AdminActivity adminActivity = new AdminActivity();
			AdminDao aDao = new AdminDao(DbCon.getConnection());
			adminActivity.setActType("Removing existing product");
			if(result) {
				adminActivity.setDescription("Product name: " + removedProduct.getName() + " Category: " + removedProduct.getCategory() +" Price: " + removedProduct.getPrice());
				adminActivity.setStatus("Successful");
				
				request.getSession().setAttribute("alertMessage", "Item Deleted");
                request.getSession().setAttribute("alertType", "success");
			}else {
				adminActivity.setDescription("Product " + removedProduct.getName() + " deletion failed");
				adminActivity.setStatus("Failed");
				
				request.getSession().setAttribute("alertMessage", "Something went wrong !");
                request.getSession().setAttribute("alertType", "error");
			}
			aDao.insetIntoAdminActivity(adminActivity);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("adminpanel/allproducts.jsp");
	}

}
