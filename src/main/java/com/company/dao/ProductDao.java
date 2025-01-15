package com.company.dao;

import java.sql.*;
import java.util.*;

import com.company.connection.DbCon;
import com.company.modal.Cart;
import com.company.modal.Product;

public class ProductDao {
	private Connection con;

	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    

	public ProductDao(Connection con) {
		super();
		this.con = con;
	}
	
//	method to add new products
	public boolean saveProduct(Product product) {
		boolean result = false;
		try {
			
			Connection con = DbCon.getConnection();
			PreparedStatement ps = con.prepareStatement("INSERT INTO products (name, category, price, image) VALUES (?, ?, ?, ?)");
	        ps.setString(1, product.getName());
	        ps.setString(2, product.getCategory());
	        ps.setDouble(3, product.getPrice());
	        ps.setString(4, product.getImage());

	        ps.executeUpdate();
	        result = true;
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return result;
	}

	
//	method to get all the products 
	public List<Product> getAllProducts() {
        List<Product> item = new ArrayList<>();
        try {

            query = "SELECT * FROM products ORDER BY category";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
            	Product pr = new Product();
                pr.setId(rs.getInt("id"));
                pr.setName(rs.getString("name"));
                pr.setCategory(rs.getString("category"));
                pr.setPrice(rs.getDouble("price"));
                pr.setImage(rs.getString("image"));

                item.add(pr);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return item;
    }
//	method to get all products by name
	public List<Product> getAllProductsByName(String prName) {
		List<Product> item = new ArrayList<>();
        try {

        	String query = "SELECT * FROM products WHERE name LIKE ?";
        	pst = this.con.prepareStatement(query);
        	pst.setString(1, "%" + prName + "%");
        	rs = pst.executeQuery();

            while (rs.next()) {
            	Product pr = new Product();
                pr.setId(rs.getInt("id"));
                pr.setName(rs.getString("name"));
                pr.setCategory(rs.getString("category"));
                pr.setPrice(rs.getDouble("price"));
                pr.setImage(rs.getString("image"));
                
                item.add(pr);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return item;
	}
//	method to get products by category
	public List<Product> getAllProductsByCategory(String category) {
        List<Product> item = new ArrayList<>();
        try {

            query = "SELECT * FROM products WHERE category = ?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, category);
            rs = pst.executeQuery();

            while (rs.next()) {
            	Product pr = new Product();
                pr.setId(rs.getInt("id"));
                pr.setName(rs.getString("name"));
                pr.setCategory(rs.getString("category"));
                pr.setPrice(rs.getDouble("price"));
                pr.setImage(rs.getString("image"));
                
                item.add(pr);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return item;
    }
//	method to get all products by name and category
	public List<Product> getAllProductsBySelections(String prName, String category) {
		List<Product> item = new ArrayList<>();
        try {
        	String query = "SELECT * FROM products WHERE category = ? AND name LIKE ?";
        	pst = this.con.prepareStatement(query);
        	pst.setString(1, category);
        	pst.setString(2, "%" + prName + "%");
        	rs = pst.executeQuery();

            while (rs.next()) {
            	Product pr = new Product();
                pr.setId(rs.getInt("id"));
                pr.setName(rs.getString("name"));
                pr.setCategory(rs.getString("category"));
                pr.setPrice(rs.getDouble("price"));
                pr.setImage(rs.getString("image"));
                
                item.add(pr);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return item;
	}

	
// method to get the product
	 public Product getSingleProduct(int pId) {
		 Product row = null;
	        try {
	            query = "SELECT * FROM products WHERE id=? ";

	            pst = this.con.prepareStatement(query);
	            pst.setInt(1, pId);
	            ResultSet rs = pst.executeQuery();

	            while (rs.next()) {
	            	row = new Product();
	                row.setId(rs.getInt("id"));
	                row.setName(rs.getString("name"));
	                row.setCategory(rs.getString("category"));
	                row.setPrice(rs.getDouble("price"));
	                row.setImage(rs.getString("image"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return row;
	    }
//	method to get total cart price
		public double getTotalCartPrice(ArrayList<Cart> cartList) {
	        double sum = 0;
	        try {
	            if (cartList.size() > 0) {
	                for (Cart item : cartList) {
	                    query = "SELECT price FROM products WHERE id=?";
	                    pst = this.con.prepareStatement(query);
	                    pst.setInt(1, item.getId());
	                    rs = pst.executeQuery();
	                    while (rs.next()) {
	                        sum+=rs.getDouble("price")*item.getQuantity();
	                    }
	
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            System.out.println(e.getMessage());
	        }
	        return sum;
	    }

//	method to get cart products
	    public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
	        List<Cart> cItems = new ArrayList<>();
	        try {
	            if (cartList.size() > 0) {
	                for (Cart c : cartList) {
	                    query = "SELECT * FROM products WHERE id=?";
	                    pst = this.con.prepareStatement(query);
	                    pst.setInt(1, c.getId());
	                    rs = pst.executeQuery();
	                    while (rs.next()) {
	                        Cart cProduct = new Cart();
	                        cProduct.setId(rs.getInt("id"));
	                        cProduct.setName(rs.getString("name"));
	                        cProduct.setCategory(rs.getString("category"));
	                        cProduct.setPrice(rs.getDouble("price")*c.getQuantity());
	                        cProduct.setQuantity(c.getQuantity());
	                        cProduct.setImage(rs.getString("image"));
	                        cItems.add(cProduct);
	                    }
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return cItems;
	    }
//	method to delete the product from database
	public boolean deleteItem(int prID) {
	    boolean res = false;
	    String query = "DELETE FROM products WHERE id=?";
	    PreparedStatement pst = null;
	    
	    try {
	        pst = this.con.prepareStatement(query);
	        pst.setInt(1, prID);
	       int rowsAffected = pst.executeUpdate();
	        res = rowsAffected > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return res;
	}
//	method to edit the product info
	public boolean editProductinfo(int productId, String productName, double price) {
		boolean res = false;

		String query = "UPDATE products SET name=?, price=? WHERE id=?";
		PreparedStatement pst = null;
	        
		try {
			pst = this.con.prepareStatement(query);
	   		pst.setString(1, productName);
	   		pst.setDouble(2, price);
	   		pst.setInt(3, productId);
	            
	        int rowsAffected = pst.executeUpdate();
	        res = rowsAffected > 0;
	    }catch (SQLException e) {
	    	e.printStackTrace();
	    }
		return res;
	}
}

