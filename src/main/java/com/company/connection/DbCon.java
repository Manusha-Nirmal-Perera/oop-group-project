package com.company.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbCon {
	private static Connection connection = null;
	
	private DbCon() { }
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
        if(connection == null){
        	synchronized (DbCon.class) {
                if (connection == null) {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_store", "root", "NIRMAL@p123");
                    System.out.println("connected");
                }
            }
        }
        return connection;
    }
}
