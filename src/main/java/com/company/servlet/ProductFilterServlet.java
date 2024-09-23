package com.company.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.connection.DbCon;
import com.company.dao.ProductDao;
import com.company.modal.Product;

@WebServlet("/user-filter-products")
public class ProductFilterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String prName = request.getParameter("entered-pr-name");
		String category = request.getParameter("category");
        ProductDao pd;
		try {
			pd = new ProductDao(DbCon.getConnection());
			List<Product> products = null;
			
			if(prName.isEmpty() && !(category.isEmpty())) {
				products = pd.getAllProductsByCategory(category);
			} 
			else if ( category.isEmpty() && !(prName.isEmpty()) ) {
				products = pd.getAllProductsByName(prName);
			} 
			else if( !(prName.isEmpty()) && !(category.isEmpty())) {
				products = pd.getAllProductsBySelections(prName, category);
			} 
			else {
				products = pd.getAllProducts();
			}

	        request.setAttribute("products", products);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/shop.jsp");
        dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
