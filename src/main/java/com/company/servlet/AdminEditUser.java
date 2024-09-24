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
import com.company.dao.UserDao;
import com.company.modal.AdminActivity;
import com.company.modal.User;

@WebServlet("/admin-edit-user")
public class AdminEditUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("adminuser-id"));
		String firstname = request.getParameter("adminuser-fname");
        String lastname = request.getParameter("adminuser-lname");
        String email = request.getParameter("adminuser-email");
        String phone = request.getParameter("adminuser-phone");
        
        

		try {
			UserDao uDAO = new UserDao(DbCon.getConnection());
			User updatedUser = uDAO.getUserByID(id);
			
			AdminActivity adminActivity = new AdminActivity();
			AdminDao aDao = new AdminDao(DbCon.getConnection());
			adminActivity.setActType("User info updated");
			
			boolean isUpdated = uDAO.updateUser(id, firstname, lastname, email, phone);
	        if(isUpdated) {
	        	adminActivity.setDescription("Updated user info of user #" + id);	        	
	        	adminActivity.setStatus("Successful");
	        	
	        	request.getSession().setAttribute("alertMessage", "User info updated");
	            request.getSession().setAttribute("alertType", "success");
	        }else {
	        	adminActivity.setDescription("Update of user info of user #" + id + " failed");
	        	adminActivity.setStatus("Failed");
	        	
				request.getSession().setAttribute("alertMessage", "Something went wrong !");
		        request.getSession().setAttribute("alertType", "error");
			}
	        aDao.insetIntoAdminActivity(adminActivity);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
        
        response.sendRedirect("adminpanel/users.jsp");	
	}

}
