package com.company.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;

import com.company.modal.*;

public class UserDao {
	private Connection con;

	private String query;
    private PreparedStatement pst;
    private ResultSet rs;

	public UserDao(Connection con) {
		this.con = con;
	}
	
	public User userLogin(String email, String password) {
		User user = null;
        try {
            query = "select * from users where email=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            rs = pst.executeQuery();
            if(rs.next()){
            	String storedHashedPassword = rs.getString("password");
            	
            	if (BCrypt.checkpw(password, storedHashedPassword)) {
            		user = new User();
                	user.setId(rs.getInt("id"));
                	user.setfName(rs.getString("firstName"));
                	user.setlName(rs.getString("lastName"));
                	user.setEmail(rs.getString("email"));
                	user.setPassword("password");
                	user.setRegisteredDate(rs.getString("registered_at"));
                	user.setImage(rs.getString("image"));
            	}else {
            		System.out.println("Invalid password");
            	}
            }else {
            	System.out.println("User not found");
            }
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
        return user;
    }

	public boolean userRegister(User user) {
		boolean result = false;
		try {
			query = "select * from users where email=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, user.getEmail());
            rs = pst.executeQuery();
            
            if(rs.next()){
              	result = false;
            }else {
            	query = "insert into users(firstName, lastName, email, password) values (?, ?, ?, ?)";
                pst = this.con.prepareStatement(query);
                pst.setString(1, user.getfName());
                pst.setString(2, user.getlName());
                pst.setString(3, user.getEmail());
                pst.setString(4, user.getPassword());
                pst.executeUpdate();
                result = true;
            }
	    } catch (SQLException e) {	    	
	    	e.printStackTrace();
	    }
		return result;
	}
	
	public List<User> getAllUsers(){
		List<User> user = new ArrayList<>();
		try {
            query = "select * from users";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
            	User u = new User();
                u.setId(rs.getInt("id"));
                u.setfName(rs.getString("firstName"));
                u.setlName(rs.getString("lastName"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setImage(rs.getString("password"));	
                user.add(u);
            }
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}

}
