package com.company.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.company.modal.Product;
import com.company.modal.WishlistItem;

public class WishlistDao {
	private Connection con;

	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    

	public WishlistDao(Connection con) {
		super();
		this.con = con;
	}
	
	public List<WishlistItem> getAllWishlistItems(int uid) {
        List<WishlistItem> wishListPr = new ArrayList<>();
        try {

            query = "SELECT * FROM user_wishlist WHERE user_id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, uid);
            rs = pst.executeQuery();

            while (rs.next()) {
            	WishlistItem wlItem = new WishlistItem();
            	wlItem.setRecordId(rs.getInt("record_id"));
            	wlItem.setUserId(rs.getInt("user_id"));
            	wlItem.setId(rs.getInt("product_id"));
            	wlItem.setWLquantity(rs.getInt("quantity"));

            	wishListPr.add(wlItem);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return wishListPr;
    }

	public boolean isExist(int uid, int prId) {
		boolean result = false;
		try {
			query = "SELECT * FROM user_wishlist WHERE user_id=? AND product_id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, uid);
            pst.setInt(2, prId);
            rs = pst.executeQuery();
            if(rs.next()) {
            	result = true;
            }
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean AddToWishList(int uid, int prId) {
		boolean result = false;
		try {
			query = "INSERT INTO user_wishlist(user_id, product_id) VALUES (?, ?)";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, uid);
            pst.setInt(2, prId);
            
            pst.executeUpdate();
            result = true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean removeFromWishList(int uid, int prId) {
		boolean result = false;
	    try {
	        query = "DELETE FROM user_wishlist WHERE user_id=? AND product_id=?";
	        pst = this.con.prepareStatement(query);
	        pst.setInt(1, uid);
	        pst.setInt(2, prId);

	        int rowsAffected = pst.executeUpdate();
	        System.out.println(rowsAffected);
	        result = rowsAffected > 0;
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return result;
	}
}
