package com.company.servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.company.connection.DbCon;
import com.company.dao.UserDao;
import com.company.modal.User;

@WebServlet("/user-edit-info")
@MultipartConfig
public class EditUserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
		

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid = Integer.parseInt(request.getParameter("userID"));
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String existingImg = request.getParameter("currImg");
		System.out.println(existingImg);
		Part filePart = request.getPart("profile-pic");
		boolean skipExecution = false;
        if (filePart == null || filePart.getSize() == 0) {
        	skipExecution = true;
        }

        // Generate a unique file name
        String newFileName = existingImg;
        if(!skipExecution) {
        	String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String fileExtension = fileName.substring(fileName.lastIndexOf("."));
            newFileName = UUID.randomUUID().toString() + fileExtension;

            // Define upload path
            String uploadPath = "D:\\eclipse projects\\ecommerce\\src\\main\\webapp\\components\\images\\users";

            // Create the directory if it doesn't exist
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            // Write the uploaded file to the target location
            filePart.write(uploadPath + File.separator + newFileName);
        	
        }
        
        
        try {
        	User user = new User();
        	user.setId(uid);
        	user.setEmail(email);
        	user.setPhone(phone);
        	user.setAddress(address);
        	user.setImage(newFileName);
        	
        	UserDao udao = new UserDao(DbCon.getConnection());
        	boolean res = udao.editUserInfo(user);
        	if(res) {
        		request.getSession().removeAttribute("user");
        		User updatedUser = new User();
        		updatedUser = udao.getUserByID(uid);
        		request.getSession().setAttribute("user", updatedUser);
        		request.getSession().setAttribute("alertMessage", "Your info updated");
                request.getSession().setAttribute("alertType", "success");
        	} else {
        		request.getSession().setAttribute("alertMessage", "Something went wrong..!");
                request.getSession().setAttribute("alertType", "error");
        	}
        	response.sendRedirect("pages/myprofile.jsp");
        }catch(Exception e) {
        	e.printStackTrace();
        }
	    
	}

}
