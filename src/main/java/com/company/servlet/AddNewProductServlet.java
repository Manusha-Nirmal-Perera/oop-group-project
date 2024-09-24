package com.company.servlet;

import java.io.File;
import java.io.IOException;
//import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.company.connection.DbCon;
import com.company.dao.AdminDao;
import com.company.dao.ProductDao;
import com.company.modal.AdminActivity;
import com.company.modal.Product;


@WebServlet("/admin-add-product")
@MultipartConfig
public class AddNewProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html");
//	     PrintWriter out = response.getWriter();
	     
	     try {
		     String productName = request.getParameter("pr-name");
		     String category = request.getParameter("pr-category");
		     String priceParam = request.getParameter("pr-price");
		     double price = Double.parseDouble(priceParam);
	
		     Part filePart = request.getPart("image");
	         if (filePart == null || filePart.getSize() == 0) {
	             response.getWriter().println("No file uploaded.");
	             return;
	         }
	
	         // Generate a unique file name
	         String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
	         String fileExtension = fileName.substring(fileName.lastIndexOf("."));
	         String newFileName = UUID.randomUUID().toString() + fileExtension;
	
	         // Define upload path
	         String uploadPath = "D:\\eclipse projects\\ecommerce\\src\\main\\webapp\\components\\images\\products";
	
	         // Create the directory if it doesn't exist
	         File uploadDir = new File(uploadPath);
	         if (!uploadDir.exists()) {
	             uploadDir.mkdirs();
	         }
	
	         // Write the uploaded file to the target location
	         filePart.write(uploadPath + File.separator + newFileName);
	
	         // Output success message
	         response.getWriter().println("File uploaded successfully: " + newFileName);
	         
	         Product product = new Product(productName, category, price, newFileName);
		     ProductDao productdao;
		     try {
				productdao = new ProductDao(DbCon.getConnection());
				boolean result = productdao.saveProduct(product);
				
				AdminActivity adminActivity = new AdminActivity();
				AdminDao aDao = new AdminDao(DbCon.getConnection());
				adminActivity.setActType("Adding new product");
				if(result) {
					adminActivity.setDescription("Product name: " + product.getName() + " Category: " + product.getCategory() +" Price: " + product.getPrice());
					adminActivity.setStatus("Successful");
					
					request.getSession().setAttribute("alertMessage", "Item added");
	                request.getSession().setAttribute("alertType", "success");
				}else {
					adminActivity.setDescription("");
					adminActivity.setStatus("Failed");
					
					request.getSession().setAttribute("alertMessage", "Something went wrong !");
			        request.getSession().setAttribute("alertType", "error");
				}
				aDao.insetIntoAdminActivity(adminActivity);
		     } catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
		     }

	     } catch (Exception e) {
	    	 e.printStackTrace();
	     }
	     response.sendRedirect("adminpanel/addproducts.jsp");
	}

}
