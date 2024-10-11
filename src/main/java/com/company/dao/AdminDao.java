package com.company.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;

import com.company.Repository.*;
import com.company.modal.Admin;
import com.company.modal.AdminActivity;
import com.company.modal.Order;
import com.company.modal.Product;
import com.company.modal.User;

public class AdminDao implements AdminActivityRepository, AdminLoginRepository, AdminRegisterRepository {
	private Connection con;
	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    
    
	public AdminDao(Connection con) {
		this.con = con;
	}
	public boolean insetIntoAdminActivity(AdminActivity adAct) {
		boolean result = false;
		try {
			query = "INSERT INTO adminactivity(action_type, description, status) values (?, ?, ?)";
            pst = this.con.prepareStatement(query);
            pst.setString(1, adAct.getActType());
            pst.setString(2, adAct.getDescription());
            pst.setString(3, adAct.getStatus());
            pst.executeUpdate();
            result = true;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<AdminActivity> getAllAdminActivity(){
		List<AdminActivity> activityList = new ArrayList<>();
		try {
            query = "SELECT * FROM adminactivity ORDER By activity_id DESC";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
                AdminActivity adminActivity = new AdminActivity();

                adminActivity.setActId(rs.getInt("activity_id"));
                adminActivity.setActType(rs.getString("action_type"));
                adminActivity.setDescription(rs.getString("description"));
                adminActivity.setActTime(rs.getString("datetime"));
                adminActivity.setStatus(rs.getString("status"));

                activityList.add(adminActivity);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
		
		return activityList;
	}
	
//	method to handle admin login
	public Admin adminLogin(String email, String password) {
		Admin admin = null;
        try {
            query = "SELECT * FROM admins WHERE email=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            rs = pst.executeQuery();
            if(rs.next()){
            	String storedHashedPassword = rs.getString("password");
            	
            	if (BCrypt.checkpw(password, storedHashedPassword)) {
            		admin = new Admin();
            		admin.setId(rs.getInt("id"));
            		admin.setfName(rs.getString("firstName"));
            		admin.setlName(rs.getString("lastName"));
            		admin.setEmail(rs.getString("email"));
                	admin.setPassword("password");
            	}else {
            		System.out.println("Invalid password");
            	}
            }else {
            	System.out.println("User not found");
            }
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
        return admin;
    }

//	method to handle admin registration
	@Override
	public boolean adminRegister(Admin admin) {
		boolean result = false;
		try {
			query = "SELECT* FROM admins WHERE email=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, admin.getEmail());
            rs = pst.executeQuery();
            
            if(rs.next()){
              	result = false;
            }else {
            	query = "INSERT INTO admins(firstName, lastName, email, password) values (?, ?, ?, ?)";
                pst = this.con.prepareStatement(query);
                pst.setString(1, admin.getfName());
                pst.setString(2, admin.getlName());
                pst.setString(3, admin.getEmail());
                pst.setString(4, admin.getPassword());
                pst.executeUpdate();
                result = true;
            }
	    } catch (SQLException e) {	    	
	    	e.printStackTrace();
	    }
		return result;
	}


		
}
