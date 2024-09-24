package com.company.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.company.modal.AdminActivity;
import com.company.modal.Order;
import com.company.modal.Product;

public class AdminDao {
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
	
}
