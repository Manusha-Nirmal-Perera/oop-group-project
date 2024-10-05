package com.company.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.company.modal.Order;
import com.company.modal.Product;
import com.company.modal.Report;

public class ReportDao {
	private Connection con;
	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    
    

	public ReportDao(Connection con) {
		this.con = con;
	}
//	method to get all the reports 
	public List<Report> getAllReports() {
        List<Report> reports = new ArrayList<>();
        try {

            query = "SELECT * FROM user_reports ORDER BY status";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
            	Report r = new Report();
            	r.setRid(rs.getInt("report_id"));
                r.setUid(rs.getInt("user_id"));
                r.setType(rs.getString("type"));
                r.setMessege(rs.getString("messege"));
                r.setDate(rs.getString("date"));
                r.setStatus(rs.getString("status"));
                
                reports.add(r);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return reports;
    }
	
//	method to get all the reports made by a user 
	public List<Report> getAllReportsByUid(int uid) {
        List<Report> reports = new ArrayList<>();
        try {
            query = "SELECT * FROM user_reports WHERE user_id =?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, uid);
	        rs = pst.executeQuery();
            
            while (rs.next()) {
            	Report r = new Report();
                r.setRid(rs.getInt("report_id"));
                r.setUid(rs.getInt("user_id"));
                r.setType(rs.getString("type"));
                r.setMessege(rs.getString("messege"));
                r.setDate(rs.getString("date"));
                r.setStatus(rs.getString("status"));
                
                reports.add(r);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return reports;
    }
	
//	method to insert a report
	public boolean addReport(Report report) {
        boolean result = false;
        try {
            query = "INSERT INTO user_reports (user_id, type, messege) VALUES(?,?,?)";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, report.getUid());
            pst.setString(2, report.getType());
            pst.setString(3, report.getMessege());
            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
	
//	method to update report info
	public boolean resolveReport(int rid) {
		boolean res = false;

        try {
        	query = "UPDATE user_reports SET status=? WHERE report_id =?";
        	pst = this.con.prepareStatement(query);
            pst.setString(1, "Resolved");
            pst.setInt(2, rid);
            
            int rowsAffected = pst.executeUpdate();
            res = rowsAffected > 0;
        }catch (SQLException e) {
            e.printStackTrace();
        }
		
		return res;
	}
	
// method to delete the user reports 
	public boolean deleteReport(int rid) {
	    boolean res = false;
	    query = "DELETE FROM user_reports WHERE report_id=?";
	    
	    try {
	        pst = this.con.prepareStatement(query);
	        pst.setInt(1, rid);
	        int rowsAffected = pst.executeUpdate();
	       	res = rowsAffected > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return res;
	}
//	method to get total report count
	public int getReportCount() {
		int count=0;
		try {
			query = "SELECT COUNT(*) FROM user_reports";
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
