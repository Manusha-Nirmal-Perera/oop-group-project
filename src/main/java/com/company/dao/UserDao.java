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
	
//	method to handle user login
	public User userLogin(String email, String password) {
		User user = null;
        try {
            query = "SELECT * FROM users WHERE email=?";
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
                	user.setPhone("phone");
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

//	method to handle user registration
	public boolean userRegister(User user) {
		boolean result = false;
		try {
			query = "SELECT* FROM users WHERE email=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, user.getEmail());
            rs = pst.executeQuery();
            
            if(rs.next()){
              	result = false;
            }else {
            	query = "INSERT INTO users(firstName, lastName, email, password, registered_at) values (?, ?, ?, ?, ?)";
                pst = this.con.prepareStatement(query);
                pst.setString(1, user.getfName());
                pst.setString(2, user.getlName());
                pst.setString(3, user.getEmail());
                pst.setString(4, user.getPassword());
                pst.setString(5, user.getRegisteredDate());
                pst.executeUpdate();
                result = true;
            }
	    } catch (SQLException e) {	    	
	    	e.printStackTrace();
	    }
		return result;
	}
	
//	method to get all the users as a list
	public List<User> getAllUsers(){
		List<User> user = new ArrayList<>();
		try {
            query = "SELECT * FROM users";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
            	User u = new User();
                u.setId(rs.getInt("id"));
                u.setfName(rs.getString("firstName"));
                u.setlName(rs.getString("lastName"));
                u.setEmail(rs.getString("email"));
                u.setPhone(rs.getString("phone"));
                u.setPassword(rs.getString("password"));
                u.setRegisteredDate(rs.getString("registered_at"));
                u.setImage(rs.getString("Image"));	
                user.add(u);
            }
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	public boolean updateUser(int userID, String fName, String lName, String email, String phone) {
		boolean res = false;

		query = "UPDATE users SET firstName = ?, lastName = ?, email = ?, phone= ? WHERE id = ?";

        try {
        	pst = this.con.prepareStatement(query);
        	pst.setString(1, fName);
			pst.setString(2, lName);	
	        pst.setString(3, email);
	        pst.setString(4, phone);
	        pst.setInt(5, userID);
            
            int rowsAffected = pst.executeUpdate();
            res = rowsAffected > 0;
        }catch (SQLException e) {
            e.printStackTrace();
        }
		
		return res;
	}
	
	public boolean deleteUser(int id) {
		boolean res = false;
		query = "DELETE FROM users WHERE id = ?";
		try {
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			
			int rowsAffected = pst.executeUpdate();
            res = rowsAffected > 0;
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}

	public User getUserByID(int id) {
		User u = new User();
		try {
			query = "SELECT* FROM users WHERE id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            
            if(rs.next()){
            	u.setId(rs.getInt(id));
                u.setfName(rs.getString("firstName"));
                u.setlName(rs.getString("lastName"));
                u.setEmail(rs.getString("email"));
                u.setPhone(rs.getString("phone"));
            }
	    } catch (SQLException e) {	    	
	    	e.printStackTrace();
	    }
		return u;
	}
//	method to get the user count
	public int getUserCount() {
		int count=0;
		try {
			query = "SELECT COUNT(*) FROM users";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
				
			if (rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception e) {
				e.printStackTrace();
		}
		return count;
		
	}
}
