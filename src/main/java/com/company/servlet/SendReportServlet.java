package com.company.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.connection.DbCon;
import com.company.dao.ReportDao;
import com.company.modal.Report;
import com.company.modal.User;


@WebServlet("/user-send-msg")
public class SendReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		
		if(user!=null) {
			try {
				String inqType = request.getParameter("inquiry_type");
				String message = request.getParameter("message");
				
				Report r = new Report();
				r.setUid(user.getId());
				r.setType(inqType);
				r.setMessege(message);
				
				ReportDao rDao = new ReportDao(DbCon.getConnection());
				boolean res = rDao.addReport(r);
				
				if(res) {
					request.getSession().setAttribute("alertMessage", "Report submitted succes");
		            request.getSession().setAttribute("alertType", "success");
				} else {
					request.getSession().setAttribute("alertMessage", "Something went Wrong..!");
		            request.getSession().setAttribute("alertType", "error");
				}
			} catch(SQLException | ClassNotFoundException e) {
				e.printStackTrace();
			}
			response.sendRedirect("pages/contact.jsp");
		}else {
			request.getSession().setAttribute("alertMessage", "You need to login first before sending a messege");
            request.getSession().setAttribute("alertType", "info");
            response.sendRedirect("pages/home.jsp");
		}
		 
		 
	}

}
