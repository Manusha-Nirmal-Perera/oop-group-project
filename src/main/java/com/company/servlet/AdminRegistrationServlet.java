package com.company.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import com.company.connection.DbCon;
import com.company.dao.AdminDao;
import com.company.modal.Admin;

/**
 * Servlet implementation class AdminRegistrationServlet
 */
@WebServlet("/admin-register")
public class AdminRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstname = request.getParameter("signup-fname");
        String lastname = request.getParameter("signup-lname");
        String email = request.getParameter("signup-email");
        String password = request.getParameter("signup-password");
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        
        Admin admin = new Admin();
        
        admin.setfName(firstname);
        admin.setlName(lastname);
        admin.setEmail(email);
        admin.setPassword(hashedPassword);
        
        try {
			AdminDao adao = new AdminDao(DbCon.getConnection());
			boolean result = adao.adminRegister(admin);
			if(result) {
				request.getSession().setAttribute("alertMessage", "Registration Success");
                request.getSession().setAttribute("alertType", "success");
				response.sendRedirect("adminpanel/adminIndex.jsp?");
			}else {
				request.getSession().setAttribute("alertMessage", "Registraion Failed");
                request.getSession().setAttribute("alertType", "error");
				response.sendRedirect("adminpanel/adminIndex.jsp?");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

}
