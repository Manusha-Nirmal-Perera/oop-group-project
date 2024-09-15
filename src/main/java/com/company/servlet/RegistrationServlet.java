package com.company.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import com.company.dao.UserDao;
import com.company.connection.DbCon;
import com.company.modal.User;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/user-register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        String firstname = request.getParameter("signup-fname");
        String lastname = request.getParameter("signup-lname");
        String email = request.getParameter("signup-email");
        String password = request.getParameter("signup-password");
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        
        User user = new User();
        
        user.setfName(firstname);
        user.setlName(lastname);
        user.setEmail(email);
        user.setPassword(hashedPassword);
        user.setRegisteredDate(formatter.format(date));
        
        try {
			UserDao udao = new UserDao(DbCon.getConnection());
			boolean result = udao.userRegister(user);
			if(result) {
				response.sendRedirect("pages/home.jsp?register=success");
			}else {
				response.sendRedirect("pages/home.jsp?register=fail");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
    }

}
