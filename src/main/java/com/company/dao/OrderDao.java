package com.company.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import com.company.modal.*;

public class OrderDao {
	
	private Connection con;
	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    
    

	public OrderDao(Connection con) {
		this.con = con;
	}
//	method to get all the orders 
	public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        try {

            query = "SELECT * FROM orders";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
            	try {
            	Order o = new Order();
            	ProductDao productDao = new ProductDao(this.con);
                int pId = rs.getInt("p_id");
                Product product = productDao.getSingleProduct(pId);
                
//                System.out.println(product);
            	o.setOrderId(rs.getInt("o_id"));
                o.setUid(rs.getInt("u_id"));
                o.setId(rs.getInt("p_id"));
                o.setQunatity(rs.getInt("o_quantity"));
                o.setDate(rs.getString("o_date"));
                o.setStatus(rs.getString("o_status"));
                o.setName(product.getName());
                o.setPrice(product.getPrice());
                o.setImage(product.getImage());
                orders.add(o);
            	} catch(Exception e) {
            		e.printStackTrace();
            	}
                
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return orders;
    }
	// Method to get order by ID
	public Order getOrderById(int id) {
	    Order order = null;
	    try {
	        String query = "SELECT * FROM orders WHERE o_id = ?";
	        pst = this.con.prepareStatement(query);
	        pst.setInt(1, id);
	        rs = pst.executeQuery();

	        // Check if the result set contains any data
	        if (rs.next()) {
	            // Initialize the order object
	            order = new Order();
	            
	            // Fetch the product using the product ID from the result set
	            ProductDao productDao = new ProductDao(this.con);
	            int pId = rs.getInt("p_id");
	            Product product = productDao.getSingleProduct(pId);
	            
	            // Set order details from the result set and product data
	            order.setOrderId(rs.getInt("o_id"));
	            order.setUid(rs.getInt("u_id"));
	            order.setQunatity(rs.getInt("o_quantity"));
	            order.setDate(rs.getString("o_date"));
	            order.setName(product.getName());
	            order.setPrice(product.getPrice());
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.println(e.getMessage());
	    }
	    System.out.println(order);
	    return order;
	}
	
//	method to get the total order count of a single user
	public int getUserOrderCount(int uid) {
	    int count = 0;
	    try {
	        String q = "SELECT COUNT(*) FROM orders WHERE u_id=?";
	        PreparedStatement ps = con.prepareStatement(q);

	        ps.setInt(1, uid);
	        ResultSet r = ps.executeQuery();

	        if (r.next()) {
	            count = r.getInt(1);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.println(e.getMessage());
	    }
	    return count;
	}

//	method to handle new orders 
	public boolean insertOrder(Order model) {
        boolean result = false;
        try {
            query = "INSERT INTO orders (p_id, u_id, o_quantity) VALUES(?,?,?)";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, model.getId());
            pst.setInt(2, model.getUid());
            pst.setInt(3, model.getQunatity());
            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
	
//	method to get all the orders that are made by a user
    public List<Order> userOrders(int id) {
        List<Order> list = new ArrayList<>();
        try {
            query = "SELECT * FROM orders WHERE u_id=? ORDER BY orders.o_id desc";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                ProductDao productDao = new ProductDao(this.con);
                int pId = rs.getInt("p_id");
                Product product = productDao.getSingleProduct(pId);
                order.setOrderId(rs.getInt("o_id"));
                order.setId(pId);
                order.setName(product.getName());
                order.setCategory(product.getCategory());
                order.setPrice(product.getPrice());
                order.setImage(product.getImage());
                order.setQunatity(rs.getInt("o_quantity"));
                order.setDate(rs.getString("o_date"));
                order.setStatus(rs.getString("o_status"));
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
//	method to handle cancel order
    public void cancelOrder(int id) {
        //boolean result = false;
        try {
        	System.out.println(id);
            query = "DELETE FROM orders WHERE o_id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            pst.execute();
            //result = true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
        //return result;
    }
	public boolean adminDeliverOrder(int id) {
		boolean res = false;

		query = "UPDATE orders SET o_status = ? WHERE o_id = ?";

        try {
        	pst = this.con.prepareStatement(query);
        	pst.setString(1, "Delivered");
			pst.setInt(2, id);	

            
            int rowsAffected = pst.executeUpdate();
            res = rowsAffected > 0;
        }catch (SQLException e) {
            e.printStackTrace();
        }
		
		return res;
		
	}
	public boolean adminCancelOrder(int id) {
		boolean result = false;
		try {
            query = "DELETE FROM orders WHERE o_id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            pst.execute();
            result = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return result;
	}
//	method to count all the no of orders
	public int getOrderCount() {
		int count = 0;
		try {
			query = "SELECT COUNT(*) FROM orders";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			
			if (rs.next()) {
	            count = rs.getInt(1);
	        }
		}catch(Exception e) {
			e.printStackTrace();;
		}
		return count;
	}
//	method to get the total earning from the sales 
	public double getTotalSales() {
		double amount = 0;
		try {
			query = "SELECT SUM(o.o_quantity * p.price) FROM orders o, products p Where o.p_id = p.id";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			
			if (rs.next()) {
				amount = rs.getDouble(1);
	        }
		}catch(Exception e) {
			e.printStackTrace();
		}
		return amount;
	}
	
//	user reject order
	public boolean userRejectOrder(int id) {
		boolean res = false;

		query = "UPDATE orders SET o_status = ? WHERE o_id = ?";

        try {
        	pst = this.con.prepareStatement(query);
        	pst.setString(1, "Rejected");
			pst.setInt(2, id);	

            
            int rowsAffected = pst.executeUpdate();
            res = rowsAffected > 0;
        }catch (SQLException e) {
            e.printStackTrace();
        }
		return res;
	}
	
//	user accept order
	public boolean userAcceptOrder(int id) {
		boolean res = false;

		query = "UPDATE orders SET o_status = ? WHERE o_id = ?";

        try {
        	pst = this.con.prepareStatement(query);
        	pst.setString(1, "Accepted");
			pst.setInt(2, id);	

            
            int rowsAffected = pst.executeUpdate();
            res = rowsAffected > 0;
        }catch (SQLException e) {
            e.printStackTrace();
        }
		return res;
	}
}
